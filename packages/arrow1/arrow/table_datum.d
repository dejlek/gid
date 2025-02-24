module arrow.table_datum;

import arrow.c.functions;
import arrow.c.types;
import arrow.datum;
import arrow.table;
import arrow.types;
import gid.gid;

class TableDatum : Datum
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_table_datum_get_type != &gidSymbolNotFound ? garrow_table_datum_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Table value)
  {
    GArrowTableDatum* _cretval;
    _cretval = garrow_table_datum_new(value ? cast(GArrowTable*)value.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
