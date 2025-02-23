module arrow.int32_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;

class Int32Scalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_int32_scalar_get_type != &gidSymbolNotFound ? garrow_int32_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(int value)
  {
    GArrowInt32Scalar* _cretval;
    _cretval = garrow_int32_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  int getValue()
  {
    int _retval;
    _retval = garrow_int32_scalar_get_value(cast(GArrowInt32Scalar*)cPtr);
    return _retval;
  }
}
