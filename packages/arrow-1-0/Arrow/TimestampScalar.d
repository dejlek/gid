module Arrow.TimestampScalar;

import Arrow.Scalar;
import Arrow.TimestampDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class TimestampScalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_timestamp_scalar_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(TimestampDataType dataType, long value)
  {
    GArrowTimestampScalar* _cretval;
    _cretval = garrow_timestamp_scalar_new(dataType ? cast(GArrowTimestampDataType*)dataType.cPtr(No.Dup) : null, value);
    this(_cretval, Yes.Take);
  }

  long getValue()
  {
    long _retval;
    _retval = garrow_timestamp_scalar_get_value(cast(GArrowTimestampScalar*)cPtr);
    return _retval;
  }
}
