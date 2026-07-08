#include<stdio.h>
int main(){
  float area;
  int r;
  const pi = 3.14;

  printf("enter the radius of a circle: ");
  scanf("%d",&r);

  area = pi * r * r;

  printf("area of circle whose radius is %d = %.2f",r,area);
  return 0;
}
