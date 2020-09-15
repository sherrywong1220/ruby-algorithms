# 参考 http://songhuiming.github.io/pages/2018/01/07/shen-du-sou-suo-hui-su-fa-he-di-gui/
# @param {Integer} n
# @return {String[][]}
def solve_n_queens(n)
  res = []
  dfs([-1] * n, 0, [], res)
  res
end

# nums is a one-dimension array, like [1, 3, 0, 2] means
# first queen is placed in column 1, second queen is placed
# in column 3, etc.
def dfs(nums, index, path, res)
  return res << path if index == nums.length
  (0...nums.length).each do |column|
    nums[index] = column
    # 剪枝
    if valid(nums, index)
      tmp = "#{'.' * column}Q#{'.' * (nums.length - 1 - column)}"
      # 注意这里一定不能改变 path 原本的值
      dfs(nums, index + 1, path + [tmp], res)
    end
  end
end

# check whether nth queen can be placed in that column
def valid(nums, n)
  (0...n).each do |i|
    return false if (n - i) == (nums[n] - nums[i]).abs || nums[i] == nums[n]
  end
  true
end

# pp solve_n_queens(4)