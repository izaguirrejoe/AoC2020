require 'set'

input = File.read('day16.txt')
parts = input.split("\n\n")
map = Hash.new { |h,k| h[k] = [] }

#Fill the map
rules = parts[0]
rules.split("\n").each do |line|
  s = line.split(": ")
  key = s[0]
  range_arr = s[1].strip.split(" or ")
  range_arr.each do |range_string|
    nums = range_string.split("-")
    startIndex = Integer(nums[0])
    endIndex = Integer(nums[1])
    map[key].push(startIndex..endIndex)
  end
end

#Part A
bad_lines = []
all_ranges = map.values.flatten
ans = 0
lines = parts[2].split("\n").drop(1)
lines.each do |line|
  nums = line.split(",").collect { |s| Integer(s) }
  nums.each do |num|
    valid = false
    all_ranges.each do |range|
      if range.include?(num)
        valid = true
      end
    end
    if !valid 
      ans += num
      bad_lines << line
    end
  end
end
puts "Ticket scanning Error rate: #{ans}"

lines.reject! {|line| bad_lines.include?(line)}

#Takes a number and checks to see if it is in any of the ranges given
def in_ranges?(num, ranges)
  result = false
  ranges.each do |range|
    if range.include?(num)
      result = true
    end
  end
  return result
end

#Checks to see if every num in nums is in the ranges given
def all_in_ranges?(nums, ranges)
  if nums.empty?
    return false
  end
  nums.each do |num|
    if !in_ranges?(num, ranges)
      return false
    end
  end
  true
end

#Takes a map of fields to ranges and an array of numbers and returns a set of fields are possible candidates for the numbers
def possible_fields(map, nums)
  result = Set.new()
  map.each do |field, ranges|
    if all_in_ranges?(nums, ranges)
      result << field 
    end
  end
  result
end

#Takes a 2-D matrix and returns the transpose 
def transpose(matrix)
  if matrix.empty? || matrix.first.empty?
    raise ArgumentError
  end
  result = Array.new(matrix.first.length) { Array.new(matrix.length, 0) }
  matrix.each_with_index do |row, x|
    row.each_with_index do |val, y|
      result[y][x] = val
    end
  end
  result
end

#Prints a 2-D matrix
def print_matrix(matrix)
  matrix.each do |row|
    p row
  end
end

transposed_lines = transpose(lines.collect {|line| line.split(",").collect { |num| Integer(num) } })
matches = {  }
transposed_lines.each_with_index do |nums, index|
  fields = possible_fields(map, nums)
  matches[index] = fields 
end

result = {  }
while !matches.empty? do
  ones = matches.keys.select { |key| matches[key].size == 1 } 
  ones.each do |key|
    result[key] = matches[key]
    deleted = matches.delete(key)
    matches.values.each {|set| set.subtract(deleted)}
  end
end


my_ticket = parts[1].split("\n")[1].split(",").map {|s| Integer(s)}

final_result = 1
my_ticket.each_with_index do |num, index|
  if result[index].to_a.first.match("departure")
    final_result *= num
  end
end

puts "The result is: #{final_result}"

