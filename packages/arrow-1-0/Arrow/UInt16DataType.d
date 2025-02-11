module Arrow.UInt16DataType;

import Arrow.IntegerDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class UInt16DataType : IntegerDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_uint16_data_type_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowUInt16DataType* _cretval;
    _cretval = garrow_uint16_data_type_new();
    this(_cretval, Yes.Take);
  }
}
