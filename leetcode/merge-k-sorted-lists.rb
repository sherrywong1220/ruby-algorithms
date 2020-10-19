# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode[]} lists
# @return {ListNode}

require 'algorithms'

def merge_k_lists(lists)
    pq = Containers::PriorityQueue.new { |x, y| (y <=> x) == 1 }
    lists.each do |l|
        pq.push(l, l.val) if l
    end
    head = l = nil
    while !pq.empty?
        node = pq.pop
        pq.push(node.next, node.next.val) if node.next
        if l.nil?
            head = l = node
        else
            l.next = node
            l = l.next
        end
    end
    head
end
