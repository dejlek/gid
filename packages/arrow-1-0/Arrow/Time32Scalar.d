module Arrow.Time32Scalar;

import Arrow.Scalar;
import Arrow.Time32DataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Time32Scalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_time32_scalar_get_type != &gidSymbolNotFound ? garrow_time32_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Time32DataType dataType, int value)
  {
    GArrowTime32Scalar* _cretval;
    _cretval = garrow_time32_scalar_new(dataType ? cast(GArrowTime32DataType*)dataType.cPtr(No.Dup) : null, value);
    this(_cretval, Yes.Take);
  }

  int getValue()
  {
    int _retval;
    _retval = garrow_time32_scalar_get_value(cast(GArrowTime32Scalar*)cPtr);
    return _retval;
  }
}
