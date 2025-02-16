module Arrow.ExtensionScalar;

import Arrow.Scalar;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class ExtensionScalar : Scalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_extension_scalar_get_type != &gidSymbolNotFound ? garrow_extension_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
