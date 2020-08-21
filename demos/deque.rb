require_relative '../lib/algorithms'

deque = Containers::Deque.new

[1, 2, 3, 4].each { |i| deque.push_back(i) }
puts deque.pop_back
puts deque

