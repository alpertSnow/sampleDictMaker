### read PWIDS locations
### merge with the head and tail of the sampleDict file.

# Input wind measurements locations (transposed)
wind.n <- 35 # 1-15: PWIDS, 16-35: SuperPWIDS
wind.loc <- matrix(c(    634311, 3926171, 8,
                         634602, 3926148, 8,
                         634797, 3926169, 8,
                         634602, 3926031, 8,
                         634803, 3926031, 8,
                         634345, 3925915, 8,
                         634613, 3925934, 8,
                         634795, 3925937, 8,
                         634939, 3925886, 8,
                         634319, 3925766, 8,
                         634605, 3925769, 8,
                         634769, 3925798, 8,
                         634942, 3925779, 8,
                         634783, 3925590, 32,# PWIDS 14, South edge of Cox Cenvention Center roof (25 m)
                         634392, 3925033, 35,# PWIDS 15, 25 m above roof Post Office roof (5-story)
                         634605, 3926378, 8,
                         634809, 3926379, 8,
                         634603, 3926264, 8,
                         634780, 3926260, 8,
                         634602, 3926148, 8,
                         634797, 3926169, 8,
                         634595, 3926049, 8,
                         634613, 3926050, 8,
                         634602, 3926031, 8,
                         634614, 3926036, 8,
                         634771, 3926048, 8,
                         634795, 3926054, 8,
                         634777, 3926029, 8,
                         634803, 3926031, 8,
                         634612, 3925952, 8,
                         634795, 3925937, 8,
                         634605, 3925769, 8,
                         634769, 3925798, 8,
                         634795, 3925800, 8,
                         634609, 3925551, 8), nrow = 3, ncol = receptor.n)

# Input location mapping info
init.loc <- c(634614.5, 3925939.8, 0)
target.loc <- c(1900, 1400, 0)

# Calc translate vector and translate
transVec <- target.loc - init.loc
windLocation <- round(wind.loc + transVec,2)

# Input fieldNames
fn <- c('    U','    k','    epsilon')

# Make the point coordiates as "(x y z)"
points <- apply(t(windLocation), 1, paste, collapse = ' ')
coords.str <- paste0('                (', points, ')')

# read head and tail
head <- readLines('PWIDS sampleDict/sampleDict-head')
tail <- readLines('PWIDS sampleDict/sampleDict-tail')

# set fieldNames
head <- append(head, fn, after = grep('field', head) + 1)

# write sampleDict
write(head, 'PWIDS sampleDict/sampleDict')
write(coords.str, 'PWIDS sampleDict/sampleDict', append = TRUE)
write(tail, 'PWIDS sampleDict/sampleDict', append = TRUE)
