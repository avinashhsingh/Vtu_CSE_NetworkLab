#include<stdio.h>
int gcd(int z,int e) {
	int k;
	while(1) {
		k=z%e;
		z=e;
		e=k;
	//	if(k==1)
	//		return 1;
	//	if(k==0)
	//		return 0;
			return k;
	}
}

int encrypt(int m,int e,int n) {
	int k=1;
	int i;
	for(i=1;i<=e;i++) {
		k=(k*m)%n;
	}
	return k;
}

int main() {
	int p,q,m,c,z,e,i,d,n;
	printf("enter two prime number\n");
	scanf("%d%d",&p,&q);
	n=p*q;
	z=(p-1)*(q-1);
	do {
		printf("Enter the value of e between z-1\n");
		scanf("%d",&e);
	}while(!gcd(e,z) && (e<(z-1)));

	printf("Public key pair kv={e,n}={%d,%d}\n",e,n);
	for(d=1;(d*e)%z!=1;d++) { }
	printf("Private key pair kv={d,n}={%d,%d}\n",d,n);

	printf("Enter the message\n");
	scanf("%d",&m);

	c=encrypt(m,e,n);

	printf("the cyphertext is\n");
	printf("%d\t\n",c);

	c=encrypt(c,d,n);

	printf("The message is\n%d\n",c);
	return 0;
}



