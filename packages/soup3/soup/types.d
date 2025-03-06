module soup.types;

import gid.gid;
import soup.auth_domain;
import soup.auth_domain_basic;
import soup.auth_domain_digest;
import soup.c.functions;
import soup.c.types;
import soup.logger;
import soup.message;
import soup.server;
import soup.server_message;
import soup.websocket_connection;


// Structs

/** */
alias Range = SoupRange;

// Callbacks

/**
    Callback used by #SoupAuthDomainBasic for authentication purposes.
  
  The application should verify that username and password and valid
  and return true or false.
  
  If you are maintaining your own password database (rather than
  using the password to authenticate against some other system like
  PAM or a remote server), you should make sure you know what you are
  doing. In particular, don't store cleartext passwords, or
  easily-computed hashes of cleartext passwords, even if you don't
  care that much about the security of your server, because users
  will frequently use the same password for multiple sites, and so
  compromising any site with a cleartext (or easily-cracked) password
  database may give attackers access to other more-interesting sites
  as well.

  ## Parameters
  $(LIST
    * $(B domain)       the domain
    * $(B msg)       the message being authenticated
    * $(B username)       the username provided by the client
    * $(B password)       the password provided by the client
  )
  Returns:     true if username and password are valid
*/
alias AuthDomainBasicAuthCallback = bool delegate(soup.auth_domain_basic.AuthDomainBasic domain, soup.server_message.ServerMessage msg, string username, string password);

/**
    Callback used by #SoupAuthDomainDigest for authentication purposes.
  
  The application should look up username in its password database,
  and return the corresponding encoded password (see
  [soup.auth_domain_digest.AuthDomainDigest.encodePassword].

  ## Parameters
  $(LIST
    * $(B domain)       the domain
    * $(B msg)       the message being authenticated
    * $(B username)       the username provided by the client
  )
  Returns:     the encoded password, or null if
      username is not a valid user. domain will free the password when
      it is done with it.
*/
alias AuthDomainDigestAuthCallback = string delegate(soup.auth_domain_digest.AuthDomainDigest domain, soup.server_message.ServerMessage msg, string username);

/**
    The prototype for a #SoupAuthDomain filter.
  
  See [soup.auth_domain.AuthDomain.setFilter] for details.

  ## Parameters
  $(LIST
    * $(B domain)       a #SoupAuthDomain
    * $(B msg)       a #SoupServerMessage
  )
  Returns:     true if msg requires authentication, false if not.
*/
alias AuthDomainFilter = bool delegate(soup.auth_domain.AuthDomain domain, soup.server_message.ServerMessage msg);

/**
    The prototype for a #SoupAuthDomain generic authentication callback.
  
  The callback should look up the user's password, call
  [soup.auth_domain.AuthDomain.checkPassword], and use the return value from that method
  as its own return value.
  
  In general, for security reasons, it is preferable to use the
  auth-domain-specific auth callbacks (eg,
  `callbackAuthDomainBasicAuthCallback` and
  `callbackAuthDomainDigestAuthCallback`), because they don't require
  keeping a cleartext password database. Most users will use the same
  password for many different sites, meaning if any site with a
  cleartext password database is compromised, accounts on other
  servers might be compromised as well. For many of the cases where
  `classServer` is used, this is not really relevant, but it may still
  be worth considering.

  ## Parameters
  $(LIST
    * $(B domain)       a #SoupAuthDomain
    * $(B msg)       the #SoupServerMessage being authenticated
    * $(B username)       the username from msg
  )
  Returns:     true if msg is authenticated, false if not.
*/
alias AuthDomainGenericAuthCallback = bool delegate(soup.auth_domain.AuthDomain domain, soup.server_message.ServerMessage msg, string username);

/**
    The prototype for a logging filter.
  
  The filter callback will be invoked for each request or response, and should
  analyze it and return a `enumLoggerLogLevel` value indicating how much of
  the message to log.

  ## Parameters
  $(LIST
    * $(B logger)       the #SoupLogger
    * $(B msg)       the message being logged
  )
  Returns:     a `enumLoggerLogLevel` value indicating how much of the message to
      log
*/
alias LoggerFilter = soup.types.LoggerLogLevel delegate(soup.logger.Logger logger, soup.message.Message msg);

