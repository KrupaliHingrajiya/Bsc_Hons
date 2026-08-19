#include <stdio.h>
#include <string.h>

int main() {
char str[100];
char *start, *end;

printf("Enter a string: ");
scanf("%s", str);

start = str;
end = str + strlen(str) - 1;

while (start < end) {
    if (*start != *end) {
        printf("The string is NOT a Palindrome.\n");
        return 0;
    }
    start++;
    end--;
}

printf("The string is a Palindrome.\n");

return 0;
}