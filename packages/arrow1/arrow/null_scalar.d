module arrow.null_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.global;

class NullScalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_null_scalar_get_type != &gidSymbolNotFound ? garrow_null_scalar_get_type() : cast(GType)0;
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
