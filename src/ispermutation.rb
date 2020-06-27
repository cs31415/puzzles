def printHash(ch)
	puts 'ch:'
	ch.map { |key, value| puts key + ',' + value.to_s }
end

def isPermutation(s1, s2)
	if (s1.length != s2.length)
		return false
	end
	ch = Hash.new()
	s1.each_char do |i|
		ch[i] = ch.key?(i) ? (ch[i] + 1) : 1;
	end
	printHash(ch)
	s2.each_char do |i|
		if !ch.key?(i)
			break
		end
		ch[i] = ch[i] - 1
		if (ch[i] < 0)
			break;
		end
	end
	printHash(ch)
	return !ch.any? {|key,value| value != 0}
end

s1 = 'aaaaaab1bbbbbccccccsdkljfjasldfkjasldkfjalsdkfjlaskdfjlaskdjflaskdjflaskdjflaskdjflaksdjflaksjdflaskjdflaksjdf'
s2 = 'aaaaaab1bbbbbccccccsdkljfjasldfkjasldkfjalsdkfjlaskdfjlaskdjflaskdjflaskdjflaskdjflaksdjflaksjdflaskjdflaksjdf'
puts isPermutation(s1, s2)

