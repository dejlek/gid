/// Module for [FloatDataType] class
module arrow.float_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.floating_point_data_type;
import arrow.types;
import gid.gid;

/** */
class FloatDataType : arrow.floating_point_data_type.FloatingPointDataType
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
    return cast(void function())garrow_float_data_type_get_type != &gidSymbolNotFound ? garrow_float_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FloatDataType self()
  {
    return this;
  }

  /** */
  this()
  {
    GArrowFloatDataType* _cretval;
    _cretval = garrow_float_data_type_new();
    this(_cretval, Yes.Take);
  }
}
