module arrow.double_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.floating_point_data_type;
import arrow.types;
import gid.global;

class DoubleDataType : FloatingPointDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_double_data_type_get_type != &gidSymbolNotFound ? garrow_double_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowDoubleDataType* _cretval;
    _cretval = garrow_double_data_type_new();
    this(_cretval, Yes.Take);
  }
}
