#include <stdio.h>
#include <stdlib.h>

struct Node
{
int data;
struct Node *next;
};

// Create Circular Linked List
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

temp->next = head;   // Make it circular

return head;
}

// Display Circular Linked List
void display(struct Node *head)
{
struct Node *temp;

if(head == NULL)
{
    printf("List is Empty.\n");
    return;
}

temp = head;

do
{
    printf("%d -> ", temp->data);
    temp = temp->next;
} while(temp != head);

printf("(HEAD)\n");
}

// Split Circular Linked List
void splitList(struct Node *head, struct Node **head1, struct Node **head2)
{
struct Node *slow, *fast;

if(head == NULL)
    return;

slow = head;
fast = head;

while(fast->next != head && fast->next->next != head)
{
    slow = slow->next;
    fast = fast->next->next;
}

if(fast->next->next == head)
    fast = fast->next;

*head1 = head;

if(head->next != head)
    *head2 = slow->next;

fast->next = slow->next;
slow->next = head;
}

int main()
{
struct Node *head = NULL;
struct Node *head1 = NULL;
struct Node *head2 = NULL;
int n;

printf("Enter number of nodes: ");
scanf("%d", &n);

head = createList(n);

printf("\nOriginal Circular Linked List:\n");
display(head);

splitList(head, &head1, &head2);

printf("\nFirst Half:\n");
display(head1);

printf("\nSecond Half:\n");
display(head2);

return 0;
}