module arrow.scalar_datum;

import arrow.c.functions;
import arrow.c.types;
import arrow.datum;
import arrow.scalar;
import arrow.types;
import gid.gid;

/** */
class ScalarDatum : arrow.datum.Datum
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_scalar_datum_get_type != &gidSymbolNotFound ? garrow_scalar_datum_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(arrow.scalar.Scalar value)
  {
    GArrowScalarDatum* _cretval;
    _cretval = garrow_scalar_datum_new(value ? cast(GArrowScalar*)value.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
