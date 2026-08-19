#include <stdio.h>
#include <stdlib.h>

struct Node
{
int data;
struct Node *next;
};

int gcd(int a, int b)
{
while (b != 0)
{
    int temp = b;
    b = a % b;
    a = temp;
}
return a;
}

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

void insertGCD(struct Node *head)
{
struct Node *current = head;

while(current != NULL && current->next != NULL)
{
    int value = gcd(current->data, current->next->data);

    struct Node *newNode = (struct Node*)malloc(sizeof(struct Node));

    newNode->data = value;
    newNode->next = current->next;

    current->next = newNode;

    current = newNode->next;
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

insertGCD(head);

printf("\nLinked List after inserting GCD nodes:\n");
display(head);

return 0;
}