#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

int isAnagram(char str1[], char str2[]) {
    int count1[256] = {0};
    int count2[256] = {0};
    int i;

    if (strlen(str1) != strlen(str2))
        return 0;

    for (i = 0; str1[i] != '\0'; i++) {
        count1[(unsigned char)str1[i]]++;
        count2[(unsigned char)str2[i]]++;
    }

    for (i = 0; i < 256; i++) {
        if (count1[i] != count2[i])
            return 0;
    }

    return 1;
}

int main() {
    int N, i, randomIndex;
    char words[50][50];
    char userWord[50];

    printf("Enter number of words: ");
    scanf("%d", &N);

    printf("Enter %d words:\n", N);
    for (i = 0; i < N; i++) {
        scanf("%s", words[i]);
    }

    srand(time(NULL));
    randomIndex = rand() % N;

    printf("\nSelected Word: %s\n", words[randomIndex]);

    printf("Enter its anagram: ");
    scanf("%s", userWord);

    if (isAnagram(words[randomIndex], userWord))
        printf("Correct! '%s' is an anagram of '%s'.\n",
               userWord, words[randomIndex]);
    else
        printf("Wrong! '%s' is not an anagram of '%s'.\n",
               userWord, words[randomIndex]);

    return 0;
}