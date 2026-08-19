#include<stdio.h>

int main(){
int n,i,arr[100],max;
int *p;

printf("Enter number of elements: ");
scanf("%d",&n);

p=arr;

printf("Enter elements:\n");
for(i=0;i<n;i++){
scanf("%d",p+i);
}

max=*p;

for(i=1;i<n;i++){
if(*(p+i)>max){
max=*(p+i);
}
}

printf("Largest element=%d",max);

return 0;
}