/**
    The prototype for a custom printing callback.
  
  level indicates what kind of information is being printed. Eg, it
  will be [soup.types.LoggerLogLevel.Headers] if data is header data.
  
  direction is either '<', '>', or ' ', and data is the single line
  to print; the printer is expected to add a terminating newline.
  
  To get the effect of the default printer, you would do:
  
  ```c
  printf ("%c %s\n", direction, data);
  ```

  ## Parameters
  $(LIST
    * $(B logger)       the #SoupLogger
    * $(B level)       the level of the information being printed.
    * $(B direction)       a single-character prefix to data
    * $(B data)       data to print
  )
*/
alias LoggerPrinter = void delegate(soup.logger.Logger logger, soup.types.LoggerLogLevel level, char direction, string data);

/**
    The callback passed to [soup.message_headers.MessageHeaders.foreach_].

  ## Parameters
  $(LIST
    * $(B name)       the header name
    * $(B value)       the header value
  )
*/
alias MessageHeadersForeachFunc = void delegate(string name, string value);

/**
    A callback used to handle requests to a `classServer`.
  
  path and query contain the likewise-named components of the
  Request-URI, subject to certain assumptions. By default,
  `classServer` decodes all percent-encoding in the URI path, such that
  `"/foo`2Fbar`"` is treated the same as `"/foo/bar"`. If your
  server is serving resources in some non-POSIX-filesystem namespace,
  you may want to distinguish those as two distinct paths. In that
  case, you can set the `propertyServer:raw-paths` property when creating
  the `classServer`, and it will leave those characters undecoded.
  
  query contains the query component of the Request-URI parsed according to
  the rules for HTML form handling. Although this is the only commonly-used
  query string format in HTTP, there is nothing that actually requires that
  HTTP URIs use that format; if your server needs to use some other format, you
  can just ignore query, and call [soup.message.Message.getUri] and parse the URI's
  query field yourself.
  
  See [soup.server.Server.addHandler] and [soup.server.Server.addEarlyHandler]
  for details of what handlers can/should do.

  ## Parameters
  $(LIST
    * $(B server)       the #SoupServer
    * $(B msg)       the message being processed
    * $(B path)       the path component of msg's Request-URI
    * $(B query)       the parsed query
        component of msg's Request-URI
  )
*/
alias ServerCallback = void delegate(soup.server.Server server, soup.server_message.ServerMessage msg, string path, string[string] query);

/**
    A callback used to handle WebSocket requests to a #SoupServer.
  
  The callback will be invoked after sending the handshake response back to the
  client (and is only invoked if the handshake was successful).
  
  path contains the path of the Request-URI, subject to the same
  rules as `callbackServerCallback` `(qv)`.

  ## Parameters
  $(LIST
    * $(B server)       the #SoupServer
    * $(B msg)       the #SoupServerMessage
    * $(B path)       the path component of msg's Request-URI
    * $(B connection)       the newly created WebSocket connection
  )
*/
alias ServerWebsocketCallback = void delegate(soup.server.Server server, soup.server_message.ServerMessage msg, string path, soup.websocket_connection.WebsocketConnection connection);

/**
    The type of cache; this affects what kinds of responses will be
  saved.
*/
enum CacheType
{
  /**
      a single-user cache
  */
  SingleUser = 0,

  /**
      a shared cache
  */
  Shared = 1,
}

/**
    Indicates if a message should or shouldn't be cached.
*/
enum Cacheability : uint
{
  /**
      The message should be cached
  */
  Cacheable = 1,

  /**
      The message shouldn't be cached
  */
  Uncacheable = 2,

  /**
      The messages cache should be invalidated
  */
  Invalidates = 4,

  /**
      The messages cache should be updated
  */
  Validates = 8,
}

/**
    The policy for accepting or rejecting cookies returned in
  responses.
*/
enum CookieJarAcceptPolicy
{
  /**
      accept all cookies unconditionally.
  */
  Always = 0,

  /**
      reject all cookies unconditionally.
  */
  Never = 1,

