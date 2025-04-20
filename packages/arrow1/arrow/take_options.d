/// Module for [TakeOptions] class
module arrow.take_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;

/** */
class TakeOptions : arrow.function_options.FunctionOptions
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_take_options_get_type != &gidSymbolNotFound ? garrow_take_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TakeOptions self()
  {
    return this;
  }

  /** */
  this()
  {
    GArrowTakeOptions* _cretval;
    _cretval = garrow_take_options_new();
    this(_cretval, Yes.Take);
  }
}
