#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Song
{
char name[50];
struct Song *prev;
struct Song *next;
};

struct Song *head = NULL;
struct Song *tail = NULL;
struct Song *current = NULL;

void addSong()
{
struct Song *newSong;

newSong = (struct Song *)malloc(sizeof(struct Song));

printf("Enter Song Name: ");
scanf(" %[^\n]", newSong->name);

newSong->next = NULL;
newSong->prev = NULL;

if(head == NULL)
{
head = tail = current = newSong;
}
else
{
tail->next = newSong;
newSong->prev = tail;
tail = newSong;
}

printf("Song Added Successfully.\n");
}

// Display Playlist
void display()
{
struct Song *temp;

if(head == NULL)
{
printf("Playlist is Empty.\n");
return;
}

temp = head;

printf("\nPlaylist:\n");

while(temp != NULL)
{
printf("%s\n", temp->name);
temp = temp->next;
}
}

// Play Current Song
void playCurrent()
{
if(current == NULL)
{
printf("No Song Available.\n");
}
else
{
printf("Now Playing: %s\n", current->name);
}
}

// Play Next Song
void nextSong()
{
if(current == NULL)
{
printf("Playlist is Empty.\n");
return;
}

if(current->next != NULL)
{
current = current->next;
printf("Now Playing: %s\n", current->name);
}
else
{
printf("This is the Last Song.\n");
}
}

// Play Previous Song
void previousSong()
{
if(current == NULL)
{
printf("Playlist is Empty.\n");
return;
}

if(current->prev != NULL)
{
current = current->prev;
printf("Now Playing: %s\n", current->name);
}
else
{
printf("This is the First Song.\n");
}
}

int main()
{
int choice;

do
{
printf("\n------ MUSIC PLAYER ------\n");
printf("1. Add Song\n");
printf("2. Display Playlist\n");
printf("3. Play Current Song\n");
printf("4. Play Next Song\n");
printf("5. Play Previous Song\n");
printf("6. Exit\n");

printf("Enter Choice: ");
scanf("%d", &choice);

switch(choice)
{
    case 1:
        addSong();
        break;

    case 2:
        display();
        break;

    case 3:
        playCurrent();
        break;

    case 4:
        nextSong();
        break;

    case 5:
        previousSong();
        break;

    case 6:
        printf("Thank You!\n");
        break;

    default:
        printf("Invalid Choice.\n");
}

} while(choice != 6);

return 0;
}