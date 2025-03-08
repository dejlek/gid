module arrow.time32_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.time32_data_type;
import arrow.types;
import gid.gid;

/** */
class Time32Scalar : arrow.scalar.Scalar
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_time32_scalar_get_type != &gidSymbolNotFound ? garrow_time32_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(arrow.time32_data_type.Time32DataType dataType, int value)
  {
    GArrowTime32Scalar* _cretval;
    _cretval = garrow_time32_scalar_new(dataType ? cast(GArrowTime32DataType*)dataType.cPtr(No.dup) : null, value);
    this(_cretval, Yes.take);
  }

  /** */
  int getValue()
  {
    int _retval;
    _retval = garrow_time32_scalar_get_value(cast(GArrowTime32Scalar*)cPtr);
    return _retval;
  }
}