  /**
      accept all cookies set by the main
      document loaded in the application using libsoup. An example of the most
      common case, web browsers, would be: If http://www.example.com is the page
      loaded, accept all cookies set by example.com, but if a resource from
      http://www.third-party.com is loaded from that page reject any cookie that
      it could try to set. For libsoup to be able to tell apart first party
      cookies from the rest, the application must call
      [soup.message.Message.setFirstParty] on each outgoing `class@Message`, setting
      the [glib.uri.Uri] of the main document. If no first party is set in a
      message when this policy is in effect, cookies will be assumed to be third
      party by default.
  */
  NoThirdParty = 2,

  /**
      accept all cookies set by
      the main document loaded in the application using libsoup, and from domains
      that have previously set at least one cookie when loaded as the main
      document. An example of the most common case, web browsers, would be: if
      http://www.example.com is the page loaded, accept all cookies set by
      example.com, but if a resource from http://www.third-party.com is loaded
      from that page, reject any cookie that it could try to set unless it
      already has a cookie in the cookie jar. For libsoup to be able to tell
      apart first party cookies from the rest, the application must call
      [soup.message.Message.setFirstParty] on each outgoing #SoupMessage, setting the
      [glib.uri.Uri] of the main document. If no first party is set in a
      message when this policy is in effect, cookies will be assumed to be third
      party by default.
  */
  GrandfatheredThirdParty = 3,
}

/**
    Date formats that `func@date_time_to_string` can use.
  
  @SOUP_DATE_HTTP and @SOUP_DATE_COOKIE always coerce the time to
  UTC.
  
  This enum may be extended with more values in future releases.
*/
enum DateFormat
{
  /**
      RFC 1123 format, used by the HTTP "Date" header. Eg
      "Sun, 06 Nov 1994 08:49:37 GMT".
  */
  Http = 1,

  /**
      The format for the "Expires" timestamp in the
      Netscape cookie specification. Eg, "Sun, 06-Nov-1994 08:49:37 GMT".
  */
  Cookie = 2,
}

/**
    How a message body is encoded for transport
*/
enum Encoding
{
  /**
      unknown / error
  */
  Unrecognized = 0,

  /**
      no body is present (which is not the same as a
      0-length body, and only occurs in certain places)
  */
  None = 1,

  /**
      Content-Length encoding
  */
  ContentLength = 2,

  /**
      Response body ends when the connection is closed
  */
  Eof = 3,

  /**
      chunked encoding (currently only supported
      for response)
  */
  Chunked = 4,

  /**
      multipart/byteranges (Reserved for future
      use: NOT CURRENTLY IMPLEMENTED)
  */
  Byteranges = 5,
}

/**
    Represents the parsed value of the "Expect" header.
*/
enum Expectation : uint
{
  /**
      any unrecognized expectation
  */
  Unrecognized = 1,

  /**
      "100-continue"
  */
  Continue = 2,
}

/**
    Indicates the HTTP protocol version being used.
*/
enum HTTPVersion
{
  /**
      HTTP 1.0 (RFC 1945)
  */
  Http10 = 0,

  /**
      HTTP 1.1 (RFC 2616)
  */
  Http11 = 1,

  /**
      HTTP 2.0 (RFC 7540)
  */
  Http20 = 2,
}

/**
    Describes the level of logging output to provide.
*/
enum LoggerLogLevel
{
  /**
      No logging
  */
  None = 0,

  /**
      Log the Request-Line or Status-Line and
      the Soup-Debug pseudo-headers
  */
  Minimal = 1,

  /**
      Log the full request/response headers
  */
  Headers = 2,

  /**
      Log the full headers and request/response bodies
  */
  Body = 3,
}

/**
    The lifetime of the memory being passed.
*/
enum MemoryUse
{
  /**
      The memory is statically allocated and
      constant; libsoup can use the passed-in buffer directly and not
      need to worry about it being modified or freed.
  */
  Static = 0,

  /**
      The caller has allocated the memory and libsoup
      will assume ownership of it and free it with `func@GLib.free`.
  */
  Take = 1,

  /**
      The passed-in data belongs to the caller and
      libsoup will copy it into new memory leaving the caller free
      to reuse the original memory.
  */
  Copy = 2,
}

