# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
    total = 0
    node = head
    while(node)
        total += 1
        node = node.next
    end
    move = total - n
    node = head
    prev_node = nil
    if move == 0
        head = head.next
        return head
    end
    move.times do |i|
        prev_node = node
        node = node.next
    end
    prev_node.next = node.next
    head
end
