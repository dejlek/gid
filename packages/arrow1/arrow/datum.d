/// Module for [Datum] class
module arrow.datum;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class Datum : gobject.object.ObjectWrap
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
    return cast(void function())garrow_datum_get_type != &gidSymbolNotFound ? garrow_datum_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Datum self()
  {
    return this;
  }

  /** */
  bool equal(arrow.datum.Datum otherDatum)
  {
    bool _retval;
    _retval = garrow_datum_equal(cast(GArrowDatum*)cPtr, otherDatum ? cast(GArrowDatum*)otherDatum.cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool isArray()
  {
    bool _retval;
    _retval = garrow_datum_is_array(cast(GArrowDatum*)cPtr);
    return _retval;
  }

  /** */
  bool isArrayLike()
  {
    bool _retval;
    _retval = garrow_datum_is_array_like(cast(GArrowDatum*)cPtr);
    return _retval;
  }

  /** */
  bool isScalar()
  {
    bool _retval;
    _retval = garrow_datum_is_scalar(cast(GArrowDatum*)cPtr);
    return _retval;
  }

  /** */
  bool isValue()
  {
    bool _retval;
    _retval = garrow_datum_is_value(cast(GArrowDatum*)cPtr);
    return _retval;
  }

  /** */
  string toString_()
  {
    char* _cretval;
    _cretval = garrow_datum_to_string(cast(GArrowDatum*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
