#include<stdio.h>
int main(){
    int a[100],b[100],n,i,j,k;

    printf("Enter number of elements: ");
    scanf("%d",&n);

    printf("Enter array elements:\n");
        for(i=0;i<n;i++){
        scanf("%d",&a[i]);
        }

        k=0;

        for(i=0;i<n;i++){
            for(j=0;j<k;j++){
                if(a[i]==b[j]){
                break;
                }
            }

            if(j==k){
            b[k]=a[i];
            k++;
            }
        }

    printf("Array after removing duplicates:\n");
        for(i=0;i<k;i++){
        printf("%d ",b[i]);
        }

    return 0;
}