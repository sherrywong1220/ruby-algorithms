# @param {String} s
# @return {Boolean}
def is_valid(s)
    stack = []
    (0...s.length).each do |i|
        if s[i] == '('
            stack << s[i]
        elsif s[i] == ')'
            return false if stack[-1] != '('
            stack.pop
        elsif s[i] == '{'
            stack << s[i]
        elsif s[i] == '}'
            return false if stack[-1] != '{'
            stack.pop
        elsif s[i] == '['
            stack << s[i]
        elsif s[i] == ']'
            return false if stack[-1] != '['
            stack.pop
        end
    end
    stack.empty? ? true : false
end
