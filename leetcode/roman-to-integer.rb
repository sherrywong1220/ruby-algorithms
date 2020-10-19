# @param {Integer} s
# @return {String}
def roman_to_int(s)
    map = {
        'I' => 1,
        'V' => 5,
        'X' => 10,
        'L' => 50,
        'C' => 100,
        'D' => 500,
        'M' => 1000,
        'IV' => 4,
        'IX' => 9,
        'XL' => 40,
        'XC' => 90,
        'CD' => 400,
        'CM' => 900
    }
    total = 0
    i = 0
    while i < s.length
        if i + 1 < s.length && map[s[i..i+1]]
            n = map[s[i..i+1]]
            i += 2
        else
            n = map[s[i]]
            i += 1
        end
        total += n
    end
    total
end
