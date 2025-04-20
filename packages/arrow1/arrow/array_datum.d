/// Module for [ArrayDatum] class
module arrow.array_datum;

import arrow.array;
import arrow.c.functions;
import arrow.c.types;
import arrow.datum;
import arrow.types;
import gid.gid;

/** */
class ArrayDatum : arrow.datum.Datum
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
    return cast(void function())garrow_array_datum_get_type != &gidSymbolNotFound ? garrow_array_datum_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ArrayDatum self()
  {
    return this;
  }

  /** */
  this(arrow.array.Array value)
  {
    GArrowArrayDatum* _cretval;
    _cretval = garrow_array_datum_new(value ? cast(GArrowArray*)value.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
