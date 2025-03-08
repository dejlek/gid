module arrow.string_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.types;
import gid.gid;

/** */
class StringDataType : arrow.data_type.DataType
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_string_data_type_get_type != &gidSymbolNotFound ? garrow_string_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this()
  {
    GArrowStringDataType* _cretval;
    _cretval = garrow_string_data_type_new();
    this(_cretval, Yes.take);
  }
}
