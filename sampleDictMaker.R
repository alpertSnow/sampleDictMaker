### read x,y,z coordinate vectors
### form a 3-d point matrix as the sample points
### merge with the head and tail of the sampleDict file.

# Input coordinate vectors
x <- seq(201,849,2)  
y <- seq(1,899,2)  
z <- seq(1,1,1)  

# Input fieldNames
fn <- c('    T','    Tr1','    Tr2','    Tr3','    Tr4','    Tr5','    Tr6','    Tr7','    Tr8','    Tr9')

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
