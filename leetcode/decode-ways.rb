# @param {String} s
# @return {Integer}
def num_decodings(s)
    find_ways(s, s.length - 1, [])
end

def find_ways(s, i, memo)
    return memo[i] unless memo[i].nil?
    return 0 if i == 0 && s[i] == '0'
    return 1 if i == 0 || i == -1
    count1 = count2 = 0
    count1 = find_ways(s, i - 1, memo) if s[i] != '0'
    count2 = find_ways(s, i - 2, memo) if s[i-1] != '0' && s[(i-1)..i].to_i <= 26
    result = count1 + count2
    memo[i] = result
    result
end
