module Arrow.CastOptions;

import Arrow.FunctionOptions;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class CastOptions : FunctionOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_cast_options_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowCastOptions* _cretval;
    _cretval = garrow_cast_options_new();
    this(_cretval, Yes.Take);
  }
}
