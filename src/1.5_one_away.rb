def advance_pointer(str, idx)
	chars_left = true
	if idx+1<=str.length-1
		idx = idx+1
	else
		chars_left = false
	end
	return idx, chars_left
end

def one_away(c, d)
	c_length = c.length
	d_length = d.length
	ci = 0
	di = 0
	one_away = false
	chars_left = c_length > 0 || d_length > 0
	c_has_chars_left = ci<=c_length-1
	d_has_chars_left = di<=d_length-1
	# O(n)
	# Iterate through the strings character by character
	while chars_left
		
		# if both strings have characters left	
		if c_has_chars_left && d_has_chars_left
			# if there is a mismatch
			puts "1. characters left in both strings"
			if c[ci]!=d[di]
			       matchFound = false	
				# toggle return flag
				one_away = !one_away
				puts "1. mismatch '#{c[ci]}' & '#{d[di]}', one_away = #{one_away}"
				# advance pointer to longer string
				# if one is longer
				if c_length > d_length 
					puts "advance 1st string"
					ci, c_has_chars_left = advance_pointer(c,ci)
				# advance both pointers if strings
				# are of equal length       	
				elsif c_length == d_length
					puts "advance both strings"
					ci, c_has_chars_left = advance_pointer(c,ci)
					di, d_has_chars_left = advance_pointer(d,di)
				else
					puts "advance 2nd string"
					di, d_has_chars_left = advance_pointer(d,di)
					puts "di = #{di}, d_has_chars_left = #{d_has_chars_left}"
				end
			# advance both pointers if no mismatch
			else
				puts "1. match '#{c[ci]}' & '#{d[di]}', advance both pointers"
				matchFound = true
				ci, c_has_chars_left = advance_pointer(c,ci)
				di, d_has_chars_left = advance_pointer(d,di)
				puts "ci = #{ci}, di = #{di}"
			end
			puts "matchFound = #{matchFound}"
		# if we reached end of one string but not the
		# other, then toggle the return flag and advance
		# the pointer to the longer string
		elsif (!c_has_chars_left && d_has_chars_left)
			puts "2. reached end of 1st string, ci = #{ci}, di = #{di}"
			one_away = !one_away
			puts "2. one_away = #{one_away}"
			di, d_has_chars_left = advance_pointer(d,di)
		elsif (c_has_chars_left && !d_has_chars_left)
			puts "3. reached end of 2nd string, ci = #{ci}, di = #{di}"
			one_away = !one_away
			puts "3. one_away = #{one_away}"
			ci, c_has_chars_left = advance_pointer(c,ci)
		else
			puts "4. reached end of both strings"	
			ci, c_has_chars_left = advance_pointer(c,ci)
			di, d_has_chars_left = advance_pointer(d,di)
		end
		chars_left = c_has_chars_left || d_has_chars_left
		puts "chars_left = #{chars_left}, ci = #{ci}, di = #{di}"
	end
	return one_away
end

begin
	puts "Enter 1st string"
	# read console input and strip newline(s)
	a = gets.chomp
end while a.length <= 0
begin
	puts "Enter 2nd string"
	# read console input and strip newline(s)
	b = gets.chomp
end while b.length <= 0
puts "one away = " + one_away(a, b).to_s

