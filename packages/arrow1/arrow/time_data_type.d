module arrow.time_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.temporal_data_type;
import arrow.types;
import gid.gid;

class TimeDataType : arrow.temporal_data_type.TemporalDataType
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

  arrow.types.TimeUnit getUnit()
  {
    GArrowTimeUnit _cretval;
    _cretval = garrow_time_data_type_get_unit(cast(GArrowTimeDataType*)cPtr);
    arrow.types.TimeUnit _retval = cast(arrow.types.TimeUnit)_cretval;
    return _retval;
  }
}
