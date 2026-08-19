#include<stdio.h>
#include<stdlib.h>

int main(){
int *p;
char *c;
float *f;

p=(int*)malloc(sizeof(int));
c=(char*)malloc(sizeof(char));
f=(float*)malloc(sizeof(float));

printf("Enter an integer: ");
scanf("%d",p);

printf("Enter a character: ");
scanf(" %c",c);

printf("Enter a float: ");
scanf("%f",f);

printf("\nInteger=%d",*p);
printf("\nCharacter=%c",*c);
printf("\nFloat=%.2f",*f);

free(p);
free(c);
free(f);

return 0;
}