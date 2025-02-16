module Arrow.BaseListScalar;

import Arrow.Array;
import Arrow.Scalar;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class BaseListScalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_base_list_scalar_get_type != &gidSymbolNotFound ? garrow_base_list_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  Array getValue()
  {
    GArrowArray* _cretval;
    _cretval = garrow_base_list_scalar_get_value(cast(GArrowBaseListScalar*)cPtr);
    auto _retval = ObjectG.getDObject!Array(cast(GArrowArray*)_cretval, No.Take);
    return _retval;
  }
}
