#include<stdio.h>
int main(){
    int y;

    printf("enter any year: ");
    scanf("%d",&y);

    if((y%100!=0 && y%4==0)||(y%400==0)){
    printf("leap year");
    }
    else{
    printf("not a leap year");
    }

    return 0;
}