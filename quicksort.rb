# frozen_string_literal: true

def quicksort(a)
  array = a.clone
  quicksort!(array)
  array
end

def quicksort!(array)
  return if array.length == 1 || array.length.zero?
  quicksort_partition(array, 0, array.length - 1)
end

def quicksort_partition(array, index1, index2)
  return if index2 >= array.length || index1 >= array.length || index2 - index1 < 1
  pivot = array[index1]
  pivot_index = index1
  higher_queue = Queue.new
  ((index1 + 1)..index2).each do |index|
    unless pivot > array[index]
      higher_queue.push(index)
      next
    end
    if higher_queue.empty?
      value1 = array[index]
      array[index] = array[pivot_index]
      array[pivot_index] = value1
      pivot_index = index
    else
      higher_index = higher_queue.pop
      array[pivot_index] = array[index]
      array[index] = array[higher_index]
      array[higher_index] = pivot
      pivot_index = higher_index
    end
  end
  quicksort_partition(array, index1, pivot_index - 1)
  quicksort_partition(array, pivot_index + 1, index2)
end
