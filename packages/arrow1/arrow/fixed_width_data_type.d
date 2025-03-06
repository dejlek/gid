module arrow.fixed_width_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.types;
import gid.gid;

/** */
class FixedWidthDataType : arrow.data_type.DataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_fixed_width_data_type_get_type != &gidSymbolNotFound ? garrow_fixed_width_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /** */
  int getBitWidth()
  {
    int _retval;
    _retval = garrow_fixed_width_data_type_get_bit_width(cast(GArrowFixedWidthDataType*)cPtr);
    return _retval;
  }
}
