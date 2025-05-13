/// Module for [BooleanDataType] class
module arrow.boolean_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.fixed_width_data_type;
import arrow.types;
import gid.gid;

/** */
class BooleanDataType : arrow.fixed_width_data_type.FixedWidthDataType
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
    return cast(void function())garrow_boolean_data_type_get_type != &gidSymbolNotFound ? garrow_boolean_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BooleanDataType self()
  {
    return this;
  }

  /** */
  this()
  {
    GArrowBooleanDataType* _cretval;
    _cretval = garrow_boolean_data_type_new();
    this(_cretval, Yes.Take);
  }
}
