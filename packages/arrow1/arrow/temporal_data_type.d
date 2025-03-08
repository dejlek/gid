module arrow.temporal_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.fixed_width_data_type;
import arrow.types;
import gid.gid;

/** */
class TemporalDataType : arrow.fixed_width_data_type.FixedWidthDataType
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_temporal_data_type_get_type != &gidSymbolNotFound ? garrow_temporal_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }
}
