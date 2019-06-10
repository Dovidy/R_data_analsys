sp <- ' '
sh <- '#'

dia <- function(num) {
  for(i in 1:4) {
    print(' ')
    for(j in 1:4 - i) {
      print('#')
    }
  }
}

dia(7)

for(i in 1:4) {
  for(j in 1:(4-i)) {
    cat(' ')
  }
  for(j in 1:i) {
    cat('#')
  }
  cat('\n')
}
