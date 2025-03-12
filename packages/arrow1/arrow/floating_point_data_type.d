module arrow.floating_point_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.numeric_data_type;
import arrow.types;
import gid.gid;

/** */
class FloatingPointDataType : arrow.numeric_data_type.NumericDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_floating_point_data_type_get_type != &gidSymbolNotFound ? garrow_floating_point_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override FloatingPointDataType self()
  {
    return this;
  }
}
