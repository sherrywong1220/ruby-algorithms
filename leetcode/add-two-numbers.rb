# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  value = get_value_from_list(l1) + get_value_from_list(l2)
  get_list_from_value(value)
end

def get_value_from_list(l)
  value = 0
  i = 0
  while(l)
    value += l.val * (10 ** i)
    l = l.next
    i += 1
  end
  value
end

def get_list_from_value(value)
  return ListNode.new(0, nil) if value.zero?
  head = l = nil
  while value > 0 do
    if l.nil?
      head = l = ListNode.new(value % 10, nil)
    else
      l.next = ListNode.new(value % 10, nil)
      l = l.next
    end
    value = value / 10
  end
  head
end
