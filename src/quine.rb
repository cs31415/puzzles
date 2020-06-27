def quine
    x = "def quine\n\tx = %s\n\tputs x %% [x.inspect]\nend\nquine" 
    puts x % [x.inspect] 
end 
quine
