#include<stdio.h>
int main(){
  float area;
  int r;
  const float pi = 3.14;

  printf("enter the radius of a circle: ");
  scanf("%d",&r);

  area = pi * r * r;

  printf("area of circle with radius %d is equal to %.2f",r,area);
  return 0;
}