#include <stdio.h>
#include <stdlib.h>

struct Node
{
int data;
struct Node *next;
};

struct Node *head = NULL;

void insertFront()
{
struct Node *newNode;
newNode = (struct Node *)malloc(sizeof(struct Node));

printf("Enter data: ");
scanf("%d", &newNode->data);

newNode->next = head;
head = newNode;

printf("Node inserted at front.\n");
}

void insertEnd()
{
struct Node *newNode, *temp;

newNode = (struct Node *)malloc(sizeof(struct Node));

printf("Enter data: ");
scanf("%d", &newNode->data);

newNode->next = NULL;

if (head == NULL)
{
    head = newNode;
}
else
{
    temp = head;
    while (temp->next != NULL)
    {
        temp = temp->next;
    }
    temp->next = newNode;
}

printf("Node inserted at end.\n");
}

void display()
{
struct Node *temp;

if (head == NULL)
{
    printf("Linked List is Empty.\n");
    return;
}

temp = head;

printf("Linked List: ");

while (temp != NULL)
{
    printf("%d -> ", temp->data);
    temp = temp->next;
}

printf("NULL\n");
}

void deleteFront()
{
struct Node *temp;

if (head == NULL)
{
    printf("Linked List is Empty.\n");
    return;
}

temp = head;
head = head->next;

free(temp);

printf("First node deleted.\n");
}

void deleteEnd()
{
struct Node *temp, *prev;

if (head == NULL)
{
    printf("Linked List is Empty.\n");
    return;
}

if (head->next == NULL)
{
    free(head);
    head = NULL;
}
else
{
    temp = head;

    while (temp->next != NULL)
    {
        prev = temp;
        temp = temp->next;
    }

    prev->next = NULL;
    free(temp);
}

printf("Last node deleted.\n");
}

void deletePosition()
{
int pos, i;
struct Node *temp, *prev;

if (head == NULL)
{
    printf("Linked List is Empty.\n");
    return;
}

printf("Enter position: ");
scanf("%d", &pos);

if (pos == 1)
{
    deleteFront();
    return;
}

temp = head;

for (i = 1; i < pos; i++)
{
    prev = temp;
    temp = temp->next;

    if (temp == NULL)
    {
        printf("Invalid Position.\n");
        return;
    }
}

prev->next = temp->next;
free(temp);

printf("Node deleted.\n");
}

void countNodes()
{
int count = 0;
struct Node *temp = head;

while (temp != NULL)
{
    count++;
    temp = temp->next;
}

printf("Total Nodes = %d\n", count);
}

int main()
{
int choice;

do
{
    printf("\n------ MENU ------\n");
    printf("1. Insert at Front\n");
    printf("2. Display\n");
    printf("3. Delete First Node\n");
    printf("4. Insert at End\n");
    printf("5. Delete Last Node\n");
    printf("6. Delete from Position\n");
    printf("7. Count Nodes\n");
    printf("8. Exit\n");

    printf("Enter Choice: ");
    scanf("%d", &choice);

    switch (choice)
    {
    case 1:
        insertFront();
        break;

    case 2:
        display();
        break;

    case 3:
        deleteFront();
        break;

    case 4:
        insertEnd();
        break;

    case 5:
        deleteEnd();
        break;

    case 6:
        deletePosition();
        break;

    case 7:
        countNodes();
        break;

    case 8:
        printf("Program Ended.\n");
        break;

    default:
        printf("Invalid Choice.\n");
    }

} while (choice != 8);

return 0;
}