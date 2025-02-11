module Arrow.MatchSubstringOptions;

import Arrow.FunctionOptions;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class MatchSubstringOptions : FunctionOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_match_substring_options_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowMatchSubstringOptions* _cretval;
    _cretval = garrow_match_substring_options_new();
    this(_cretval, Yes.Take);
  }
}
