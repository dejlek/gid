module arrow.boolean_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.global;

class BooleanScalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_boolean_scalar_get_type != &gidSymbolNotFound ? garrow_boolean_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(bool value)
  {
    GArrowBooleanScalar* _cretval;
    _cretval = garrow_boolean_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  bool getValue()
  {
    bool _retval;
    _retval = garrow_boolean_scalar_get_value(cast(GArrowBooleanScalar*)cPtr);
    return _retval;
  }
}
