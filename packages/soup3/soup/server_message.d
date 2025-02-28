module soup.server_message;

import gid.gid;
import gio.iostream;
import gio.socket;
import gio.socket_address;
import gio.tls_certificate;
import gio.types;
import glib.bytes;
import glib.uri;
import gobject.dclosure;
import gobject.object;
import soup.c.functions;
import soup.c.types;
import soup.message_body;
import soup.message_headers;
import soup.types;

/**
 * An HTTP server request and response pair.
 * A SoupServerMessage represents an HTTP message that is being sent or
 * received on a class@Server.
 * class@Server will create `SoupServerMessage`s automatically for
 * incoming requests, which your application will receive via handlers.
 * Note that libsoup's terminology here does not quite match the HTTP
 * specification: in RFC 2616, an "HTTP-message" is *either* a Request, *or* a
 * Response. In libsoup, a #SoupServerMessage combines both the request and the
 * response.
 */
class ServerMessage : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_server_message_get_type != &gidSymbolNotFound ? soup_server_message_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Get the HTTP version of msg.
   * Returns: a #SoupHTTPVersion.
   */
  HTTPVersion getHttpVersion()
  {
    SoupHTTPVersion _cretval;
    _cretval = soup_server_message_get_http_version(cast(SoupServerMessage*)cPtr);
    HTTPVersion _retval = cast(HTTPVersion)_cretval;
    return _retval;
  }

  /**
   * Retrieves the [Gio.SocketAddress] associated with the local end
   * of a connection.
   * Returns: the #GSocketAddress
   *   associated with the local end of a connection, it may be
   *   %NULL if you used [Soup.Server.acceptIostream].
   */
  SocketAddress getLocalAddress()
  {
    GSocketAddress* _cretval;
    _cretval = soup_server_message_get_local_address(cast(SoupServerMessage*)cPtr);
    auto _retval = ObjectG.getDObject!SocketAddress(cast(GSocketAddress*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Get the HTTP method of msg.
   * Returns: the HTTP method.
   */
  string getMethod()
  {
    const(char)* _cretval;
    _cretval = soup_server_message_get_method(cast(SoupServerMessage*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Get the HTTP reason phrase of msg.
   * Returns: the reason phrase.
   */
  string getReasonPhrase()
  {
    const(char)* _cretval;
    _cretval = soup_server_message_get_reason_phrase(cast(SoupServerMessage*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Retrieves the [Gio.SocketAddress] associated with the remote end
   * of a connection.
   * Returns: the #GSocketAddress
   *   associated with the remote end of a connection, it may be
   *   %NULL if you used classServer.accept_iostream.
   */
  SocketAddress getRemoteAddress()
  {
    GSocketAddress* _cretval;
    _cretval = soup_server_message_get_remote_address(cast(SoupServerMessage*)cPtr);
    auto _retval = ObjectG.getDObject!SocketAddress(cast(GSocketAddress*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Retrieves the IP address associated with the remote end of a
   * connection.
   * Returns: the IP address associated with the remote
   *   end of a connection, it may be %NULL if you used
   *   [Soup.Server.acceptIostream].
   */
  string getRemoteHost()
  {
    const(char)* _cretval;
    _cretval = soup_server_message_get_remote_host(cast(SoupServerMessage*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Get the request body of msg.
   * Returns: a #SoupMessageBody.
   */
  MessageBody getRequestBody()
  {
    SoupMessageBody* _cretval;
    _cretval = soup_server_message_get_request_body(cast(SoupServerMessage*)cPtr);
    auto _retval = _cretval ? new MessageBody(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Get the request headers of msg.
   * Returns: a #SoupMessageHeaders with the request headers.
   */
  MessageHeaders getRequestHeaders()
  {
    SoupMessageHeaders* _cretval;
    _cretval = soup_server_message_get_request_headers(cast(SoupServerMessage*)cPtr);
    auto _retval = _cretval ? new MessageHeaders(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Get the response body of msg.
   * Returns: a #SoupMessageBody.
   */
  MessageBody getResponseBody()
  {
    SoupMessageBody* _cretval;
    _cretval = soup_server_message_get_response_body(cast(SoupServerMessage*)cPtr);
    auto _retval = _cretval ? new MessageBody(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Get the response headers of msg.
   * Returns: a #SoupMessageHeaders with the response headers.
   */
  MessageHeaders getResponseHeaders()
  {
    SoupMessageHeaders* _cretval;
    _cretval = soup_server_message_get_response_headers(cast(SoupServerMessage*)cPtr);
    auto _retval = _cretval ? new MessageHeaders(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Retrieves the [Gio.Socket] that msg is associated with.
   * If you are using this method to observe when multiple requests are
   * made on the same persistent HTTP connection $(LPAREN)eg, as the ntlm-test
   * test program does$(RPAREN), you will need to pay attention to socket
   * destruction as well $(LPAREN)eg, by using weak references$(RPAREN), so that you do
   * not get fooled when the allocator reuses the memory address of a
   * previously-destroyed socket to represent a new socket.
   * Returns: the #GSocket that msg is
   *   associated with, %NULL if you used [Soup.Server.acceptIostream].
   */
  Socket getSocket()
  {
    GSocket* _cretval;
    _cretval = soup_server_message_get_socket(cast(SoupServerMessage*)cPtr);
    auto _retval = ObjectG.getDObject!Socket(cast(GSocket*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Get the HTTP status code of msg.
   * Returns: the HTTP status code.
   */
  uint getStatus()
  {
    uint _retval;
    _retval = soup_server_message_get_status(cast(SoupServerMessage*)cPtr);
    return _retval;
  }

  /**
   * Gets the peer's #GTlsCertificate associated with msg's connection.
   * Note that this is not set yet during the emission of
   * SoupServerMessage::accept-certificate signal.
   * Returns: msg's TLS peer certificate,
   *   or %NULL if msg's connection is not SSL.
   */
  TlsCertificate getTlsPeerCertificate()
  {
    GTlsCertificate* _cretval;
    _cretval = soup_server_message_get_tls_peer_certificate(cast(SoupServerMessage*)cPtr);
    auto _retval = ObjectG.getDObject!TlsCertificate(cast(GTlsCertificate*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the errors associated with validating msg's TLS peer certificate.
   * Note that this is not set yet during the emission of
   * SoupServerMessage::accept-certificate signal.
   * Returns: a #GTlsCertificateFlags with msg's TLS peer certificate errors.
   */
  TlsCertificateFlags getTlsPeerCertificateErrors()
  {
    GTlsCertificateFlags _cretval;
    _cretval = soup_server_message_get_tls_peer_certificate_errors(cast(SoupServerMessage*)cPtr);
    TlsCertificateFlags _retval = cast(TlsCertificateFlags)_cretval;
    return _retval;
  }

  /**
   * Get msg's URI.
   * Returns: a #GUri
   */
  Uri getUri()
  {
    GUri* _cretval;
    _cretval = soup_server_message_get_uri(cast(SoupServerMessage*)cPtr);
    auto _retval = _cretval ? new Uri(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Gets if msg represents an OPTIONS message with the path `*`.
   * Returns: %TRUE if is an OPTIONS ping
   */
  bool isOptionsPing()
  {
    bool _retval;
    _retval = soup_server_message_is_options_ping(cast(SoupServerMessage*)cPtr);
    return _retval;
  }

  /**
   * Pauses I/O on msg.
   * This can be used when you need to return from the server handler without
   * having the full response ready yet. Use [Soup.ServerMessage.unpause] to
   * resume I/O.
   */
  void pause()
  {
    soup_server_message_pause(cast(SoupServerMessage*)cPtr);
  }

  /**
   * Set the HTTP version of msg.
   * Params:
   *   version_ = a #SoupHTTPVersion
   */
  void setHttpVersion(HTTPVersion version_)
  {
    soup_server_message_set_http_version(cast(SoupServerMessage*)cPtr, version_);
  }

  /**
   * Sets msg's status_code to status_code and adds a Location header
   * pointing to redirect_uri. Use this from a classServer when you
   * want to redirect the client to another URI.
   * redirect_uri can be a relative URI, in which case it is
   * interpreted relative to msg's current URI. In particular, if
   * redirect_uri is just a path, it will replace the path
   * *and query* of msg's URI.
   * Params:
   *   statusCode = a 3xx status code
   *   redirectUri = the URI to redirect msg to
   */
  void setRedirect(uint statusCode, string redirectUri)
  {
    const(char)* _redirectUri = redirectUri.toCString(No.Alloc);
    soup_server_message_set_redirect(cast(SoupServerMessage*)cPtr, statusCode, _redirectUri);
  }

  /**
   * Convenience function to set the response body of a #SoupServerMessage. If
   * content_type is %NULL, the response body must be empty as well.
   * Params:
   *   contentType = MIME Content-Type of the body
   *   respUse = a #SoupMemoryUse describing how to handle resp_body
   *   respBody = a data buffer containing the body of the message response.
   */
  void setResponse(string contentType, MemoryUse respUse, ubyte[] respBody)
  {
    const(char)* _contentType = contentType.toCString(No.Alloc);
    size_t _respLength;
    if (respBody)
      _respLength = cast(size_t)respBody.length;

    auto _respBody = cast(const(ubyte)*)respBody.ptr;
    soup_server_message_set_response(cast(SoupServerMessage*)cPtr, _contentType, respUse, _respBody, _respLength);
  }

  /**
   * Sets msg's status code to status_code.
   * If status_code is a known value and reason_phrase is %NULL, the
   * reason_phrase will be set automatically.
   * Params:
   *   statusCode = an HTTP status code
   *   reasonPhrase = a reason phrase
   */
  void setStatus(uint statusCode, string reasonPhrase)
  {
    const(char)* _reasonPhrase = reasonPhrase.toCString(No.Alloc);
    soup_server_message_set_status(cast(SoupServerMessage*)cPtr, statusCode, _reasonPhrase);
  }

  /**
   * "Steals" the HTTP connection associated with msg from its #SoupServer. This
   * happens immediately, regardless of the current state of the connection; if
   * the response to msg has not yet finished being sent, then it will be
   * discarded; you can steal the connection from a
   * signalServerMessage::wrote-informational or
   * signalServerMessage::wrote-body signal handler if you need to wait for
   * part or all of the response to be sent.
   * Note that when calling this function from C, msg will most
   * likely be freed as a side effect.
   * Returns: the #GIOStream formerly associated
   *   with msg $(LPAREN)or %NULL if msg was no longer associated with a
   *   connection$(RPAREN). No guarantees are made about what kind of #GIOStream
   *   is returned.
   */
  IOStream stealConnection()
  {
    GIOStream* _cretval;
    _cretval = soup_server_message_steal_connection(cast(SoupServerMessage*)cPtr);
    auto _retval = ObjectG.getDObject!IOStream(cast(GIOStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Resumes I/O on msg.
   * Use this to resume after calling [Soup.ServerMessage.pause], or after
   * adding a new chunk to a chunked response. I/O won't actually resume until you
   * return to the main loop.
   */
  void unpause()
  {
    soup_server_message_unpause(cast(SoupServerMessage*)cPtr);
  }

  /**
   * Emitted during the msg's connection TLS handshake
   * after client TLS certificate has been received.
   * You can return %TRUE to accept tls_certificate despite
   * tls_errors.
   * Params
   *   tlsPeerCertificate = the peer's #GTlsCertificate
   *   tlsPeerErrors = the tls errors of tls_certificate
   *   serverMessage = the instance the signal is connected to
   * Returns: %TRUE to accept the TLS certificate and stop other
   *   handlers from being invoked, or %FALSE to propagate the
   *   event further.
   */
  alias AcceptCertificateCallbackDlg = bool delegate(TlsCertificate tlsPeerCertificate, TlsCertificateFlags tlsPeerErrors, ServerMessage serverMessage);
  alias AcceptCertificateCallbackFunc = bool function(TlsCertificate tlsPeerCertificate, TlsCertificateFlags tlsPeerErrors, ServerMessage serverMessage);

  /**
   * Connect to AcceptCertificate signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectAcceptCertificate(T)(T callback, Flag!"After" after = No.After)
  if (is(T : AcceptCertificateCallbackDlg) || is(T : AcceptCertificateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto serverMessage = getVal!ServerMessage(_paramVals);
      auto tlsPeerCertificate = getVal!TlsCertificate(&_paramVals[1]);
      auto tlsPeerErrors = getVal!TlsCertificateFlags(&_paramVals[2]);
      _retval = _dClosure.dlg(tlsPeerCertificate, tlsPeerErrors, serverMessage);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("accept-certificate", closure, after);
  }

  /**
   * Emitted when the msg's socket is connected and the TLS handshake completed.
   *   serverMessage = the instance the signal is connected to
   */
  alias ConnectedCallbackDlg = void delegate(ServerMessage serverMessage);
  alias ConnectedCallbackFunc = void function(ServerMessage serverMessage);

  /**
   * Connect to Connected signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectConnected(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ConnectedCallbackDlg) || is(T : ConnectedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto serverMessage = getVal!ServerMessage(_paramVals);
      _dClosure.dlg(serverMessage);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("connected", closure, after);
  }

  /**
   * Emitted when the msg's socket is disconnected.
   *   serverMessage = the instance the signal is connected to
   */
  alias DisconnectedCallbackDlg = void delegate(ServerMessage serverMessage);
  alias DisconnectedCallbackFunc = void function(ServerMessage serverMessage);

  /**
   * Connect to Disconnected signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectDisconnected(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DisconnectedCallbackDlg) || is(T : DisconnectedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto serverMessage = getVal!ServerMessage(_paramVals);
      _dClosure.dlg(serverMessage);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("disconnected", closure, after);
  }

  /**
   * Emitted when all HTTP processing is finished for a message.
   * $(LPAREN)After signalServerMessage::wrote-body$(RPAREN).
   *   serverMessage = the instance the signal is connected to
   */
  alias FinishedCallbackDlg = void delegate(ServerMessage serverMessage);
  alias FinishedCallbackFunc = void function(ServerMessage serverMessage);

  /**
   * Connect to Finished signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectFinished(T)(T callback, Flag!"After" after = No.After)
  if (is(T : FinishedCallbackDlg) || is(T : FinishedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto serverMessage = getVal!ServerMessage(_paramVals);
      _dClosure.dlg(serverMessage);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("finished", closure, after);
  }

  /**
   * Emitted after receiving the complete request body.
   *   serverMessage = the instance the signal is connected to
   */
  alias GotBodyCallbackDlg = void delegate(ServerMessage serverMessage);
  alias GotBodyCallbackFunc = void function(ServerMessage serverMessage);

  /**
   * Connect to GotBody signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectGotBody(T)(T callback, Flag!"After" after = No.After)
  if (is(T : GotBodyCallbackDlg) || is(T : GotBodyCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto serverMessage = getVal!ServerMessage(_paramVals);
      _dClosure.dlg(serverMessage);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("got-body", closure, after);
  }

  /**
   * Emitted after receiving a chunk of a message body.
   * Note that "chunk" in this context means any subpiece of the body, not
   * necessarily the specific HTTP 1.1 chunks sent by the other side.
   * Params
   *   chunk = the just-read chunk
   *   serverMessage = the instance the signal is connected to
   */
  alias GotChunkCallbackDlg = void delegate(Bytes chunk, ServerMessage serverMessage);
  alias GotChunkCallbackFunc = void function(Bytes chunk, ServerMessage serverMessage);

  /**
   * Connect to GotChunk signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectGotChunk(T)(T callback, Flag!"After" after = No.After)
  if (is(T : GotChunkCallbackDlg) || is(T : GotChunkCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto serverMessage = getVal!ServerMessage(_paramVals);
      auto chunk = getVal!Bytes(&_paramVals[1]);
      _dClosure.dlg(chunk, serverMessage);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("got-chunk", closure, after);
  }

  /**
   * Emitted after receiving the Request-Line and request headers.
   *   serverMessage = the instance the signal is connected to
   */
  alias GotHeadersCallbackDlg = void delegate(ServerMessage serverMessage);
  alias GotHeadersCallbackFunc = void function(ServerMessage serverMessage);

  /**
   * Connect to GotHeaders signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectGotHeaders(T)(T callback, Flag!"After" after = No.After)
  if (is(T : GotHeadersCallbackDlg) || is(T : GotHeadersCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto serverMessage = getVal!ServerMessage(_paramVals);
      _dClosure.dlg(serverMessage);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("got-headers", closure, after);
  }

  /**
   * Emitted immediately after writing the complete response body for a
   * message.
   *   serverMessage = the instance the signal is connected to
   */
  alias WroteBodyCallbackDlg = void delegate(ServerMessage serverMessage);
  alias WroteBodyCallbackFunc = void function(ServerMessage serverMessage);

  /**
   * Connect to WroteBody signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectWroteBody(T)(T callback, Flag!"After" after = No.After)
  if (is(T : WroteBodyCallbackDlg) || is(T : WroteBodyCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto serverMessage = getVal!ServerMessage(_paramVals);
      _dClosure.dlg(serverMessage);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("wrote-body", closure, after);
  }

  /**
   * Emitted immediately after writing a portion of the message
   * body to the network.
   * Params
   *   chunkSize = the number of bytes written
   *   serverMessage = the instance the signal is connected to
   */
  alias WroteBodyDataCallbackDlg = void delegate(uint chunkSize, ServerMessage serverMessage);
  alias WroteBodyDataCallbackFunc = void function(uint chunkSize, ServerMessage serverMessage);

  /**
   * Connect to WroteBodyData signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectWroteBodyData(T)(T callback, Flag!"After" after = No.After)
  if (is(T : WroteBodyDataCallbackDlg) || is(T : WroteBodyDataCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto serverMessage = getVal!ServerMessage(_paramVals);
      auto chunkSize = getVal!uint(&_paramVals[1]);
      _dClosure.dlg(chunkSize, serverMessage);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("wrote-body-data", closure, after);
  }

  /**
   * Emitted immediately after writing a body chunk for a message.
   * Note that this signal is not parallel to
   * signalServerMessage::got-chunk; it is emitted only when a complete
   * chunk $(LPAREN)added with [Soup.MessageBody.append] or
   * [Soup.MessageBody.appendBytes] has been written. To get
   * more useful continuous progress information, use
   * signalServerMessage::wrote-body-data.
   *   serverMessage = the instance the signal is connected to
   */
  alias WroteChunkCallbackDlg = void delegate(ServerMessage serverMessage);
  alias WroteChunkCallbackFunc = void function(ServerMessage serverMessage);

  /**
   * Connect to WroteChunk signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectWroteChunk(T)(T callback, Flag!"After" after = No.After)
  if (is(T : WroteChunkCallbackDlg) || is(T : WroteChunkCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto serverMessage = getVal!ServerMessage(_paramVals);
      _dClosure.dlg(serverMessage);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("wrote-chunk", closure, after);
  }

  /**
   * Emitted immediately after writing the response headers for a
   * message.
   *   serverMessage = the instance the signal is connected to
   */
  alias WroteHeadersCallbackDlg = void delegate(ServerMessage serverMessage);
  alias WroteHeadersCallbackFunc = void function(ServerMessage serverMessage);

  /**
   * Connect to WroteHeaders signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectWroteHeaders(T)(T callback, Flag!"After" after = No.After)
  if (is(T : WroteHeadersCallbackDlg) || is(T : WroteHeadersCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto serverMessage = getVal!ServerMessage(_paramVals);
      _dClosure.dlg(serverMessage);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("wrote-headers", closure, after);
  }

  /**
   * Emitted immediately after writing a 1xx $(LPAREN)Informational$(RPAREN) response.
   *   serverMessage = the instance the signal is connected to
   */
  alias WroteInformationalCallbackDlg = void delegate(ServerMessage serverMessage);
  alias WroteInformationalCallbackFunc = void function(ServerMessage serverMessage);

  /**
   * Connect to WroteInformational signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectWroteInformational(T)(T callback, Flag!"After" after = No.After)
  if (is(T : WroteInformationalCallbackDlg) || is(T : WroteInformationalCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto serverMessage = getVal!ServerMessage(_paramVals);
      _dClosure.dlg(serverMessage);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("wrote-informational", closure, after);
  }
}
