/// Module for [TimestampScalar] class
module arrow.timestamp_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.timestamp_data_type;
import arrow.types;
import gid.gid;

/** */
class TimestampScalar : arrow.scalar.Scalar
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_timestamp_scalar_get_type != &gidSymbolNotFound ? garrow_timestamp_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TimestampScalar self()
  {
    return this;
  }

  /** */
  this(arrow.timestamp_data_type.TimestampDataType dataType, long value)
  {
    GArrowTimestampScalar* _cretval;
    _cretval = garrow_timestamp_scalar_new(dataType ? cast(GArrowTimestampDataType*)dataType._cPtr(No.Dup) : null, value);
    this(_cretval, Yes.Take);
  }

  /** */
  long getValue()
  {
    long _retval;
    _retval = garrow_timestamp_scalar_get_value(cast(GArrowTimestampScalar*)this._cPtr);
    return _retval;
  }
}
