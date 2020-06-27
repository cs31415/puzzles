require 'find'
#filename = "heart of darkness.txt"
#pattern = "horror"

def processFile(filename, pattern, nlines)
	buffer = Array.new{5}
	prevline = ""
	prelines = 0
	postlines = 0
	writeline = false
	found = false

	File.foreach(filename) do |x|
		if found
			if postlines > 0 && postlines <= nlines 
				puts prevline
			elsif postlines != 0
				postlines = 0
				found = false
			end
			if found 		
				postlines += 1
			end
		end
		if (nil != (/#{pattern}/ =~ x))
			found = true
			puts "---------------------------------------"
			buffer.each {|y| puts y}
			puts x.gsub! pattern, '>' + pattern + '<'
		end
		if found
			prevline = x
		end
		prelines = (prelines + 1) % nlines
		buffer[prelines] = x
	end
end

path = ARGV[0]
pattern = ARGV[1]

puts "path = " + path
puts "pattern = " + pattern

nlines = 5

Dir.glob(path) do |filename|
	if not(File.file?(filename))
		next
	end
	puts filename + ':' + "\n"
        break	
        #loop through file line by line
	processFile filename, pattern, nlines
end


