# You are not suppose to use the library's sort function for this problem.
# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.

# Input: [2,0,2,1,1,0]
# Output: [0,0,1,1,2,2]
def sort_colors(nums)
  anchor = -1
  (0..2).each do |num|
    count = 0
    break if anchor + 1 > nums.length - 1
    ((anchor + 1)...nums.length).each do |i|
      if nums[i] == num
        # swap
        anchor += 1
        tmp = nums[anchor]
        nums[anchor] = nums[i]
        nums[i] = tmp
      end
    end
  end
end
