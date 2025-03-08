module arrow.date32_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;

/** */
class Date32Scalar : arrow.scalar.Scalar
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_date32_scalar_get_type != &gidSymbolNotFound ? garrow_date32_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(int value)
  {
    GArrowDate32Scalar* _cretval;
    _cretval = garrow_date32_scalar_new(value);
    this(_cretval, Yes.take);
  }

  /** */
  int getValue()
  {
    int _retval;
    _retval = garrow_date32_scalar_get_value(cast(GArrowDate32Scalar*)cPtr);
    return _retval;
  }
}
