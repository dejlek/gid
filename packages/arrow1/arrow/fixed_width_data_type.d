/// Module for [FixedWidthDataType] class
module arrow.fixed_width_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.types;
import gid.gid;

/** */
class FixedWidthDataType : arrow.data_type.DataType
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
    return cast(void function())garrow_fixed_width_data_type_get_type != &gidSymbolNotFound ? garrow_fixed_width_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FixedWidthDataType self()
  {
    return this;
  }

  /** */
  int getBitWidth()
  {
    int _retval;
    _retval = garrow_fixed_width_data_type_get_bit_width(cast(GArrowFixedWidthDataType*)this._cPtr);
    return _retval;
  }
}
