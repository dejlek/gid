module arrow.match_substring_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;

/** */
class MatchSubstringOptions : arrow.function_options.FunctionOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_match_substring_options_get_type != &gidSymbolNotFound ? garrow_match_substring_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override MatchSubstringOptions self()
  {
    return this;
  }

  /** */
  this()
  {
    GArrowMatchSubstringOptions* _cretval;
    _cretval = garrow_match_substring_options_new();
    this(_cretval, Yes.Take);
  }
}
