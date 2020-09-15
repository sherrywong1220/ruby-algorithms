# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}

def two_sum(nums, target)
  hash = {}
  nums.each_with_index do |n, i|
    hash[n] = i
  end
  (0...(nums.length - 1)).each do |i|
    value = target - nums[i]
    return [i, hash[value]] if !hash[value].nil? && hash[value] != i
  end
end
