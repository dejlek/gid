module arrow.index_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.global;

class IndexOptions : FunctionOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_index_options_get_type != &gidSymbolNotFound ? garrow_index_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowIndexOptions* _cretval;
    _cretval = garrow_index_options_new();
    this(_cretval, Yes.Take);
  }
}
