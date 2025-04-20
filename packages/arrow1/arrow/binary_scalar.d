/// Module for [BinaryScalar] class
module arrow.binary_scalar;

import arrow.base_binary_scalar;
import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;

/** */
class BinaryScalar : arrow.base_binary_scalar.BaseBinaryScalar
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_binary_scalar_get_type != &gidSymbolNotFound ? garrow_binary_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BinaryScalar self()
  {
    return this;
  }

  /** */
  this(arrow.buffer.Buffer value)
  {
    GArrowBinaryScalar* _cretval;
    _cretval = garrow_binary_scalar_new(value ? cast(GArrowBuffer*)value.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
