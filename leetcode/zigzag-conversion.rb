# @param {String} s
# @param {Integer} num_rows
# @return {String}
def convert(s, num_rows)
    return s if num_rows == 1 || s.empty?
    rows = num_rows
    cols = (s.length / (num_rows * 2 - 2) + 1) * 2
    arr = Array.new(rows) { Array.new(cols) { nil } }
    i = 0
    x = 0
    y = 0
    derection = :down
    while (i < s.length) do
      arr[y][x] = s[i]
      i += 1
      if derection == :down && y + 1 < rows
        y += 1
      elsif derection == :down && !(y + 1 < rows)
        derection = :up
        y -= 1
        x += 1
      elsif derection == :up && (y - 1 >= 0)
        y -= 1
        x += 1
      elsif derection == :up && !(y - 1 >= 0)
        derection = :down
        y += 1
      end
    end
    new_s_arr = arr.flatten.compact
    new_s_arr.join('')
end
