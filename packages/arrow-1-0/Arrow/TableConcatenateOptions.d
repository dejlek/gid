module Arrow.TableConcatenateOptions;

import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class TableConcatenateOptions : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_table_concatenate_options_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowTableConcatenateOptions* _cretval;
    _cretval = garrow_table_concatenate_options_new();
    this(_cretval, Yes.Take);
  }
}
