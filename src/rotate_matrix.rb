class Pixel
	attr_accessor :a, :b, :c, :d
	def initialize(a, b, c, d)
		@a = a
		@b = b
		@c = c
		@d = d
	end

	def to_s
		"#{@a}#{@b}#{@c}#{@d}"
	end
end

class Matrix
	def initialize(arr)
		@arr = arr
	end

	def print
		@arr.each_with_index do |r, ri|
			r.each_with_index do |val, ci|
				printf "%s ", val
			end
			printf "\n"
		end		
	end

	def transpose
		puts "transposing..."
		n = @arr.length
		@arr.each_with_index do |r, ri|
			for ci in ri..n-1
				if ri != ci
					temp = @arr[ri][ci] 
					@arr[ri][ci] = @arr[ci][ri]
					@arr[ci][ri] = temp
				end				
			end			
		end
	end

	def vflip
		puts "vertical flip..."
		n = @arr.length
		@arr.each_with_index do |r, ri|
			for ci in 0..(n-1)/2
				if ci != n-ci-1
					temp = @arr[ri][ci]
					@arr[ri][ci] = @arr[ri][n-ci-1]
					@arr[ri][n-ci-1] = temp
				end
			end
		end
	end

	def rotateCW(m)
	 	m.times do |i|
			transpose
			vflip
		end
	end

	def swap(x,y)
		temp = x
		x = y
		y = temp
	end
end

n = 3
a = Pixel.new('a','a','a','a')
b = Pixel.new('b','b','b','b')
c = Pixel.new('c','c','c','c')
d = Pixel.new('d','d','d','d')
e = Pixel.new('e','e','e','e')
f = Pixel.new('f','f','f','f')
g = Pixel.new('g','g','g','g')
h = Pixel.new('h','h','h','h')
i = Pixel.new('i','i','i','i')
j = Pixel.new('j','j','j','j')
k = Pixel.new('k','k','k','k')
l = Pixel.new('l','l','l','l')
m = Pixel.new('m','m','m','m')
n = Pixel.new('n','n','n','n')
o = Pixel.new('o','o','o','o')
p = Pixel.new('p','p','p','p')

arr = 
[ 
	[a,b,c,d],
	[e,f,g,h],
	[i,j,k,l],
	[m,n,o,p]
]
m = Matrix.new(arr)
m.print

m.rotateCW 1
m.print

