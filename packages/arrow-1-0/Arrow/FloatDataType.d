module Arrow.FloatDataType;

import Arrow.FloatingPointDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class FloatDataType : FloatingPointDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_float_data_type_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowFloatDataType* _cretval;
    _cretval = garrow_float_data_type_new();
    this(_cretval, Yes.Take);
  }
}
