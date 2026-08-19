#include <stdio.h>

int main()
{
    int n, i;
    int arr[100];
    int smallest, largest;
    int smallPos, largePos;

    printf("enter the number of elements: ");
    scanf("%d", &n);

    printf("enter %d numbers:", n);

    for(i=0;i<n;i++)
    {
        scanf("%d",&arr[i]);
    }

    smallest=largest=arr[0];
    smallPos=largePos=1;

    for(i=1;i<n;i++)
    {
        if(arr[i]<smallest)
        {
            smallest=arr[i];
            smallPos=i+1;
        }

        if(arr[i]>largest)
        {
            largest=arr[i];
            largePos=i+1;
        }
    }

    printf("Smallest number = %d at position %d\n", smallest, smallPos);
    printf("Largest number = %d at position %d", largest, largePos);

    return 0;
}