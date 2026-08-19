#include<stdio.h>
int main(){
    int m,n,i,sum=0;
    
    printf("enter m: ");
    scanf("%d",&m);
    printf("enter n: ");
    scanf("%d",&n);

    for(i=m;i<=n;i++){
        sum=sum+i;
    }

    printf("sum= %d",sum);

    return 0;
}