def zigzag(arr)
	zigzag_length = 0
	max_zigzag_length = 0
	prev = nil
	expecting_greater_than = true
	# O(n)
	arr.each do |x|
		# if sequence is unbroken, then increment counter
		# and flip the expectation for next element
		if prev == nil
			zigzag_length = zigzag_length + 1
		elsif (expecting_greater_than and x > prev) or
		      (!expecting_greater_than and x < prev)
			expecting_greater_than = !expecting_greater_than
			zigzag_length = zigzag_length + 1
		# if sequence ended, then reset counter and 
		# expectation for next element
=begin
		else
			if zigzag_length > 0
				max_zigzag_length = zigzag_length
				zigzag_length = 1
			end
			expecting_greater_than = true
=end		
		end
		prev = x
	end
	return [max_zigzag_length, zigzag_length].max
end

arr = [10, 22, 9, 33, 49, 50, 31, 60, 43]
puts zigzag(arr)
