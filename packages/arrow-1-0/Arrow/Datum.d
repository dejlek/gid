module Arrow.Datum;

import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class Datum : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_datum_get_type != &gidSymbolNotFound ? garrow_datum_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  bool equal(Datum otherDatum)
  {
    bool _retval;
    _retval = garrow_datum_equal(cast(GArrowDatum*)cPtr, otherDatum ? cast(GArrowDatum*)otherDatum.cPtr(No.Dup) : null);
    return _retval;
  }

  bool isArray()
  {
    bool _retval;
    _retval = garrow_datum_is_array(cast(GArrowDatum*)cPtr);
    return _retval;
  }

  bool isArrayLike()
  {
    bool _retval;
    _retval = garrow_datum_is_array_like(cast(GArrowDatum*)cPtr);
    return _retval;
  }

  bool isScalar()
  {
    bool _retval;
    _retval = garrow_datum_is_scalar(cast(GArrowDatum*)cPtr);
    return _retval;
  }

  bool isValue()
  {
    bool _retval;
    _retval = garrow_datum_is_value(cast(GArrowDatum*)cPtr);
    return _retval;
  }

  string toString_()
  {
    char* _cretval;
    _cretval = garrow_datum_to_string(cast(GArrowDatum*)cPtr);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }
}