/**
    Various flags that can be set on a #SoupMessage to alter its
  behavior.
*/
enum MessageFlags : uint
{
  /**
      The session should not follow redirect
      (3xx) responses received by this message.
  */
  NoRedirect = 2,

  /**
      Requests that the message should be
      sent on a newly-created connection, not reusing an existing
      persistent connection. Note that messages with non-idempotent
      `property@Message:method`s behave this way by default, unless
      #SOUP_MESSAGE_IDEMPOTENT is set.
  */
  NewConnection = 4,

  /**
      The message is considered idempotent,
      regardless its `property@Message:method`, and allows reuse of existing
      idle connections, instead of always requiring a new one, unless
      #SOUP_MESSAGE_NEW_CONNECTION is set.
  */
  Idempotent = 8,

  /**
      The `class@AuthManager` should not use
      the credentials cache for this message, neither to use cached credentials
      to automatically authenticate this message nor to cache the credentials
      after the message is successfully authenticated. This applies to both server
      and proxy authentication. Note that `signal@Message::authenticate` signal will
      be emitted, if you want to disable authentication for a message use
      [soup.message.Message.disableFeature] passing #SOUP_TYPE_AUTH_MANAGER instead.
  */
  DoNotUseAuthCache = 16,

  /**
      Metrics will be collected for this message.
  */
  CollectMetrics = 32,
}

/**
    Value passed to [soup.message_headers.MessageHeaders.new_] to set certain default
  behaviors.
*/
enum MessageHeadersType
{
  /**
      request headers
  */
  Request = 0,

  /**
      response headers
  */
  Response = 1,

  /**
      multipart body part headers
  */
  Multipart = 2,
}

/**
    Priorities that can be set on a `class@Message` to instruct the message queue
  to process it before any other message with lower priority.
*/
enum MessagePriority
{
  /**
      The lowest priority, the messages
      with this priority will be the last ones to be attended.
  */
  VeryLow = 0,

  /**
      Use this for low priority messages, a
      #SoupMessage with the default priority will be processed first.
  */
  Low = 1,

  /**
      The default priotity, this is the
      priority assigned to the #SoupMessage by default.
  */
  Normal = 2,

  /**
      High priority, a #SoupMessage with
      this priority will be processed before the ones with the default
      priority.
  */
  High = 3,

  /**
      The highest priority, use this
      for very urgent #SoupMessage as they will be the first ones to be
      attended.
  */
  VeryHigh = 4,
}

/**
    Represents the same-site policies of a cookie.
*/
enum SameSitePolicy
{
  /**
      The cookie is exposed with both cross-site and same-site requests
  */
  None = 0,

  /**
      The cookie is withheld on cross-site requests but exposed on cross-site navigations
  */
  Lax = 1,

  /**
      The cookie is only exposed for same-site requests
  */
  Strict = 2,
}

/**
    Options to pass to [soup.server.Server.listen], etc.
  
  [soup.types.ServerListenOptions.Ipv4Only] and [soup.types.ServerListenOptions.Ipv6Only]
  only make sense with [soup.server.Server.listenAll] and
  [soup.server.Server.listenLocal], not plain [soup.server.Server.listen] (which
  simply listens on whatever kind of socket you give it). And you
  cannot specify both of them in a single call.
*/
enum ServerListenOptions : uint
{
  /**
      Listen for https connections rather
      than plain http.
  */
  Https = 1,

  /**
      Only listen on IPv4 interfaces.
  */
  Ipv4Only = 2,

  /**
      Only listen on IPv6 interfaces.
  */
  Ipv6Only = 4,
}

/**
    A #SoupSession error.
*/
enum SessionError
{
  /**
      the server's response could not
      be parsed
  */
  Parsing = 0,

  /**
      the server's response was in an
      unsupported format
  */
  Encoding = 1,

  /**
      the message has been redirected
      too many times
  */
  TooManyRedirects = 2,

  /**
      the message has been restarted
      too many times
  */
  TooManyRestarts = 3,

  /**
      failed to redirect message because
      Location header was missing or empty in response
  */
  RedirectNoLocation = 4,

  /**
      failed to redirect message because
      Location header contains an invalid URI
  */
  RedirectBadUri = 5,

