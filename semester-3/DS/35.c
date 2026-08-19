#include<stdio.h>

int main(){
int n,i,arr[100];
int *p;

printf("Enter number of elements: ");
scanf("%d",&n);

p=arr;

printf("Enter elements:\n");
for(i=0;i<n;i++){
scanf("%d",p+i);
}

printf("Array elements are:\n");
for(i=0;i<n;i++){
printf("%d ",*(p+i));
}

return 0;
}