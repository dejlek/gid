module Arrow.BooleanScalar;

import Arrow.Scalar;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class BooleanScalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
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
