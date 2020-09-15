# @param {String} text1
# @param {String} text2
# @return {Integer}
def longest_common_subsequence(text1, text2)
  memo = Array.new(text1.length + 1) { Array.new(text2.length + 1) }
  lcs_recursive_solution(text1, text2, text1.length, text2.length, memo)
  # lcs_bottom_up_solution(text1, text2, memo)
end

def lcs_recursive_solution(text1, text2, n1, n2, memo)
  return memo[n1][n2] if memo[n1][n2]

  result = if n1 == 0 || n2 == 0
             0
           elsif text1[n1 - 1] == text2[n2 - 1]
             1 + lcs_recursive_solution(text1, text2, n1 - 1, n2 - 1, memo)
           elsif text1[n1 - 1] != text2[n2 - 1]
             [lcs_recursive_solution(text1, text2, n1 - 1, n2, memo), lcs_recursive_solution(text1, text2, n1, n2 - 1, memo)].max
           end
  memo[n1][n2] = result
  result
end

def lcs_bottom_up_solution(text1, text2, memo)
  (0..text1.length).each do |n1|
    (0..text2.length).each do |n2|
      if n1 == 0 || n2 == 0
        memo[n1][n2] = 0
      elsif text1[n1 - 1] == text2[n2 - 1]
        memo[n1][n2] = memo[n1 - 1][n2 - 1] + 1
      elsif text1[n1 - 1] != text2[n2 - 1]
        memo[n1][n2] = [memo[n1][n2 - 1], memo[n1- 1][n2]].max
      end
    end
  end
  memo[text1.length][text2.length]
end

puts longest_common_subsequence('abcde', 'de')