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
        head = temp = newNode;
    }
    else
    {
        temp->next = newNode;
        temp = newNode;
    }
}

return head;
}

struct Node* swapPairs(struct Node *head)
{
if(head == NULL || head->next == NULL)
    return head;

struct Node *prev = NULL;
struct Node *curr = head;
struct Node *nextNode;

head = head->next;

while(curr != NULL && curr->next != NULL)
{
    nextNode = curr->next;

    
    curr->next = nextNode->next;
    nextNode->next = curr;

    if(prev != NULL)
        prev->next = nextNode;

    prev = curr;
    curr = curr->next;
}

return head;
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

head = swapPairs(head);

printf("\nLinked List after swapping consecutive nodes:\n");
display(head);

return 0;
}