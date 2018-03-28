
local obj = {}

local class = {
	getName = function(self) return self:name; end
	name = nil
}

setmetatable(obj, class)

print(obj:getName()) -- nil

obj.name = "Obj1"

print(obj:getName()) -- Obj1

local obj2

setmetatable(obj2, class)

obj2.name = "Obj2"

print(obj2:getName()) -- Obj2

obj2.getName = function() return "NOOO" end

print(obj2:getName()) -- NOOO







local t = {
	f = function(self, t) return self:x + t end
	x = 99
}

local a = {}
a.x = 88

setmetatable(a, t)

a.f(a, 5)
a:f(5)