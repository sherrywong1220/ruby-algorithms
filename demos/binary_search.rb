require_relative '../lib/algorithms'

puts Algorithms::Search.binary_search([1,2,3,4,5], 0)
puts Algorithms::Search.binary_search([1,2,3,4,5], 1)
puts Algorithms::Search.binary_search([1,2,3,4,5], 5)


puts Algorithms::Search.binary_search_using_recursion([1,2,3,4,5], 0)
puts Algorithms::Search.binary_search_using_recursion([1,2,3,4,5], 1)
puts Algorithms::Search.binary_search_using_recursion([1,2,3,4,5], 5)


