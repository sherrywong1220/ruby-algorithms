# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
    return 0 if s.empty?
    max = 1
    length = 1
    set = {}
    (0...s.length).each do |i|
        set.delete(s[i-1]) if i > 0
        length -= 1
        start = (i > 0 ? i + length : i)
        (start...s.length).each do |j|
            if set[s[j]].nil?
                length += 1
                set[s[j]] = 1 
            else
                break
            end   
        end
        max = length if length > max
    end
    return max
end
