#include<stdio.h>

  int main(){
  int base,power,i,result=1;
  
  printf("Enter base: ");
  scanf("%d",&base);
  
  printf("Enter power: ");
  scanf("%d",&power);
  
  for(i=1;i<=power;i++){
  result=result*base;
  }
  
  printf("Answer=%d",result);
  
  return 0;
}
