set ns [new Simulator]
set nf [open lab2.nam w]
$ns namtrace-all $nf
set tf [open lab2.tr w]
$ns trace-all $tf
proc finish {} {
	global ns nf tf
	$ns flush-trace
	close $nf
	close $tf
	exec nam lab2.nam &
	exit 0
}

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]

$ns duplex-link $n0 $n2 10MB 100ms DropTail
$ns duplex-link $n1 $n2 10MB 100ms DropTail
$ns duplex-link $n2 $n3 5MB 100ms DropTail

set tcp0 [new Agent/TCP]
$ns attach-agent $n0 $tcp0

set ftp0 [new Application/FTP]
$ftp0 attach-agent $tcp0

set udp1 [new Agent/UDP]
$ns attach-agent $n1 $udp1

set cbr1 [new Application/Traffic/CBR]
$cbr1 attach-agent $udp1

set null3 [new Agent/Null]
$ns attach-agent $n3 $null3

set sink3 [new Agent/TCPSink]
$ns attach-agent $n3 $sink3

$ns connect $tcp0 $sink3
$ns connect $udp1 $null3


$ftp0 set packetSize_ 5000
$ftp0 set interval_ 0.001

$cbr1 set packetSize_ 5000
$cbr1 set interval_ 0.001

$ns at 0.1 "$ftp0 start"
$ns at 0.2 "$cbr1 start"

$ns at 4.5 "$ftp0 stop"
$ns at 4.5 "$cbr1 stop"

$ns at 5.0 "finish"

$ns run

