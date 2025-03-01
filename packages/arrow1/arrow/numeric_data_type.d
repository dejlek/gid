module arrow.numeric_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.fixed_width_data_type;
import arrow.types;
import gid.global;

class NumericDataType : FixedWidthDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_numeric_data_type_get_type != &gidSymbolNotFound ? garrow_numeric_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