  /**
      the message is already in the
      session queue. Messages can only be reused after unqueued.
  */
  MessageAlreadyInQueue = 6,
}

/**
    These represent the known HTTP status code values, plus various
  network and internal errors.
  
  Note that no libsoup functions take or return this type directly;
  any function that works with status codes will accept unrecognized
  status codes as well.
*/
enum Status
{
  /**
      No status available. (Eg, the message has not
    been sent yet)
  */
  None = 0,

  /**
      100 Continue (HTTP)
  */
  Continue = 100,

  /**
      101 Switching Protocols (HTTP)
  */
  SwitchingProtocols = 101,

  /**
      102 Processing (WebDAV)
  */
  Processing = 102,

  /**
      200 Success (HTTP). Also used by many lower-level
    soup routines to indicate success.
  */
  Ok = 200,

  /**
      201 Created (HTTP)
  */
  Created = 201,

  /**
      202 Accepted (HTTP)
  */
  Accepted = 202,

  /**
      203 Non-Authoritative Information
    (HTTP)
  */
  NonAuthoritative = 203,

  /**
      204 No Content (HTTP)
  */
  NoContent = 204,

  /**
      205 Reset Content (HTTP)
  */
  ResetContent = 205,

  /**
      206 Partial Content (HTTP)
  */
  PartialContent = 206,

  /**
      207 Multi-Status (WebDAV)
  */
  MultiStatus = 207,

  /**
      300 Multiple Choices (HTTP)
  */
  MultipleChoices = 300,

  /**
      301 Moved Permanently (HTTP)
  */
  MovedPermanently = 301,

  /**
      302 Found (HTTP)
  */
  Found = 302,

  /**
      302 Moved Temporarily (old name,
    RFC 2068)
  */
  MovedTemporarily = 302,

  /**
      303 See Other (HTTP)
  */
  SeeOther = 303,

  /**
      304 Not Modified (HTTP)
  */
  NotModified = 304,

  /**
      305 Use Proxy (HTTP)
  */
  UseProxy = 305,

  /**
      306 [Unused] (HTTP)
  */
  NotAppearingInThisProtocol = 306,

  /**
      307 Temporary Redirect (HTTP)
  */
  TemporaryRedirect = 307,

  /**
      308 Permanent Redirect (HTTP)
  */
  PermanentRedirect = 308,

  /**
      400 Bad Request (HTTP)
  */
  BadRequest = 400,

  /**
      401 Unauthorized (HTTP)
  */
  Unauthorized = 401,

  /**
      402 Payment Required (HTTP)
  */
  PaymentRequired = 402,

  /**
      403 Forbidden (HTTP)
  */
  Forbidden = 403,

  /**
      404 Not Found (HTTP)
  */
  NotFound = 404,

  /**
      405 Method Not Allowed (HTTP)
  */
  MethodNotAllowed = 405,

  /**
      406 Not Acceptable (HTTP)
  */
  NotAcceptable = 406,

  /**
      407 Proxy Authentication
    Required (HTTP)
  */
  ProxyAuthenticationRequired = 407,

  /**
      shorter alias for
    [soup.types.Status.ProxyAuthenticationRequired]
  */
  ProxyUnauthorized = 407,

  /**
      408 Request Timeout (HTTP)
  */
  RequestTimeout = 408,

  /**
      409 Conflict (HTTP)
  */
  Conflict = 409,

  /**
      410 Gone (HTTP)
  */
  Gone = 410,

  /**
      411 Length Required (HTTP)
  */
  LengthRequired = 411,

  /**
      412 Precondition Failed (HTTP)
  */
  PreconditionFailed = 412,

  /**
      413 Request Entity Too Large
    (HTTP)
  */
  RequestEntityTooLarge = 413,

  /**
      414 Request-URI Too Long (HTTP)
  */
  RequestUriTooLong = 414,

  /**
      415 Unsupported Media Type
    (HTTP)
  */
  UnsupportedMediaType = 415,

  /**
      416 Requested Range
    Not Satisfiable (HTTP)
  */
  RequestedRangeNotSatisfiable = 416,

  /**
      shorter alias for
    [soup.types.Status.RequestedRangeNotSatisfiable]
  */
  InvalidRange = 416,

