module arrow.large_binary_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.types;
import gid.gid;

/** */
class LargeBinaryDataType : arrow.data_type.DataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_large_binary_data_type_get_type != &gidSymbolNotFound ? garrow_large_binary_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this()
  {
    GArrowLargeBinaryDataType* _cretval;
    _cretval = garrow_large_binary_data_type_new();
    this(_cretval, Yes.Take);
  }
}
