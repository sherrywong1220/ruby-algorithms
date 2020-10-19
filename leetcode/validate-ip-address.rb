# @param {String} ip
# @return {String}
def valid_ip_address(ip)
    return "Neither" if [':', '.'].include?(ip[-1])
    return validate_ipv4(ip) if ip.split('.').count == 4
    return validate_ipv6(ip) if ip.split(':').count == 8
    "Neither"
end

def validate_ipv4(ip)
    support_chars = ('0'..'9').to_a
    ip.split('.').each do |i|
        return 'Neither' if i.empty?
        return 'Neither' unless i.to_i >= 0 && i.to_i <= 255 && i == i.to_i.to_s
    end
    'IPv4'
end

def validate_ipv6(ip)
    support_chars = ('A'..'F').to_a + ('a'..'f').to_a + ('0'..'9').to_a
    ip.split(':').each do |i|
        return 'Neither' if i.empty?
        return 'Neither' unless i.length >= 1 && i.length <= 4 && (i.split('').all? { |x| support_chars.include?(x)  })
    end
    'IPv6'
end
