#include<stdio.h>

int main(){
  int number,i,factorial=1;
  
  printf("Enter number: ");
  scanf("%d",&number);
  
  for(i=1;i<=number;i++){
  factorial=factorial*i;
  }
  
  printf("Factorial=%d",factorial);
  
  return 0;
}
