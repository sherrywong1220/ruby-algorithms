# @param {Character[][]} board
# @return {Boolean}

require 'set'

def is_valid_sudoku(board)
    (0...9).each do |i|
        unit = board[i]
        return false unless is_unit_valid(unit)
    end

    (0...9).each do |i|
        unit = (0...9).map { |j| board[j][i] }
        return false unless is_unit_valid(unit)
    end

    [0, 3, 6].each do |i|
        [0, 3, 6].each do |j|
            unit = (0..2).map do |n1|
                        (0..2).map do |n2|
                            board[n1 + j][n2 + i]
                        end
                    end.flatten
            puts unit.to_s
            return false unless is_unit_valid(unit)
        end
    end

    return true
end

def is_unit_valid(unit)
    unit = unit.reject { |x| x == '.' }
    unit.uniq.count == unit.count
end
