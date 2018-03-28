------------------
-- Pseudo-Array --
------------------

-- Empty Table
local t = {}

-- Access per indices
t[1] = 8
t[2] = 7

------------------
-- Map		    --
------------------

-- Empty Table
t = {}

t.getName = function()
	return t.name
end

t.name = "Hello World"

t.birthday = {
	day = 1
	month = 3
	year = 1903
}

t[t.birthday] = 7;
-- t =>
-- birthday = ...
-- name = "Hello World"
-- getName = function
-- 't.birthday' = 7

t.getAge = function(now)
	nowTime = now()

	return 0 -- todo calc
end

return t.getName()