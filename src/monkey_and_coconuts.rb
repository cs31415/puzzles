for k in 1..10000
	p = (3125.0*k + 1476.0)/1024.0
	if p.to_i == p
		puts “k = " + k.to_s + ", p = " + p.to_s
	end
end

