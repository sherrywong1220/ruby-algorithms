# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
    return [-1, -1] if nums.empty?
    left_start, left_end = 0, nums.length - 1
    left_mid = (left_end + left_start) / 2
    statisfy = false
    while(left_start < nums.length && left_end >= 0 && left_end >= left_start)
        left_mid = (left_end + left_start) / 2
        if nums[left_mid] == target
            if (left_mid - 1 >= 0 && nums[left_mid - 1] < target) || left_mid == 0
                # 满足条件
                statisfy = true
                break
            else
                left_end = left_mid - 1
            end
        elsif nums[left_mid] > target
            left_end = left_mid - 1
        elsif nums[left_mid] < target
            left_start = left_mid + 1
        end
    end
    return [-1, -1] unless statisfy
    
    right_start = left_mid
    right_end = nums.length - 1
    right_mid = (right_start + right_end) / 2
    while(right_start < nums.length && right_end >= left_mid && right_end >= right_start)
        right_mid = (right_start + right_end) / 2

        if nums[right_mid] == target
            if (right_mid <= nums.length - 2 && nums[right_mid+1] > target) || right_mid == nums.length - 1
                # 满足条件
                break
            else
                right_start = right_mid + 1
            end
        elsif nums[right_mid] > target
            right_end = right_mid - 1
        end
    end
    [left_mid, right_mid]
end
