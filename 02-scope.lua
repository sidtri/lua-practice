-- 1. Leak vs contain. At the top, declare local local_only = "safe" and, with no local, global_leak = "leaked". Print _G.local_only and _G.global_leak.
local local_only = "safe"
global_leak = "leaked"
print(_G.local_only)
print(_G.global_leak)
-- 2. Shadowing. local name = "outer", then local function show() that declares local name = "inner" and prints it. Call show(), then print name after.
local name = "outer"
local function show()
	local name = "inner"
	print(name)
end
show()
print(name)
-- 3. Block scope. Use a do ... end block to declare local hidden = 42 and print it inside; then print hidden outside the block.
do
	local hidden = 42
	print(hidden)
end
print(hidden)
-- 4. The typo hazard. Print _G.desribe (the typo from last time) and _G.print. Explain in a comment why one is nil and the other is a function.
print(_G.desribe)
print(_G.print)
-- 5. Local vs global functions. Define local function add(a, b) returning a + b, and separately function mul(a, b) returning a * b (no local). Then print _G.add and _G.mul, and call both functions.
local function add(a, b)
	return a + b
end
function mul(a, b)
	return a * b
end

print(_G.add, _G.mul)
print(add(1, 2))
print(mul(1, 2))
-- 6. Bonus. Snapshot the set of keys in _G before your global assignments and after, and print just the names your file added to _G. (Hint: copy keys into a lookup table, then diff — think about how you'd mark which keys existed in the "before" snapshot.)
-- Expected results: _G.local_only is nil, _G.global_leak is "leaked", hidden outside its block is nil, _G.desribe is nil but _G.print is a function, and _G.add is nil while _G.mul is a function.
