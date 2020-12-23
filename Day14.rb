input = File.read('Day14').gsub(/mask = /) { |m| "\n" + m }.sub("\n", '')
instructions = input.split("\n\n").collect { |s| s.split("\n") } 
# Part A
# memory = {  }
# instructions.each do |i|
#   mask_line = i.first
#   mask_string = mask_line.split(" = ").last
#   i.drop(1).each do |a_string|
#     a_split = a_string.split(" = ")
#     val = Integer(a_split.last)
#     address = Integer(a_split.first[/\d+/])
#     val |= mask_string.gsub('X', '0').to_i(2)
#     val &= mask_string.gsub('X', '1').to_i(2)
#     memory[address] = val
#   end
# end
# total = memory.values.reduce(:+)
# puts "The total is #{total}."

class Solution
  def initialize()
    @result = []
  end
  #Gives all possibilities of binary numbers with a given length
  def binary(length, current = "")
    if length == 0
      @result.push(current)
    else
      binary(length-1, current+"0")
      binary(length-1, current+"1")
    end
  end
end

memory = {  }
instructions.each do |i|
  mask_line = i.first
  mask_string = mask_line.split(" = ").last
  i.drop(1).each do |a_string|
    a_split = a_string.split(" = ")
    val = Integer(a_split.last)
    address = Integer(a_split.first[/\d+/]).to_s(2)
    (mask_string.length - address.length).times { address = "0" + address }

    #Apply mask
    puts "Address: #{address}"
    puts "Mask:    #{mask_string}"
    for i in 0...address.length do
      if mask_string[i] == "X"
        address[i] = "X"
      elsif
        mask_string[i] == "1" 
        address[i] = "1" 
      end
    end
    puts "Result:  #{address}"

    #Get Combos
    x = Solution.new()
    combo = x.binary(address.count("X"))
    combo.each do |string|
      puts "Iteration: #{string}"
      address_copy =  address.dup
      string.split("").each do |char|
        address_copy.sub!("X", char)
      end
      memory[address_copy.to_i(2)] = val
      puts "Writing #{val} to address #{address_copy}"
    end
  end
end
total = memory.values.reduce(:+)
puts "The total is #{total}."
