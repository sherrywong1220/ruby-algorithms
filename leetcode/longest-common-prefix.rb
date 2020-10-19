# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
    return '' if strs.empty?
    return strs.first if strs.length == 1
    
    strs = strs.sort_by { |s| s.length }
    prefix = strs.first
    (0...prefix.length).each do |i|
        strs[1..-1].each do |str|
            if prefix[i] != str[i]
                return prefix[0..i-1] if i - 1 >= 0
                return ''
            end
        end
    end
    prefix
end
