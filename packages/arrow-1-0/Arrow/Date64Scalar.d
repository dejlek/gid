module Arrow.Date64Scalar;

import Arrow.Scalar;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Date64Scalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_date64_scalar_get_type != &gidSymbolNotFound ? garrow_date64_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(long value)
  {
    GArrowDate64Scalar* _cretval;
    _cretval = garrow_date64_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  long getValue()
  {
    long _retval;
    _retval = garrow_date64_scalar_get_value(cast(GArrowDate64Scalar*)cPtr);
    return _retval;
  }
}
