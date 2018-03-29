local cache = {}

function fib(n)
	if cache[n] ~= nil then
		return cache[n]
	end

	if(n == 1 or n == 0) then
		return 1
	end

	cache[n] = fib(n - 2) + fib(n - 1)

	print(cache[n])

	return cache[n]
end

fib(10)