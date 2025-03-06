module arrowflight.info;

import arrow.read_options;
import arrow.schema;
import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.descriptor;
import arrowflight.endpoint;
import arrowflight.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class Info : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_info_get_type != &gidSymbolNotFound ? gaflight_info_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /** */
  this(arrow.schema.Schema schema, arrowflight.descriptor.Descriptor descriptor, arrowflight.endpoint.Endpoint[] endpoints, long totalRecords, long totalBytes)
  {
    GAFlightInfo* _cretval;
    auto _endpoints = gListFromD!(arrowflight.endpoint.Endpoint)(endpoints);
    scope(exit) containerFree!(GList*, arrowflight.endpoint.Endpoint, GidOwnership.None)(_endpoints);
    GError *_err;
    _cretval = gaflight_info_new(schema ? cast(GArrowSchema*)schema.cPtr(No.Dup) : null, descriptor ? cast(GAFlightDescriptor*)descriptor.cPtr(No.Dup) : null, _endpoints, totalRecords, totalBytes, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  bool equal(arrowflight.info.Info otherInfo)
  {
    bool _retval;
    _retval = gaflight_info_equal(cast(GAFlightInfo*)cPtr, otherInfo ? cast(GAFlightInfo*)otherInfo.cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  arrowflight.descriptor.Descriptor getDescriptor()
  {
    GAFlightDescriptor* _cretval;
    _cretval = gaflight_info_get_descriptor(cast(GAFlightInfo*)cPtr);
    auto _retval = ObjectG.getDObject!(arrowflight.descriptor.Descriptor)(cast(GAFlightDescriptor*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrowflight.endpoint.Endpoint[] getEndpoints()
  {
    GList* _cretval;
    _cretval = gaflight_info_get_endpoints(cast(GAFlightInfo*)cPtr);
    auto _retval = gListToD!(arrowflight.endpoint.Endpoint, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /** */
  arrow.schema.Schema getSchema(arrow.read_options.ReadOptions options = null)
  {
    GArrowSchema* _cretval;
    GError *_err;
    _cretval = gaflight_info_get_schema(cast(GAFlightInfo*)cPtr, options ? cast(GArrowReadOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.schema.Schema)(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  long getTotalBytes()
  {
    long _retval;
    _retval = gaflight_info_get_total_bytes(cast(GAFlightInfo*)cPtr);
    return _retval;
  }

  /** */
  long getTotalRecords()
  {
    long _retval;
    _retval = gaflight_info_get_total_records(cast(GAFlightInfo*)cPtr);
    return _retval;
  }
}
