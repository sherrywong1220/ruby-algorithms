# @param {String} str
# @return {Integer}
def my_atoi(str)
    str = str.strip
    return 0 if str.empty?
    negative = str[0] == '-' ? true : false
    signal = true if ['-', '+'].include?(str[0])
    str = str[1..-1] if signal
    return 0 if str.empty?
    start_at = nil
    end_at = nil
    (0...str.length).each do |i|
        if i == 0 && !('0'..'9').include?(str[i])
            return 0
        end
        
        if '0' != str[i]
            start_at = i
            end_at = str.length - 1
            (i...str.length).each do |j|
                if !('0'..'9').include?(str[j])
                    end_at = j - 1
                    break
                end
            end
            break
        end
        
        
    end
    return 0 if start_at.nil?
    int_s = str[start_at..end_at]
    num = 0
    count = 0
    (0...int_s.length).each do |i|
        n = int_s[int_s.length - 1 - i]
        num += (n.to_i * (10 ** count))
        count += 1 
    end
    result = negative ? (-num) : num
    if result < -(2**31)
        -(2**31)
    elsif result > (2**31 - 1)
        2**31 - 1
    else
        result
    end
end
