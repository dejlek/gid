module Arrow.StructScalar;

import Arrow.Scalar;
import Arrow.StructDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class StructScalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_struct_scalar_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(StructDataType dataType, Scalar[] value)
  {
    GArrowStructScalar* _cretval;
    auto _value = gListFromD!(Scalar)(value);
    scope(exit) containerFree!(GList*, Scalar, GidOwnership.None)(_value);
    _cretval = garrow_struct_scalar_new(dataType ? cast(GArrowStructDataType*)dataType.cPtr(No.Dup) : null, _value);
    this(_cretval, Yes.Take);
  }

  Scalar[] getValue()
  {
    GList* _cretval;
    _cretval = garrow_struct_scalar_get_value(cast(GArrowStructScalar*)cPtr);
    auto _retval = gListToD!(Scalar, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }
}
