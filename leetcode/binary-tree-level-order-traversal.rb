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
# @return {Integer[][]}
def level_order(root)
  return [] unless root
  result = []
  nodes = []
  nodes = [root]
  while !nodes.empty?
    level_result = []
    level_nodes = []
    nodes.each do |node|
      level_result << node.val
      level_nodes << node.left if node.left
      level_nodes << node.right if node.right
    end
    result << level_result
    nodes = level_nodes
  end
  result
end