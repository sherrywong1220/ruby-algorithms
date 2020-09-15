# frozen_string_literal: true

# Assume a BST is defined as follows:
#   The left subtree of a node contains only nodes with keys less than the node's key.
#   The right subtree of a node contains only nodes with keys greater than the node's key.
#   Both the left and right subtrees must also be binary search trees.
#
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
# @return {Boolean}

def is_valid_bst(root)
  validate_node(root, :MIN, :MAX)
end

def validate_node(node, less_than, greater_than)
  return true if node.nil?
  if (less_than == :MIN || node.val > less_than) && (greater_than == :MAX || node.val < greater_than)
    validate_node(node.left, less_than, node.val) && validate_node(node.right, node.val, greater_than)
  else
    false
  end
end

