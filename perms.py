
def perms(items):
    if len(items) <= 1: # It's down to the last item
        yield items
    else:               # Still at least two in the list
        for perm in perms(items[1:]):
            # Go through each item
            for i in range(len(perm) + 1):
                print i
                yield perm[:i] + [items[0]] + perm[i:]
            
            
for i in perms([1,2,3]):
    print i
    
    
#perms[1,2,3]
#    perms[2,3]
#        perms[3]