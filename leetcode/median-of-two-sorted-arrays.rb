# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  nums = []
  length1 = nums1.length
  length2 = nums2.length
  i = j = 0
  while(i < length1 && j < length2)
    if nums1[i] < nums2[j]
      nums << nums1[i]
      i += 1
    else
      nums << nums2[j]
      j += 1
    end
  end
  if i == length1
    nums2[j...length2].each do |n|
      nums << n
    end
  end

  if j == length2
    nums1[i...length1].each do |n|
      nums << n
    end
  end
    
  puts nums
  if nums.length.odd?
    nums[nums.length / 2]
  else
    (nums[nums.length / 2 - 1] + nums[nums.length / 2]) / 2.0
  end
end
