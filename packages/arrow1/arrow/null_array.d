/// Module for [NullArray] class
module arrow.null_array;

import arrow.array;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;

/** */
class NullArray : arrow.array.Array
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_null_array_get_type != &gidSymbolNotFound ? garrow_null_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NullArray self()
  {
    return this;
  }

  /** */
  this(long length)
  {
    GArrowNullArray* _cretval;
    _cretval = garrow_null_array_new(length);
    this(_cretval, Yes.Take);
  }
}
