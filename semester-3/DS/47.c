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

void sortList(struct Node *head)
{
struct Node *current, *index;
int temp;

if(head == NULL)
    return;

for(current = head; current != NULL; current = current->next)
{
    for(index = current->next; index != NULL; index = index->next)
    {
        if(current->data > index->data)
        {
            temp = current->data;
            current->data = index->data;
            index->data = temp;
        }
    }
}
}

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

sortList(head);

printf("\nSorted Linked List (Ascending Order):\n");
display(head);

return 0;
}