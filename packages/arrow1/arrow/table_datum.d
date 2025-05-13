/// Module for [TableDatum] class
module arrow.table_datum;

import arrow.c.functions;
import arrow.c.types;
import arrow.datum;
import arrow.table;
import arrow.types;
import gid.gid;

/** */
class TableDatum : arrow.datum.Datum
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_table_datum_get_type != &gidSymbolNotFound ? garrow_table_datum_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TableDatum self()
  {
    return this;
  }

  /** */
  this(arrow.table.Table value)
  {
    GArrowTableDatum* _cretval;
    _cretval = garrow_table_datum_new(value ? cast(GArrowTable*)value._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
