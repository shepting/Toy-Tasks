//
// main.c
//
// Toy program for generating and printing a singly-linked list
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct node {
    char *value;
    struct node *next;
    };
    

int main(int argc, char*argv[])
{
    printf("Generating.\n");
    
    struct node *head = NULL;
    struct node *tail = NULL;
        
    char *base= "value-";
    //printf("Length: %zu \n", strlen(base));
    
    int i;
    for (i=0; i<10;i++){
        char *new_str = malloc(strlen(base)+1);
        strcat(new_str, base);
        
        struct node * nn_ptr = malloc(sizeof(struct node));
        char new = (i+97);
        (*nn_ptr).value = strncat(new_str, &new, 1);
        (*nn_ptr).next = NULL;
        
        // Add to the list (set head if not yet set)
        if (!head){
            //printf("Assigning head pointer\n");
            head = nn_ptr;
        } else {
            //printf("Updating tail pointer\n");
            (*tail).next = nn_ptr; // Put us at the end
        }
        tail = nn_ptr;
    }
    
    struct node * tmp = head;
    while ((*tmp).next != NULL)
    {
        printf("Node: %s %u, %p\n", (*tmp).value, (unsigned int)sizeof(*tmp), (void *)tmp);
        tmp = (*tmp).next;
        
    }
    
    return 0;
}