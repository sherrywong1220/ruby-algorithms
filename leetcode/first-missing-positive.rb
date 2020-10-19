# @param {Integer[]} nums
# @return {Integer}
def first_missing_positive(nums)
    set = Set.new
    min = 1
    nums.each do |num|
        set << num
        next if num < 1
        if num == min
            min += 1
            while set.include?(min)
                min += 1
            end
        end
    end
    min
end
