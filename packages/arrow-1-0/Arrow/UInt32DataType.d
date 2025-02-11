module Arrow.UInt32DataType;

import Arrow.IntegerDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class UInt32DataType : IntegerDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_uint32_data_type_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowUInt32DataType* _cretval;
    _cretval = garrow_uint32_data_type_new();
    this(_cretval, Yes.Take);
  }
}
