# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
    result = []
    backtrack(result, '', 0, 0, n)
    result
end

def backtrack(result, str, open, close, max)
    return (result << str) if str.length == max * 2
    
    if open < max
        backtrack(result, str+"(", open + 1, close, max)
    end
    if close < open
        backtrack(result, str+")", open, close + 1, max)
    end
end
