#include<stdio.h>

int main(){
int n,i,arr[100],sum=0;
int *p;

printf("Enter number of elements: ");
scanf("%d",&n);

p=arr;

printf("Enter elements:\n");
for(i=0;i<n;i++){
scanf("%d",p+i);
}

for(i=0;i<n;i++){
sum=sum+*(p+i);
}

printf("Sum=%d",sum);

return 0;
}