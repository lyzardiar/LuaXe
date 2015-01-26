-- Std class http://api.haxe.org/Std.html
Std = {};
Std_Std = Std;
function Std.int( x, y ) -- Fix for tail-call generator bug, TODO fix
	local z = y or x
	return z > 0 and math.floor(z) or math.ceil(z)
end
--static function string(s:Dynamic):String
--Converts any value to a String.
--If s is of String, Int, Float or Bool, its value is returned.
--If s is an instance of a class and that class or one of its parent classes has a toString method, that method is called. If no such method is present, the result is unspecified.
--If s is an enum constructor without argument, the constructor's name is returned. If arguments exists, the constructor's name followed by the String representations of the arguments is returned.
--If s is a structure, the field names along with their values are returned. The field order and the operator separating field names and values are unspecified.
--If s is null, "null" is returned.
function Std.string( s )
	local t = type(s)
	if t == "string" then return s
	elseif s == nil then return "null"
	elseif t == "function" then return "<function>"
	elseif t == "userdata" or t == "thread" then return t
	end
	return tostring(s)
end
--function instance<T, S>(value:T, c:Class<S>):S
--Checks if object value is an instance of class c.
--Compiles only if the class specified by c can be assigned to the type of value.
--This method checks if a downcast is possible. That is, if the runtime type of value is assignable to the class specified by c, value is returned. Otherwise null is returned.
--This method is not guaranteed to work with interfaces or core types such as String, Array and Date.
--If value is null, the result is null. If c is null, the result is unspecified.
function Std.instance( value, c )
	if(value == nil)then return nil end
	local mt = getmetatable(value)
	if(mt == c)then return value end
	while(mt ~= nil)do
		mt = mt.__super__
		if(mt == c and mt ~= Object)then return value end
	end
	return nil
end
--static function is(v:Dynamic, t:Dynamic):Bool
--Tells if a value v is of the type t. Returns false if v or t are null.
function Std.is( v, t )
	-- TODO: __ename__ Enums
	-- TODO basic types & funtions detection
	if(not(v or t))then return false end
	return Std.instance( v, t ) and true or false
end
js_Boot_Boot = js_Boot_Boot or {}
js_Boot_Boot.__instanceof = Std.is
__instanceof__ = Std.is
--static function parseInt(x:String):Null<Int>
--Converts a String to an Int.
--Leading whitespaces are ignored.
--If x starts with 0x or 0X, hexadecimal notation is recognized where the following digits may contain 0-9 and A-F.
--Otherwise x is read as decimal number with 0-9 being allowed characters. x may also start with a - to denote a negative value.
--In decimal mode, parsing continues until an invalid character is detected, in which case the result up to that point is returned. For hexadecimal notation, the effect of invalid characters is unspecified.
--Leading 0s that are not part of the 0x/0X hexadecimal notation are ignored, which means octal notation is not supported.
--If the input cannot be recognized, the result is null.
function Std.parseInt( x )
	return tonumber(x) -- TODO implement full specification
end
--static function parseFloat(x:String):Float
--Converts a String to a Float.
--The parsing rules for parseInt apply here as well, with the exception of invalid input resulting in a NaN value instead of null.
--Additionally, decimal notation may contain a single . to denote the start of the fractions.
function Std.parseFloat( x )
	return tonumber(x) -- TODO implement full specification
end
--static function random(x:Int):Int
--Return a random integer between 0 included and x excluded.
--If x <= 1, the result is always 0.
function Std.random( x )
	if x <= 1 then return 0 end
	return math.random(0,x-1)
end