# @param {String} s
# @return {String}
# Input: "babad"
# Output: "bab"
# Note: "aba" is also a valid answer.
def longest_palindrome(s)
  return '' if s.empty?
  flags = [1, 0, 0]
  # case 1: abcba
  (0...s.length).each do |i|
    length = 1
    start_at = i - 1
    end_at = i + 1
    while (start_at >= 0 && end_at < s.length)
      if s[start_at] == s[end_at]
        length += 2
        if length > flags[0]
            flags[0] = length
            flags[1] = start_at
            flags[2] = end_at
        end
        start_at -= 1
        end_at += 1
      else
        break
      end
    end
  end

  # case 2: abccba
  (0...s.length).each do |i|
    start_at = i
    end_at = i + 1
    length = 0
    while (start_at >= 0 && end_at < s.length)
      if s[start_at] == s[end_at]
        length += 2
        if length > flags[0]
            flags[0] = length
            flags[1] = start_at
            flags[2] = end_at
        end
        start_at -= 1
        end_at += 1
      else
        break
      end
    end
  end

  s[flags[1]..flags[2]]
end
