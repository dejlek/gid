module Arrow.QuantileOptions;

import Arrow.FunctionOptions;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class QuantileOptions : FunctionOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_quantile_options_get_type != &gidSymbolNotFound ? garrow_quantile_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowQuantileOptions* _cretval;
    _cretval = garrow_quantile_options_new();
    this(_cretval, Yes.Take);
  }

  double[] getQs()
  {
    const(double)* _cretval;
    size_t _cretlength;
    _cretval = garrow_quantile_options_get_qs(cast(GArrowQuantileOptions*)cPtr, &_cretlength);
    double[] _retval;

    if (_cretval)
    {
      _retval = cast(double[] )_cretval[0 .. _cretlength];
    }
    return _retval;
  }

  void setQ(double q)
  {
    garrow_quantile_options_set_q(cast(GArrowQuantileOptions*)cPtr, q);
  }

  void setQs(double[] qs)
  {
    size_t _n;
    if (qs)
      _n = cast(size_t)qs.length;

    auto _qs = cast(const(double)*)qs.ptr;
    garrow_quantile_options_set_qs(cast(GArrowQuantileOptions*)cPtr, _qs, _n);
  }
}
