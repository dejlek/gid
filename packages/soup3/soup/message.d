module soup.message;

import gid.gid;
import gio.input_stream;
import gio.iostream;
import gio.socket_address;
import gio.tls_certificate;
import gio.tls_client_connection;
import gio.tls_password;
import gio.types;
import glib.bytes;
import glib.uri;
import gobject.dclosure;
import gobject.object;
import gobject.types;
import soup.auth;
import soup.c.functions;
import soup.c.types;
import soup.message_headers;
import soup.message_metrics;
import soup.multipart;
import soup.types;

/**
 * Represents an HTTP message being sent or received.
 * A #SoupMessage represents an HTTP message that is being sent or
 * received.
 * You would create a #SoupMessage with [soup.message.Message.new_] or
 * [soup.message.Message.newFromUri], set up its fields appropriately, and send it.
 * property@Message:status-code will normally be a enum@Status value, eg,
 * %SOUP_STATUS_OK, though of course it might actually be an unknown status
 * code. property@Message:reason-phrase is the actual text returned from the
 * server, which may or may not correspond to the "standard" description of
 * @status_code. At any rate, it is almost certainly not localized, and not very
 * descriptive even if it is in the user's language; you should not use
 * property@Message:reason-phrase in user-visible messages. Rather, you should
 * look at property@Message:status-code, and determine an end-user-appropriate
 * message based on that and on what you were trying to do.
 * Note that libsoup's terminology here does not quite match the HTTP
 * specification: in RFC 2616, an "HTTP-message" is *either* a Request, *or* a
 * Response. In libsoup, a #SoupMessage combines both the request and the
 * response.
 */
