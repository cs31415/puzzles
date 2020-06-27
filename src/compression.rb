def compress(input)
	prev_char = nil
	repetitions = 0
	result = ""
	# O(n) space and time complexity
	input.each_char do |c|
		if c != prev_char && !prev_char.nil? 
			# write out the previous char
			# alongwith repetitions
			result << prev_char << repetitions.to_s
			
			# reset repetitions
			repetitions = 1
		else
			# we saw the same character again
			# bump repetitions
			repetitions = repetitions + 1
		end		

		prev_char = c
	end	
	# get trailing character
	result << prev_char << repetitions.to_s
	return result.length < input.length ? result : input
end

begin
puts "Enter string to be compressed:"
str = gets.chomp
end while str.length <= 0
puts "compressed string = " + compress(str)
