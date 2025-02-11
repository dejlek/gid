module Arrow.ScalarAggregateOptions;

import Arrow.FunctionOptions;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class ScalarAggregateOptions : FunctionOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_scalar_aggregate_options_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowScalarAggregateOptions* _cretval;
    _cretval = garrow_scalar_aggregate_options_new();
    this(_cretval, Yes.Take);
  }
}
