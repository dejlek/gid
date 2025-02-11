module Arrow.FloatingPointDataType;

import Arrow.NumericDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class FloatingPointDataType : NumericDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_floating_point_data_type_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }
}
