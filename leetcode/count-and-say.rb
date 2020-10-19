# @param {Integer} n
# @return {String}
def count_and_say(n)
    if n == 1
        return '1'
    end
    say(count_and_say(n-1))
end

def say(string)
    result = ''
    count = 1
    (0...string.length).each do |i|
        if (string[i] != string[i+1]) && (i < string.length - 1)
            result += "#{count}#{string[i]}"
            count = 1
        elsif i == string.length - 1
            result += "#{count}#{string[i]}"
        else
            count += 1
        end
    end
    result
end
