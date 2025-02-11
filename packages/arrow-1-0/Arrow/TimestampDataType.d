module Arrow.TimestampDataType;

import Arrow.TemporalDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.TimeZone;
import Gid.gid;

class TimestampDataType : TemporalDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_timestamp_data_type_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(TimeUnit unit, TimeZone timeZone)
  {
    GArrowTimestampDataType* _cretval;
    _cretval = garrow_timestamp_data_type_new(unit, timeZone ? cast(GTimeZone*)timeZone.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  TimeUnit getUnit()
  {
    GArrowTimeUnit _cretval;
    _cretval = garrow_timestamp_data_type_get_unit(cast(GArrowTimestampDataType*)cPtr);
    TimeUnit _retval = cast(TimeUnit)_cretval;
    return _retval;
  }
}
