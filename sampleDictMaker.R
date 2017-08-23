### read x,y,z coordinate vectors
### form a 3-d point matrix as the sample points
### merge with the head and tail of the sampleDict file.

# Input coordinate vectors
x <- seq(1,5,2)
y <- seq(2,6,2)
z <- seq(1,1,1)

# Input fieldNames
fn <- c('    U','    k')

# Make the point coordiates as "(x y z)"
points <- expand.grid( x , y , z )
points.str <- do.call(paste, points)
coords.str <- paste0('                (', points.str, ')')

# read head and tail
head <- readLines('sampleDict-head')
tail <- readLines('sampleDict-tail')

# set fieldNames
head <- append(head, fn, after = grep('field', head) + 1)

# write sampleDict
write(head, 'sampleDict')
write(coords.str, 'sampleDict', append = TRUE)
write(tail, 'sampleDict', append = TRUE)
