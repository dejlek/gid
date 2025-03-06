module arrow.large_string_scalar;

import arrow.base_binary_scalar;
import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;

/** */
class LargeStringScalar : arrow.base_binary_scalar.BaseBinaryScalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_large_string_scalar_get_type != &gidSymbolNotFound ? garrow_large_string_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /** */
  this(arrow.buffer.Buffer value)
  {
    GArrowLargeStringScalar* _cretval;
    _cretval = garrow_large_string_scalar_new(value ? cast(GArrowBuffer*)value.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
