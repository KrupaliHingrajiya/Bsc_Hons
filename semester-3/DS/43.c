#include <stdio.h>
#include <stdlib.h>

struct Node
{
int data;
struct Node *next;
};

// Function to create a linked list
struct Node *createList(int n)
{
struct Node *head = NULL, *temp = NULL, *newNode;
int i;

for (i = 1; i <= n; i++)
{
    newNode = (struct Node *)malloc(sizeof(struct Node));

    printf("Enter data for node %d: ", i);
    scanf("%d", &newNode->data);

    newNode->next = NULL;

    if (head == NULL)
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

// Function to compare two linked lists
int compareLists(struct Node *head1, struct Node *head2)
{
while (head1 != NULL && head2 != NULL)
{
    if (head1->data != head2->data)
        return 0;

    head1 = head1->next;
    head2 = head2->next;
}

if (head1 == NULL && head2 == NULL)
    return 1;
else
    return 0;
}

int main()
{
struct Node *head1, *head2;
int n1, n2;

printf("Enter number of nodes in List 1: ");
scanf("%d", &n1);

head1 = createList(n1);

printf("\nEnter number of nodes in List 2: ");
scanf("%d", &n2);

head2 = createList(n2);

if (compareLists(head1, head2))
    printf("\nBoth Linked Lists are SAME.\n");
else
    printf("\nBoth Linked Lists are NOT SAME.\n");

return 0;
}