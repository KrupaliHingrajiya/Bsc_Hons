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
struct Node *newNode, *temp;

newNode = (struct Node *)malloc(sizeof(struct Node));

printf("Enter data: ");
scanf("%d", &newNode->data);

if (head == NULL)
{
    head = newNode;
    newNode->next = head;
}
else
{
    temp = head;

    while (temp->next != head)
        temp = temp->next;

    newNode->next = head;
    temp->next = newNode;
    head = newNode;
}

printf("Node inserted at front.\n");
}

void insertEnd()
{
struct Node *newNode, *temp;

newNode = (struct Node *)malloc(sizeof(struct Node));

printf("Enter data: ");
scanf("%d", &newNode->data);

if (head == NULL)
{
    head = newNode;
    newNode->next = head;
}
else
{
    temp = head;

    while (temp->next != head)
        temp = temp->next;

    temp->next = newNode;
    newNode->next = head;
}

printf("Node inserted at end.\n");
}

void deletePosition()
{
struct Node *temp, *prev;
int pos, i, count = 0;

if (head == NULL)
{
    printf("Circular Linked List is Empty.\n");
    return;
}

printf("Enter position: ");
scanf("%d", &pos);

temp = head;

do
{
    count++;
    temp = temp->next;
} while (temp != head);

if (pos < 1 || pos > count)
{
    printf("Invalid Position.\n");
    return;
}

if (pos == 1)
{
    if (head->next == head)
    {
        free(head);
        head = NULL;
    }
    else
    {
        temp = head;

        while (temp->next != head)
            temp = temp->next;

        temp->next = head->next;

        struct Node *del = head;
        head = head->next;
        free(del);
    }

    printf("Node deleted.\n");
    return;
}

temp = head;

for (i = 1; i < pos; i++)
{
    prev = temp;
    temp = temp->next;
}

prev->next = temp->next;
free(temp);

printf("Node deleted.\n");
}

void display()
{
struct Node *temp;

if (head == NULL)
{
    printf("Circular Linked List is Empty.\n");
    return;
}

temp = head;

printf("Circular Linked List:\n");

do
{
    printf("%d -> ", temp->data);
    temp = temp->next;
} while (temp != head);

printf("(HEAD)\n");
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

    switch (choice)
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

} while (choice != 5);

return 0;
}