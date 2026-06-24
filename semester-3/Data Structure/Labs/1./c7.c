#include <stdio.h>
int main()
{
    int totalDays, years, weeks, days;

    printf("enter days:");
    scanf("%d", &totalDays);

    years = totalDays/365;
    totalDays = totalDays%365;

    weeks = totalDays/7;
    days = totalDays%7;

    printf("%d year(s), %d week(s), %d day(s)\n", years, weeks, days);

    return 0;
}