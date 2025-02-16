module Arrow.FixedWidthDataType;

import Arrow.DataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class FixedWidthDataType : DataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_fixed_width_data_type_get_type != &gidSymbolNotFound ? garrow_fixed_width_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  int getBitWidth()
  {
    int _retval;
    _retval = garrow_fixed_width_data_type_get_bit_width(cast(GArrowFixedWidthDataType*)cPtr);
    return _retval;
  }
}
