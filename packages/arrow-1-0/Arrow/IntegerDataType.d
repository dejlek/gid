module Arrow.IntegerDataType;

import Arrow.NumericDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class IntegerDataType : NumericDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_integer_data_type_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  bool isSigned()
  {
    bool _retval;
    _retval = garrow_integer_data_type_is_signed(cast(GArrowIntegerDataType*)cPtr);
    return _retval;
  }
}
