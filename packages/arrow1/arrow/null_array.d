module arrow.null_array;

import arrow.array;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.global;

class NullArray : Array
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_null_array_get_type != &gidSymbolNotFound ? garrow_null_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(long length)
  {
    GArrowNullArray* _cretval;
    _cretval = garrow_null_array_new(length);
    this(_cretval, Yes.Take);
  }
}
