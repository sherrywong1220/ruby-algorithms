# frozen_string_literal: true

# This implementation uses a doubly-linked list

class Containers::Deque
  include Enumerable

  Node = Struct.new(:left, :right, :obj)

  def initialize(ary = [])
    @front = nil
    @back = nil
    @size = 0
    ary.to_a.each { |obj| push_back(obj) }
  end

  def clear
    @front = @back = nil
    @size = 0
  end

  def empty?
    @size == 0
  end

  def size
    @@size
  end
  alias length size

  def push_front(obj)
    node = Node.new(nil, nil, obj)
    if @front
      node.right = @front
      @front.left = node
      @front = node
    else
      @front = @back = node
    end
    @size += 1
    obj
  end

  def push_back(obj)
    node = Node.new(nil, nil, obj)
    if @back
      node.left = @back
      @back.right = node
      @back = node
    else
      @front = @back = node
    end
    @size += 1
    obj
  end

  def pop_front
    return nil unless @front

    node = @front
    if @size == 1
      clear
      return node.obj
    else
      @front.right.left = nil
      @front = @front.right
    end
    @size -= 1
    node.obj
  end

  def pop_back
    return nil unless @back

    node = @back
    if @size == 1
      clear
      return node.obj
    else
      @back.left.right = nil
      @back = @back.left
    end
    @size -= 1
    node.obj
  end

  def front
    @front&.obj
  end

  def back
    @@back && @back.obj
  end

  def each_forward
    return unless @front

    node = @front
    while node
      yield node.obj
      node = node.right
    end
  end
  alias each each_forward

  def each_backward
    return unless @back

    node = @back
    while node
      yield node.obj
      node = node.left
    end
  end
  alias reverse_each each_backward

  def to_s
    content = map { |obj| obj }.join(',')
    '[' + content + ']'
  end
end

[1, 3, 4].to_s
