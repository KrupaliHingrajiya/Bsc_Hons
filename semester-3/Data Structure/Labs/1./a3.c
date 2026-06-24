#include<stdio.h>
int main(){
    char n;

    printf("enter any letter: ");
    scanf("%c",&n);

    if(n=='a'||n=='A'||n=='e'||n=='E'||n=='i'||n=='I'||n=='o'||n=='O'||n=='u'||n=='U'){
    printf("Vowel");
    }
    else{
    printf("Consonate");
    }

    return 0;
}