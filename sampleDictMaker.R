### read x,y,z coordinate vectors
### form a 3-d point matrix as the sample points
### merge with the head and tail of the sampleDict file.

# Input coordinate vectors
x <- seq(634177,635177,2)
y <- seq(3925780,3926530,2)
z <- seq(0.2,0.2,1)

init.loc <- c(634614.5,3925939.8,0)
target.loc <- c(1900,1400,0)


# Input fieldNames
fn <- c('    T','    Tr01','    Tr02','    Tr03','    Tr04','    Tr05','    Tr06','    Tr07','    Tr08','    Tr09',
     '    Tr10','    Tr11','    Tr12','    Tr13','    Tr14','    Tr15','    Tr16','    Tr17','    Tr18','    Tr19',
     '    Tr20','    Tr21','    Tr22','    Tr23','    Tr24','    Tr25','    Tr26','    Tr27','    Tr28','    Tr29',
     '    Tr30','    Tr31','    Tr32','    Tr33','    Tr34','    Tr35','    Tr36','    Tr37','    Tr38','    Tr39',
     '    Tr40','    Tr41','    Tr42','    Tr43','    Tr44')

# Make the point coordiates as "(x y z)"
points <- expand.grid( x , y , z )
transVec <- target.loc - init.loc
points[,1] <- points[,1] + transVec[1]
points[,2] <- points[,2] + transVec[2]
points[,3] <- points[,3] + transVec[3]
points <- round(points, 2)
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
