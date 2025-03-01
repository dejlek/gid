module arrow.timestamp_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.temporal_data_type;
import arrow.types;
import gid.global;
import glib.time_zone;

class TimestampDataType : TemporalDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_timestamp_data_type_get_type != &gidSymbolNotFound ? garrow_timestamp_data_type_get_type() : cast(GType)0;
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
