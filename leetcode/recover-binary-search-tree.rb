# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Void} Do not return anything, modify root in-place instead.

def recover_tree(root)
  flags = {
      first_node: nil,
      second_node: nil,
      previous_node: TreeNode.new(:MIN)
  }
  inorder_traverse(root, flags)
    
  tmp = flags[:first_node].val
  flags[:first_node].val = flags[:second_node].val
  flags[:second_node].val = tmp
end

def inorder_traverse(node, flags)
  return if node.nil?
  inorder_traverse(node.left)

  if ( flags[:previous_node].val != :MIN && node.val < flags[:previous_node].val )
    flags[:first_node] = flags[:previous_node] unless flags[:first_node]
    flags[:second_node] = node if flags[:first_node]
  end
  flags[:previous_node] = node

  inorder_traverse(node.right)
end
