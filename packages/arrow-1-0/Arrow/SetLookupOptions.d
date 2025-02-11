module Arrow.SetLookupOptions;

import Arrow.Datum;
import Arrow.FunctionOptions;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class SetLookupOptions : FunctionOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_set_lookup_options_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Datum valueSet)
  {
    GArrowSetLookupOptions* _cretval;
    _cretval = garrow_set_lookup_options_new(valueSet ? cast(GArrowDatum*)valueSet.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
