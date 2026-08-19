#include<stdio.h>
int main(){
    int totalSec, hours, minutes, seconds;

    printf("enter any number of seconds: ");
    scanf("%d",&totalSec);

    hours = totalSec/3600;
    minutes = (totalSec%3600)/60;
    seconds = totalSec%60;

    printf("%02d:%02d:%02d", hours, minutes, seconds);

    return 0;
}