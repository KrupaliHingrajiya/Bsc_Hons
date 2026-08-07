#include<stdio.h>
int main(){
    int n,i;

    printf("enter size of array: ");
    scanf("%d",&n);

    int arr[n];

    for(i=0;i<n;i++){
        printf("enter element of array %d :",i);
        scanf("%d",&arr[i]);
    }

    printf("array: ");

    for(i=0;i<n;i++){
        printf(" %d ",arr[i]);  
    }

    return 0;
}