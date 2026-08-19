#include <stdio.h>
#include <stdlib.h>

struct Node
{
int data;
struct Node *next;
};

struct Node* createList(int n)
{
struct Node *head = NULL, *temp = NULL, *newNode;
int i;

for(i = 1; i <= n; i++)
{
    newNode = (struct Node*)malloc(sizeof(struct Node));

    printf("Enter data for node %d: ", i);
    scanf("%d", &newNode->data);

    newNode->next = NULL;

    if(head == NULL)
    {
        head = newNode;
        temp = newNode;
    }
    else
    {
        temp->next = newNode;
        temp = newNode;
    }
}

return head;
}

struct Node* reverseList(struct Node *head)
{
struct Node *prev = NULL;
struct Node *current = head;
struct Node *next = NULL;

while(current != NULL)
{
    next = current->next;      
    current->next = prev;      
    prev = current;            
    current = next;            
}

head = prev;

return head;
}

// Display Linked List
void display(struct Node *head)
{
while(head != NULL)
{
    printf("%d -> ", head->data);
    head = head->next;
}

printf("NULL\n");
}

int main()
{
struct Node *head;
int n;

printf("Enter number of nodes: ");
scanf("%d", &n);

head = createList(n);

printf("\nOriginal Linked List:\n");
display(head);

head = reverseList(head);

printf("\nReversed Linked List:\n");
display(head);

return 0;
}