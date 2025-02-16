module Arrow.Decimal64Scalar;

import Arrow.Decimal64;
import Arrow.Decimal64DataType;
import Arrow.Scalar;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class Decimal64Scalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_decimal64_scalar_get_type != &gidSymbolNotFound ? garrow_decimal64_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Decimal64DataType dataType, Decimal64 value)
  {
    GArrowDecimal64Scalar* _cretval;
    _cretval = garrow_decimal64_scalar_new(dataType ? cast(GArrowDecimal64DataType*)dataType.cPtr(No.Dup) : null, value ? cast(GArrowDecimal64*)value.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  Decimal64 getValue()
  {
    GArrowDecimal64* _cretval;
    _cretval = garrow_decimal64_scalar_get_value(cast(GArrowDecimal64Scalar*)cPtr);
    auto _retval = ObjectG.getDObject!Decimal64(cast(GArrowDecimal64*)_cretval, No.Take);
    return _retval;
  }
}
