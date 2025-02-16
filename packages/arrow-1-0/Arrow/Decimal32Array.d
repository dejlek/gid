module Arrow.Decimal32Array;

import Arrow.Decimal32;
import Arrow.FixedSizeBinaryArray;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class Decimal32Array : FixedSizeBinaryArray
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_decimal32_array_get_type != &gidSymbolNotFound ? garrow_decimal32_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  string formatValue(long i)
  {
    char* _cretval;
    _cretval = garrow_decimal32_array_format_value(cast(GArrowDecimal32Array*)cPtr, i);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }

  alias getValue = FixedSizeBinaryArray.getValue;

  Decimal32 getValue(long i)
  {
    GArrowDecimal32* _cretval;
    _cretval = garrow_decimal32_array_get_value(cast(GArrowDecimal32Array*)cPtr, i);
    auto _retval = ObjectG.getDObject!Decimal32(cast(GArrowDecimal32*)_cretval, Yes.Take);
    return _retval;
  }
}
