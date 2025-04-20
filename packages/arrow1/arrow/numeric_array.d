/// Module for [NumericArray] class
module arrow.numeric_array;

import arrow.c.functions;
import arrow.c.types;
import arrow.primitive_array;
import arrow.types;
import gid.gid;
import glib.error;

/** */
class NumericArray : arrow.primitive_array.PrimitiveArray
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
    return cast(void function())garrow_numeric_array_get_type != &gidSymbolNotFound ? garrow_numeric_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NumericArray self()
  {
    return this;
  }

  /** */
  double mean()
  {
    double _retval;
    GError *_err;
    _retval = garrow_numeric_array_mean(cast(GArrowNumericArray*)cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
