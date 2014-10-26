package luaxe.lib;

extern class Metatable implements ArrayAccess<Dynamic>
{
	var __call:Dynamic;
	var __mode:String;
	var __metatable:Metatable;
	var __index:Metatable->Dynamic->Dynamic;
	var __newindex:Metatable->Dynamic->Dynamic->Void;
	var __eq:Metatable->Dynamic->Bool;
	var __add:Metatable->Dynamic->Dynamic;
	var __lt:Metatable->Dynamic->Bool;
	var __le:Metatable->Dynamic->Bool;
	var __len:Void->Float;
	var __gc:Dynamic->Void;
	var __sub:Metatable-> Dynamic->Dynamic;
	var __mul:Metatable->Dynamic->Dynamic;
	var __div:Metatable->Dynamic->Dynamic;
	var __mod:Metatable->Dynamic->Dynamic;
	var __pow:Metatable->Dynamic->Dynamic;
	var __concat:Metatable->Dynamic->String;
	var __unm:Metatable->Dynamic;
	var __tostring:Metatable->String;
}