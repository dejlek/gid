module arrow.binary_view_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.types;
import gid.gid;

class BinaryViewDataType : DataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
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
