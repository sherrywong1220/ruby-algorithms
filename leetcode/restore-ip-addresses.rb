# @param {String} s
# @return {String[]}
def restore_ip_addresses(s)
    return [] if s.length < 4
    results = []
    i = 0
    j = 1
    k = 2
    (0..2).each do |i|
        ((i+1)..(i+3)).each do |j|          
            ((j+1)..(j+3)).each do |k|
                s1 = s[0..i]
                s2 = s[(i+1)..j]
                s3 = s[(j+1)..k]
                s4 = s[(k+1)..-1]
                results << [s1,s2,s3,s4].join('.') if [s1,s2,s3,s4].all? { |x| validate_item(x)  }
                
            end
        end
    end
    results
end

def validate_item(i)
    return true if i.to_i.to_s == i && i.to_i >= 0 && i.to_i <= 255
    false
end
