# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
    return -1 if needle.length > haystack.length
    return 0 if needle.empty?
    (0...(haystack.length - needle.length + 1)).each do |i|
        return i if haystack[i...i+needle.length] == needle
    end
    -1
end
