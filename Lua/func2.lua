
function sqrt(x)
	if x < 0 then
		return nil, "Radikant darf nicht < 0 sein!"
	end

	return math.sqrt(x)
end

local w, e = sqrt(17)

if w == nil then
	print(e)
else
	print(w)
end

if w ~= nil then
	print(w)
else 
	print(e)
end