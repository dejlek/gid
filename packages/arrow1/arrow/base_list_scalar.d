module arrow.base_list_scalar;

import arrow.array;
import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.object;

class BaseListScalar : arrow.scalar.Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_base_list_scalar_get_type != &gidSymbolNotFound ? garrow_base_list_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  arrow.array.Array getValue()
  {
    GArrowArray* _cretval;
    _cretval = garrow_base_list_scalar_get_value(cast(GArrowBaseListScalar*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, No.Take);
    return _retval;
  }
}
