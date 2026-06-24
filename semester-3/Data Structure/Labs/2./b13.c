#include <stdio.h>
int main(){
    int start,end,i,j,isPrime;

    printf("enter starting number: ");
    scanf("%d",&start);

    printf("enter ending number: ");
    scanf("%d",&end);

    printf("prime numbers between %d and %d are:",start,end);

    for(i=start;i<=end;i++){
        if(i<=1){
            continue;
        }
        isPrime=1;
        for(j=2;j<i;j++){
            if(i%j==0){
                isPrime=0;
                break;
            }
        }
        if(isPrime){
            printf("%d ",i);
        }
    }
    return 0;
}