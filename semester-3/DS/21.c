#include<stdio.h>

int main(){
    int n,i,x,y;

    printf("enter number of elements: ");
    scanf("%d",&n);

    int arr[n];

    printf("enter array elements:\n");
    for(i=0;i<n;i++){
        scanf("%d",&arr[i]);
    }

    printf("enter number to be replaced: ");
    scanf("%d",&x);

    printf("enter new number: ");
    scanf("%d",&y);

    printf("changed indices: ");

    for(i=0;i<n;i++){
        if(arr[i]==x){
            arr[i]=y;
            printf("%d ",i);
        }
    }

    printf("\nFinal array:\n");

    for(i=0;i<n;i++){
        printf("%d ",arr[i]);
    }

    return 0;
}