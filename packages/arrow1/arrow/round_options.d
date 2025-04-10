/// Module for [RoundOptions] class
module arrow.round_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;

/** */
class RoundOptions : arrow.function_options.FunctionOptions
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_round_options_get_type != &gidSymbolNotFound ? garrow_round_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override RoundOptions self()
  {
    return this;
  }

  /** */
  this()
  {
    GArrowRoundOptions* _cretval;
    _cretval = garrow_round_options_new();
    this(_cretval, Yes.Take);
  }
}
