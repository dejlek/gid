/// Module for [UInt16DataType] class
module arrow.uint16_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.integer_data_type;
import arrow.types;
import gid.gid;

/** */
class UInt16DataType : arrow.integer_data_type.IntegerDataType
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
    return cast(void function())garrow_uint16_data_type_get_type != &gidSymbolNotFound ? garrow_uint16_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UInt16DataType self()
  {
    return this;
  }

  /** */
  this()
  {
    GArrowUInt16DataType* _cretval;
    _cretval = garrow_uint16_data_type_new();
    this(_cretval, Yes.Take);
  }
}
