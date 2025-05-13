/// Module for [BaseBinaryScalar] class
module arrow.base_binary_scalar;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class BaseBinaryScalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_base_binary_scalar_get_type != &gidSymbolNotFound ? garrow_base_binary_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BaseBinaryScalar self()
  {
    return this;
  }

  /** */
  arrow.buffer.Buffer getValue()
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_base_binary_scalar_get_value(cast(GArrowBaseBinaryScalar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, No.Take);
    return _retval;
  }
}
