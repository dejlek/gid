module arrow.fixed_size_binary_scalar;

import arrow.base_binary_scalar;
import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.fixed_size_binary_data_type;
import arrow.types;
import gid.gid;

/** */
class FixedSizeBinaryScalar : arrow.base_binary_scalar.BaseBinaryScalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_fixed_size_binary_scalar_get_type != &gidSymbolNotFound ? garrow_fixed_size_binary_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(arrow.fixed_size_binary_data_type.FixedSizeBinaryDataType dataType, arrow.buffer.Buffer value)
  {
    GArrowFixedSizeBinaryScalar* _cretval;
    _cretval = garrow_fixed_size_binary_scalar_new(dataType ? cast(GArrowFixedSizeBinaryDataType*)dataType.cPtr(No.Dup) : null, value ? cast(GArrowBuffer*)value.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
