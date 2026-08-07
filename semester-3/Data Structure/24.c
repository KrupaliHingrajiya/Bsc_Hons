#include<stdio.h>
int main(){
    int a[100],n,i,pos,val;
    printf("Enter number of elements: ");
    scanf("%d",&n);

    printf("Enter array elements:\n");
        for(i=0;i<n;i++){
        scanf("%d",&a[i]);
        }

    printf("Enter position to insert (1 to %d): ",n+1);
    scanf("%d",&pos);

    printf("Enter value to insert: ");
    scanf("%d",&val);

        if(pos<1 || pos>n+1){
        printf("Invalid position");
        return 0;
        }

        for(i=n;i>=pos;i--){
        a[i]=a[i-1];
        }

        a[pos-1]=val;
        n++;

    printf("Array after insertion:\n");
        for(i=0;i<n;i++){
        printf("%d ",a[i]);
        }

    return 0;
}