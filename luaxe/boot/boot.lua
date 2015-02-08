-- boot

null = nil
trace = print
undefined = { } -- unique special value for (mostly) internal use.

pcall(require, 'bit32')
pcall(require, 'bit')
bit = bit or bit32
bit32 = bit

Enum = Enum or {}
Enum_Enum = Enum_Enum or Enum
Enum.__super__ = Enum

--function Enum.__index(e, i)
--	local params = rawget(e, "params")
--	if(params)then
--		return params[i]
--	else
--		return rawget(e, i)
--	end
--end

function Enum.__tostring(e)
	return (e.tag or "") + (e.params and "(" .. table.concat(e.params, ",") .. ")" or rawget(e, 0))
end

-- BAD IDEA! BECAUSE OF LASY EXECUTION!
-- MAKE TO INLINE FUNCTIONS!
function _G.___ternar(cond,any,elses)
	if(cond)then return any end
	return elses
end

function ___inherit(to, base)
	-- copy all fields from parent
    for k, v in pairs(base) do
        to[k] = v
    end
    to.__super__ = base
end

function __new__(obj, ...)
	return obj.new(...)
end

function __strict_eq__(obj, to)
	return (tostring(obj) == tostring(to))
end

__typeof__ = type;

haxe_Log_Log = {};
function haxe_Log_Log.trace(a, i)
	if(i and i.fileName and i.customParams)then
		print(i.fileName + ":" + i.lineNumber + ": " + a + "," + i.customParams:join(","))
	elseif(i and i.fileName)then
		print(i.fileName + ":" + i.lineNumber + ": " + a)
	else
		print(a)
		if(i) then print(i) end
	end
end

function haxe_Log_Log.clear()
	-- TODO
end

-- Closure
function ___bind(o,m)
	if(not m)then return nil end;
	return function(...)
    	local result = m(o, ...);
    	return result;
 	end
end

function __Array(r)
	return setmetatable(r, Array_Array)
end

function Array()
	return __Array({})
end
--Array_Array.toString = Array_Array.__tostring
--function Array_Array.new(arg)return setmetatable(arg or{},Array_Array)end
if(table.getn == nil)then table.getn = function(o)return #o end end
if(loadstring == nil)then loadstring = function(o)return (function()return "" end) end end