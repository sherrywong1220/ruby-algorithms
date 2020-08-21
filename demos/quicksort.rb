require_relative '../lib/algorithms'

arr = [6, 4, 2, 8, 23, 5, 7, 1]
Algorithms::Sort.quicksort(arr)
puts arr.to_s

arr = []
Algorithms::Sort.quicksort(arr)
puts arr.to_s
