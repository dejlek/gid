module Arrow.UnionScalar;

import Arrow.Scalar;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class UnionScalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_union_scalar_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  byte getTypeCode()
  {
    byte _retval;
    _retval = garrow_union_scalar_get_type_code(cast(GArrowUnionScalar*)cPtr);
    return _retval;
  }

  Scalar getValue()
  {
    GArrowScalar* _cretval;
    _cretval = garrow_union_scalar_get_value(cast(GArrowUnionScalar*)cPtr);
    auto _retval = ObjectG.getDObject!Scalar(cast(GArrowScalar*)_cretval, No.Take);
    return _retval;
  }
}
