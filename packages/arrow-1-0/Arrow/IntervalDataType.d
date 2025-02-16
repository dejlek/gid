module Arrow.IntervalDataType;

import Arrow.TemporalDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class IntervalDataType : TemporalDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_interval_data_type_get_type != &gidSymbolNotFound ? garrow_interval_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  IntervalType getIntervalType()
  {
    GArrowIntervalType _cretval;
    _cretval = garrow_interval_data_type_get_interval_type(cast(GArrowIntervalDataType*)cPtr);
    IntervalType _retval = cast(IntervalType)_cretval;
    return _retval;
  }
}
