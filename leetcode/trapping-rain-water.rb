# @param {Integer[]} height
# @return {Integer}
def trap(height)
    left = 0
    right = height.size - 1
    res = max_left = max_right = 0
    while left < right
        if height[left] <= height[right]
            if height[left] >= max_left
                max_left = height[left]
            else
                res += max_left - height[left]
            end
            left += 1
        else
            if height[right] >= max_right
                max_right = height[right]
            else
                res += max_right - height[right]
            end
            right -= 1
        end
    end
    res
end
