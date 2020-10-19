# @param {Integer} x
# @return {Integer}
def reverse(x)
    negative = x < 0 ? true : false
    return 0 if x == 0
    arr = []
    n = x.abs
    while (n % 10 == 0)
        n = n / 10
    end
    
    while (n != 0)
        m = n % 10
        arr << m
        n = n / 10
    end
    
    n = arr.join('').to_i
    n = negative ? -n : n
    return 0 if n < -(2**31) || n > (2**31 - 1)
    n
end