class Message : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_message_get_type != &gidSymbolNotFound ? soup_message_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new empty #SoupMessage, which will connect to uri.
   * Params:
   *   method = the HTTP method for the created request
   *   uriString = the destination endpoint $(LPAREN)as a string$(RPAREN)
   * Returns: the new #SoupMessage $(LPAREN)or %NULL if uri
   *   could not be parsed$(RPAREN).
   */
  this(string method, string uriString)
  {
    SoupMessage* _cretval;
    const(char)* _method = method.toCString(No.Alloc);
    const(char)* _uriString = uriString.toCString(No.Alloc);
    _cretval = soup_message_new(_method, _uriString);
    this(_cretval, Yes.Take);
  }

  /**
   * Creates a new #SoupMessage and sets it up to send the given encoded_form
   * to uri via method. If method is "GET", it will include the form data
   * into uri's query field, and if method is "POST" or "PUT", it will be set as
   * request body.
   * This function takes the ownership of encoded_form, that will be released
   * with funcGLib.free when no longer in use. See also funcform_encode,
   * funcform_encode_hash and funcform_encode_datalist.
   * Params:
   *   method = the HTTP method for the created request $(LPAREN)GET, POST or PUT$(RPAREN)
   *   uriString = the destination endpoint $(LPAREN)as a string$(RPAREN)
   *   encodedForm = a encoded form
   * Returns: the new #SoupMessage, or %NULL if
   *   uri_string could not be parsed or method is not "GET, "POST" or "PUT"
   */
  static soup.message.Message newFromEncodedForm(string method, string uriString, string encodedForm)
  {
    SoupMessage* _cretval;
    const(char)* _method = method.toCString(No.Alloc);
    const(char)* _uriString = uriString.toCString(No.Alloc);
    char* _encodedForm = encodedForm.toCString(Yes.Alloc);
    _cretval = soup_message_new_from_encoded_form(_method, _uriString, _encodedForm);
    auto _retval = ObjectG.getDObject!(soup.message.Message)(cast(SoupMessage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Creates a new #SoupMessage and sets it up to send multipart to
   * uri_string via POST.
   * Params:
   *   uriString = the destination endpoint
   *   multipart = a #SoupMultipart
   * Returns: the new #SoupMessage, or %NULL if uri_string
   *   could not be parsed
   */
  static soup.message.Message newFromMultipart(string uriString, soup.multipart.Multipart multipart)
  {
    SoupMessage* _cretval;
    const(char)* _uriString = uriString.toCString(No.Alloc);
    _cretval = soup_message_new_from_multipart(_uriString, multipart ? cast(SoupMultipart*)multipart.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(soup.message.Message)(cast(SoupMessage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Creates a new empty #SoupMessage, which will connect to uri.
   * Params:
   *   method = the HTTP method for the created request
   *   uri = the destination endpoint
   * Returns: the new #SoupMessage
   */
  static soup.message.Message newFromUri(string method, glib.uri.Uri uri)
  {
    SoupMessage* _cretval;
    const(char)* _method = method.toCString(No.Alloc);
    _cretval = soup_message_new_from_uri(_method, uri ? cast(GUri*)uri.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(soup.message.Message)(cast(SoupMessage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Creates a new #SoupMessage to send `OPTIONS *` to a server. The path of
   * base_uri will be ignored.
   * Params:
   *   baseUri = the destination endpoint
   * Returns: the new #SoupMessage
   */
  static soup.message.Message newOptionsPing(glib.uri.Uri baseUri)
  {
    SoupMessage* _cretval;
    _cretval = soup_message_new_options_ping(baseUri ? cast(GUri*)baseUri.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(soup.message.Message)(cast(SoupMessage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Adds flags to the set of msg's flags.
   * Params:
   *   flags = a set of #SoupMessageFlags values
   */
  void addFlags(soup.types.MessageFlags flags)
  {
    soup_message_add_flags(cast(SoupMessage*)cPtr, flags);
  }

  /**
   * Disables the actions of ifaceSessionFeatures with the
   * given feature_type $(LPAREN)or a subclass of that type$(RPAREN) on msg.
   * msg is processed as though the feature$(LPAREN)s$(RPAREN) hadn't been added to the
   * session. Eg, passing #SOUP_TYPE_CONTENT_SNIFFER for feature_type
   * will disable Content-Type sniffing on the message.
   * You must call this before queueing msg on a session; calling it on
   * a message that has already been queued is undefined. In particular,
   * you cannot call this on a message that is being requeued after a
   * redirect or authentication.
   * Params:
   *   featureType = the #GType of a #SoupSessionFeature
   */
  void disableFeature(gobject.types.GType featureType)
  {
    soup_message_disable_feature(cast(SoupMessage*)cPtr, featureType);
  }

  /**
   * Returns the unique idenfier for the last connection used.
   * This may be 0 if it was a cached resource or it has not gotten
   * a connection yet.
   * Returns: An id or 0 if no connection.
   */
  ulong getConnectionId()
  {
    ulong _retval;
    _retval = soup_message_get_connection_id(cast(SoupMessage*)cPtr);
    return _retval;
  }

  /**
   * Gets msg's first-party [glib.uri.Uri].
   * Returns: the msg's first party #GUri
   */
  glib.uri.Uri getFirstParty()
  {
    GUri* _cretval;
    _cretval = soup_message_get_first_party(cast(SoupMessage*)cPtr);
    auto _retval = _cretval ? new glib.uri.Uri(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Gets the flags on msg.
   * Returns: the flags
   */
  soup.types.MessageFlags getFlags()
  {
    SoupMessageFlags _cretval;
    _cretval = soup_message_get_flags(cast(SoupMessage*)cPtr);
    soup.types.MessageFlags _retval = cast(soup.types.MessageFlags)_cretval;
    return _retval;
  }

  /**
   * Returns whether HTTP/1 version is currently demanded for the msg send.
   * Returns: %TRUE, when HTTP/1 is demanded, %FALSE otherwise.
   */
  bool getForceHttp1()
  {
    bool _retval;
    _retval = soup_message_get_force_http1(cast(SoupMessage*)cPtr);
    return _retval;
  }

  /**
   * Gets the HTTP version of msg.
   * This is the minimum of the version from the request and the version from the
   * response.
   * Returns: the HTTP version
   */
  soup.types.HTTPVersion getHttpVersion()
  {
    SoupHTTPVersion _cretval;
    _cretval = soup_message_get_http_version(cast(SoupMessage*)cPtr);
    soup.types.HTTPVersion _retval = cast(soup.types.HTTPVersion)_cretval;
    return _retval;
  }

  /**
   * Gets whether msg is intended to be used to send `OPTIONS *` to a server.
   * Returns: %TRUE if the message is options ping, or %FALSE otherwise
   */
  bool getIsOptionsPing()
  {
    bool _retval;
    _retval = soup_message_get_is_options_ping(cast(SoupMessage*)cPtr);
    return _retval;
  }

  /**
   * Returns if this message is set as a top level navigation.
   * Used for same-site policy checks.
   * Returns: Whether the current request is a top-level navitation
   */
  bool getIsTopLevelNavigation()
  {
    bool _retval;
    _retval = soup_message_get_is_top_level_navigation(cast(SoupMessage*)cPtr);
    return _retval;
  }

  /**
   * Returns the method of this message.
   * Returns: A method such as %SOUP_METHOD_GET
   */
  string getMethod()
  {
    const(char)* _cretval;
    _cretval = soup_message_get_method(cast(SoupMessage*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * Get the structMessageMetrics of msg.
   * If the flag %SOUP_MESSAGE_COLLECT_METRICS is not enabled for msg this will
   * return %NULL.
   * Returns: a #SoupMessageMetrics
   */
  soup.message_metrics.MessageMetrics getMetrics()
  {
    SoupMessageMetrics* _cretval;
    _cretval = soup_message_get_metrics(cast(SoupMessage*)cPtr);
    auto _retval = _cretval ? new soup.message_metrics.MessageMetrics(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Retrieves the enumMessagePriority.
   * If not set this value defaults to #SOUP_MESSAGE_PRIORITY_NORMAL.
   * Returns: the priority of the message.
   */
  soup.types.MessagePriority getPriority()
  {
    SoupMessagePriority _cretval;
    _cretval = soup_message_get_priority(cast(SoupMessage*)cPtr);
    soup.types.MessagePriority _retval = cast(soup.types.MessagePriority)_cretval;
    return _retval;
  }

  /**
   * Returns the reason phrase for the status of this message.
   * Returns: the phrase
   */
  string getReasonPhrase()
  {
    const(char)* _cretval;
    _cretval = soup_message_get_reason_phrase(cast(SoupMessage*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * Get the remote [gio.socket_address.SocketAddress] of the connection associated with
   * the message.
   * The returned address can be %NULL if the connection hasn't been established
   * yet, or the resource was loaded from the disk cache. In case of proxy
   * connections, the remote address returned is a [gio.proxy_address.ProxyAddress]. If
   * propertySession:remote-connectable is set the returned address id for the
   * connection to the session's remote connectable.
   * Returns: a #GSocketAddress or %NULL if the connection
   *   hasn't been established
   */
  gio.socket_address.SocketAddress getRemoteAddress()
  {
    GSocketAddress* _cretval;
    _cretval = soup_message_get_remote_address(cast(SoupMessage*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.socket_address.SocketAddress)(cast(GSocketAddress*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns the headers sent with the request.
   * Returns: The #SoupMessageHeaders
   */
  soup.message_headers.MessageHeaders getRequestHeaders()
  {
    SoupMessageHeaders* _cretval;
    _cretval = soup_message_get_request_headers(cast(SoupMessage*)cPtr);
    auto _retval = _cretval ? new soup.message_headers.MessageHeaders(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Returns the headers recieved with the response.
   * Returns: The #SoupMessageHeaders
   */
  soup.message_headers.MessageHeaders getResponseHeaders()
  {
    SoupMessageHeaders* _cretval;
    _cretval = soup_message_get_response_headers(cast(SoupMessage*)cPtr);
    auto _retval = _cretval ? new soup.message_headers.MessageHeaders(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Gets msg's site for cookies #GUri.
   * Returns: the msg's site for cookies #GUri
   */
  glib.uri.Uri getSiteForCookies()
  {
    GUri* _cretval;
    _cretval = soup_message_get_site_for_cookies(cast(SoupMessage*)cPtr);
    auto _retval = _cretval ? new glib.uri.Uri(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Returns the set status of this message.
   * Returns: The #SoupStatus
   */
  soup.types.Status getStatus()
  {
    SoupStatus _cretval;
    _cretval = soup_message_get_status(cast(SoupMessage*)cPtr);
    soup.types.Status _retval = cast(soup.types.Status)_cretval;
    return _retval;
  }

  /**
   * Gets the name of the TLS ciphersuite negotiated for msg's connection.
   * Returns: the name of the TLS ciphersuite,
   *   or %NULL if msg's connection is not SSL.
   */
  string getTlsCiphersuiteName()
  {
    const(char)* _cretval;
    _cretval = soup_message_get_tls_ciphersuite_name(cast(SoupMessage*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * Gets the peer's [gio.tls_certificate.TlsCertificate] associated with msg's connection.
   * Note that this is not set yet during the emission of
   * signalMessage::accept-certificate signal.
   * Returns: msg's TLS peer certificate,
   *   or %NULL if msg's connection is not SSL.
   */
  gio.tls_certificate.TlsCertificate getTlsPeerCertificate()
  {
    GTlsCertificate* _cretval;
    _cretval = soup_message_get_tls_peer_certificate(cast(SoupMessage*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.tls_certificate.TlsCertificate)(cast(GTlsCertificate*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the errors associated with validating msg's TLS peer certificate.
   * Note that this is not set yet during the emission of
   * signalMessage::accept-certificate signal.
   * Returns: a #GTlsCertificateFlags with msg's TLS peer certificate errors.
   */
  gio.types.TlsCertificateFlags getTlsPeerCertificateErrors()
  {
    GTlsCertificateFlags _cretval;
    _cretval = soup_message_get_tls_peer_certificate_errors(cast(SoupMessage*)cPtr);
    gio.types.TlsCertificateFlags _retval = cast(gio.types.TlsCertificateFlags)_cretval;
    return _retval;
  }

  /**
   * Gets the TLS protocol version negotiated for msg's connection.
   * If the message connection is not SSL, %G_TLS_PROTOCOL_VERSION_UNKNOWN is returned.
   * Returns: a #GTlsProtocolVersion
   */
  gio.types.TlsProtocolVersion getTlsProtocolVersion()
  {
    GTlsProtocolVersion _cretval;
    _cretval = soup_message_get_tls_protocol_version(cast(SoupMessage*)cPtr);
    gio.types.TlsProtocolVersion _retval = cast(gio.types.TlsProtocolVersion)_cretval;
    return _retval;
  }

  /**
   * Gets msg's URI.
   * Returns: the URI msg is targeted for.
   */
  glib.uri.Uri getUri()
  {
    GUri* _cretval;
    _cretval = soup_message_get_uri(cast(SoupMessage*)cPtr);
    auto _retval = _cretval ? new glib.uri.Uri(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Get whether ifaceSessionFeatures of the given feature_type
   * $(LPAREN)or a subclass of that type$(RPAREN) are disabled on msg.
   * See [soup.message.Message.disableFeature].
   * Params:
   *   featureType = the #GType of a #SoupSessionFeature
   * Returns: %TRUE if feature is disabled, or %FALSE otherwise.
   */
  bool isFeatureDisabled(gobject.types.GType featureType)
  {
    bool _retval;
    _retval = soup_message_is_feature_disabled(cast(SoupMessage*)cPtr, featureType);
    return _retval;
  }

  /**
   * Determines whether or not msg's connection can be kept alive for
   * further requests after processing msg.
   * The result is based on the HTTP version, Connection header, etc.
   * Returns: %TRUE or %FALSE.
   */
  bool isKeepalive()
  {
    bool _retval;
    _retval = soup_message_is_keepalive(cast(SoupMessage*)cPtr);
    return _retval;
  }

  /**
   * Queries if flags are present in the set of msg's flags.
   * Params:
   *   flags = a set of #SoupMessageFlags values
   * Returns: %TRUE if flags are enabled in msg
   */
  bool queryFlags(soup.types.MessageFlags flags)
  {
    bool _retval;
    _retval = soup_message_query_flags(cast(SoupMessage*)cPtr, flags);
    return _retval;
  }

  /**
   * Removes flags from the set of msg's flags.
   * Params:
   *   flags = a set of #SoupMessageFlags values
   */
  void removeFlags(soup.types.MessageFlags flags)
  {
    soup_message_remove_flags(cast(SoupMessage*)cPtr, flags);
  }

  /**
   * Sets first_party as the main document #GUri for msg.
   * For details of when and how this is used refer to the documentation for
   * enumCookieJarAcceptPolicy.
   * Params:
   *   firstParty = the #GUri for the msg's first party
   */
  void setFirstParty(glib.uri.Uri firstParty)
  {
    soup_message_set_first_party(cast(SoupMessage*)cPtr, firstParty ? cast(GUri*)firstParty.cPtr(No.Dup) : null);
  }

  /**
   * Sets the specified flags on msg.
   * Params:
   *   flags = a set of #SoupMessageFlags values
   */
  void setFlags(soup.types.MessageFlags flags)
  {
    soup_message_set_flags(cast(SoupMessage*)cPtr, flags);
  }

  /**
   * Sets whether HTTP/1 version should be used when sending this message.
   * Some connections can still override it, if needed.
   * Note the value is unset after the message send is finished.
   * Params:
   *   value = value to set
   */
  void setForceHttp1(bool value)
  {
    soup_message_set_force_http1(cast(SoupMessage*)cPtr, value);
  }

  /**
   * Set whether msg is intended to be used to send `OPTIONS *` to a server.
   * When set to %TRUE, the path of propertyMessage:uri will be ignored and
   * propertyMessage:method set to %SOUP_METHOD_OPTIONS.
   * Params:
   *   isOptionsPing = the value to set
   */
  void setIsOptionsPing(bool isOptionsPing)
  {
    soup_message_set_is_options_ping(cast(SoupMessage*)cPtr, isOptionsPing);
  }

  /**
   * Sets whether the current request is a top-level navitation.
   * See the [same-site spec](https://tools.ietf.org/html/draft-ietf-httpbis-cookie-same-site-00)
   * for more information.
   * Params:
   *   isTopLevelNavigation = if %TRUE indicate the current request is a top-level navigation
   */
  void setIsTopLevelNavigation(bool isTopLevelNavigation)
  {
    soup_message_set_is_top_level_navigation(cast(SoupMessage*)cPtr, isTopLevelNavigation);
  }

  /**
   * Set msg's HTTP method to method.
   * Params:
   *   method = the value to set
   */
  void setMethod(string method)
  {
    const(char)* _method = method.toCString(No.Alloc);
    soup_message_set_method(cast(SoupMessage*)cPtr, _method);
  }

  /**
   * Sets the priority of a message.
   * Note that this won't have any effect unless used before the message is added
   * to the session's message processing queue.
   * The message will be placed just before any other previously added
   * message with lower priority $(LPAREN)messages with the same priority are
   * processed on a FIFO basis$(RPAREN).
   * Setting priorities does not currently work with synchronous messages
   * because in the synchronous/blocking case, priority ends up being determined
   * semi-randomly by thread scheduling.
   * Params:
   *   priority = the #SoupMessagePriority
   */
  void setPriority(soup.types.MessagePriority priority)
  {
    soup_message_set_priority(cast(SoupMessage*)cPtr, priority);
  }

  /**
   * Set the request body of a #SoupMessage.
   * If content_type is %NULL and stream is not %NULL the Content-Type header will
   * not be changed if present.
   * The request body needs to be set again in case msg is restarted
   * $(LPAREN)in case of redirection or authentication$(RPAREN).
   * Params:
   *   contentType = MIME Content-Type of the body, or %NULL if unknown
   *   stream = a #GInputStream to read the request body from
   *   contentLength = the byte length of stream or -1 if unknown
   */
  void setRequestBody(string contentType, gio.input_stream.InputStream stream, ptrdiff_t contentLength)
  {
    const(char)* _contentType = contentType.toCString(No.Alloc);
    soup_message_set_request_body(cast(SoupMessage*)cPtr, _contentType, stream ? cast(GInputStream*)stream.cPtr(No.Dup) : null, contentLength);
  }

  /**
   * Set the request body of a #SoupMessage from [glib.bytes.Bytes].
   * If content_type is %NULL and bytes is not %NULL the Content-Type header will
   * not be changed if present.
   * The request body needs to be set again in case msg is restarted
   * $(LPAREN)in case of redirection or authentication$(RPAREN).
   * Params:
   *   contentType = MIME Content-Type of the body, or %NULL if unknown
   *   bytes = a #GBytes with the request body data
   */
  void setRequestBodyFromBytes(string contentType, glib.bytes.Bytes bytes)
  {
    const(char)* _contentType = contentType.toCString(No.Alloc);
    soup_message_set_request_body_from_bytes(cast(SoupMessage*)cPtr, _contentType, bytes ? cast(GBytes*)bytes.cPtr(No.Dup) : null);
  }

  /**
   * Sets site_for_cookies as the policy URL for same-site cookies for msg.
   * It is either the URL of the top-level document or %NULL depending on whether
   * the registrable domain of this document's URL matches the registrable domain
   * of its parent's/opener's URL. For the top-level document it is set to the
   * document's URL.
   * See the [same-site spec](https://tools.ietf.org/html/draft-ietf-httpbis-cookie-same-site-00)
   * for more information.
   * Params:
   *   siteForCookies = the #GUri for the msg's site for cookies
   */
  void setSiteForCookies(glib.uri.Uri siteForCookies)
  {
    soup_message_set_site_for_cookies(cast(SoupMessage*)cPtr, siteForCookies ? cast(GUri*)siteForCookies.cPtr(No.Dup) : null);
  }

  /**
   * Sets the certificate to be used by msg's connection when a
   * client certificate is requested during the TLS handshake.
   * You can call this as a response to signalMessage::request-certificate
   * signal, or before the connection is started. If certificate is %NULL
   * the handshake will continue without providing a GTlsCertificate.
   * Note that the [gio.tls_certificate.TlsCertificate] set by this function will be ignored if
   * propertySession:tls-interaction is not %NULL.
   * Params:
   *   certificate = the #GTlsCertificate to set, or %NULL
   */
  void setTlsClientCertificate(gio.tls_certificate.TlsCertificate certificate)
  {
    soup_message_set_tls_client_certificate(cast(SoupMessage*)cPtr, certificate ? cast(GTlsCertificate*)certificate.cPtr(No.Dup) : null);
  }

  /**
   * Sets msg's URI to uri.
   * If msg has already been sent and you want to re-send it with the new URI,
   * you need to send it again.
   * Params:
   *   uri = the new #GUri
   */
  void setUri(glib.uri.Uri uri)
  {
    soup_message_set_uri(cast(SoupMessage*)cPtr, uri ? cast(GUri*)uri.cPtr(No.Dup) : null);
  }

  /**
   * Completes a certificate password request.
   * You must call this as a response to
   * signalMessage::request-certificate-password signal, to notify msg that
   * the [gio.tls_password.TlsPassword] has already been updated.
   */
  void tlsClientCertificatePasswordRequestComplete()
  {
    soup_message_tls_client_certificate_password_request_complete(cast(SoupMessage*)cPtr);
  }

  /**
   * Emitted during the msg's connection TLS handshake
   * after an unacceptable TLS certificate has been received.
   * You can return %TRUE to accept tls_certificate despite
   * tls_errors.
   * Params
   *   tlsPeerCertificate = the peer's #GTlsCertificate
   *   tlsPeerErrors = the tls errors of tls_certificate
   *   message = the instance the signal is connected to
   * Returns: %TRUE to accept the TLS certificate and stop other
   *   handlers from being invoked, or %FALSE to propagate the
   *   event further.
   */
  alias AcceptCertificateCallbackDlg = bool delegate(gio.tls_certificate.TlsCertificate tlsPeerCertificate, gio.types.TlsCertificateFlags tlsPeerErrors, soup.message.Message message);
  alias AcceptCertificateCallbackFunc = bool function(gio.tls_certificate.TlsCertificate tlsPeerCertificate, gio.types.TlsCertificateFlags tlsPeerErrors, soup.message.Message message);

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
      auto message = getVal!(soup.message.Message)(_paramVals);
      auto tlsPeerCertificate = getVal!(gio.tls_certificate.TlsCertificate)(&_paramVals[1]);
      auto tlsPeerErrors = getVal!(gio.types.TlsCertificateFlags)(&_paramVals[2]);
      _retval = _dClosure.dlg(tlsPeerCertificate, tlsPeerErrors, message);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("accept-certificate", closure, after);
  }

  /**
   * Emitted when the message requires authentication.
   * If credentials are available call [soup.auth.Auth.authenticate] on
   * auth. If these credentials fail, the signal will be emitted again,
   * with retrying set to %TRUE, which will continue until you return
   * without calling [soup.auth.Auth.authenticate] on auth.
   * Note that this may be emitted before msg's body has been
   * fully read.
   * You can authenticate auth asynchronously by calling
   * [gobject.object.ObjectG.ref_] on auth and returning %TRUE. The operation will
   * complete once either [soup.auth.Auth.authenticate] or
   * [soup.auth.Auth.cancel] are called.
   * Params
   *   auth = the #SoupAuth to authenticate
   *   retrying = %TRUE if this is the second $(LPAREN)or later$(RPAREN) attempt
   *   message = the instance the signal is connected to
   * Returns: %TRUE to stop other handlers from being invoked
   *   or %FALSE to propagate the event further.
   */
  alias AuthenticateCallbackDlg = bool delegate(soup.auth.Auth auth, bool retrying, soup.message.Message message);
  alias AuthenticateCallbackFunc = bool function(soup.auth.Auth auth, bool retrying, soup.message.Message message);

  /**
   * Connect to Authenticate signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectAuthenticate(T)(T callback, Flag!"After" after = No.After)
  if (is(T : AuthenticateCallbackDlg) || is(T : AuthenticateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto message = getVal!(soup.message.Message)(_paramVals);
      auto auth = getVal!(soup.auth.Auth)(&_paramVals[1]);
      auto retrying = getVal!(bool)(&_paramVals[2]);
      _retval = _dClosure.dlg(auth, retrying, message);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("authenticate", closure, after);
  }

  /**
   * Emitted when all HTTP processing is finished for a message.
   * $(LPAREN)After signalMessage::got_body$(RPAREN).
   *   message = the instance the signal is connected to
   */
  alias FinishedCallbackDlg = void delegate(soup.message.Message message);
  alias FinishedCallbackFunc = void function(soup.message.Message message);

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
      auto message = getVal!(soup.message.Message)(_paramVals);
      _dClosure.dlg(message);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("finished", closure, after);
  }

  /**
   * Emitted after receiving the complete message response body.
   *   message = the instance the signal is connected to
   */
  alias GotBodyCallbackDlg = void delegate(soup.message.Message message);
  alias GotBodyCallbackFunc = void function(soup.message.Message message);

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
      auto message = getVal!(soup.message.Message)(_paramVals);
      _dClosure.dlg(message);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("got-body", closure, after);
  }

  /**
   * Emitted after reading a portion of the message
   * body from the network.
   * Params
   *   chunkSize = the number of bytes read
   *   message = the instance the signal is connected to
   */
  alias GotBodyDataCallbackDlg = void delegate(uint chunkSize, soup.message.Message message);
  alias GotBodyDataCallbackFunc = void function(uint chunkSize, soup.message.Message message);

  /**
   * Connect to GotBodyData signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectGotBodyData(T)(T callback, Flag!"After" after = No.After)
  if (is(T : GotBodyDataCallbackDlg) || is(T : GotBodyDataCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto message = getVal!(soup.message.Message)(_paramVals);
      auto chunkSize = getVal!(uint)(&_paramVals[1]);
      _dClosure.dlg(chunkSize, message);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("got-body-data", closure, after);
  }

  /**
   * Emitted after receiving the Status-Line and response headers.
   * See also [soup.message.Message.addHeaderHandler] and
   * [soup.message.Message.addStatusCodeHandler], which can be used to
   * connect to a subset of emissions of this signal.
   * If you cancel or requeue msg while processing this signal,
   * then the current HTTP I/O will be stopped after this signal
   * emission finished, and msg's connection will be closed.
   * $(LPAREN)If you need to requeue a message--eg, after handling
   * authentication or redirection--it is usually better to
   * requeue it from a signalMessage::got-body handler rather
   * than a signalMessage::got_headers handler, so that the
   * existing HTTP connection can be reused.$(RPAREN)
   *   message = the instance the signal is connected to
   */
  alias GotHeadersCallbackDlg = void delegate(soup.message.Message message);
  alias GotHeadersCallbackFunc = void function(soup.message.Message message);

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
      auto message = getVal!(soup.message.Message)(_paramVals);
      _dClosure.dlg(message);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("got-headers", closure, after);
  }

  /**
   * Emitted after receiving a 1xx $(LPAREN)Informational$(RPAREN) response for
   * a $(LPAREN)client-side$(RPAREN) message.
   * The response_headers will be filled in with the headers associated
   * with the informational response; however, those header values will be
   * erased after this signal is done.
   * If you cancel or requeue msg while processing this signal,
   * then the current HTTP I/O will be stopped after this signal
   * emission finished, and msg's connection will be closed.
   *   message = the instance the signal is connected to
   */
  alias GotInformationalCallbackDlg = void delegate(soup.message.Message message);
  alias GotInformationalCallbackFunc = void function(soup.message.Message message);

  /**
   * Connect to GotInformational signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectGotInformational(T)(T callback, Flag!"After" after = No.After)
  if (is(T : GotInformationalCallbackDlg) || is(T : GotInformationalCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto message = getVal!(soup.message.Message)(_paramVals);
      _dClosure.dlg(message);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("got-informational", closure, after);
  }

  /**
   * Emitted when classHSTSEnforcer has upgraded the protocol
   * for msg to HTTPS as a result of matching its domain with
   * a HSTS policy.
   *   message = the instance the signal is connected to
   */
  alias HstsEnforcedCallbackDlg = void delegate(soup.message.Message message);
  alias HstsEnforcedCallbackFunc = void function(soup.message.Message message);

  /**
   * Connect to HstsEnforced signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectHstsEnforced(T)(T callback, Flag!"After" after = No.After)
  if (is(T : HstsEnforcedCallbackDlg) || is(T : HstsEnforcedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto message = getVal!(soup.message.Message)(_paramVals);
      _dClosure.dlg(message);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("hsts-enforced", closure, after);
  }

  /**
   * Emitted to indicate that some network-related event
   * related to msg has occurred.
   * This essentially proxies the [gio.socket_client.SocketClient.event] signal,
   * but only for events that occur while msg "owns" the connection; if
   * msg is sent on an existing persistent connection, then this signal
   * will not be emitted. $(LPAREN)If you want to force the message to be sent on
   * a new connection, set the %SOUP_MESSAGE_NEW_CONNECTION flag on it.$(RPAREN)
   * See [gio.socket_client.SocketClient.event] for more information on what
   * the different values of event correspond to, and what
   * connection will be in each case.
   * Params
   *   event = the network event
   *   connection = the current state of the network connection
   *   message = the instance the signal is connected to
   */
  alias NetworkEventCallbackDlg = void delegate(gio.types.SocketClientEvent event, gio.iostream.IOStream connection, soup.message.Message message);
  alias NetworkEventCallbackFunc = void function(gio.types.SocketClientEvent event, gio.iostream.IOStream connection, soup.message.Message message);

  /**
   * Connect to NetworkEvent signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectNetworkEvent(T)(T callback, Flag!"After" after = No.After)
  if (is(T : NetworkEventCallbackDlg) || is(T : NetworkEventCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto message = getVal!(soup.message.Message)(_paramVals);
      auto event = getVal!(gio.types.SocketClientEvent)(&_paramVals[1]);
      auto connection = getVal!(gio.iostream.IOStream)(&_paramVals[2]);
      _dClosure.dlg(event, connection, message);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("network-event", closure, after);
  }

  /**
   * Emitted during the msg's connection TLS handshake when
   * tls_connection requests a certificate from the client.
   * You can set the client certificate by calling
   * [soup.message.Message.setTlsClientCertificate] and returning %TRUE. It's
   * possible to handle the request asynchornously by returning %TRUE and
   * call [soup.message.Message.setTlsClientCertificate] later once the
   * certificate is available. Note that this signal is not emitted if
   * propertySession:tls-interaction was set, or if
   * [soup.message.Message.setTlsClientCertificate] was called before the
   * connection TLS handshake started.
   * Params
   *   tlsConnection = the #GTlsClientConnection
   *   message = the instance the signal is connected to
   * Returns: %TRUE to handle the request, or %FALSE to make the connection
   *   fail with %G_TLS_ERROR_CERTIFICATE_REQUIRED.
   */
  alias RequestCertificateCallbackDlg = bool delegate(gio.tls_client_connection.TlsClientConnection tlsConnection, soup.message.Message message);
  alias RequestCertificateCallbackFunc = bool function(gio.tls_client_connection.TlsClientConnection tlsConnection, soup.message.Message message);

  /**
   * Connect to RequestCertificate signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectRequestCertificate(T)(T callback, Flag!"After" after = No.After)
  if (is(T : RequestCertificateCallbackDlg) || is(T : RequestCertificateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto message = getVal!(soup.message.Message)(_paramVals);
      auto tlsConnection = getVal!(gio.tls_client_connection.TlsClientConnection)(&_paramVals[1]);
      _retval = _dClosure.dlg(tlsConnection, message);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("request-certificate", closure, after);
  }

  /**
   * Emitted during the msg's connection TLS handshake when
   * tls_connection requests a certificate password from the client.
   * You can set the certificate password on password, then call
   * [soup.message.Message.tlsClientCertificatePasswordRequestComplete] and
   * return %TRUE to handle the signal synchronously. It's possible to
   * handle the request asynchornously by calling
   * [gobject.object.ObjectG.ref_] on password, then returning %TRUE and
   * call
   * [soup.message.Message.tlsClientCertificatePasswordRequestComplete]
   * later after setting the password on password. Note that this signal
   * is not emitted if propertySession:tls-interaction was set.
   * Params
   *   tlsPassword = the #GTlsPassword
   *   message = the instance the signal is connected to
   * Returns: %TRUE to handle the request, or %FALSE to make the connection
   *   fail with %G_TLS_ERROR_CERTIFICATE_REQUIRED.
   */
  alias RequestCertificatePasswordCallbackDlg = bool delegate(gio.tls_password.TlsPassword tlsPassword, soup.message.Message message);
  alias RequestCertificatePasswordCallbackFunc = bool function(gio.tls_password.TlsPassword tlsPassword, soup.message.Message message);

  /**
   * Connect to RequestCertificatePassword signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectRequestCertificatePassword(T)(T callback, Flag!"After" after = No.After)
  if (is(T : RequestCertificatePasswordCallbackDlg) || is(T : RequestCertificatePasswordCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto message = getVal!(soup.message.Message)(_paramVals);
      auto tlsPassword = getVal!(gio.tls_password.TlsPassword)(&_paramVals[1]);
      _retval = _dClosure.dlg(tlsPassword, message);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("request-certificate-password", closure, after);
  }

  /**
   * Emitted when a request that was already sent once is now
   * being sent again.
   * e.g. because the first attempt received a
   * redirection response, or because we needed to use
   * authentication.
   *   message = the instance the signal is connected to
   */
  alias RestartedCallbackDlg = void delegate(soup.message.Message message);
  alias RestartedCallbackFunc = void function(soup.message.Message message);

  /**
   * Connect to Restarted signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectRestarted(T)(T callback, Flag!"After" after = No.After)
  if (is(T : RestartedCallbackDlg) || is(T : RestartedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto message = getVal!(soup.message.Message)(_paramVals);
      _dClosure.dlg(message);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("restarted", closure, after);
  }

  /**
   * Emitted just before a message is sent.
   *   message = the instance the signal is connected to
   */
  alias StartingCallbackDlg = void delegate(soup.message.Message message);
  alias StartingCallbackFunc = void function(soup.message.Message message);

  /**
   * Connect to Starting signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectStarting(T)(T callback, Flag!"After" after = No.After)
  if (is(T : StartingCallbackDlg) || is(T : StartingCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto message = getVal!(soup.message.Message)(_paramVals);
      _dClosure.dlg(message);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("starting", closure, after);
  }

  /**
   * Emitted immediately after writing the complete body for a
   * message.
   *   message = the instance the signal is connected to
   */
  alias WroteBodyCallbackDlg = void delegate(soup.message.Message message);
  alias WroteBodyCallbackFunc = void function(soup.message.Message message);

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
      auto message = getVal!(soup.message.Message)(_paramVals);
      _dClosure.dlg(message);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("wrote-body", closure, after);
  }

  /**
   * Emitted immediately after writing a portion of the message
   * body to the network.
   * Params
   *   chunkSize = the number of bytes written
   *   message = the instance the signal is connected to
   */
  alias WroteBodyDataCallbackDlg = void delegate(uint chunkSize, soup.message.Message message);
  alias WroteBodyDataCallbackFunc = void function(uint chunkSize, soup.message.Message message);

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
      auto message = getVal!(soup.message.Message)(_paramVals);
      auto chunkSize = getVal!(uint)(&_paramVals[1]);
      _dClosure.dlg(chunkSize, message);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("wrote-body-data", closure, after);
  }

  /**
   * Emitted immediately after writing the request headers for a
   * message.
   *   message = the instance the signal is connected to
   */
  alias WroteHeadersCallbackDlg = void delegate(soup.message.Message message);
  alias WroteHeadersCallbackFunc = void function(soup.message.Message message);

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
      auto message = getVal!(soup.message.Message)(_paramVals);
      _dClosure.dlg(message);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("wrote-headers", closure, after);
  }
}
