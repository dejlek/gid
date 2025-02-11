module Arrow.NullScalar;

import Arrow.Scalar;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class NullScalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_null_scalar_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowNullScalar* _cretval;
    _cretval = garrow_null_scalar_new();
    this(_cretval, Yes.Take);
  }
}
