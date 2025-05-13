/// Module for [MonthIntervalScalar] class
module arrow.month_interval_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;

/** */
class MonthIntervalScalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_month_interval_scalar_get_type != &gidSymbolNotFound ? garrow_month_interval_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MonthIntervalScalar self()
  {
    return this;
  }

  /** */
  this(int value)
  {
    GArrowMonthIntervalScalar* _cretval;
    _cretval = garrow_month_interval_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  /** */
  int getValue()
  {
    int _retval;
    _retval = garrow_month_interval_scalar_get_value(cast(GArrowMonthIntervalScalar*)this._cPtr);
    return _retval;
  }
}
