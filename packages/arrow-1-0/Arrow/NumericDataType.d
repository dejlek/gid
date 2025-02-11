module Arrow.NumericDataType;

import Arrow.FixedWidthDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class NumericDataType : FixedWidthDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_numeric_data_type_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }
}
