#include <stdio.h>
#include <stdlib.h>

struct node {
    char value;
    struct node *next;
    };
    

int main(int argc, char*argv[])
{
    printf("Generating.\n");
    
    struct node *head = NULL;
    struct node *tail = NULL;
    
    int i;
    for (i=0; i<10;i++){
        struct node * nn_ptr = malloc(sizeof(struct node));
        (*nn_ptr).value = i+97;
        (*nn_ptr).next = NULL;
        //printf("Made new node %i %c %p\n", i, (*nn_ptr).value, (void *)nn_ptr);
        
        if (!head){
            printf("Assigning head pointer\n");
            head = nn_ptr;
        } else {
            printf("Updating tail pointer\n");
            (*tail).next = nn_ptr; // Put us at the end
        }
        tail = nn_ptr;
    }
    
    struct node * tmp = head;
    while ((*tmp).next != NULL)
    {
        printf("Node: %c %u, %p\n", (*tmp).value, (unsigned int)sizeof(*tmp), (void *)tmp);
        tmp = (*tmp).next;
        
    }
    
    return 0;
}