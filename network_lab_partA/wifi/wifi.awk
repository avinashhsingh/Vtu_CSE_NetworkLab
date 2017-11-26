BEGIN {
	#include<stdio.h>
	time=0;
	pkt=0;
}
{
	if($1=="r" && $3=="0" && $4=="1") {
		pkt=pkt+$6;
		time=$2;
	}
}
END {
	printf("The throughput is:%f kbps\n",(pkt/(time-2.5))*(8/1000));
}

