module arrowflight.location;

import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class Location : gobject.object.ObjectG
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_location_get_type != &gidSymbolNotFound ? gaflight_location_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(string uri)
  {
    GAFlightLocation* _cretval;
    const(char)* _uri = uri.toCString(No.alloc);
    GError *_err;
    _cretval = gaflight_location_new(_uri, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.take);
  }

  /** */
  bool equal(arrowflight.location.Location otherLocation)
  {
    bool _retval;
    _retval = gaflight_location_equal(cast(GAFlightLocation*)cPtr, otherLocation ? cast(GAFlightLocation*)otherLocation.cPtr(No.dup) : null);
    return _retval;
  }

  /** */
  string getScheme()
  {
    char* _cretval;
    _cretval = gaflight_location_get_scheme(cast(GAFlightLocation*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.free);
    return _retval;
  }

  /** */
  string toString_()
  {
    char* _cretval;
    _cretval = gaflight_location_to_string(cast(GAFlightLocation*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.free);
    return _retval;
  }
}
