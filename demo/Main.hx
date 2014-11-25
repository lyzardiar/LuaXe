package ;

import luaxe.Lua;
import luaxe.Sys;

// Use readme
//@:require("hello", "world")
class Main
{
	public static function main()
	{
		// -D lua is defined automaticaly
		#if lua
			trace("Lua Rocks!");
		#end

		// Using native Lua arrays
		// indexed from zero [0]
		var larr = new LuaArray<Int>();
		larr[0] = 100500;
		trace(larr[0]);
		trace(larr.length);

		// Haxe arrays also indexed from zero [0]
		var arr = [5,55,555];
		var arr2 = ["a","b","c"];
		trace(arr);
		trace(arr[0]);
		arr.push(77);
		arr2.push("x");
		trace(arr);

		// Maps works as expected
		var map = new Map<String, Int>();
			map["x"] = 1;
			map["y"] = 2;
			map["z"] = map["x"] + map["y"];
		trace(map["x"]);
		trace(map["oops"]);
		trace(map[null]);
		trace(map);
		trace(map.exists("x"));
		trace(map.remove("x"));
		for(i in map.keys()) trace("key:"+i);
		for(i in map) trace("iter:"+i);

		// Multiline strings are supported
		trace(" Dyna
		_test_multiline_strings_
			mic ");

		// luaxe.Sys.hx is a replacement of Sys.hx
		trace(Sys.time());

		// Testing metatables:
		Metatables.main();
	}
}
