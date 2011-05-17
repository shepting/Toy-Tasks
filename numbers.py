numbers = 0
for x in xrange(10000000000):
    numbers += len([l for l in str(x) if l=='1'])
    if numbers <= x:
        print "Solved: %s" % x