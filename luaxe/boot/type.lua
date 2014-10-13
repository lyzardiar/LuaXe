local Type = {}
Type_Type = Type

function Type.getSuperClass( c )
	return c.__super__
end

function Type.getClassName( c )
	return c.__name__
end

function Type.resolveClass( name )
	local cl = ___hxClasses[name]
	if(cl == nil)then
		return nil
	end
	return cl
end

function Type.createEmptyInstance( cl )
	return nil -- ___hxClasses[cl].new() -- TODO guarantee that the class constructor is not called
end

function Type.allEnums(e)
	return nil
end

function Type.createEnum(e, constr, params)
	return nil
end

function Type.createEnumIndex(e, index, params)
	return nil
end

function Type.createInstance(cl, args)
	return nil
end

function Type.enumConstructor(e)
	return nil
end

function Type.enumEq(a, b)
	return nil
end

function Type.enumIndex(e)
	return nil
end

function Type.enumParameters(e)
	return nil
end

function Type.getClass(o)
	return nil
end

function Type.getClassFields(c)
	return nil
end

function Type.getEnum(o)
	return nil
end

function Type.getEnumConstructs(e)
	return nil
end

function Type.getEnumName(e)
	return nil
end

function Type.getInstanceFields(c)
	return nil
end

function Type.resolveEnum(name)
	return nil
end

function Type.typeof(v)
	return nil
end