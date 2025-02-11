module Arrow.TableDatum;

import Arrow.Datum;
import Arrow.Table;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class TableDatum : Datum
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_table_datum_get_type();
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