  /**
      417 Expectation Failed (HTTP)
  */
  ExpectationFailed = 417,

  /**
      421 Misdirected Request
  */
  MisdirectedRequest = 421,

  /**
      422 Unprocessable Entity
    (WebDAV)
  */
  UnprocessableEntity = 422,

  /**
      423 Locked (WebDAV)
  */
  Locked = 423,

  /**
      424 Failed Dependency (WebDAV)
  */
  FailedDependency = 424,

  /**
      500 Internal Server Error
    (HTTP)
  */
  InternalServerError = 500,

  /**
      501 Not Implemented (HTTP)
  */
  NotImplemented = 501,

  /**
      502 Bad Gateway (HTTP)
  */
  BadGateway = 502,

  /**
      503 Service Unavailable (HTTP)
  */
  ServiceUnavailable = 503,

  /**
      504 Gateway Timeout (HTTP)
  */
  GatewayTimeout = 504,

  /**
      505 HTTP Version Not
    Supported (HTTP)
  */
  HttpVersionNotSupported = 505,

  /**
      507 Insufficient Storage
    (WebDAV)
  */
  InsufficientStorage = 507,

  /**
      510 Not Extended (RFC 2774)
  */
  NotExtended = 510,
}

/**
    Error codes for `SOUP_TLD_ERROR`.
*/
enum TLDError
{
  /**
      A hostname was syntactically
      invalid.
  */
  InvalidHostname = 0,

  /**
      The passed-in "hostname" was
      actually an IP address (and thus has no base domain or
      public suffix).
  */
  IsIpAddress = 1,

  /**
      The passed-in hostname
      did not have enough components. Eg, calling
      `func@tld_get_base_domain` on <literal>"co.uk"</literal>.
  */
  NotEnoughDomains = 2,

  /**
      The passed-in hostname has
      no recognized public suffix.
  */
  NoBaseDomain = 3,

  /**
      The Public Suffix List was not
      available.
  */
  NoPslData = 4,
}

/**
    Enum values passed to `func@uri_copy` to indicate the components of
  the URI that should be updated with the given values.
*/
enum URIComponent
{
  /**
      no component
  */
  None = 0,

  /**
      the URI scheme component
  */
  Scheme = 1,

  /**
      the URI user component
  */
  User = 2,

  /**
      the URI password component
  */
  Password = 3,

  /**
      the URI authentication parameters component
  */
  AuthParams = 4,

  /**
      the URI host component
  */
  Host = 5,

  /**
      the URI port component
  */
  Port = 6,

  /**
      the URI path component
  */
  Path = 7,

  /**
      the URI query component
  */
  Query = 8,

  /**
      the URI fragment component
  */
  Fragment = 9,
}

/**
    Pre-defined close codes that can be passed to
  [soup.websocket_connection.WebsocketConnection.close] or received from
  [soup.websocket_connection.WebsocketConnection.getCloseCode].
  
  However, other codes are also allowed.
*/
enum WebsocketCloseCode
{
  /**
      a normal, non-error close
  */
  Normal = 1000,

  /**
      the client/server is going away
  */
  GoingAway = 1001,

  /**
      a protocol error occurred
  */
  ProtocolError = 1002,

  /**
      the endpoint received data
      of a type that it does not support.
  */
  UnsupportedData = 1003,

  /**
      reserved value indicating that
      no close code was present; must not be sent.
  */
  NoStatus = 1005,

  /**
      reserved value indicating that
      the connection was closed abnormally; must not be sent.
  */
  Abnormal = 1006,

  /**
      the endpoint received data that
      was invalid (eg, non-UTF-8 data in a text message).
  */
  BadData = 1007,

  /**
      generic error code
      indicating some sort of policy violation.
  */
  PolicyViolation = 1008,

  /**
      the endpoint received a message
      that is too big to process.
  */
  TooBig = 1009,

  /**
      the client is closing the
      connection because the server failed to negotiate a required
      extension.
  */
  NoExtension = 1010,

  /**
      the server is closing the
      connection because it was unable to fulfill the request.
  */
  ServerError = 1011,

  /**
      reserved value indicating that
      the TLS handshake failed; must not be sent.
  */
  TlsHandshake = 1015,
}

