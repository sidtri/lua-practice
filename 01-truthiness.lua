function is_truthy(v)
	if v then
		return true
	end

	return false
end

function describe(v)
	local vtype = type(v)
	local ist = is_truthy(v)
	return string.format("value is %s, type is %s, is truthy %s", v, vtype, ist)
end

print(describe(nil))
print(describe(print))
local data = { false, true, 0, 1, "", "false", {} }
for _, d in ipairs(data) do
	print(describe(d))
end

print(nil or "default")
print(0 or "default")
print("" or "default")
