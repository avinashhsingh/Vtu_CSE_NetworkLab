set ns [new Simulator]
set nf [open wifi.nam w]
$ns namtrace-all-wireless $nf 1000 1000 
set tf [open wifi.tr w]
$ns trace-all $tf 
set topo [new Topography]
$topo load_flatgrid 1000 1000
proc finish {} {
	global ns nf tf
	$ns flush-trace
	close $nf
	close $tf
	exec nam wifi.nam &
	exit 0
}

$ns node-config -addressType hierarchical
AddrParams set domain_num_ 3
create-god 4

$ns node-config -adhocRouting DSDV \
-llType LL \
-ifqType Queue/DropTail \
-ifqLen 50 \
-macType Mac/802_11 \
-phyType Phy/WirelessPhy \
-channelType Channel/WirelessChannel \
-propType Propagation/TwoRayGround \
-antType Antenna/OmniAntenna \
-wiredRouting ON \
-topoInstance $topo \
-agentTrace ON \

set w0 [$ns node 0.0.0]
set w1 [$ns node 0.0.1]

set bs0 [$ns node 1.0.0]
set bs1 [$ns node 2.0.0]

$w0 set X_ 50
$w0 set Y_ 50
$w0 set Z_ 0

$w1 set X_ 90
$w1 set Y_ 90
$w1 set Z_ 0

$bs0 set X_ 650
$bs0 set Y_ 650
$bs0 set Z_ 0

$bs1 set X_ 90
$bs1 set Y_ 90
$bs1 set Z_ 0

$ns node-config -wiredRouting OFF

set n0 [$ns node 1.0.1]
set n1 [$ns node 2.0.1]

$n0 set X_ 550
$n0 set Y_ 550
$n0 set Z_ 0

$n1 set X_ 150
$n1 set Y_ 150
$n1 set Z_ 0

$ns initial_node_pos $n0 550
$ns initial_node_pos $n1 150

$n0 base-station [AddrParams addr2id 1.0.0]
$n1 base-station [AddrParams addr2id 2.0.0]

$ns duplex-link $bs0 $w0 10MB 100ms DropTail
$ns duplex-link $bs1 $w0 10MB 100ms DropTail
$ns duplex-link $w0 $w1 100MB 100ms DropTail

set tcp0 [new Agent/TCP]
$ns attach-agent $n0 $tcp0

set ftp0 [new Application/FTP]
$ftp0 attach-agent $tcp0

set sink0 [new Agent/TCPSink]
$ns attach-agent $w1 $sink0

$ns connect $tcp0 $sink0

set tcp1 [new Agent/TCP]
$ns attach-agent $n1 $tcp1

set ftp1 [new Application/FTP]
$ftp1 attach-agent $tcp1

set sink1 [new Agent/TCPSink]
$ns attach-agent $w1 $sink1

$ns connect $tcp1 $sink1

$tcp1 set packetSize_ 5000

$ns at 5 "$n1 setdest 900 900 15"
$ns at 30 "$n1 setdest 150 150 15"

$ns at 2.5 "$ftp0 start"
$ns at 2.5 "$ftp1 start"

$ns at 100 "finish"

$ns run





