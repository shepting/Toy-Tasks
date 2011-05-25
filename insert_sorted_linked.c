/*
 * insert_sorted_linked.c
 *
 * Insert a new node into a sorted linked list.
 *
 * Steven Hepting
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>


struct node {
    char *value;
    struct node *next;
};

void print_list(struct node *head){
    //printf("Printing list\n");
    struct node *curr_node = head;
    while (curr_node != NULL){
        printf("Node: %p Value: %s Points to: %p\n", (void *)curr_node, (*curr_node).value, (void *)(*curr_node).next);
        curr_node = (*curr_node).next;
    }
}


void insert_into_list(struct node *head, char *value){
    struct node *curr_node = head;
    struct node *previous = NULL;
    
    // Get to the node after
    // Note: strcmp("first", "second") -> -1
    while (strcmp((*curr_node).value, value) < 0){
        previous = curr_node;
        curr_node = (*curr_node).next;
    }
    
    // Make the new node and insert
    struct node *new_node = malloc(sizeof(struct node));
    (*new_node).value = value;
    (*new_node).next = curr_node;
    (*previous).next = new_node;
}

int main(int argc, char * argv[]){
    printf("Starting\n");
    
    struct node *head;
    struct node *first = malloc(sizeof(struct node));
    (*first).value = "First";
    head = first;
    
    struct node *second = malloc(sizeof(struct node));
    (*second).value = "Second";
    (*first).next = second;
    
    struct node *third = malloc(sizeof(struct node));
    (*third).value = "Third";
    (*second).next = third;
    (*third).next = NULL;
    //printf("Got here\n");
    
    //printf("Compare: %i\n", strcmp("apple", "beta"));
    //printf("Compare: %i\n", strcmp("carotene", "beta"));
    
    print_list(head);
    insert_into_list(head, "Fourth");
    print_list(head);
    
    
    return 0;
}