/**
    The type of a `class@WebsocketConnection`.
*/
enum WebsocketConnectionType
{
  /**
      unknown/invalid connection
  */
  Unknown = 0,

  /**
      a client-side connection
  */
  Client = 1,

  /**
      a server-side connection
  */
  Server = 2,
}

/**
    The type of data contained in a `signal@WebsocketConnection::message` signal.
*/
enum WebsocketDataType
{
  /**
      UTF-8 text
  */
  Text = 1,

  /**
      binary data
  */
  Binary = 2,
}

/**
    WebSocket-related errors.
*/
enum WebsocketError
{
  /**
      a generic error
  */
  Failed = 0,

  /**
      attempted to handshake with a
      server that does not appear to understand WebSockets.
  */
  NotWebsocket = 1,

  /**
      the WebSocket handshake failed
      because some detail was invalid (eg, incorrect accept key).
  */
  BadHandshake = 2,

  /**
      the WebSocket handshake failed
      because the "Origin" header was not an allowed value.
  */
  BadOrigin = 3,
}

/**
    The state of the WebSocket connection.
*/
enum WebsocketState
{
  /**
      the connection is ready to send messages
  */
  Open = 1,

  /**
      the connection is in the process of
      closing down; messages may be received, but not sent
  */
  Closing = 2,

  /**
      the connection is completely closed down
  */
  Closed = 3,
}

/**
    A constant corresponding to 1 day.
  
  For use with [soup.cookie.Cookie.new_] and [soup.cookie.Cookie.setMaxAge].
*/
enum COOKIE_MAX_AGE_ONE_DAY = 0;

/**
    A constant corresponding to 1 hour.
  
  For use with [soup.cookie.Cookie.new_] and [soup.cookie.Cookie.setMaxAge].
*/
enum COOKIE_MAX_AGE_ONE_HOUR = 3600;

/**
    A constant corresponding to 1 week.
  
  For use with [soup.cookie.Cookie.new_] and [soup.cookie.Cookie.setMaxAge].
*/
enum COOKIE_MAX_AGE_ONE_WEEK = 0;

/**
    A constant corresponding to 1 year.
  
  For use with [soup.cookie.Cookie.new_] and [soup.cookie.Cookie.setMaxAge].
*/
enum COOKIE_MAX_AGE_ONE_YEAR = 0;

/**
    A macro containing the value
  `multipart/form-data`; the MIME type used for
  posting form data that contains files to be uploaded.
*/
enum FORM_MIME_TYPE_MULTIPART = "multipart/form-data";

/**
    A macro containing the value
  `application/x-www-form-urlencoded`; the default
  MIME type for POSTing HTML form data.
*/
enum FORM_MIME_TYPE_URLENCODED = "application/x-www-form-urlencoded";

/**
    An expiration date that is always in the past.
*/
enum HSTS_POLICY_MAX_AGE_PAST = 0;

/**
    The set of #GUriFlags libsoup expects all #GUri to use.
*/
enum HTTP_URI_FLAGS = 482;

/**
    Like `func@get_major_version`, but from the headers used at application
  compile time, rather than from the library linked against at application run
  time.
*/
enum MAJOR_VERSION = 3;

/**
    Like `func@get_micro_version`, but from the headers used at
  application compile time, rather than from the library linked
  against at application run time.
*/
enum MICRO_VERSION = 5;

/**
    Like `func@get_minor_version`, but from the headers used at
  application compile time, rather than from the library linked
  against at application run time.
*/
enum MINOR_VERSION = 4;

/**
    A macro that should be defined by the user prior to including
  `libsoup.h`.
  
  The definition should be one of the predefined libsoup
  version macros: `SOUP_VERSION_2_24`, `SOUP_VERSION_2_26`, ...
  
  This macro defines the earliest version of libsoup that the package
  is required to be able to compile against.
  
  If the compiler is configured to warn about the use of deprecated
  functions, then using functions that were deprecated in version
  `SOUP_VERSION_MIN_REQUIRED` or earlier will cause warnings (but
  using functions deprecated in later releases will not).
*/
enum VERSION_MIN_REQUIRED = 2;
