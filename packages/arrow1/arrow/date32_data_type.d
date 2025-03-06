module arrow.date32_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.temporal_data_type;
import arrow.types;
import gid.gid;

/** */
class Date32DataType : arrow.temporal_data_type.TemporalDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_date32_data_type_get_type != &gidSymbolNotFound ? garrow_date32_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /** */
  this()
  {
    GArrowDate32DataType* _cretval;
    _cretval = garrow_date32_data_type_new();
    this(_cretval, Yes.Take);
  }
}
