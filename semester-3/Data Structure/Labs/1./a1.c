#include<stdio.h>
int main(){
    int r;
    float a;

    printf("enter radius: ");
    scanf("%d",&r);

    a = r * r * 3.14;

    printf("area = %.2f",a);

    return 0;
}