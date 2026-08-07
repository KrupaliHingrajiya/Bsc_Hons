#include<stdio.h>
int main(){
    int a[100],n,i,val,pos;

    printf("Enter number of elements: ");
    scanf("%d",&n);

    printf("Enter sorted array elements (ascending order):\n");
        for(i=0;i<n;i++){
        scanf("%d",&a[i]);
        }

    printf("Enter value to insert: ");
    scanf("%d",&val);

    pos=0;
        while(pos<n && a[pos]<val){
        pos++;
        }

        for(i=n;i>pos;i--){
        a[i]=a[i-1];
        }

        a[pos]=val;
        n++;

    printf("Array after insertion:\n");
        for(i=0;i<n;i++){
        printf("%d ",a[i]);
        }

    return 0;
}