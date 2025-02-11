module Arrow.FixedSizeBinaryScalar;

import Arrow.BaseBinaryScalar;
import Arrow.Buffer;
import Arrow.FixedSizeBinaryDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class FixedSizeBinaryScalar : BaseBinaryScalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_fixed_size_binary_scalar_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(FixedSizeBinaryDataType dataType, Buffer value)
  {
    GArrowFixedSizeBinaryScalar* _cretval;
    _cretval = garrow_fixed_size_binary_scalar_new(dataType ? cast(GArrowFixedSizeBinaryDataType*)dataType.cPtr(No.Dup) : null, value ? cast(GArrowBuffer*)value.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
