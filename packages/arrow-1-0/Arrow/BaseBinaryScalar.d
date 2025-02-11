module Arrow.BaseBinaryScalar;

import Arrow.Buffer;
import Arrow.Scalar;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class BaseBinaryScalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_base_binary_scalar_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  Buffer getValue()
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_base_binary_scalar_get_value(cast(GArrowBaseBinaryScalar*)cPtr);
    auto _retval = ObjectG.getDObject!Buffer(cast(GArrowBuffer*)_cretval, No.Take);
    return _retval;
  }
}
