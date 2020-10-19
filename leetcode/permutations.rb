# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
    result = []
    backtrace(result, [], nums, nums)
    result
end

def backtrace(result, path, options, nums)
    if path.length == nums.length
        result << path
        return
    end
    
    options.each do |i|
        backtrace(result, path + [i], options - [i], nums)
    end
end
