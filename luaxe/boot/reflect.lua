Reflect = {};
Reflect_Reflect = Reflect;

function Reflect.setProperty(o, f, v)
	if o then
		if o[f] then o[f] = v end
	end
end

function Reflect.isFunction(f)
	if f == nil then return false end
	return type(f) == "function"
end

function Reflect.isObject(v)
	if v == nil then return false end
	-- to-do: check for enums
	
	local t = type(v)
	return t == "table" or t == "userdata"
end

function Reflect.hasField(o, f)
	-- to-do
	if o == nil or f == nil then return false end
	return o[f] ~= nil
end

function Reflect.fields(o)
	if o == nil then return nil end
	local t = {}
	
	for i, _ in pairs(o) do table.insert(t, i) end
	return t
end

function Reflect.field(o, f)
	if o == nil or f == nil then return nil end
	if o[f] == nil then return nil end
	
	return o[f]
end

function Reflect.setField(o, f, v)
	-- TODO
end

function Reflect.getProperty(o, f)
	return nil -- TODO
end

function Reflect.isEnumValue(o)
	return false -- TODO
end

function Reflect.deleteField(o, f)
	return false -- TODO
end

function Reflect.copy(o)
	return nil -- TODO
end

function Reflect.compare(a, b)
	-- to-do
	if a == nil and b == nil then return 0 end
	if type(a) ~= type(b) then return nil end
	
	local ta, tb = type(a), type(b)
	
	if ta == "number" then
		if a < b then return -1
		elseif a > b then return 1
		else return 0 end
	elseif ta == "function" then
	elseif ta == "string" then
	else
		if a == b then return 0 else return nil end
	end
	return nil
end