module Arrow.BooleanDataType;

import Arrow.FixedWidthDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class BooleanDataType : FixedWidthDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_boolean_data_type_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowBooleanDataType* _cretval;
    _cretval = garrow_boolean_data_type_new();
    this(_cretval, Yes.Take);
  }
}
