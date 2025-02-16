module Arrow.UInt32Scalar;

import Arrow.Scalar;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class UInt32Scalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_uint32_scalar_get_type != &gidSymbolNotFound ? garrow_uint32_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(uint value)
  {
    GArrowUInt32Scalar* _cretval;
    _cretval = garrow_uint32_scalar_new(value);
    this(_cretval, Yes.Take);
  }

  uint getValue()
  {
    uint _retval;
    _retval = garrow_uint32_scalar_get_value(cast(GArrowUInt32Scalar*)cPtr);
    return _retval;
  }
}
