# frozen_string_literal: true

def merge_sort(array)
  return array if array.length == 1 || array.length.zero?
  half = array.length / 2
  merge(merge_sort(array.slice(0, half)), merge_sort(array.slice(half, array.length)))
end

def merge(a, b)
  return a if !b || b.empty?
  return b if !a || a.empty?
  c = []
  a_index = 0
  b_index = 0
  while a_index < a.length || b_index < b.length
    if a_index >= a.length
      c.push(b[b_index])
      b_index += 1
      next
    elsif b_index >= b.length
      c.push(a[a_index])
      a_index += 1
      next
    else
      a_greater = a[a_index] > b[b_index]
      c.push(a_greater ? b[b_index] : a[a_index])
      a_index += 1 unless a_greater
      b_index += 1 if a_greater
    end
  end
  c
end
