module arrow.interval_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.temporal_data_type;
import arrow.types;
import gid.gid;

/** */
class IntervalDataType : arrow.temporal_data_type.TemporalDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_interval_data_type_get_type != &gidSymbolNotFound ? garrow_interval_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override IntervalDataType self()
  {
    return this;
  }

  /** */
  arrow.types.IntervalType getIntervalType()
  {
    GArrowIntervalType _cretval;
    _cretval = garrow_interval_data_type_get_interval_type(cast(GArrowIntervalDataType*)cPtr);
    arrow.types.IntervalType _retval = cast(arrow.types.IntervalType)_cretval;
    return _retval;
  }
}
