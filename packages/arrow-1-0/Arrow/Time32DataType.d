module Arrow.Time32DataType;

import Arrow.TimeDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import Gid.gid;

class Time32DataType : TimeDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_time32_data_type_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(TimeUnit unit)
  {
    GArrowTime32DataType* _cretval;
    GError *_err;
    _cretval = garrow_time32_data_type_new(unit, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }
}
