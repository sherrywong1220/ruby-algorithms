# https://leetcode.com/problems/lru-cache/
# 实现: 双向链表 + 哈希表

class LRUCache
  Node = Struct.new(:key, :value, :left, :right)

  def initialize(capacity)
    @size = 0
    @capacity = capacity
    @hash = {}
    @head = Node.new(nil, nil, nil, nil)
    @tail = Node.new(nil, nil, nil, nil)
    @head.right = @tail
    @tail.left = @head
  end

  def size
    @size
  end

  def get(key)
    node = @hash[key]
    if node
      delete(key)
      append(node.key, node.value)
      return node.value
    end
    return -1
  end

  def put(key, value)
    delete(key)
    append(key, value)
    nil
  end

  def delete(key)
    node = @hash[key]
    return unless node
    node.left.right = node.right
    node.right.left = node.left
    @hash.delete(key)
    @size -= 1
  end

  def to_s
    to_a.to_s
  end

  def to_a
    arr = []
    node = @head.right
    while node != @tail
      arr << { node.key => node.value }
      node = node.right
    end
    arr
  end

  def append(key, value)
    delete(@head.right.key) if @size == @capacity
    node = Node.new(key, value, nil, nil)
    node.left = @tail.left
    node.right = @tail
    @tail.left.right = node
    @tail.left = node
    @hash[key] = node
    @size += 1
  end
  private :append

end

# Your LRUCache object will be instantiated and called as such:
cache = LRUCache.new(2)
puts cache.put(1, 1);
puts cache
puts cache.put(2, 2);
puts cache

puts cache.get(1);
puts cache

puts cache.put(3, 3);
puts cache

puts cache.get(2);
puts cache

puts cache.put(4, 4);
puts cache

puts cache.get(1);
puts cache

puts cache.get(3);
puts cache

puts cache.get(4);
puts cache

