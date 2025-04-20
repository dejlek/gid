/// Module for [StructScalar] class
module arrow.struct_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.struct_data_type;
import arrow.types;
import gid.gid;

/** */
class StructScalar : arrow.scalar.Scalar
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_struct_scalar_get_type != &gidSymbolNotFound ? garrow_struct_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StructScalar self()
  {
    return this;
  }

  /** */
  this(arrow.struct_data_type.StructDataType dataType, arrow.scalar.Scalar[] value)
  {
    GArrowStructScalar* _cretval;
    auto _value = gListFromD!(arrow.scalar.Scalar)(value);
    scope(exit) containerFree!(GList*, arrow.scalar.Scalar, GidOwnership.None)(_value);
    _cretval = garrow_struct_scalar_new(dataType ? cast(GArrowStructDataType*)dataType.cPtr(No.Dup) : null, _value);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.scalar.Scalar[] getValue()
  {
    GList* _cretval;
    _cretval = garrow_struct_scalar_get_value(cast(GArrowStructScalar*)cPtr);
    auto _retval = gListToD!(arrow.scalar.Scalar, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }
}
