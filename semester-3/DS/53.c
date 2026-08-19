#include <stdio.h>
#include <stdlib.h>

struct Node
{
int coeff;
int exp;
struct Node *next;
};

// Create a node
struct Node* createNode(int coeff, int exp)
{
struct Node *newNode;

newNode = (struct Node*)malloc(sizeof(struct Node));

newNode->coeff = coeff;
newNode->exp = exp;
newNode->next = NULL;

return newNode;
}

// Insert node at end
void insert(struct Node **head, int coeff, int exp)
{
struct Node *newNode = createNode(coeff, exp);
struct Node *temp;

if(*head == NULL)
{
    *head = newNode;
    return;
}

temp = *head;

while(temp->next != NULL)
    temp = temp->next;

temp->next = newNode;
}

// Add two polynomials
struct Node* addPolynomial(struct Node *poly1, struct Node *poly2)
{
struct Node *result = NULL;

while(poly1 != NULL && poly2 != NULL)
{
    if(poly1->exp == poly2->exp)
    {
        insert(&result, poly1->coeff + poly2->coeff, poly1->exp);
        poly1 = poly1->next;
        poly2 = poly2->next;
    }
    else if(poly1->exp > poly2->exp)
    {
        insert(&result, poly1->coeff, poly1->exp);
        poly1 = poly1->next;
    }
    else
    {
        insert(&result, poly2->coeff, poly2->exp);
        poly2 = poly2->next;
    }
}

while(poly1 != NULL)
{
    insert(&result, poly1->coeff, poly1->exp);
    poly1 = poly1->next;
}

while(poly2 != NULL)
{
    insert(&result, poly2->coeff, poly2->exp);
    poly2 = poly2->next;
}

return result;
}

// Display Polynomial
void display(struct Node *head)
{
while(head != NULL)
{
    printf("%dx^%d", head->coeff, head->exp);

    if(head->next != NULL)
        printf(" + ");

    head = head->next;
}

printf("\n");
}

int main()
{
struct Node *poly1 = NULL;
struct Node *poly2 = NULL;
struct Node *result = NULL;

int n1, n2, coeff, exp, i;

printf("Enter number of terms in Polynomial 1: ");
scanf("%d", &n1);

printf("Enter coefficient and exponent:\n");
for(i = 1; i <= n1; i++)
{
    scanf("%d%d", &coeff, &exp);
    insert(&poly1, coeff, exp);
}

printf("Enter number of terms in Polynomial 2: ");
scanf("%d", &n2);

printf("Enter coefficient and exponent:\n");
for(i = 1; i <= n2; i++)
{
    scanf("%d%d", &coeff, &exp);
    insert(&poly2, coeff, exp);
}

printf("\nPolynomial 1: ");
display(poly1);

printf("Polynomial 2: ");
display(poly2);

result = addPolynomial(poly1, poly2);

printf("Result: ");
display(result);

return 0;
}