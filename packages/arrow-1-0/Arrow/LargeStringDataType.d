module Arrow.LargeStringDataType;

import Arrow.DataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class LargeStringDataType : DataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_large_string_data_type_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowLargeStringDataType* _cretval;
    _cretval = garrow_large_string_data_type_new();
    this(_cretval, Yes.Take);
  }
}
