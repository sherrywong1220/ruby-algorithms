# @param {Integer[][]} intervals
# @return {Integer[][]}
def merge(intervals)
    return intervals if intervals.length < 2

    intervals =  intervals.sort_by { |x| [[x][0], [x][1] ] }
    
    (1...intervals.length).each do |j|  
        i = j - 1
        unless intervals[j][0] > intervals[i][1]
            intervals[j][0] = [intervals[i][0], intervals[j][0]].min
            intervals[j][1] = [intervals[i][1], intervals[j][1]].max
            intervals[i] = nil
            
        end
        i = j
    end
    intervals.compact
end
