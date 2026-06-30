#include<stdio.h>

int main(){
  int days,year,week;
  
  printf("Enter days: ");
  scanf("%d",&days);
  
  year=days/365;
  days=days%365;
  week=days/7;
  days=days%7;
  
  printf("%d Year %d Week %d Day",year,week,days);
  
  return 0;
}
