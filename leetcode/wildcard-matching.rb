# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
    return true if s.empty? && p.empty?
    return false if !s.empty? && p.empty?
    memo = Array.new(s.length + 1) { Array.new(p.length + 1) { nil } }
    recursive_solution(s, p, s.length - 1, p.length - 1, memo)
end

def recursive_solution(s, p, i, j, memo)
    return false if i < -1
    if i == 0 && j == 0
        return true if s[i] == p[j] || p[j] == '?' || p[j] == '*'
        return false
    end
    return true if i == -1 && j == 0 && p[j] == '*'
    # return false if (i == -1 || j == -1) && i != j
    return false if i == -1 && p[j] != '*'
    return false if j == -1 && i != -1
    return memo[i][j] unless memo[i][j].nil?
    result = false
    result =  recursive_solution(s, p, i - 1, j - 1, memo) if p[j] == s[i] || p[j] == '?'
    result =  ((recursive_solution(s, p, i, j - 1, memo) || recursive_solution(s, p, i - 1, j, memo) || recursive_solution(s, p, i - 1, j - 1, memo))) if p[j] == '*'
    memo[i][j] = result
    result  
end
