"""Quicksort algorithm in Python

No space or time optimizations performed.
"""

import random

def quicksort(unsorted_list):
    if len(unsorted_list) < 2:
        return unsorted_list
    
    # Prepare
    lower = []
    higher = []
    pivot = random.sample(unsorted_list, 1)[0]
    unsorted_list.remove(pivot)
    
    # To visualize recursive calls
    print '.',
    
    # Partition
    for x in unsorted_list:
        if x < pivot:
            lower.append(x)
        else:
            higher.append(x)
    
    # Combine
    return quicksort(lower) + [pivot] + quicksort(higher)
    
    
if __name__ == '__main__':
    # Prepare a list of integers, shuffle them
    numbers = range(100)
    random.shuffle(numbers)
    print "Unsorted: %s" % numbers
    
    # Sort and print
    sorted_list = quicksort(numbers)
    print 
    print "Sorted: %s" % sorted_list