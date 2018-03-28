
function exp(n, x)
	local r = 1

	-- for(int i = 1; i <= x; i++)
	for i=1, x, 1 do
		r = r * n
	end

	return r
end

-- parameter holen
local args = { ... }
local n = args[1]
local e = args[2]

-- calculate exponent
return exp(n, e)