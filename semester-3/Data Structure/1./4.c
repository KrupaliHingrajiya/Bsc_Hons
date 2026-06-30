#include<stdio.h>

int main(){
  int first,second,third,max;
  
  printf("Enter three numbers: ");
  scanf("%d%d%d",&first,&second,&third);
  
  max=first;
  
  if(second>max){
  max=second;
  }
  
  if(third>max){
  max=third;
  }
  
  printf("Largest=%d",max);
  
  return 0;
}
