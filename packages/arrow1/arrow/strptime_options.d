module arrow.strptime_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.global;

class StrptimeOptions : FunctionOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_strptime_options_get_type != &gidSymbolNotFound ? garrow_strptime_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowStrptimeOptions* _cretval;
    _cretval = garrow_strptime_options_new();
    this(_cretval, Yes.Take);
  }
}
