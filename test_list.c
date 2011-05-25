/*
 *  main.c
 *
 * Test app
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct node {
    char *value;
    struct node *next;
};

// Print out a linked list
void print_list(struct node *head)
{
    struct node *curr_node = head;
    while (curr_node != NULL){
        printf("Value: %s\tSize: %u\tNode: %p\n",curr_node->value, sizeof(*curr_node), (void *)curr_node);
        curr_node = curr_node->next;
    }

}


int main(int argc, char *argv[])
{
    printf("Running...\n");
    
    struct node *head;
    
    struct node *first = malloc(sizeof(struct node));
    head = first;
    
    struct node *second = malloc(sizeof(struct node));
    second->next = NULL;
    first->next = second;
    
    first->value = "First item";
    second->value = "Second item";
    
    print_list(head);

    return 0;
}
