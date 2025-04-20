/// Module for [StringViewDataType] class
module arrow.string_view_data_type;

import arrow.binary_view_data_type;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;

/** */
class StringViewDataType : arrow.binary_view_data_type.BinaryViewDataType
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
    return cast(void function())garrow_string_view_data_type_get_type != &gidSymbolNotFound ? garrow_string_view_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StringViewDataType self()
  {
    return this;
  }

  /** */
  this()
  {
    GArrowStringViewDataType* _cretval;
    _cretval = garrow_string_view_data_type_new();
    this(_cretval, Yes.Take);
  }
}
