module ArrowFlight.Server;

import ArrowFlight.Criteria;
import ArrowFlight.DataStream;
import ArrowFlight.Descriptor;
import ArrowFlight.Info;
import ArrowFlight.MessageReader;
import ArrowFlight.MetadataWriter;
import ArrowFlight.Servable;
import ArrowFlight.ServableT;
import ArrowFlight.ServerCallContext;
import ArrowFlight.ServerOptions;
import ArrowFlight.Ticket;
import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class Server : ObjectG, Servable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gaflight_server_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin ServableT!();

  DataStream doGet(ServerCallContext context, Ticket ticket)
  {
    GAFlightDataStream* _cretval;
    GError *_err;
    _cretval = gaflight_server_do_get(cast(GAFlightServer*)cPtr, context ? cast(GAFlightServerCallContext*)context.cPtr(No.Dup) : null, ticket ? cast(GAFlightTicket*)ticket.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!DataStream(cast(GAFlightDataStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Processes a stream of IPC payloads sent from a client.
   * Params:
   *   context = A #GAFlightServerCallContext.
   *   reader = A #GAFlightMessageReader.
   *   writer = A #GAFlightMetadataWriter.
   * Returns: %TRUE on success, %FALSE on error.
   */
  bool doPut(ServerCallContext context, MessageReader reader, MetadataWriter writer)
  {
    bool _retval;
    GError *_err;
    _retval = gaflight_server_do_put(cast(GAFlightServer*)cPtr, context ? cast(GAFlightServerCallContext*)context.cPtr(No.Dup) : null, reader ? cast(GAFlightMessageReader*)reader.cPtr(No.Dup) : null, writer ? cast(GAFlightMetadataWriter*)writer.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  Info getFlightInfo(ServerCallContext context, Descriptor request)
  {
    GAFlightInfo* _cretval;
    GError *_err;
    _cretval = gaflight_server_get_flight_info(cast(GAFlightServer*)cPtr, context ? cast(GAFlightServerCallContext*)context.cPtr(No.Dup) : null, request ? cast(GAFlightDescriptor*)request.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Info(cast(GAFlightInfo*)_cretval, Yes.Take);
    return _retval;
  }

  int getPort()
  {
    int _retval;
    _retval = gaflight_server_get_port(cast(GAFlightServer*)cPtr);
    return _retval;
  }

  Info[] listFlights(ServerCallContext context, Criteria criteria)
  {
    GList* _cretval;
    GError *_err;
    _cretval = gaflight_server_list_flights(cast(GAFlightServer*)cPtr, context ? cast(GAFlightServerCallContext*)context.cPtr(No.Dup) : null, criteria ? cast(GAFlightCriteria*)criteria.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = gListToD!(Info, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  bool listen(ServerOptions options)
  {
    bool _retval;
    GError *_err;
    _retval = gaflight_server_listen(cast(GAFlightServer*)cPtr, options ? cast(GAFlightServerOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Shuts down the serve. This function can be called from signal
   * handler or another thread.
   * Returns: %TRUE on success, %FALSE on error.
   */
  bool shutdown()
  {
    bool _retval;
    GError *_err;
    _retval = gaflight_server_shutdown(cast(GAFlightServer*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  bool wait()
  {
    bool _retval;
    GError *_err;
    _retval = gaflight_server_wait(cast(GAFlightServer*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
