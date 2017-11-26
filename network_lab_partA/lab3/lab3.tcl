set ns [new Simulator]
set nf [open lab3.nam w]
$ns namtrace-all $nf
set tf [open lab3.tr w]
$ns trace-all $tf
proc finish {} {
	global ns nf tf
	$ns flush-trace
	close $nf
	close $tf
	exec nam lab3.nam &
	exit 0
}

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]
set n6 [$ns node]

$ns duplex-link $n0 $n1 1MB 1ms DropTail
$ns duplex-link $n0 $n2 1MB 1ms DropTail
$ns duplex-link $n0 $n3 1MB 1ms DropTail
$ns duplex-link $n0 $n4 1MB 1ms DropTail
$ns duplex-link $n0 $n5 1MB 1ms DropTail
$ns duplex-link $n0 $n6 1MB 1ms DropTail

$ns set queue-limit $n0 $n6 2
$ns set queue-limit $n0 $n2 5
$ns set queue-limit $n0 $n3 3
$ns set queue-limit $n0 $n5 4

set ping2 [new Agent/Ping]
$ns attach-agent $n2 $ping2

set ping3 [new Agent/Ping]
$ns attach-agent $n3 $ping3

set ping5 [new Agent/Ping]
$ns attach-agent $n5 $ping5

set ping6 [new Agent/Ping]
$ns attach-agent $n6 $ping6

$ns connect $ping6 $ping2
$ns connect $ping3 $ping5

$ping6 set packetSize_ 500000
$ping6 set interval_ 0.00005

$ping3 set packetSize_ 500000
$ping3 set interval_ 0.00005

$ns color 1 "red"
$ns color 2 "blue"

$ping6 set class_ 1
$ping3 set class_ 2

proc sendPingPacket {} {
	global ns ping3 ping6
	set intervalTime 0.001
	set now [$ns now]
	$ns at [expr $now+$intervalTime] "$ping3 send"
	$ns at [expr $now+$intervalTime] "$ping6 send"
	$ns at [expr $now+$intervalTime] "sendPingPacket"
}

Agent/Ping instproc recv {from rtt} {
	global seq
	$self instvar node_
	puts "The node [$node_ id] recieved an Ack from the node $from with rtt $rtt ms"
}

$ns at 0.01 "sendPingPacket"
$ns at 10.0 "finish"
$ns run 






















