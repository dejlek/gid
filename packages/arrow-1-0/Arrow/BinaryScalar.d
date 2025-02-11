module Arrow.BinaryScalar;

import Arrow.BaseBinaryScalar;
import Arrow.Buffer;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class BinaryScalar : BaseBinaryScalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_binary_scalar_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Buffer value)
  {
    GArrowBinaryScalar* _cretval;
    _cretval = garrow_binary_scalar_new(value ? cast(GArrowBuffer*)value.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
