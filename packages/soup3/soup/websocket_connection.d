module soup.websocket_connection;

import gid.gid;
import gio.iostream;
import glib.bytes;
import glib.error;
import glib.uri;
import gobject.dclosure;
import gobject.object;
import soup.c.functions;
import soup.c.types;
import soup.types;
import soup.websocket_extension;

/**
 * The WebSocket Protocol
 * Provides support for the [WebSocket](http://tools.ietf.org/html/rfc6455)
 * protocol.
 * To connect to a WebSocket server, create a class@Session and call
 * [Soup.Session.websocketConnectAsync]. To accept WebSocket
 * connections, create a class@Server and add a handler to it with
 * [Soup.Server.addWebsocketHandler].
 * $(LPAREN)Lower-level support is available via
 * func@websocket_client_prepare_handshake and
 * func@websocket_client_verify_handshake, for handling the client side of the
 * WebSocket handshake, and func@websocket_server_process_handshake for
 * handling the server side.$(RPAREN)
 * #SoupWebsocketConnection handles the details of WebSocket communication. You
 * can use [Soup.WebsocketConnection.sendText] and
 * [Soup.WebsocketConnection.sendBinary] to send data, and the
 * signal@WebsocketConnection::message signal to receive data.
 * $(LPAREN)#SoupWebsocketConnection currently only supports asynchronous I/O.$(RPAREN)
 */
