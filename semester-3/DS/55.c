#include <stdio.h>
#include <stdlib.h>

struct Node
{
int data;
struct Node *prev;
struct Node *next;
};

// Create Doubly Linked List
struct Node* createList(int n)
{
struct Node *head = NULL, *temp = NULL, *newNode;
int i;

for(i = 1; i <= n; i++)
{
    newNode = (struct Node*)malloc(sizeof(struct Node));

    printf("Enter data for node %d: ", i);
    scanf("%d", &newNode->data);

    newNode->prev = temp;
    newNode->next = NULL;

    if(head == NULL)
        head = newNode;
    else
        temp->next = newNode;

    temp = newNode;
}

return head;
}

// Delete Alternate Nodes
void deleteAlternate(struct Node *head)
{
struct Node *temp = head;
struct Node *del;

while(temp != NULL && temp->next != NULL)
{
    del = temp->next;              // Node to delete

    temp->next = del->next;

    if(del->next != NULL)
        del->next->prev = temp;

    free(del);

    temp = temp->next;             // Move to next remaining node
}
}

// Display Doubly Linked List
void display(struct Node *head)
{
while(head != NULL)
{
    printf("%d <-> ", head->data);
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

printf("\nOriginal Doubly Linked List:\n");
display(head);

deleteAlternate(head);

printf("\nDoubly Linked List after deleting alternate nodes:\n");
display(head);

return 0;
}