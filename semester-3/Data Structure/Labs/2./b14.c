#include <stdio.h>

int main(){
    int n,i;
    int innerSum=0,totalSum=0;

    printf("enter value of n: ");
    scanf("%d",&n);

    for(i=1;i<=n;i++){
        innerSum=innerSum+i;   
        totalSum=totalSum+innerSum;
    }

    printf("Sum = %d",totalSum);
    return 0;
}