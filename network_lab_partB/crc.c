#include<stdio.h>
#include<string.h>
int err;
char i[200],op[200],g[200];
int crc(char i[200],char op[200],int mode);
void main() {
	char r[200];

	printf("\nEnter the message\n");
	scanf("%s",i);

	crc(i,op,1);

	printf("\ncrc code is %s%s",i,op+strlen(i));

	printf("\nEnter the recieved message\n");
	scanf("\n%s",r);

	if(!crc(r,op,0))
		printf("\nError free message\n");
	else
		printf("\nError in message\n");
}

int crc(char i[200],char op[200],int mode) {
	int j,k;
	char g[200]={"10001000000100001"};
	strcpy(op,i);
	if(mode)
		strcat(op,"0000000000000000");
	for(j=0;j<strlen(i);j++)
		if(op[j]=='1')
			for(k=0;k<strlen(g);k++)
				if((op[j+k]=='1' && g[k]=='1') || (op[j+k]=='0' && g[k]=='0'))
					op[j+k]='0';
				else
					op[j+k]='1';
	for(j=0;j<strlen(op);j++) {
		err=0;
	if(op[j]=='1') {
		err=1;
		break;
	}
	}
	return err;
}

