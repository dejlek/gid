module Arrow.Int8DataType;

import Arrow.IntegerDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Int8DataType : IntegerDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_int8_data_type_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowInt8DataType* _cretval;
    _cretval = garrow_int8_data_type_new();
    this(_cretval, Yes.Take);
  }
}
