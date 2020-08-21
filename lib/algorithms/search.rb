module Algorithms::Search
  # Complexity: O(lg N)
  #
  #   Algorithms::Search.binary_search([1, 2, 3], 1) #=> 1
  #   Algorithms::Search.binary_search([1, 2, 3], 4) #=> nil
  def self.binary_search(container, item)
    return nil if item.nil?
    low = 0
    high = container.size - 1
    while low <= high
      mid = (low + high) / 2
      val = container[mid]
      if val > item
        high = mid - 1
      elsif val < item
        low = mid + 1
      else
        return val
      end
    end
    nil
  end

  def self.binary_search_using_recursion(container, item)
    return nil if item.nil?
    low = 0
    high = container.size - 1
    find_item_using_binary_search(container, low, high, item)
  end

  def self.find_item_using_binary_search(container, low, high, item)
    return if low > high
    mid = (low + high) / 2
    val = container[mid]
    if val > item
      high = mid - 1
      return find_item_using_binary_search(container, low, high, item)
    elsif val < item
      low = mid + 1
      return find_item_using_binary_search(container, low, high, item)
    else
      return item
    end
  end
end