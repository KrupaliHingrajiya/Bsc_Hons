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

void removeDuplicates(struct Node *head)
{
struct Node *current, *duplicate;

current = head;

while(current != NULL && current->next != NULL)
{
    if(current->data == current->next->data)
    {
        duplicate = current->next;
        current->next = current->next->next;
        free(duplicate);
    }
    else
    {
        current = current->next;
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

printf("Enter elements in sorted order:\n");
head = createList(n);

printf("\nOriginal Linked List:\n");
display(head);

removeDuplicates(head);

printf("\nLinked List after removing duplicates:\n");
display(head);

return 0;
}