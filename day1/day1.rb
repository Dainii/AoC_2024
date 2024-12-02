# frozen_string_literal: true

file_data = File.readlines('day1/real_input.txt')

list1 = []
list2 = []

file_data.each do |line|
  data = line.split(' ')
  list1 << data.first.to_i
  list2 << data.last.to_i
end

list1.sort!
list2.sort!
list2_tally = list2.tally

total_p1 = 0
total_p2 = 0

list1.each_with_index do |l, i|
  diff = (l - list2[i]).abs
  total_p1 = total_p1 + diff
  total_p2 = total_p2 + l * (list2_tally[l] || 0)
end

puts "total part 1: #{total_p1}"
puts "total part 2: #{total_p2}"
