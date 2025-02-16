module Arrow.HalfFloatDataType;

import Arrow.FloatingPointDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class HalfFloatDataType : FloatingPointDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_half_float_data_type_get_type != &gidSymbolNotFound ? garrow_half_float_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowHalfFloatDataType* _cretval;
    _cretval = garrow_half_float_data_type_new();
    this(_cretval, Yes.Take);
  }
}
