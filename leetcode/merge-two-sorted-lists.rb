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
def merge_two_lists(l1, l2)
    prev_node1 = nil
    prev_node2 = nil
    node1 = l1
    node2 = l2
    while node1 && node2
        if node1.val <= node2.val
            prev_node1 = node1
            node1 = node1.next
        else
            tmp_node = node2.next
            node2.next = node1
            if prev_node1
                prev_node1.next = node2
            else
                l1 = prev_node1 = node2
            end
            node1 = node2
            node2 = tmp_node 
        end    
    end
    
    if node2 && prev_node1
        prev_node1.next = node2
    elsif node2 && !prev_node1
        l1 = node2
    end
    l1
end
