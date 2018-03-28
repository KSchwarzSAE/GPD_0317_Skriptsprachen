-- file 1

x = 6
-- ...

function a()
	print(x)
end

-- file 2

-- ...
x = 78

-- Engine

-- load file 1
-- load file 2 into the same space
a() -- 78