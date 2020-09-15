# @param {Integer[]} nums
# @param {Integer} k
# @return {Float[]}
def median_sliding_window(nums, k)
  arr = nums[0..(k-1)]
  arr.sort!
  odd = k.odd?
  mid = if odd
          arr[k / 2]
        else
          (arr[k / 2 - 1] + arr[k / 2]) / 2.0
        end
  result = [mid]
  (k...nums.size).each do |j|
    arr.delete_at(arr.find_index(nums[j - k]))
    n = nums[j]

    insert_index = 0
    (0..(arr.size - 1)).each do |index|
      if arr[index] > n
        insert_index = index
        break
      else
        insert_index = index + 1
      end
    end
    arr.insert(insert_index, n)

    mid = if odd
            arr[k / 2]
          else
            (arr[k / 2 - 1] + arr[k / 2]) / 2.0
          end
    result << mid
  end
  result
end

