"""Generate all combinations of n elements using backtracking"""

finished = False

def backtrack(a, k, n):
    #print "k:%s a:%s\t" % (k, a[1:])
    if is_a_solution(a, k, n):
        process_solution(a, k, n)
    else:
        k = k + 1
        candidates = construct_candidates(a, k, n)
        for i in range(len(candidates)):
            a[k] = candidates[i]
            make_move(a, k, n)
            backtrack(a, k, n)
            unmake_move(a, k, n)
            if finished:
                return

def is_a_solution(a, k, n):
    return k == n

def process_solution(a, k, n):    
    print "{",
    i = 1
    for i in range(1, len(a)):
        if a[i]:
            print "%s" % i,
    print "}"

def construct_candidates(a, k, n):
    return [True, False]

def make_move(a, k, n):
    pass

def unmake_move(a, k, n):
    pass
    
if __name__ == "__main__":
    n = 3
    items = [None]*(n+1)
    backtrack(items, 0, n)