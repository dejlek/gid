/// Module for [Date64DataType] class
module arrow.date64_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.temporal_data_type;
import arrow.types;
import gid.gid;

/** */
class Date64DataType : arrow.temporal_data_type.TemporalDataType
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
    return cast(void function())garrow_date64_data_type_get_type != &gidSymbolNotFound ? garrow_date64_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Date64DataType self()
  {
    return this;
  }

  /** */
  this()
  {
    GArrowDate64DataType* _cretval;
    _cretval = garrow_date64_data_type_new();
    this(_cretval, Yes.Take);
  }
}
