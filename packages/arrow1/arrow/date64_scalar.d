module arrow.date64_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;

/** */
class Date64Scalar : arrow.scalar.Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_date64_scalar_get_type != &gidSymbolNotFound ? garrow_date64_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /** */
  this(long value)
  {
    GArrowDate64Scalar* _cretval;
    _cretval = garrow_date64_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  /** */
  long getValue()
  {
    long _retval;
    _retval = garrow_date64_scalar_get_value(cast(GArrowDate64Scalar*)cPtr);
    return _retval;
  }
}
