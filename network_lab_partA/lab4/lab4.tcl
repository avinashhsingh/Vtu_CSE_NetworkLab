set ns [new Simulator]
set nf [open lab4.nam w]
$ns namtrace-all $nf
set tf [open lab4.tr w]
$ns trace-all $tf
proc finish {} {
	global ns nf tf
	$ns flush-trace
	close $nf
	close $tf
	exec nam lab4.nam &
	exit 0
}

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]
set n6 [$ns node]

$ns make-lan "$n1 $n0 $n2 $n3" 10MB 100ms LL Queue/DropTail Mac/802_3
$ns make-lan "$n4 $n5 $n6" 10MB 100ms LL Queue/DropTail Mac/802_3

$ns duplex-link $n3 $n6 100MB 100ms DropTail

set udp1 [new Agent/UDP]
$ns attach-agent $n1 $udp1

set cbr1 [new Application/Traffic/CBR]
$cbr1 attach-agent $udp1

set null5 [new Agent/Null]
$ns attach-agent $n5 $null5

$ns connect $udp1 $null5

$cbr1 set packetSize_ 5000
$cbr1 set interval_ 0.005

set err [new ErrorModel]
$ns lossmodel $err $n3 $n6
$err set rate_ 0.2

$ns at 0.1 "$cbr1 start"
$ns at 4.5 "$cbr1 stop"
$ns at 5.0 "finish"
$ns run

