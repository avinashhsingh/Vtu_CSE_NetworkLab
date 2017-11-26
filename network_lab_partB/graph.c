#include<stdio.h>
#include<stdlib.h>
int i,j,k,n,cost[10][10],via[10][10];
int main() {
	printf("Enter the no. of nodes(<10)\n");
	scanf("%d",&n);
	for(i=0;i<n;i++) {
		printf("The cost from %c:(999 for no connection)\n",65+i);
		for(j=0;j<n;j++) {
			if(i!=j) {
				printf("To %c:",65+j);
				scanf("%d",&cost[i][j]);
			}
			else
				cost[i][j]=0;
		}
	}

	for(i=0;i<n;i++)
		for(j=0;j<n;j++)
			via[i][j]=i;
	for(i=0;i<n;i++) {
		for(j=0;j<n;j++) {
			if(cost[i][j]<999) {
				for(k=0;k<n;k++) {
					if(cost[i][k]>cost[i][j]+cost[j][k]) {
						cost[i][k]=cost[i][j]+cost[j][k];
						via[i][k]=j;
					}
				}
			}
		}
	}

	for(i=0;i<n;i++) {
		printf("The preferred path from %c to:\n",65+i);
		for(j=0;j<n;j++) {
			if(cost[i][j]!=999)
				printf("%c:%d via %c\n",65+j,cost[i][j],65+cost[i][j]);
			else
				printf("%c:No connection",65+j);
		}
	}
}

