/// Module for [TimeDataType] class
module arrow.time_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.temporal_data_type;
import arrow.types;
import gid.gid;

/** */
class TimeDataType : arrow.temporal_data_type.TemporalDataType
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_time_data_type_get_type != &gidSymbolNotFound ? garrow_time_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TimeDataType self()
  {
    return this;
  }

  /** */
  arrow.types.TimeUnit getUnit()
  {
    GArrowTimeUnit _cretval;
    _cretval = garrow_time_data_type_get_unit(cast(GArrowTimeDataType*)this._cPtr);
    arrow.types.TimeUnit _retval = cast(arrow.types.TimeUnit)_cretval;
    return _retval;
  }
}
