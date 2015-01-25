LuaXe
=====

![lua](https://cloud.githubusercontent.com/assets/3642643/5892488/6bb5e326-a4d1-11e4-8e5b-4fa2ef3270f3.png)

<a href="http://peyty.github.io#donate"><img src="http://peyty.github.io/images/donate.png"></a>
<a href="http://peyty.github.io#hireme"><img src="http://peyty.github.io/images/hireme.png"></a>

State: *pre-alpha*
=====
Primarily LuaJIT -> make super-optimized portable Haxe target!

I have some working *fast* (beats V8 and Neko) code output.

**Note:** don't beleave benchmarks from *demo* folder, they show low performance just because of immature code generator. Manually tweaked code works really well. Happily, this process would be automated soon.

Require Haxe Compiler 3.1, Lua 5.2 or LuaJIT 2

Installation & Usage *!fully functional!*
=====
Quick install:
```
haxelib git luaxe https://github.com/PeyTy/LuaXe.git
```
Quick update:
```
haxelib update luaxe
```
First, you need to set JS target in your HXML file: ```-js bin/hx.lua``` Note to set *.lua* file type. Than, add LuaXe lib: ```-lib luaxe``` Build macro added automatically: ```--macro luaxe.LuaGenerator.use()```. Library folder also contains patched std libs.
Complete HXML file:
```
-main Main
-lib luaxe
-js bin/hx.lua
-dce full
--connect 6000
```

Option ```-D lua``` is defined automaticaly, so you can use ```#if lua ... #end```
(___dce___ and ___connect___ is optional)

You can run your file just after compilation directly in stand-alone Lua environment:
```
-cmd /usr/local/bin/luajit bin/hx.lua
or:
-cmd /usr/local/bin/lua bin/hx.lua
```

Compiler
=====
- Separate boot file:
`-D luabootfile` forces LuaXe to create `youfile-boot.lua` and import it with `require("yourfile-boot")`. File `youfile.lua` would then contain only user classes.

Magic
=====
Untyped:
```haxe
untyped __lua__("_G.print('__lua__')");
untyped __call__(print, 1, 2, 3);
untyped __tail__(os, clock, 1, 2, "hi");
untyped __global__(print,'__lua__', 2);
untyped __hash__(z);
```
```lua
_G.print('__lua__');
print(1, 2, 3);
os:clock(1, 2, "hi");
_G.print("__lua__", 2);
#z
```
Meta`s:
```haxe
@:require("hello", "world")
class Main { ... }
```
```lua
require "hello" -- added to top of your lua file
require "world"
```

External Classes Usage
=====
Using external Lua **tables** fairly simple, but requires special meta **@dotpath**.
Here is example for Love2D:

```haxe
class Main {
 static function main() {
  LoveGraphics.setColor(0, 0, 0, 0);
 }
}

@:native("love.graphics") @dotpath
extern class LoveGraphics {
 static public function setColor(r:Float, g:Float, b:Float, a:Float):Void;
}
```
Outputs:
```lua
function Main_Main.main(  )
	love.graphics.setColor(0, 0, 0, 0)
end
```
If you want to use name of class as a constructor, use meta **@nonew**

```haxe
class Main {
 static function main() {
  var vec = new Vector3(1, 2, 3);
 }
}

@:native("Vector3") @nonew private extern class Vector3 {
	public function new(x:Float,y:Float,z:Float);
}
```
Outputs:
```lua
function Main_Main.main(  )
	local vec = Vector3(1, 2, 3) -- NOT "Vector3.new(...)"
end
```

External Classes Creation
=====
It is very easy to create external classes for LuaXe.
Create extern class definition:
```haxe
// placed inside root package TestExtern
extern class Extern {
	function new(x:Int);
	static function test():String;
	static var hi:String;
	function selfcall():String;
	var X:Int;
}
```
Create implementation of class in Lua that is fully compatible with OOP-style LuaXe API:
```lua
local Extern = {}
TestExtern_Extern = Extern -- setting proper namespace 
-- Another namespace? Use "_": namespace.TestExtern.Extern -> namespace_TestExtern_Extern
Extern.__index = Extern -- need for metatable
Extern.hi = "Hello!" -- static var

function Extern.new(x) -- constructor
	local self = { X = x } -- "X" is a class field
	setmetatable(self, Extern)
	return self
end

function Extern:selfcall() return self.X end -- public function
function Extern.test() return "static test" end -- static function
```
Everything works just as usual:
```haxe
// static:
trace(Extern.test());
trace(Extern.hi);
// fields:
var inst = new Extern(5);
trace(inst.selfcall());
trace(inst.X);
```

Links
=====
https://github.com/frabbit/hx2python
<br>https://bitbucket.org/AndrewVernon/hx2dart
<br>http://api.haxe.org/
