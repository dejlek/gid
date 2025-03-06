module arrow.float_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.floating_point_data_type;
import arrow.types;
import gid.gid;

/** */
class FloatDataType : arrow.floating_point_data_type.FloatingPointDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_float_data_type_get_type != &gidSymbolNotFound ? garrow_float_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /** */
  this()
  {
    GArrowFloatDataType* _cretval;
    _cretval = garrow_float_data_type_new();
    this(_cretval, Yes.Take);
  }
}
