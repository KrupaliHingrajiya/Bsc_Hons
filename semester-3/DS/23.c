#include<stdio.h>
#include<string.h>

int main(){
    int n,i,j;
    char temp[50];

    printf("Enter number of names: ");
    scanf("%d",&n);

    char name[n][50];

    printf("enter names:\n");
    for(i=0;i<n;i++){
        scanf("%s",name[i]);
    }

    for(i=0;i<n-1;i++){
        for(j=i+1;j<n;j++){
            if(strcmp(name[i],name[j])>0){
                strcpy(temp,name[i]);
                strcpy(name[i],name[j]);
                strcpy(name[j],temp);
            }
        }
    }

    printf("\nNames in alphabetical order:\n");
    for(i=0;i<n;i++){
        printf("%s\n",name[i]);
    }

    return 0;
}