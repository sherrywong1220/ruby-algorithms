# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
    hash = {
        '2' => ['a', 'b', 'c'],
        '3' => ['d', 'e', 'f'],
        '4' => ['g', 'h', 'i'],
        '5' => ['j', 'k', 'l'],
        '6' => ['m', 'n', 'o'],
        '7' => ['p', 'q', 'r', 's'],
        '8' => ['t', 'u', 'v'],
        '9' => ['w', 'x', 'y', 'z']
    }
    recursive_solution(hash, digits)
end

def recursive_solution(hash, digits)
    return [] if digits.empty?
    letter = digits[0]
    return [] if hash[letter].nil?
    appends = recursive_solution(hash, digits[1..-1])
    if appends.empty?
        hash[letter]
    else
        hash[letter].map { |x| appends.map { |y| "#{x}#{y}"  }  }.flatten
    end
end
