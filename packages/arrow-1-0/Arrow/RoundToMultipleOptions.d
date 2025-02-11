module Arrow.RoundToMultipleOptions;

import Arrow.FunctionOptions;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class RoundToMultipleOptions : FunctionOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_round_to_multiple_options_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowRoundToMultipleOptions* _cretval;
    _cretval = garrow_round_to_multiple_options_new();
    this(_cretval, Yes.Take);
  }
}
