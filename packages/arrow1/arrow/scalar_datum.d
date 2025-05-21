/// Module for [ScalarDatum] class
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

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_scalar_datum_get_type != &gidSymbolNotFound ? garrow_scalar_datum_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ScalarDatum self()
  {
    return this;
  }

  /** */
  this(arrow.scalar.Scalar value)
  {
    GArrowScalarDatum* _cretval;
    _cretval = garrow_scalar_datum_new(value ? cast(GArrowScalar*)value._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
