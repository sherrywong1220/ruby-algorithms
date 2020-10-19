# @param {String} s1
# @param {String} s2
# @param {String} s3
# @return {Boolean}
def is_interleave(s1, s2, s3) 
    return false if (s1.length + s2.length != s3.length)
    
    memo = Array.new(s1.length+1) { Array.new(s2.length+1) { nil } }
    is_match(s1, s2, s3, memo, s1.length, s2.length)
end

def is_match(s1, s2, s3, memo, i1, i2)
    return memo[i1][i2] unless memo[i1][i2].nil?
    result = false
    result =  true if i1 == 0 && i2 == 0
    result =  true if i1 - 1 >= 0 && s3[i1 + i2 - 1] == s1[i1 - 1] && is_match(s1, s2, s3, memo, i1 - 1, i2)
    result =  true if i2 - 1 >= 0 && s3[i1 + i2 - 1] == s2[i2 - 1] && is_match(s1, s2, s3, memo, i1, i2 - 1)
    memo[i1][i2] = result
    result  
end
