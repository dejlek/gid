module Arrow.DoubleDataType;

import Arrow.FloatingPointDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class DoubleDataType : FloatingPointDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
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
