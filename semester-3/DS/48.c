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

void display(struct Node *head)
{
while(head != NULL)
{
    printf("%d -> ", head->data);
    head = head->next;
}
printf("NULL\n");
}

void swapKthNode(struct Node *head, int k)
{
int count = 0, i;
struct Node *first, *second, *temp;

temp = head;
while(temp != NULL)
{
    count++;
    temp = temp->next;
}

if(k > count)
{
    printf("Invalid value of K\n");
    return;
}

first = head;
for(i = 1; i < k; i++)
    first = first->next;

second = head;
for(i = 1; i < count - k + 1; i++)
    second = second->next;

int t = first->data;
first->data = second->data;
second->data = t;
}

int main()
{
struct Node *head;
int n, k;

printf("Enter number of nodes: ");
scanf("%d", &n);

head = createList(n);

printf("\nOriginal Linked List:\n");
display(head);

printf("\nEnter value of K: ");
scanf("%d", &k);

swapKthNode(head, k);

printf("\nLinked List after swapping:\n");
display(head);

return 0;
}