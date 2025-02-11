module Arrow.ScalarDatum;

import Arrow.Datum;
import Arrow.Scalar;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class ScalarDatum : Datum
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_scalar_datum_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Scalar value)
  {
    GArrowScalarDatum* _cretval;
    _cretval = garrow_scalar_datum_new(value ? cast(GArrowScalar*)value.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
