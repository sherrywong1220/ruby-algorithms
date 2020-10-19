# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
    i = s.length - 1
    j = p.length - 1
    match_regex(s, p ,i, j)
end

def match_regex(s, p ,i, j)
    return true if i == -1 && j == -1
    return true if i == -1 && j == 1 && p[j] == '*'
    return false if j == -1 && i != -1
    return false if i < -1
    if !['.', '*'].include?(p[j])
        return false if p[j] != s[i]
        return match_regex(s, p ,i - 1, j - 1)
    end
    return match_regex(s, p ,i - 1, j - 1) if p[j] == '.'
    

    if p[j-1] == s[i]
      return match_regex(s, p ,i, j - 2) ||
            match_regex(s, p ,i - 1, j - 1) ||
            match_regex(s, p, i - 1, j)
    elsif p[j-1] == '.'
        return match_regex(s, p, i - 1, j) || match_regex(s, p, i, j - 2)
    elsif p[j-1] != s[i]
        return match_regex(s, p, i, j - 2)
    end
end
