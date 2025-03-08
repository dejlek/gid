module arrow.round_to_multiple_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;

/** */
class RoundToMultipleOptions : arrow.function_options.FunctionOptions
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_round_to_multiple_options_get_type != &gidSymbolNotFound ? garrow_round_to_multiple_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this()
  {
    GArrowRoundToMultipleOptions* _cretval;
    _cretval = garrow_round_to_multiple_options_new();
    this(_cretval, Yes.take);
  }
}
