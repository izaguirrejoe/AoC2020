starting_numbers = [10,16,6,0,1,17] 
last = starting_numbers.pop
spoken = { } 

starting_numbers.each_with_index { |val, index| spoken[val] = index+1 }

(starting_numbers.length+1..2020).each do |turn|
  puts "Turn: #{turn} Last: #{last}"
  spoken[last], last = turn, spoken[last] == nil ? 0 : turn - spoken[last] 
end



