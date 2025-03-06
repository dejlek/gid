module arrow.scalar_aggregate_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;

/** */
class ScalarAggregateOptions : arrow.function_options.FunctionOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_scalar_aggregate_options_get_type != &gidSymbolNotFound ? garrow_scalar_aggregate_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /** */
  this()
  {
    GArrowScalarAggregateOptions* _cretval;
    _cretval = garrow_scalar_aggregate_options_new();
    this(_cretval, Yes.Take);
  }
}
