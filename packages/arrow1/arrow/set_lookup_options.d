module arrow.set_lookup_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.datum;
import arrow.function_options;
import arrow.types;
import gid.gid;

/** */
class SetLookupOptions : arrow.function_options.FunctionOptions
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_set_lookup_options_get_type != &gidSymbolNotFound ? garrow_set_lookup_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(arrow.datum.Datum valueSet = null)
  {
    GArrowSetLookupOptions* _cretval;
    _cretval = garrow_set_lookup_options_new(valueSet ? cast(GArrowDatum*)valueSet.cPtr(No.dup) : null);
    this(_cretval, Yes.take);
  }
}
