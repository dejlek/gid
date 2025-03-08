module arrow.int16_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;

/** */
class Int16Scalar : arrow.scalar.Scalar
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_int16_scalar_get_type != &gidSymbolNotFound ? garrow_int16_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(short value)
  {
    GArrowInt16Scalar* _cretval;
    _cretval = garrow_int16_scalar_new(value);
    this(_cretval, Yes.take);
  }

  /** */
  short getValue()
  {
    short _retval;
    _retval = garrow_int16_scalar_get_value(cast(GArrowInt16Scalar*)cPtr);
    return _retval;
  }
}