class WebsocketConnection : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_websocket_connection_get_type != &gidSymbolNotFound ? soup_websocket_connection_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Close the connection in an orderly fashion.
   * Note that until the signalWebsocketConnection::closed signal fires, the connection
   * is not yet completely closed. The close message is not even sent until the
   * main loop runs.
   * The code and data are sent to the peer along with the close request.
   * If code is %SOUP_WEBSOCKET_CLOSE_NO_STATUS a close message with no body
   * $(LPAREN)without code and data$(RPAREN) is sent.
   * Note that the data must be UTF-8 valid.
   * Params:
   *   code = close code
   *   data = close data
   */
  void close(ushort code, string data)
  {
    const(char)* _data = data.toCString(No.Alloc);
    soup_websocket_connection_close(cast(SoupWebsocketConnection*)cPtr, code, _data);
  }

  /**
   * Get the close code received from the WebSocket peer.
   * This only becomes valid once the WebSocket is in the
   * %SOUP_WEBSOCKET_STATE_CLOSED state. The value will often be in the
   * enumWebsocketCloseCode enumeration, but may also be an application
   * defined close code.
   * Returns: the close code or zero.
   */
  ushort getCloseCode()
  {
    ushort _retval;
    _retval = soup_websocket_connection_get_close_code(cast(SoupWebsocketConnection*)cPtr);
    return _retval;
  }

  /**
   * Get the close data received from the WebSocket peer.
   * This only becomes valid once the WebSocket is in the
   * %SOUP_WEBSOCKET_STATE_CLOSED state. The data may be freed once
   * the main loop is run, so copy it if you need to keep it around.
   * Returns: the close data or %NULL
   */
  string getCloseData()
  {
    const(char)* _cretval;
    _cretval = soup_websocket_connection_get_close_data(cast(SoupWebsocketConnection*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Get the connection type $(LPAREN)client/server$(RPAREN) of the connection.
   * Returns: the connection type
   */
  WebsocketConnectionType getConnectionType()
  {
    SoupWebsocketConnectionType _cretval;
    _cretval = soup_websocket_connection_get_connection_type(cast(SoupWebsocketConnection*)cPtr);
    WebsocketConnectionType _retval = cast(WebsocketConnectionType)_cretval;
    return _retval;
  }

  /**
   * Get the extensions chosen via negotiation with the peer.
   * Returns: a #GList of #SoupWebsocketExtension objects
   */
  WebsocketExtension[] getExtensions()
  {
    GList* _cretval;
    _cretval = soup_websocket_connection_get_extensions(cast(SoupWebsocketConnection*)cPtr);
    auto _retval = gListToD!(WebsocketExtension, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /**
   * Get the I/O stream the WebSocket is communicating over.
   * Returns: the WebSocket's I/O stream.
   */
  IOStream getIoStream()
  {
    GIOStream* _cretval;
    _cretval = soup_websocket_connection_get_io_stream(cast(SoupWebsocketConnection*)cPtr);
    auto _retval = ObjectG.getDObject!IOStream(cast(GIOStream*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the keepalive interval in seconds or 0 if disabled.
   * Returns: the keepalive interval.
   */
  uint getKeepaliveInterval()
  {
    uint _retval;
    _retval = soup_websocket_connection_get_keepalive_interval(cast(SoupWebsocketConnection*)cPtr);
    return _retval;
  }

  /**
   * Gets the maximum payload size allowed for incoming packets.
   * Returns: the maximum payload size.
   */
  ulong getMaxIncomingPayloadSize()
  {
    ulong _retval;
    _retval = soup_websocket_connection_get_max_incoming_payload_size(cast(SoupWebsocketConnection*)cPtr);
    return _retval;
  }

  /**
   * Get the origin of the WebSocket.
   * Returns: the origin
   */
  string getOrigin()
  {
    const(char)* _cretval;
    _cretval = soup_websocket_connection_get_origin(cast(SoupWebsocketConnection*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Get the protocol chosen via negotiation with the peer.
   * Returns: the chosen protocol
   */
  string getProtocol()
  {
    const(char)* _cretval;
    _cretval = soup_websocket_connection_get_protocol(cast(SoupWebsocketConnection*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Get the current state of the WebSocket.
   * Returns: the state
   */
  WebsocketState getState()
  {
    SoupWebsocketState _cretval;
    _cretval = soup_websocket_connection_get_state(cast(SoupWebsocketConnection*)cPtr);
    WebsocketState _retval = cast(WebsocketState)_cretval;
    return _retval;
  }

  /**
   * Get the URI of the WebSocket.
   * For servers this represents the address of the WebSocket, and
   * for clients it is the address connected to.
   * Returns: the URI
   */
  Uri getUri()
  {
    GUri* _cretval;
    _cretval = soup_websocket_connection_get_uri(cast(SoupWebsocketConnection*)cPtr);
    auto _retval = _cretval ? new Uri(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Send a binary message to the peer.
   * If length is 0, data may be %NULL.
   * The message is queued to be sent and will be sent when the main loop
   * is run.
   * Params:
   *   data = the message contents
   */
  void sendBinary(ubyte[] data)
  {
    size_t _length;
    if (data)
      _length = cast(size_t)data.length;

    auto _data = cast(const(void)*)data.ptr;
    soup_websocket_connection_send_binary(cast(SoupWebsocketConnection*)cPtr, _data, _length);
  }

  /**
   * Send a message of the given type to the peer. Note that this method,
   * allows to send text messages containing %NULL characters.
   * The message is queued to be sent and will be sent when the main loop
   * is run.
   * Params:
   *   type = the type of message contents
   *   message = the message data as #GBytes
   */
  void sendMessage(WebsocketDataType type, Bytes message)
  {
    soup_websocket_connection_send_message(cast(SoupWebsocketConnection*)cPtr, type, message ? cast(GBytes*)message.cPtr(No.Dup) : null);
  }

  /**
   * Send a %NULL-terminated text $(LPAREN)UTF-8$(RPAREN) message to the peer.
   * If you need to send text messages containing %NULL characters use
   * [Soup.WebsocketConnection.sendMessage] instead.
   * The message is queued to be sent and will be sent when the main loop
   * is run.
   * Params:
   *   text = the message contents
   */
  void sendText(string text)
  {
    const(char)* _text = text.toCString(No.Alloc);
    soup_websocket_connection_send_text(cast(SoupWebsocketConnection*)cPtr, _text);
  }

  /**
   * Sets the interval in seconds on when to send a ping message which will serve
   * as a keepalive message.
   * If set to 0 the keepalive message is disabled.
   * Params:
   *   interval = the interval to send a ping message or 0 to disable it
   */
  void setKeepaliveInterval(uint interval)
  {
    soup_websocket_connection_set_keepalive_interval(cast(SoupWebsocketConnection*)cPtr, interval);
  }

  /**
   * Sets the maximum payload size allowed for incoming packets.
   * It does not limit the outgoing packet size.
   * Params:
   *   maxIncomingPayloadSize = the maximum payload size
   */
  void setMaxIncomingPayloadSize(ulong maxIncomingPayloadSize)
  {
    soup_websocket_connection_set_max_incoming_payload_size(cast(SoupWebsocketConnection*)cPtr, maxIncomingPayloadSize);
  }

  /**
   * Emitted when the connection has completely closed.
   * This happens either due to an orderly close from the peer, one
   * initiated via [Soup.WebsocketConnection.close] or a fatal error
   * condition that caused a close.
   * This signal will be emitted once.
   *   websocketConnection = the instance the signal is connected to
   */
  alias ClosedCallbackDlg = void delegate(WebsocketConnection websocketConnection);
  alias ClosedCallbackFunc = void function(WebsocketConnection websocketConnection);

  /**
   * Connect to Closed signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectClosed(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ClosedCallbackDlg) || is(T : ClosedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto websocketConnection = getVal!WebsocketConnection(_paramVals);
      _dClosure.dlg(websocketConnection);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("closed", closure, after);
  }

  /**
   * This signal will be emitted during an orderly close.
   *   websocketConnection = the instance the signal is connected to
   */
  alias ClosingCallbackDlg = void delegate(WebsocketConnection websocketConnection);
  alias ClosingCallbackFunc = void function(WebsocketConnection websocketConnection);

  /**
   * Connect to Closing signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectClosing(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ClosingCallbackDlg) || is(T : ClosingCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto websocketConnection = getVal!WebsocketConnection(_paramVals);
      _dClosure.dlg(websocketConnection);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("closing", closure, after);
  }

  /**
   * Emitted when an error occurred on the WebSocket.
   * This may be fired multiple times. Fatal errors will be followed by
   * the signalWebsocketConnection::closed signal being emitted.
   * Params
   *   error = the error that occured
   *   websocketConnection = the instance the signal is connected to
   */
  alias ErrorCallbackDlg = void delegate(ErrorG error, WebsocketConnection websocketConnection);
  alias ErrorCallbackFunc = void function(ErrorG error, WebsocketConnection websocketConnection);

  /**
   * Connect to Error signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectError(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ErrorCallbackDlg) || is(T : ErrorCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto websocketConnection = getVal!WebsocketConnection(_paramVals);
      auto error = getVal!ErrorG(&_paramVals[1]);
      _dClosure.dlg(error, websocketConnection);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("error", closure, after);
  }

  /**
   * Emitted when we receive a message from the peer.
   * As a convenience, the message data will always be
   * %NULL-terminated, but the NUL byte will not be included in
   * the length count.
   * Params
   *   type = the type of message contents
   *   message = the message data
   *   websocketConnection = the instance the signal is connected to
   */
  alias MessageCallbackDlg = void delegate(int type, Bytes message, WebsocketConnection websocketConnection);
  alias MessageCallbackFunc = void function(int type, Bytes message, WebsocketConnection websocketConnection);

  /**
   * Connect to Message signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectMessage(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MessageCallbackDlg) || is(T : MessageCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto websocketConnection = getVal!WebsocketConnection(_paramVals);
      auto type = getVal!int(&_paramVals[1]);
      auto message = getVal!Bytes(&_paramVals[2]);
      _dClosure.dlg(type, message, websocketConnection);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("message", closure, after);
  }

  /**
   * Emitted when we receive a Pong frame $(LPAREN)solicited or
   * unsolicited$(RPAREN) from the peer.
   * As a convenience, the message data will always be
   * %NULL-terminated, but the NUL byte will not be included in
   * the length count.
   * Params
   *   message = the application data $(LPAREN)if any$(RPAREN)
   *   websocketConnection = the instance the signal is connected to
   */
  alias PongCallbackDlg = void delegate(Bytes message, WebsocketConnection websocketConnection);
  alias PongCallbackFunc = void function(Bytes message, WebsocketConnection websocketConnection);

  /**
   * Connect to Pong signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectPong(T)(T callback, Flag!"After" after = No.After)
  if (is(T : PongCallbackDlg) || is(T : PongCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto websocketConnection = getVal!WebsocketConnection(_paramVals);
      auto message = getVal!Bytes(&_paramVals[1]);
      _dClosure.dlg(message, websocketConnection);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("pong", closure, after);
  }
}
