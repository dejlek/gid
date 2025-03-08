module arrow.timestamp_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.temporal_data_type;
import arrow.types;
import gid.gid;
import glib.time_zone;

/** */
class TimestampDataType : arrow.temporal_data_type.TemporalDataType
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_timestamp_data_type_get_type != &gidSymbolNotFound ? garrow_timestamp_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(arrow.types.TimeUnit unit, glib.time_zone.TimeZone timeZone = null)
  {
    GArrowTimestampDataType* _cretval;
    _cretval = garrow_timestamp_data_type_new(unit, timeZone ? cast(GTimeZone*)timeZone.cPtr(No.dup) : null);
    this(_cretval, Yes.take);
  }

  /** */
  arrow.types.TimeUnit getUnit()
  {
    GArrowTimeUnit _cretval;
    _cretval = garrow_timestamp_data_type_get_unit(cast(GArrowTimestampDataType*)cPtr);
    arrow.types.TimeUnit _retval = cast(arrow.types.TimeUnit)_cretval;
    return _retval;
  }
}
