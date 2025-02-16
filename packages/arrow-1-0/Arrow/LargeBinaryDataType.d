module Arrow.LargeBinaryDataType;

import Arrow.DataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class LargeBinaryDataType : DataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_large_binary_data_type_get_type != &gidSymbolNotFound ? garrow_large_binary_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowLargeBinaryDataType* _cretval;
    _cretval = garrow_large_binary_data_type_new();
    this(_cretval, Yes.Take);
  }
}
