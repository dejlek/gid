module arrow.uint64_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.integer_data_type;
import arrow.types;
import gid.gid;

/** */
class UInt64DataType : arrow.integer_data_type.IntegerDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_uint64_data_type_get_type != &gidSymbolNotFound ? garrow_uint64_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this()
  {
    GArrowUInt64DataType* _cretval;
    _cretval = garrow_uint64_data_type_new();
    this(_cretval, Yes.Take);
  }
}
