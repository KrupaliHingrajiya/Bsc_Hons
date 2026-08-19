#include<stdio.h>
int main(){
    int n;

    printf("enter any number: ");
    scanf("%d",&n);

    if(n%2==0){
    printf("number is EVEN");
    }
    else{
    printf("number is ODD");
    }

    return 0;
}