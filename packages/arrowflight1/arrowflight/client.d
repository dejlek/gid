module arrowflight.client;

import arrow.schema;
import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.call_options;
import arrowflight.client_options;
import arrowflight.criteria;
import arrowflight.descriptor;
import arrowflight.do_put_result;
import arrowflight.info;
import arrowflight.location;
import arrowflight.stream_reader;
import arrowflight.ticket;
import arrowflight.types;
import gid.global;
import glib.error;
import gobject.object;

class Client : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_client_get_type != &gidSymbolNotFound ? gaflight_client_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Location location, ClientOptions options)
  {
    GAFlightClient* _cretval;
    GError *_err;
    _cretval = gaflight_client_new(location ? cast(GAFlightLocation*)location.cPtr(No.Dup) : null, options ? cast(GAFlightClientOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  /**
   * Authenticates to the server using basic HTTP style authentication.
   * Params:
   *   user = User name to be used.
   *   password = Password to be used.
   *   options = A #GAFlightCallOptions.
   *   bearerName = Bearer token name on success.
   *   bearerValue = Bearer token value on success.
   * Returns: %TRUE on success, %FALSE if there was an error.
   */
  bool authenticateBasicToken(string user, string password, CallOptions options, out string bearerName, out string bearerValue)
  {
    bool _retval;
    const(char)* _user = user.toCString(No.Alloc);
    const(char)* _password = password.toCString(No.Alloc);
    char* _bearerName;
    char* _bearerValue;
    GError *_err;
    _retval = gaflight_client_authenticate_basic_token(cast(GAFlightClient*)cPtr, _user, _password, options ? cast(GAFlightCallOptions*)options.cPtr(No.Dup) : null, &_bearerName, &_bearerValue, &_err);
    if (_err)
      throw new ErrorG(_err);
    bearerName = _bearerName.fromCString(Yes.Free);
    bearerValue = _bearerValue.fromCString(Yes.Free);
    return _retval;
  }

  bool close()
  {
    bool _retval;
    GError *_err;
    _retval = gaflight_client_close(cast(GAFlightClient*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  StreamReader doGet(Ticket ticket, CallOptions options)
  {
    GAFlightStreamReader* _cretval;
    GError *_err;
    _cretval = gaflight_client_do_get(cast(GAFlightClient*)cPtr, ticket ? cast(GAFlightTicket*)ticket.cPtr(No.Dup) : null, options ? cast(GAFlightCallOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!StreamReader(cast(GAFlightStreamReader*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Upload data to a Flight described by the given descriptor. The
   * caller must call [arrow.record_batch_writer.RecordBatchWriter.close] on the
   * returned stream once they are done writing.
   * The reader and writer are linked; closing the writer will also
   * close the reader. Use garrow_flight_stream_writer_done_writing$(LPAREN)$(RPAREN) to
   * only close the write side of the channel.
   * Params:
   *   descriptor = A #GAFlightDescriptor.
   *   schema = A #GArrowSchema.
   *   options = A #GAFlightCallOptions.
   * Returns: The #GAFlighDoPutResult holding a reader and a writer on success,
   *   %NULL on error.
   */
  DoPutResult doPut(Descriptor descriptor, Schema schema, CallOptions options)
  {
    GAFlightDoPutResult* _cretval;
    GError *_err;
    _cretval = gaflight_client_do_put(cast(GAFlightClient*)cPtr, descriptor ? cast(GAFlightDescriptor*)descriptor.cPtr(No.Dup) : null, schema ? cast(GArrowSchema*)schema.cPtr(No.Dup) : null, options ? cast(GAFlightCallOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!DoPutResult(cast(GAFlightDoPutResult*)_cretval, Yes.Take);
    return _retval;
  }

  Info getFlightInfo(Descriptor descriptor, CallOptions options)
  {
    GAFlightInfo* _cretval;
    GError *_err;
    _cretval = gaflight_client_get_flight_info(cast(GAFlightClient*)cPtr, descriptor ? cast(GAFlightDescriptor*)descriptor.cPtr(No.Dup) : null, options ? cast(GAFlightCallOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Info(cast(GAFlightInfo*)_cretval, Yes.Take);
    return _retval;
  }

  Info[] listFlights(Criteria criteria, CallOptions options)
  {
    GList* _cretval;
    GError *_err;
    _cretval = gaflight_client_list_flights(cast(GAFlightClient*)cPtr, criteria ? cast(GAFlightCriteria*)criteria.cPtr(No.Dup) : null, options ? cast(GAFlightCallOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = gListToD!(Info, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }
}
