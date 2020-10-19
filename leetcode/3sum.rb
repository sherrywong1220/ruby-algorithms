# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
    return [] if nums.length < 3
    nums.sort!
    result = []
    hash = {}
    (0...nums.length).each do |i|
        n = nums[i]
        
        if hash[n].nil?
            hash[n] = [i]
        else
            hash[n] << i
        end
    end
    (0...nums.length - 1).each do |i|
        next if nums[i] == nums[i - 1] if i >= 1
        (i + 1...nums.length).each do |j|
            n = 0 - nums[i] - nums[j]
            ni = hash[n]
            next unless ni
            unless (ni - [i] - [j]).empty?
                result << [nums[i], nums[j], n].sort
            end
        end
    end
    result.uniq
end
