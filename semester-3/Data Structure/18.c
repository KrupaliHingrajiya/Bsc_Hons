#include<stdio.h>
int main(){
    int n,i,sum=0;
    float avg=0;

    printf("enter n: ");
    scanf("%d",&n);

    for(i=1;i<=n;i++){
        sum=sum+i;
    }
    avg=sum/n;

    printf("avg=%.2f",avg);

    return 0;
}