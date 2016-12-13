#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define m 4
#define n 5

int matris[m][n];
int path[m][n];

// prototypes
int min_find_path(int i, int j);

int main(void)
{
    srand(0);
    for (int i = 0; i < m; i++)
    {
        for (int j = 0; j < n; j++)
        {
            matris[i][j] = rand() % 43;
            printf("%5d", matris[i][j]);
        }
    printf("\n");
    }
    
    for (int i = n - 2; i > 0; i--)
    {
        for (int j = 0; j < m; j++)
        {
			matris[i][j] += min_find_path(i, j);
        }
    }

	int min_indis = 0;
	for (int i = 1; i < m; i++)
	{
		if (matris[i][0] < matris[min_indis][0])
		{
			min_indis = i;
		}
	}
	printf("\nEn kısa yol %d\n", matris[min_indis][0]);

	printf("%d ", min_indis);
	for (int i = 1; i < n; i++)
	{
		printf("%d ", path[min_indis][i]);
	}
    printf("\n");
	return 0;
}

int min_find_path(int i, int j)
{
    if (matris[i][j + 1] > matris[(i == 0 ? (m - 1) : (i - 1))][j + 1])
    {
        if (matris[(i == 0 ? (m - 1) : (i - 1))][j + 1] < matris[(i == (m - 1) ? 0 : (i + 1))][j + 1]) 
		{
			path[i][j] = (i == 0 ? (m - 1) : (i - 1));
			return matris[(i == 0 ? (m - 1) : (i - 1))][j + 1];
		}
		else
		{
			path[i][j] = (i == (m - 1) ? 0 : (i + 1));
			return matris[(i == (m - 1) ? 0 : (i + 1))][j + 1];
		}
    }
	else
	{
        if (matris[i][j + 1] < matris[(i == (m - 1) ? 0 : (i + 1))][j + 1]) 
		{
			path[i][j] = i;
			return matris[i][j + 1];
		}
		else
		{
			path[i][j] = (i == (m - 1) ? 0 : (i + 1));
			return matris[(i == (m - 1) ? 0 : (i + 1))][j + 1];
		}
	}
}
