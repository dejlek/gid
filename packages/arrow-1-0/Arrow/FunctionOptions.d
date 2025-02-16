module Arrow.FunctionOptions;

import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class FunctionOptions : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_function_options_get_type != &gidSymbolNotFound ? garrow_function_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  bool equal(FunctionOptions otherOptions)
  {
    bool _retval;
    _retval = garrow_function_options_equal(cast(GArrowFunctionOptions*)cPtr, otherOptions ? cast(GArrowFunctionOptions*)otherOptions.cPtr(No.Dup) : null);
    return _retval;
  }

  string toString_()
  {
    char* _cretval;
    _cretval = garrow_function_options_to_string(cast(GArrowFunctionOptions*)cPtr);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }
}
