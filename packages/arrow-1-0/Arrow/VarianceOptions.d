module Arrow.VarianceOptions;

import Arrow.FunctionOptions;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class VarianceOptions : FunctionOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_variance_options_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowVarianceOptions* _cretval;
    _cretval = garrow_variance_options_new();
    this(_cretval, Yes.Take);
  }
}
