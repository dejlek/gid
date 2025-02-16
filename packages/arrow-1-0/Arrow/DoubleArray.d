module Arrow.DoubleArray;

import Arrow.Buffer;
import Arrow.NumericArray;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import Gid.gid;

class DoubleArray : NumericArray
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_double_array_get_type != &gidSymbolNotFound ? garrow_double_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(long length, Buffer data, Buffer nullBitmap, long nNulls)
  {
    GArrowDoubleArray* _cretval;
    _cretval = garrow_double_array_new(length, data ? cast(GArrowBuffer*)data.cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap.cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  double getValue(long i)
  {
    double _retval;
    _retval = garrow_double_array_get_value(cast(GArrowDoubleArray*)cPtr, i);
    return _retval;
  }

  double[] getValues()
  {
    const(double)* _cretval;
    long _cretlength;
    _cretval = garrow_double_array_get_values(cast(GArrowDoubleArray*)cPtr, &_cretlength);
    double[] _retval;

    if (_cretval)
    {
      _retval = cast(double[] )_cretval[0 .. _cretlength];
    }
    return _retval;
  }

  double sum()
  {
    double _retval;
    GError *_err;
    _retval = garrow_double_array_sum(cast(GArrowDoubleArray*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
