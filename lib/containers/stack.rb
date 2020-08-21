class Containers::Stack
  include Enumerable

  Node = Struct.new(:obj, :left, :right)

  def initialize(arr = [])
    @size = 0
    @head = @tail = nil
    arr.each { |obj| push(obj) }
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def size
    @size
  end

  def push(obj)
    node = Node.new(obj, nil, nil)
    if empty?
      @head = @tail = node
    else
      node.left = @tail
      @tail.right = node
      @tail = node
    end
    @size += 1
    obj
  end

  def pop
    return if empty?
    r = @tail.obj
    if @size == 1
      clear
    else
      @tail.left.right = nil
      @tail = @tail.left
      @size -= 1
    end
    r
  end

  def clear
    @head = @tail = nil
    @size = 0
  end

  def empty?
    @size.zero?
  end

  def each_forward
    return if empty?
    node = @head
    while node
      yield node.obj
      node = node.right
    end
  end
  alias each each_forward

  def each_backward
    return if empty?
    node = @tail
    while node
      yield node.obj
      node = node.left
    end
  end
  alias reverse_each each_backward

  def to_s
    '[' + map { |obj| obj }.join(',') + ']'
  end

  def inspect
    to_s
  end
end