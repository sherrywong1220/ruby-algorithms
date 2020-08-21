# frozen_string_literal: true

module Algorithms::Sort
  def self.quicksort(container)
    qc(container, 0, container.size - 1)
    container
  end

  #@todo
  def quicksort_using_iteration(container)

  end

  def self.qc(c, p, r)
    return if p >= r

    # 对 p 到 r 进行操作分区，返回新的分区点
    q = partition(c, p, r)
    qc(c, p, q - 1)
    qc(c, q, r)
  end

  def self.partition(c, p, r)
    pivot = c[p]
    i = p + 1
    j = p # j指向小于 pivot 的元素的最右元素，以便最后和 pivot 交换位置
    while i <= r do
      if c[i] < pivot
        j += 1 # 每当 c[i] < pivot，j 就要 + 1
        swap(c, i ,j)
      end
      i += 1
    end
    swap(c, p, j)
    j == p ? j + 1 : j
  end

  def self.swap(c, i, j)
    t = c[i]
    c[i] = c[j]
    c[j] = t
  end
end
