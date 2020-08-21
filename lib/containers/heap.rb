# frozen_string_literal: true

class Containers::Heap
  def initialize(compare_symbol = :<, arr = [], &compare_fn)
    initialize_compare(compare_symbol, &compare_fn)
    @size = 0
    @heap = []
    arr.each { |obj| add(obj) }
  end

  attr_reader :size

  def empty?
    @size.zero?
  end

  def peak
    @heap[0]
  end

  def pop
    return nil if empty?

    result = peak
    @size -= 1
    @heap[0] = @heap[@size]
    @heap[@size] = nil
    rebalance_down(0) if @size > 1

    result
  end

  def add(obj)
    @heap[@size] = obj
    @size += 1
    rebalance_up(size - 1)
    self
  end
  alias :<< :add

  def clear
    @heap = []
    @size = 0
  end

  def to_a
    @heap.dup
  end

  def initialize_compare(symbol, &fn)
    @compare = if block_given?
                 fn
               elsif (symbol == :<) || symbol.nil?
                 ->(a, b) { a < b }
               elsif symbol == :>
                 ->(a, b) { a > b }
               else
                 raise ArgumentError, 'This comparison symbol needs to be either :> or :<'
               end
  end
  private :initialize_compare

  def rebalance_down(i)
    left_i = left(i)
    right_i = right(i)

    if has_left(i) && compare(@heap[left_i], @heap[i]) && (!has_right(i) || compare(@heap[left_i], @heap[right_i]))
      # 左节点最小
      @heap[i], @heap[left_i] = @heap[left_i], @heap[i]
      rebalance_down(left_i)
    elsif has_right(i) && compare(@heap[right_i], @heap[i])
      # 右节点最小
      @heap[i], @heap[right_i] = @heap[right_i], @heap[i]
      rebalance_down(right_i)
    end
  end
  private :rebalance_down

  def rebalance_up(i)
    parent_i = parent(i)
    if has_parent(i) && compare(@heap[i], @heap[parent_i])
      @heap[i], @heap[parent_i] = @heap[parent_i], @heap[i]
      rebalance_up(parent_i)
    end
  end
  private :rebalance_up

  def has_right(i)
    right(i) < size
  end
  private :has_right

  def has_left(i)
    left(i) < size
  end
  private :has_left

  def left(i)
    i * 2 + 1
  end
  private :left

  def right(i)
    i * 2 + 2
  end
  private :left

  def parent(i)
    ((i - 1) / 2).floor
  end
  private :parent

  def has_parent(i)
    i >= 1
  end
  private :has_parent

  def compare(a, b)
    @compare.call(a, b)
  end
  private :compare

  def self.sort(array, order = :<, &compare_fn)
    heap = self.new(order, array, &compare_fn)
    (0...array.size).each do |i|
      array[i] = heap.pop
    end

    array
  end
end
