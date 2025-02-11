module Arrow.NullArrayBuilder;

import Arrow.ArrayBuilder;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class NullArrayBuilder : ArrayBuilder
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_null_array_builder_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowNullArrayBuilder* _cretval;
    _cretval = garrow_null_array_builder_new();
    this(_cretval, Yes.Take);
  }
}
