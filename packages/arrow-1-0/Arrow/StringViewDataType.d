module Arrow.StringViewDataType;

import Arrow.BinaryViewDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class StringViewDataType : BinaryViewDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_string_view_data_type_get_type != &gidSymbolNotFound ? garrow_string_view_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowStringViewDataType* _cretval;
    _cretval = garrow_string_view_data_type_new();
    this(_cretval, Yes.Take);
  }
}
