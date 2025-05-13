/// Module for [DoubleScalar] class
module arrow.double_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;

/** */
class DoubleScalar : arrow.scalar.Scalar
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_double_scalar_get_type != &gidSymbolNotFound ? garrow_double_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DoubleScalar self()
  {
    return this;
  }

  /** */
  this(double value)
  {
    GArrowDoubleScalar* _cretval;
    _cretval = garrow_double_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  /** */
  double getValue()
  {
    double _retval;
    _retval = garrow_double_scalar_get_value(cast(GArrowDoubleScalar*)this._cPtr);
    return _retval;
  }
}
