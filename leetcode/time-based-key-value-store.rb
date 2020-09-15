class TimeMap
=begin
    Initialize your data structure here.
=end
    def initialize()
        @store = {}
    end

=begin
    :type key: String
    :type value: String
    :type timestamp: Integer
    :rtype: Void
=end
    def set(key, value, timestamp)
        if @store[key].nil?
            @store[key] = [{ 'value' => value, 'timestamp' => timestamp }]
        else
            @store[key] << { 'value' => value, 'timestamp' => timestamp }
        end
        nil
    end

=begin
    :type key: String
    :type timestamp: Integer
    :rtype: String
=end
    def get(key, timestamp)
        return '' if @store[key].nil?
        i = 0
        j = @store[key].length - 1
        m = (i + j) / 2
        while  (i <= j) && (j <= @store[key].length - 1) do    
            # puts "i: #{i}, j: #{j}"
            if @store[key][m]['timestamp'] > timestamp
                j = m - 1
            elsif @store[key][m]['timestamp'] <= timestamp
                if m <= @store[key].length - 2 && @store[key][m+1]['timestamp'] > timestamp
                    return @store[key][m]['value']
                elsif m > @store[key].length - 2
                    return @store[key][m]['value']
                else
                    i = m + 1
                end
            end
            m = (i + j) / 2
        end
        return ''
    end
end
