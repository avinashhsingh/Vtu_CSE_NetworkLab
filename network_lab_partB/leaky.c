#include<stdio.h>
#include<stdlib.h>
#define bktSize 512

void bktInput(int a,int b) {
	if(a>bktSize) {

		printf("Bucket Overflow\n");
		printf("Bucket output unsucessful\n");
	}
	else {
		while(a>b) {
			printf("%d bytes outputted\n",b);
			a=a-b;
		}

		if(a>0)
			printf("The remaining %d bytes sent \n",a);
			printf("bucket outputted successful\n");
	}
}

void main() {
	int op,pktSize,n;
	int size[10],i;
	printf("Enter the output rate\n");
	scanf("%d",&op);
	printf("Enter the no. of packets\n");
	scanf("%d",&n);
	printf("Enter the size od %d packets\n",n);
	for(i=1;i<=n;i++)
		scanf("%d",&size[i]);
	for(i=1;i<=n;i++) {
		printf("packet number %d\n",i);
		bktInput(size[i],op);
	}
}

