package luaxe;

// TODO http://developer.coronalabs.com/reference/index/assert

class Lua
{
	inline static public function eval(code:String):Dynamic
	return (untyped __global__(dostring, code));

	inline static public function setmetatable<T>(obj:T, mt:Class<Dynamic>):T
	return (untyped __call__("setmetatable",obj,mt));

	/* TODO: doc */
	inline static public function setmetatabledef<T>(obj:T, mt:luaxe.lib.Metatable):T
	return (untyped __call__("setmetatable",obj,mt));

	inline static public function getmetatable<T>(obj:T):luaxe.lib.Metatable
	return (untyped __call__("getmetatable",obj));

	inline static public function hash(obj:Dynamic):Int
	return cast untyped __hash__(obj);
}

/*
	LuaArray
	Wrap any Lua array to safely index for [0]
*/
abstract LuaArray<T>(Dynamic)
{
	public function new() this = cast untyped __lua__("{}");

	@:arrayAccess public inline function getFromOne(k:Int):T {
		return this[k + 1];
	}

	@:arrayAccess public inline function arrayWriteFromOne(k:Int, v:T) {
		this[k + 1] = v;
	}

	public var length(get, never):Int;

	public inline function get_length():Int
	{
		return cast untyped __hash__(this);
	}
}