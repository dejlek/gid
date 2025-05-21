/// Module for [FixedSizeBinaryDataType] class
module arrow.fixed_size_binary_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.fixed_width_data_type;
import arrow.types;
import gid.gid;

/** */
class FixedSizeBinaryDataType : arrow.fixed_width_data_type.FixedWidthDataType
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
    return cast(void function())garrow_fixed_size_binary_data_type_get_type != &gidSymbolNotFound ? garrow_fixed_size_binary_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FixedSizeBinaryDataType self()
  {
    return this;
  }

  /** */
  this(int byteWidth)
  {
    GArrowFixedSizeBinaryDataType* _cretval;
    _cretval = garrow_fixed_size_binary_data_type_new(byteWidth);
    this(_cretval, Yes.Take);
  }

  /** */
  int getByteWidth()
  {
    int _retval;
    _retval = garrow_fixed_size_binary_data_type_get_byte_width(cast(GArrowFixedSizeBinaryDataType*)this._cPtr);
    return _retval;
  }
}
