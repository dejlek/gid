module arrow.function_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class FunctionOptions : gobject.object.ObjectG
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_function_options_get_type != &gidSymbolNotFound ? garrow_function_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  bool equal(arrow.function_options.FunctionOptions otherOptions = null)
  {
    bool _retval;
    _retval = garrow_function_options_equal(cast(GArrowFunctionOptions*)cPtr, otherOptions ? cast(GArrowFunctionOptions*)otherOptions.cPtr(No.dup) : null);
    return _retval;
  }

  /** */
  string toString_()
  {
    char* _cretval;
    _cretval = garrow_function_options_to_string(cast(GArrowFunctionOptions*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.free);
    return _retval;
  }
}
