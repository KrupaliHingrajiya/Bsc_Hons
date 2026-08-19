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

struct Node* copyList(struct Node *head)
{
struct Node *copyHead = NULL, *copyTemp = NULL, *newNode;

while(head != NULL)
{
    newNode = (struct Node*)malloc(sizeof(struct Node));

    newNode->data = head->data;
    newNode->next = NULL;

    if(copyHead == NULL)
    {
        copyHead = newNode;
        copyTemp = newNode;
    }
    else
    {
        copyTemp->next = newNode;
        copyTemp = newNode;
    }

    head = head->next;
}

return copyHead;
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
struct Node *head1, *head2;
int n;

printf("Enter number of nodes: ");
scanf("%d", &n);

head1 = createList(n);

head2 = copyList(head1);

printf("\nOriginal Linked List:\n");
display(head1);

printf("\nCopied Linked List:\n");
display(head2);

return 0;
}