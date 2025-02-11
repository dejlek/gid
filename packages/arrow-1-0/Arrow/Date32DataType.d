module Arrow.Date32DataType;

import Arrow.TemporalDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class Date32DataType : TemporalDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_date32_data_type_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowDate32DataType* _cretval;
    _cretval = garrow_date32_data_type_new();
    this(_cretval, Yes.Take);
  }
}
