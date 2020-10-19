# @param {Integer[]} height
# @return {Integer}
def max_area(height)
    i = 0
    j = height.length - 1
    max = 0
    while (i < j)
        area = [height[i], height[j]].min * (j - i)
        max = area if area > max
        if height[i] < height[j]
            i += 1
        else
            j -= 1
        end
    end
    max
end
