#include <stdio.h>

int main() {
int arr[100], n, i, j, temp;
int *p;

printf("Enter the number of elements: ");
scanf("%d", &n);

p = arr;   

printf("Enter %d elements:\n", n);
for (i = 0; i < n; i++) {
    scanf("%d", (p + i));
}

for (i = 0; i < n - 1; i++) {
    for (j = i + 1; j < n; j++) {
        if (*(p + i) > *(p + j)) {
            temp = *(p + i);
            *(p + i) = *(p + j);
            *(p + j) = temp;
        }
    }
}

printf("\nSorted array in ascending order:\n");
for (i = 0; i < n; i++) {
    printf("%d ", *(p + i));
}

return 0;
}