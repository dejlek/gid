module Arrow.BinaryViewDataType;

import Arrow.DataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class BinaryViewDataType : DataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_binary_view_data_type_get_type != &gidSymbolNotFound ? garrow_binary_view_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowBinaryViewDataType* _cretval;
    _cretval = garrow_binary_view_data_type_new();
    this(_cretval, Yes.Take);
  }
}
