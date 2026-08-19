#include<stdio.h>
int main(){
    int a[100],n,i,val,pos=-1;

    printf("Enter number of elements: ");
    scanf("%d",&n);

    printf("Enter sorted array elements (ascending order):\n");
        for(i=0;i<n;i++){
        scanf("%d",&a[i]);
        }

    printf("Enter value to delete: ");
    scanf("%d",&val);

        for(i=0;i<n;i++){
            if(a[i]==val){
            pos=i;
            break;
            }
        }

        if(pos==-1){
        printf("Element not found");
        return 0;
        }

        for(i=pos;i<n-1;i++){
        a[i]=a[i+1];
        }

        

    printf("Array after deletion:\n");
        for(i=0;i<n;i++){
        printf("%d ",a[i]);
        }

    return 0;
}