module Arrow.UTF8NormalizeOptions;

import Arrow.FunctionOptions;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class UTF8NormalizeOptions : FunctionOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
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
