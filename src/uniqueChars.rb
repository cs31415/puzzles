def hasUniqueChars(str)
	cc = Hash.new
	unique = true
        str.each_char do |c|
		if cc.key?(c)
			unique = false
			break	
		else
			cc[c] = 1
		end
	end
	return unique
end

def hasUniqueCharsNoExtraStorage(str)
	if (str.length <= 1)
		return true
	end
	for c in 1..(str.length-1)
		for d in 0..c-1
			puts 'c = ' + c.to_s + ', d = ' + d.to_s
			puts 'Comparing "' + str[c] + '", to "' + str[d] + '"'
			if (str[d]==str[c])
				puts "Found dup; exiting"
				return false
			end
		end
	end
	return true
end

input = ARGV[0]
puts hasUniqueCharsNoExtraStorage(input) ? "has unique chars" : "has duplicate chars"
