module Arrow.NullArray;

import Arrow.Array;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class NullArray : Array
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_null_array_get_type();
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
