/// Module for [CountOptions] class
module arrow.count_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class CountOptions : arrow.function_options.FunctionOptions
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_count_options_get_type != &gidSymbolNotFound ? garrow_count_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CountOptions self()
  {
    return this;
  }

  /** */
  @property arrow.types.CountMode mode()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.types.CountMode)("mode");
  }

  /** */
  @property void mode(arrow.types.CountMode propval)
  {
    gobject.object.ObjectWrap.setProperty!(arrow.types.CountMode)("mode", propval);
  }

  /** */
  this()
  {
    GArrowCountOptions* _cretval;
    _cretval = garrow_count_options_new();
    this(_cretval, Yes.Take);
  }
}
