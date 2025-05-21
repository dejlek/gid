/// Module for [UInt8DataType] class
module arrow.uint8_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.integer_data_type;
import arrow.types;
import gid.gid;

/** */
class UInt8DataType : arrow.integer_data_type.IntegerDataType
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
    return cast(void function())garrow_uint8_data_type_get_type != &gidSymbolNotFound ? garrow_uint8_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UInt8DataType self()
  {
    return this;
  }

  /** */
  this()
  {
    GArrowUInt8DataType* _cretval;
    _cretval = garrow_uint8_data_type_new();
    this(_cretval, Yes.Take);
  }
}
