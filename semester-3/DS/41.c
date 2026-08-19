#include <stdio.h>
#include <stdlib.h>

struct Node
{
int data;
struct Node *next;
};

int main()
{
struct Node *head;

// Create a node
head = (struct Node *)malloc(sizeof(struct Node));

printf("Enter data: ");
scanf("%d", &head->data);

head->next = NULL;

printf("\nNode Data = %d\n", head->data);

return 0;
}