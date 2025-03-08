module arrow.table_concatenate_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class TableConcatenateOptions : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_table_concatenate_options_get_type != &gidSymbolNotFound ? garrow_table_concatenate_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this()
  {
    GArrowTableConcatenateOptions* _cretval;
    _cretval = garrow_table_concatenate_options_new();
    this(_cretval, Yes.Take);
  }
}
