#include <stdio.h>
#include <stdlib.h>

struct Node
{
int data;
struct Node *prev;
struct Node *next;
};

struct Node *head = NULL;

// Insert at Front
void insertFront()
{
struct Node *newNode;

newNode = (struct Node *)malloc(sizeof(struct Node));

printf("Enter data: ");
scanf("%d", &newNode->data);

newNode->prev = NULL;
newNode->next = head;

if(head != NULL)
    head->prev = newNode;

head = newNode;

printf("Node inserted at front.\n");
}

// Insert at End
void insertEnd()
{
struct Node *newNode, *temp;

newNode = (struct Node *)malloc(sizeof(struct Node));

printf("Enter data: ");
scanf("%d", &newNode->data);

newNode->next = NULL;

if(head == NULL)
{
    newNode->prev = NULL;
    head = newNode;
}
else
{
    temp = head;

    while(temp->next != NULL)
        temp = temp->next;

    temp->next = newNode;
    newNode->prev = temp;
}

printf("Node inserted at end.\n");
}

// Delete Node from Specified Position
void deletePosition()
{
struct Node *temp;
int pos, i;

if(head == NULL)
{
    printf("Linked List is Empty.\n");
    return;
}

printf("Enter position: ");
scanf("%d", &pos);

temp = head;

if(pos == 1)
{
    head = temp->next;

    if(head != NULL)
        head->prev = NULL;

    free(temp);

    printf("Node deleted.\n");
    return;
}

for(i = 1; i < pos && temp != NULL; i++)
    temp = temp->next;

if(temp == NULL)
{
    printf("Invalid Position.\n");
    return;
}

if(temp->next != NULL)
    temp->next->prev = temp->prev;

temp->prev->next = temp->next;

free(temp);

printf("Node deleted.\n");
}

// Display Doubly Linked List
void display()
{
struct Node *temp;

if(head == NULL)
{
    printf("Linked List is Empty.\n");
    return;
}

temp = head;

printf("Doubly Linked List:\n");

while(temp != NULL)
{
    printf("%d <-> ", temp->data);
    temp = temp->next;
}

printf("NULL\n");
}

int main()
{
int choice;

do
{
    printf("\n------ MENU ------\n");
    printf("1. Insert at Front\n");
    printf("2. Delete from Position\n");
    printf("3. Insert at End\n");
    printf("4. Display\n");
    printf("5. Exit\n");

    printf("Enter your choice: ");
    scanf("%d", &choice);

    switch(choice)
    {
        case 1:
            insertFront();
            break;

        case 2:
            deletePosition();
            break;

        case 3:
            insertEnd();
            break;

        case 4:
            display();
            break;

        case 5:
            printf("Program Ended.\n");
            break;

        default:
            printf("Invalid Choice.\n");
    }

} while(choice != 5);

return 0;
}