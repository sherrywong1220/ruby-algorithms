# @param {String} s
# @param {String[]} word_dict
# @return {Boolean}
def word_break(s, word_dict)
  memo = {} 
  recursive_solution(s, word_dict, 0, memo)
end

def starts_with(s, word, i)
    result = if word.length <= s.length - i && s[i...(i + word.length)] == word
        true
    else
        false
    end
    return result
end

def recursive_solution(s, word_dict, i, memo)
  return memo[i] if !memo[i].nil?
  result = false
  result = true if i == s.length
  word_dict.each do |word|
    if starts_with(s, word, i)
      result = true if recursive_solution(s, word_dict, i + word.length)
    end
  end
  memo[i] = result
  result
end
