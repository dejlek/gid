module Arrow.NumericArray;

import Arrow.PrimitiveArray;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import Gid.gid;

class NumericArray : PrimitiveArray
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_numeric_array_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  double mean()
  {
    double _retval;
    GError *_err;
    _retval = garrow_numeric_array_mean(cast(GArrowNumericArray*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
