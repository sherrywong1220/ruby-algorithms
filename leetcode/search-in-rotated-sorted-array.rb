# https://leetcode.com/problems/search-in-rotated-sorted-array/``

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  low = 0
  high = nums.size - 1
  while (low <= high)
    mid = (low + high) / 2
    # 先确定边际逻辑会更清晰
    return mid if nums[mid] == target
    return low if nums[low] == target
    return high if nums[high] == target
    return -1 if nums[high] == nums[low] && nums[low] != target

    if nums[mid] > nums[high]
      if nums[mid] > target && nums[high] < target
        high = mid - 1
      else nums[mid] < target
        low = mid + 1
      end
    else
      if nums[mid] < target && nums[high] > target
        low = mid + 1
      else
        high = mid - 1
      end
    end
  end
  return -1
end

puts search([4,5,6,7,0,1,2], 0)
puts search( [4,5,6,7,0,1,2], 3)
puts search([1],0 )
puts search([1, 3], 2)
puts search([4,5,6,7,0,1,2], 1)