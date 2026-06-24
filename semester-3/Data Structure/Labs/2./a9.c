#include<stdio.h>
int main(){
    int base,exponent,i;
    int power=1;

    printf("enter base:");
    scanf("%d",&base);
    printf("enter exponent:");
    scanf("%d",&exponent);

    for(i=1;i<=exponent;i++){
        power=power*base;
    }
    printf("answer = %d",power);

    return 0;
}