module Arrow.Time64Scalar;

import Arrow.Scalar;
import Arrow.Time64DataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Time64Scalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_time64_scalar_get_type != &gidSymbolNotFound ? garrow_time64_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Time64DataType dataType, long value)
  {
    GArrowTime64Scalar* _cretval;
    _cretval = garrow_time64_scalar_new(dataType ? cast(GArrowTime64DataType*)dataType.cPtr(No.Dup) : null, value);
    this(_cretval, Yes.Take);
  }

  long getValue()
  {
    long _retval;
    _retval = garrow_time64_scalar_get_value(cast(GArrowTime64Scalar*)cPtr);
    return _retval;
  }
}
