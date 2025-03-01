module arrow.time_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.temporal_data_type;
import arrow.types;
import gid.global;

class TimeDataType : TemporalDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_time_data_type_get_type != &gidSymbolNotFound ? garrow_time_data_type_get_type() : cast(GType)0;
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
