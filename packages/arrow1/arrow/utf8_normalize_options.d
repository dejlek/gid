module arrow.utf8_normalize_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;

class UTF8NormalizeOptions : FunctionOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_utf8_normalize_options_get_type != &gidSymbolNotFound ? garrow_utf8_normalize_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowUTF8NormalizeOptions* _cretval;
    _cretval = garrow_utf8_normalize_options_new();
    this(_cretval, Yes.Take);
  }
}
