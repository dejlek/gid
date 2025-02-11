module Arrow.TimeDataType;

import Arrow.TemporalDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class TimeDataType : TemporalDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_time_data_type_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  TimeUnit getUnit()
  {
    GArrowTimeUnit _cretval;
    _cretval = garrow_time_data_type_get_unit(cast(GArrowTimeDataType*)cPtr);
    TimeUnit _retval = cast(TimeUnit)_cretval;
    return _retval;
  }
}
