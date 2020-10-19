# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  return 0 if nums.empty?
  flag = 0
  (1...nums.length).each do |i|
    if nums[i] != nums[i - 1]
      nums[flag + 1] = nums[i]
      flag += 1
    end
  end
  flag + 1
end
