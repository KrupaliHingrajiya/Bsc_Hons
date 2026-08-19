#include<stdio.h>

int main(){
    int n,i,j,found=0;

    printf("enter number of elements: ");
    scanf("%d",&n);

    int arr[n];

    printf("enter elements:\n");
    for(i=0;i<n;i++){
        scanf("%d",&arr[i]);
    }

    for(i=0;i<n;i++){
        for(j=i+1;j<n;j++){
            if(arr[i]==arr[j]){
                found=1;
                break;
            }
        }
        if(found==1){
            break;
        }
    }

    if(found==1){
        printf("Array contains duplicate numbers\n");
    }else{
        printf("No duplicate numbers found");
    }

    return 0;
}