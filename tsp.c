#include <stdio.h>
#include <stdlib.h>

int** dist;
int min = 32000;
int n;
void swap(int *x, int *y)
{
	int z=*x;
	*x=*y;
	*y=z;
}

void perm(int A[], int ilk,int son)
{
	int ii;
	if(ilk==son)
	{
		int top=0;
		for(ii=0;ii<n;ii++)
			if(A[ii]<A[(ii+1)%n])
				top+=dist[A[(ii+1)%n]][A[ii]];
			else
				top+=dist[A[ii]][A[(ii+1)%n]];
		if(top<min)
		{
			min=top;
			for(ii=0;ii<n;ii++)
				printf("%3d ",A[ii]);
			printf("  dist: %d\n",min);
		}
	}
	else
		for(ii=ilk;ii<=son;++ii)
		{
			swap(&A[ilk],&A[ii]);
			perm(A,(ilk+1),son);
			swap(&A[ilk],&A[ii]);
		}
}

int main(int argc,char* argv[])
{
	int i,j;

	n = atoi(argv[1]);
	int prm[n];
	for(i=0;i<n;i++) prm[i]=i;

	dist = (int**) malloc(sizeof(int*)*n);

	for(i=0;i<n;i++)
		dist[i] = (int*) malloc(sizeof(int)*(i+1));

	for(i=0;i<n;i++)
		dist[i][i]=0;

	for(i=1;i<n;i++)
		for(j=0;j<i;j++)
			dist[i][j]=rand()%20+1;

	for(i=1;i<n;i++)
	{
		for(j=0;j<i;j++)
		{
			printf("%3d",dist[i][j]);
		}
		printf("\n");
	}
	
	perm(prm,0,n-1);

	printf("min: %d",min);


	return 0;
}
