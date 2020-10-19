# @param {Integer} dividend
# @param {Integer} divisor
# @return {Integer}
def divide(dividend, divisor)
    flag = ((dividend > 0 && divisor < 0) || (dividend < 0 && divisor > 0)) ? -1 : 1
    dividend = dividend.abs
    divisor = divisor.abs
    result = abs_divide(dividend, divisor) * flag
    [[result,(2**31 - 1)].min, -2**31].max
end

def abs_divide(dividend, divisor)
    return 0 if dividend < divisor
    n = 0
    total = divisor
    while (total < dividend)
        total = total << 1
        n += 1
    end
    
    result = if total == dividend
        1 << n
    else
        (1 << (n - 1)) + abs_divide(dividend - (divisor << (n - 1)), divisor)
    end
    result
end
