module Arrow.SplitPatternOptions;

import Arrow.FunctionOptions;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class SplitPatternOptions : FunctionOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_split_pattern_options_get_type != &gidSymbolNotFound ? garrow_split_pattern_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowSplitPatternOptions* _cretval;
    _cretval = garrow_split_pattern_options_new();
    this(_cretval, Yes.Take);
  }
}
