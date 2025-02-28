module soup.c.types;

public import gid.basictypes;
public import gio.c.types;

/**
 * The type of cache; this affects what kinds of responses will be
 * saved.
 */
enum SoupCacheType
{
  /**
   * a single-user cache
   */
  SingleUser = 0,

  /**
   * a shared cache
   */
  Shared = 1,
}

/**
 * Indicates if a message should or shouldn't be cached.
 */
enum SoupCacheability : uint
{
  /**
   * The message should be cached
   */
  Cacheable = 1,

  /**
   * The message shouldn't be cached
   */
  Uncacheable = 2,

  /**
   * The messages cache should be invalidated
   */
  Invalidates = 4,

  /**
   * The messages cache should be updated
   */
  Validates = 8,
}

/**
 * The policy for accepting or rejecting cookies returned in
 * responses.
 */
enum SoupCookieJarAcceptPolicy
{
  /**
   * accept all cookies unconditionally.
   */
  Always = 0,

  /**
   * reject all cookies unconditionally.
   */
  Never = 1,

  /**
   * accept all cookies set by the main
   * document loaded in the application using libsoup. An example of the most
   * common case, web browsers, would be: If http://www.example.com is the page
   * loaded, accept all cookies set by example.com, but if a resource from
   * http://www.third-party.com is loaded from that page reject any cookie that
   * it could try to set. For libsoup to be able to tell apart first party
   * cookies from the rest, the application must call
   * [Soup.Message.setFirstParty] on each outgoing class@Message, setting
   * the [GLib.Uri] of the main document. If no first party is set in a
   * message when this policy is in effect, cookies will be assumed to be third
   * party by default.
   */
  NoThirdParty = 2,

  /**
   * accept all cookies set by
   * the main document loaded in the application using libsoup, and from domains
   * that have previously set at least one cookie when loaded as the main
   * document. An example of the most common case, web browsers, would be: if
   * http://www.example.com is the page loaded, accept all cookies set by
   * example.com, but if a resource from http://www.third-party.com is loaded
   * from that page, reject any cookie that it could try to set unless it
   * already has a cookie in the cookie jar. For libsoup to be able to tell
   * apart first party cookies from the rest, the application must call
   * [Soup.Message.setFirstParty] on each outgoing #SoupMessage, setting the
   * [GLib.Uri] of the main document. If no first party is set in a
   * message when this policy is in effect, cookies will be assumed to be third
   * party by default.
   */
  GrandfatheredThirdParty = 3,
}

/**
 * Date formats that func@date_time_to_string can use.
 * @SOUP_DATE_HTTP and @SOUP_DATE_COOKIE always coerce the time to
 * UTC.
 * This enum may be extended with more values in future releases.
 */
enum SoupDateFormat
{
  /**
   * RFC 1123 format, used by the HTTP "Date" header. Eg
   * "Sun, 06 Nov 1994 08:49:37 GMT".
   */
  Http = 1,

  /**
   * The format for the "Expires" timestamp in the
   * Netscape cookie specification. Eg, "Sun, 06-Nov-1994 08:49:37 GMT".
   */
  Cookie = 2,
}

/**
 * How a message body is encoded for transport
 */
enum SoupEncoding
{
  /**
   * unknown / error
   */
  Unrecognized = 0,

  /**
   * no body is present $(LPAREN)which is not the same as a
   * 0-length body, and only occurs in certain places$(RPAREN)
   */
  None = 1,

  /**
   * Content-Length encoding
   */
  ContentLength = 2,

  /**
   * Response body ends when the connection is closed
   */
  Eof = 3,

  /**
   * chunked encoding $(LPAREN)currently only supported
   * for response$(RPAREN)
   */
  Chunked = 4,

  /**
   * multipart/byteranges $(LPAREN)Reserved for future
   * use: NOT CURRENTLY IMPLEMENTED$(RPAREN)
   */
  Byteranges = 5,
}

/**
 * Represents the parsed value of the "Expect" header.
 */
enum SoupExpectation : uint
{
  /**
   * any unrecognized expectation
   */
  Unrecognized = 1,

  /**
   * "100-continue"
   */
  Continue = 2,
}

/**
 * Indicates the HTTP protocol version being used.
 */
enum SoupHTTPVersion
{
  /**
   * HTTP 1.0 $(LPAREN)RFC 1945$(RPAREN)
   */
  Http10 = 0,

  /**
   * HTTP 1.1 $(LPAREN)RFC 2616$(RPAREN)
   */
  Http11 = 1,

  /**
   * HTTP 2.0 $(LPAREN)RFC 7540$(RPAREN)
   */
  Http20 = 2,
}

/**
 * Describes the level of logging output to provide.
 */
enum SoupLoggerLogLevel
{
  /**
   * No logging
   */
  None = 0,

  /**
   * Log the Request-Line or Status-Line and
   * the Soup-Debug pseudo-headers
   */
  Minimal = 1,

  /**
   * Log the full request/response headers
   */
  Headers = 2,

  /**
   * Log the full headers and request/response bodies
   */
  Body = 3,
}

/**
 * The lifetime of the memory being passed.
 */
enum SoupMemoryUse
{
  /**
   * The memory is statically allocated and
   * constant; libsoup can use the passed-in buffer directly and not
   * need to worry about it being modified or freed.
   */
  Static = 0,

  /**
   * The caller has allocated the memory and libsoup
   * will assume ownership of it and free it with func@GLib.free.
   */
  Take = 1,

  /**
   * The passed-in data belongs to the caller and
   * libsoup will copy it into new memory leaving the caller free
   * to reuse the original memory.
   */
  Copy = 2,
}

/**
 * Various flags that can be set on a #SoupMessage to alter its
 * behavior.
 */
enum SoupMessageFlags : uint
{
  /**
   * The session should not follow redirect
   * $(LPAREN)3xx$(RPAREN) responses received by this message.
   */
  NoRedirect = 2,

  /**
   * Requests that the message should be
   * sent on a newly-created connection, not reusing an existing
   * persistent connection. Note that messages with non-idempotent
   * property@Message:methods behave this way by default, unless
   * #SOUP_MESSAGE_IDEMPOTENT is set.
   */
  NewConnection = 4,

  /**
   * The message is considered idempotent,
   * regardless its property@Message:method, and allows reuse of existing
   * idle connections, instead of always requiring a new one, unless
   * #SOUP_MESSAGE_NEW_CONNECTION is set.
   */
  Idempotent = 8,

  /**
   * The class@AuthManager should not use
   * the credentials cache for this message, neither to use cached credentials
   * to automatically authenticate this message nor to cache the credentials
   * after the message is successfully authenticated. This applies to both server
   * and proxy authentication. Note that signal@Message::authenticate signal will
   * be emitted, if you want to disable authentication for a message use
   * [Soup.Message.disableFeature] passing #SOUP_TYPE_AUTH_MANAGER instead.
   */
  DoNotUseAuthCache = 16,

  /**
   * Metrics will be collected for this message.
   */
  CollectMetrics = 32,
}

/**
 * Value passed to [Soup.MessageHeaders.new_] to set certain default
 * behaviors.
 */
enum SoupMessageHeadersType
{
  /**
   * request headers
   */
  Request = 0,

  /**
   * response headers
   */
  Response = 1,

  /**
   * multipart body part headers
   */
  Multipart = 2,
}

/**
 * Priorities that can be set on a class@Message to instruct the message queue
 * to process it before any other message with lower priority.
 */
enum SoupMessagePriority
{
  /**
   * The lowest priority, the messages
   * with this priority will be the last ones to be attended.
   */
  VeryLow = 0,

  /**
   * Use this for low priority messages, a
   * #SoupMessage with the default priority will be processed first.
   */
  Low = 1,

  /**
   * The default priotity, this is the
   * priority assigned to the #SoupMessage by default.
   */
  Normal = 2,

  /**
   * High priority, a #SoupMessage with
   * this priority will be processed before the ones with the default
   * priority.
   */
  High = 3,

  /**
   * The highest priority, use this
   * for very urgent #SoupMessage as they will be the first ones to be
   * attended.
   */
  VeryHigh = 4,
}

/**
 * Represents the same-site policies of a cookie.
 */
enum SoupSameSitePolicy
{
  /**
   * The cookie is exposed with both cross-site and same-site requests
   */
  None = 0,

  /**
   * The cookie is withheld on cross-site requests but exposed on cross-site navigations
   */
  Lax = 1,

  /**
   * The cookie is only exposed for same-site requests
   */
  Strict = 2,
}

/**
 * Options to pass to [Soup.Server.listen], etc.
 * %SOUP_SERVER_LISTEN_IPV4_ONLY and %SOUP_SERVER_LISTEN_IPV6_ONLY
 * only make sense with [Soup.Server.listenAll] and
 * [Soup.Server.listenLocal], not plain [Soup.Server.listen] $(LPAREN)which
 * simply listens on whatever kind of socket you give it$(RPAREN). And you
 * cannot specify both of them in a single call.
 */
enum SoupServerListenOptions : uint
{
  /**
   * Listen for https connections rather
   * than plain http.
   */
  Https = 1,

  /**
   * Only listen on IPv4 interfaces.
   */
  Ipv4Only = 2,

  /**
   * Only listen on IPv6 interfaces.
   */
  Ipv6Only = 4,
}

/**
 * A #SoupSession error.
 */
enum SoupSessionError
{
  /**
   * the server's response could not
   * be parsed
   */
  Parsing = 0,

  /**
   * the server's response was in an
   * unsupported format
   */
  Encoding = 1,

  /**
   * the message has been redirected
   * too many times
   */
  TooManyRedirects = 2,

  /**
   * the message has been restarted
   * too many times
   */
  TooManyRestarts = 3,

  /**
   * failed to redirect message because
   * Location header was missing or empty in response
   */
  RedirectNoLocation = 4,

  /**
   * failed to redirect message because
   * Location header contains an invalid URI
   */
  RedirectBadUri = 5,

  /**
   * the message is already in the
   * session queue. Messages can only be reused after unqueued.
   */
  MessageAlreadyInQueue = 6,
}

/**
 * These represent the known HTTP status code values, plus various
 * network and internal errors.
 * Note that no libsoup functions take or return this type directly;
 * any function that works with status codes will accept unrecognized
 * status codes as well.
 */
enum SoupStatus
{
  /**
   * No status available. $(LPAREN)Eg, the message has not
   * been sent yet$(RPAREN)
   */
  None = 0,

  /**
   * 100 Continue $(LPAREN)HTTP$(RPAREN)
   */
  Continue = 100,

  /**
   * 101 Switching Protocols $(LPAREN)HTTP$(RPAREN)
   */
  SwitchingProtocols = 101,

  /**
   * 102 Processing $(LPAREN)WebDAV$(RPAREN)
   */
  Processing = 102,

  /**
   * 200 Success $(LPAREN)HTTP$(RPAREN). Also used by many lower-level
   * soup routines to indicate success.
   */
  Ok = 200,

  /**
   * 201 Created $(LPAREN)HTTP$(RPAREN)
   */
  Created = 201,

  /**
   * 202 Accepted $(LPAREN)HTTP$(RPAREN)
   */
  Accepted = 202,

  /**
   * 203 Non-Authoritative Information
   * $(LPAREN)HTTP$(RPAREN)
   */
  NonAuthoritative = 203,

  /**
   * 204 No Content $(LPAREN)HTTP$(RPAREN)
   */
  NoContent = 204,

  /**
   * 205 Reset Content $(LPAREN)HTTP$(RPAREN)
   */
  ResetContent = 205,

  /**
   * 206 Partial Content $(LPAREN)HTTP$(RPAREN)
   */
  PartialContent = 206,

  /**
   * 207 Multi-Status $(LPAREN)WebDAV$(RPAREN)
   */
  MultiStatus = 207,

  /**
   * 300 Multiple Choices $(LPAREN)HTTP$(RPAREN)
   */
  MultipleChoices = 300,

  /**
   * 301 Moved Permanently $(LPAREN)HTTP$(RPAREN)
   */
  MovedPermanently = 301,

  /**
   * 302 Found $(LPAREN)HTTP$(RPAREN)
   */
  Found = 302,

  /**
   * 302 Moved Temporarily $(LPAREN)old name,
   * RFC 2068$(RPAREN)
   */
  MovedTemporarily = 302,

  /**
   * 303 See Other $(LPAREN)HTTP$(RPAREN)
   */
  SeeOther = 303,

  /**
   * 304 Not Modified $(LPAREN)HTTP$(RPAREN)
   */
  NotModified = 304,

  /**
   * 305 Use Proxy $(LPAREN)HTTP$(RPAREN)
   */
  UseProxy = 305,

  /**
   * 306 [Unused] (HTTP)
   */
  NotAppearingInThisProtocol = 306,

  /**
   * 307 Temporary Redirect $(LPAREN)HTTP$(RPAREN)
   */
  TemporaryRedirect = 307,

  /**
   * 308 Permanent Redirect $(LPAREN)HTTP$(RPAREN)
   */
  PermanentRedirect = 308,

  /**
   * 400 Bad Request $(LPAREN)HTTP$(RPAREN)
   */
  BadRequest = 400,

  /**
   * 401 Unauthorized $(LPAREN)HTTP$(RPAREN)
   */
  Unauthorized = 401,

  /**
   * 402 Payment Required $(LPAREN)HTTP$(RPAREN)
   */
  PaymentRequired = 402,

  /**
   * 403 Forbidden $(LPAREN)HTTP$(RPAREN)
   */
  Forbidden = 403,

  /**
   * 404 Not Found $(LPAREN)HTTP$(RPAREN)
   */
  NotFound = 404,

  /**
   * 405 Method Not Allowed $(LPAREN)HTTP$(RPAREN)
   */
  MethodNotAllowed = 405,

  /**
   * 406 Not Acceptable $(LPAREN)HTTP$(RPAREN)
   */
  NotAcceptable = 406,

  /**
   * 407 Proxy Authentication
   * Required $(LPAREN)HTTP$(RPAREN)
   */
  ProxyAuthenticationRequired = 407,

  /**
   * shorter alias for
   * %SOUP_STATUS_PROXY_AUTHENTICATION_REQUIRED
   */
  ProxyUnauthorized = 407,

  /**
   * 408 Request Timeout $(LPAREN)HTTP$(RPAREN)
   */
  RequestTimeout = 408,

  /**
   * 409 Conflict $(LPAREN)HTTP$(RPAREN)
   */
  Conflict = 409,

  /**
   * 410 Gone $(LPAREN)HTTP$(RPAREN)
   */
  Gone = 410,

  /**
   * 411 Length Required $(LPAREN)HTTP$(RPAREN)
   */
  LengthRequired = 411,

  /**
   * 412 Precondition Failed $(LPAREN)HTTP$(RPAREN)
   */
  PreconditionFailed = 412,

  /**
   * 413 Request Entity Too Large
   * $(LPAREN)HTTP$(RPAREN)
   */
  RequestEntityTooLarge = 413,

  /**
   * 414 Request-URI Too Long $(LPAREN)HTTP$(RPAREN)
   */
  RequestUriTooLong = 414,

  /**
   * 415 Unsupported Media Type
   * $(LPAREN)HTTP$(RPAREN)
   */
  UnsupportedMediaType = 415,

  /**
   * 416 Requested Range
   * Not Satisfiable $(LPAREN)HTTP$(RPAREN)
   */
  RequestedRangeNotSatisfiable = 416,

  /**
   * shorter alias for
   * %SOUP_STATUS_REQUESTED_RANGE_NOT_SATISFIABLE
   */
  InvalidRange = 416,

  /**
   * 417 Expectation Failed $(LPAREN)HTTP$(RPAREN)
   */
  ExpectationFailed = 417,

  /**
   * 421 Misdirected Request
   */
  MisdirectedRequest = 421,

  /**
   * 422 Unprocessable Entity
   * $(LPAREN)WebDAV$(RPAREN)
   */
  UnprocessableEntity = 422,

  /**
   * 423 Locked $(LPAREN)WebDAV$(RPAREN)
   */
  Locked = 423,

  /**
   * 424 Failed Dependency $(LPAREN)WebDAV$(RPAREN)
   */
  FailedDependency = 424,

  /**
   * 500 Internal Server Error
   * $(LPAREN)HTTP$(RPAREN)
   */
  InternalServerError = 500,

  /**
   * 501 Not Implemented $(LPAREN)HTTP$(RPAREN)
   */
  NotImplemented = 501,

  /**
   * 502 Bad Gateway $(LPAREN)HTTP$(RPAREN)
   */
  BadGateway = 502,

  /**
   * 503 Service Unavailable $(LPAREN)HTTP$(RPAREN)
   */
  ServiceUnavailable = 503,

  /**
   * 504 Gateway Timeout $(LPAREN)HTTP$(RPAREN)
   */
  GatewayTimeout = 504,

  /**
   * 505 HTTP Version Not
   * Supported $(LPAREN)HTTP$(RPAREN)
   */
  HttpVersionNotSupported = 505,

  /**
   * 507 Insufficient Storage
   * $(LPAREN)WebDAV$(RPAREN)
   */
  InsufficientStorage = 507,

  /**
   * 510 Not Extended $(LPAREN)RFC 2774$(RPAREN)
   */
  NotExtended = 510,
}

/**
 * Error codes for %SOUP_TLD_ERROR.
 */
enum SoupTLDError
{
  /**
   * A hostname was syntactically
   * invalid.
   */
  InvalidHostname = 0,

  /**
   * The passed-in "hostname" was
   * actually an IP address $(LPAREN)and thus has no base domain or
   * public suffix$(RPAREN).
   */
  IsIpAddress = 1,

  /**
   * The passed-in hostname
   * did not have enough components. Eg, calling
   * func@tld_get_base_domain on <literal>"co.uk"</literal>.
   */
  NotEnoughDomains = 2,

  /**
   * The passed-in hostname has
   * no recognized public suffix.
   */
  NoBaseDomain = 3,

  /**
   * The Public Suffix List was not
   * available.
   */
  NoPslData = 4,
}

/**
 * Enum values passed to func@uri_copy to indicate the components of
 * the URI that should be updated with the given values.
 */
enum SoupURIComponent
{
  /**
   * no component
   */
  None = 0,

  /**
   * the URI scheme component
   */
  Scheme = 1,

  /**
   * the URI user component
   */
  User = 2,

  /**
   * the URI password component
   */
  Password = 3,

  /**
   * the URI authentication parameters component
   */
  AuthParams = 4,

  /**
   * the URI host component
   */
  Host = 5,

  /**
   * the URI port component
   */
  Port = 6,

  /**
   * the URI path component
   */
  Path = 7,

  /**
   * the URI query component
   */
  Query = 8,

  /**
   * the URI fragment component
   */
  Fragment = 9,
}

/**
 * Pre-defined close codes that can be passed to
 * [Soup.WebsocketConnection.close] or received from
 * [Soup.WebsocketConnection.getCloseCode].
 * However, other codes are also allowed.
 */
enum SoupWebsocketCloseCode
{
  /**
   * a normal, non-error close
   */
  Normal = 1000,

  /**
   * the client/server is going away
   */
  GoingAway = 1001,

  /**
   * a protocol error occurred
   */
  ProtocolError = 1002,

  /**
   * the endpoint received data
   * of a type that it does not support.
   */
  UnsupportedData = 1003,

  /**
   * reserved value indicating that
   * no close code was present; must not be sent.
   */
  NoStatus = 1005,

  /**
   * reserved value indicating that
   * the connection was closed abnormally; must not be sent.
   */
  Abnormal = 1006,

  /**
   * the endpoint received data that
   * was invalid $(LPAREN)eg, non-UTF-8 data in a text message$(RPAREN).
   */
  BadData = 1007,

  /**
   * generic error code
   * indicating some sort of policy violation.
   */
  PolicyViolation = 1008,

  /**
   * the endpoint received a message
   * that is too big to process.
   */
  TooBig = 1009,

  /**
   * the client is closing the
   * connection because the server failed to negotiate a required
   * extension.
   */
  NoExtension = 1010,

  /**
   * the server is closing the
   * connection because it was unable to fulfill the request.
   */
  ServerError = 1011,

  /**
   * reserved value indicating that
   * the TLS handshake failed; must not be sent.
   */
  TlsHandshake = 1015,
}

/**
 * The type of a class@WebsocketConnection.
 */
enum SoupWebsocketConnectionType
{
  /**
   * unknown/invalid connection
   */
  Unknown = 0,

  /**
   * a client-side connection
   */
  Client = 1,

  /**
   * a server-side connection
   */
  Server = 2,
}

/**
 * The type of data contained in a signal@WebsocketConnection::message signal.
 */
enum SoupWebsocketDataType
{
  /**
   * UTF-8 text
   */
  Text = 1,

  /**
   * binary data
   */
  Binary = 2,
}

/**
 * WebSocket-related errors.
 */
enum SoupWebsocketError
{
  /**
   * a generic error
   */
  Failed = 0,

  /**
   * attempted to handshake with a
   * server that does not appear to understand WebSockets.
   */
  NotWebsocket = 1,

  /**
   * the WebSocket handshake failed
   * because some detail was invalid $(LPAREN)eg, incorrect accept key$(RPAREN).
   */
  BadHandshake = 2,

  /**
   * the WebSocket handshake failed
   * because the "Origin" header was not an allowed value.
   */
  BadOrigin = 3,
}

/**
 * The state of the WebSocket connection.
 */
enum SoupWebsocketState
{
  /**
   * the connection is ready to send messages
   */
  Open = 1,

  /**
   * the connection is in the process of
   * closing down; messages may be received, but not sent
   */
  Closing = 2,

  /**
   * the connection is completely closed down
   */
  Closed = 3,
}

/**
 * The abstract base class for handling authentication.
 * Specific HTTP Authentication mechanisms are implemented by its subclasses,
 * but applications never need to be aware of the specific subclasses being
 * used.
 * #SoupAuth objects store the authentication data associated with a given bit
 * of web space. They are created automatically by class@Session.
 */
struct SoupAuth
{
  ObjectC parentInstance;
}

struct SoupAuthClass
{
  GObjectClass parentClass;

  const(char)* schemeName;

  uint strength;

  extern(C) bool function(SoupAuth* auth, SoupMessage* msg, GHashTable* authHeader) update;

  extern(C) GSList* function(SoupAuth* auth, GUri* sourceUri) getProtectionSpace;

  extern(C) void function(SoupAuth* auth, const(char)* username, const(char)* password) authenticate;

  extern(C) bool function(SoupAuth* auth) isAuthenticated;

  extern(C) char* function(SoupAuth* auth, SoupMessage* msg) getAuthorization;

  extern(C) bool function(SoupAuth* auth, SoupMessage* msg) isReady;

  extern(C) bool function(SoupAuth* auth) canAuthenticate;

  void*[6] padding;
}

/**
 * Server-side authentication.
 * A #SoupAuthDomain manages authentication for all or part of a
 * class@Server. To make a server require authentication, first create
 * an appropriate subclass of #SoupAuthDomain, and then add it to the
 * server with [Soup.Server.addAuthDomain].
 * In order for an auth domain to have any effect, you must add one or more
 * paths to it $(LPAREN)via [Soup.AuthDomain.addPath]$(RPAREN). To require authentication for
 * all ordinary requests, add the path `"/"`. $(LPAREN)Note that this does not include
 * the special `"*"` URI $(LPAREN)eg, "OPTIONS *"$(RPAREN), which must be added as a separate
 * path if you want to cover it.$(RPAREN)
 * If you need greater control over which requests should and shouldn't be
 * authenticated, add paths covering everything you *might* want authenticated,
 * and then use a filter $(LPAREN)[Soup.AuthDomain.setFilter] to bypass
 * authentication for those requests that don't need it.
 */
struct SoupAuthDomain
{
  ObjectC parentInstance;
}

/**
 * Server-side "Basic" authentication.
 * #SoupAuthDomainBasic handles the server side of HTTP "Basic" $(LPAREN)ie,
 * cleartext password$(RPAREN) authentication.
 */
struct SoupAuthDomainBasic;

struct SoupAuthDomainBasicClass
{
  SoupAuthDomainClass parentClass;
}

struct SoupAuthDomainClass
{
  GObjectClass parentClass;

  extern(C) char* function(SoupAuthDomain* domain, SoupServerMessage* msg, const(char)* header) accepts;

  extern(C) char* function(SoupAuthDomain* domain, SoupServerMessage* msg) challenge;

  extern(C) bool function(SoupAuthDomain* domain, SoupServerMessage* msg, const(char)* username, const(char)* password) checkPassword;

  void*[6] padding;
}

/**
 * Server-side "Digest" authentication.
 * #SoupAuthDomainDigest handles the server side of HTTP "Digest"
 * authentication.
 */
struct SoupAuthDomainDigest;

struct SoupAuthDomainDigestClass
{
  SoupAuthDomainClass parentClass;
}

/**
 * HTTP client-side authentication handler.
 * #SoupAuthManager is the iface@SessionFeature that handles HTTP
 * authentication for a class@Session.
 * A #SoupAuthManager is added to the session by default, and normally
 * you don't need to worry about it at all. However, if you want to
 * disable HTTP authentication, you can remove the feature from the
 * session with [Soup.Session.removeFeatureByType] or disable it on
 * individual requests with [Soup.Message.disableFeature].
 * You can use this with [Soup.Session.removeFeatureByType] or
 * [Soup.Message.disableFeature].
 * $(LPAREN)Although this type has only been publicly visible since libsoup 2.42, it has
 * always existed in the background, and you can use `g_type_from_name
 * $(LPAREN)"SoupAuthManager"$(RPAREN)` to get its alias@GLib.Type in earlier releases.$(RPAREN)
 */
struct SoupAuthManager;

struct SoupAuthManagerClass
{
  GObjectClass parentClass;
}

/**
 * File-based cache for HTTP resources.
 */
struct SoupCache
{
  ObjectC parentInstance;
}

struct SoupCacheClass
{
  GObjectClass parentClass;

  extern(C) SoupCacheability function(SoupCache* cache, SoupMessage* msg) getCacheability;

  void*[4] padding;
}

/**
 * Handles decoding of HTTP messages.
 * #SoupContentDecoder handles adding the "Accept-Encoding" header on
 * outgoing messages, and processing the "Content-Encoding" header on
 * incoming ones. Currently it supports the "gzip", "deflate", and "br"
 * content codings.
 * A #SoupContentDecoder will automatically be
 * added to the session by default. $(LPAREN)You can use
 * [Soup.Session.removeFeatureByType] if you don't
 * want this.$(RPAREN)
 * If #SoupContentDecoder successfully decodes the Content-Encoding,
 * the message body will contain the decoded data; however, the message headers
 * will be unchanged $(LPAREN)and so "Content-Encoding" will still be present,
 * "Content-Length" will describe the original encoded length, etc$(RPAREN).
 * If "Content-Encoding" contains any encoding types that
 * #SoupContentDecoder doesn't recognize, then none of the encodings
 * will be decoded.
 * $(LPAREN)Note that currently there is no way to $(LPAREN)automatically$(RPAREN) use
 * Content-Encoding when sending a request body, or to pick specific
 * encoding types to support.$(RPAREN)
 */
struct SoupContentDecoder;

struct SoupContentDecoderClass
{
  GObjectClass parentClass;
}

/**
 * Sniffs the mime type of messages.
 * A #SoupContentSniffer tries to detect the actual content type of
 * the files that are being downloaded by looking at some of the data
 * before the class@Message emits its signal@Message::got-headers signal.
 * #SoupContentSniffer implements iface@SessionFeature, so you can add
 * content sniffing to a session with [Soup.Session.addFeature] or
 * [Soup.Session.addFeatureByType].
 */
struct SoupContentSniffer;

struct SoupContentSnifferClass
{
  GObjectClass parentClass;
}

/**
 * Implements HTTP cookies, as described by
 * [RFC 6265](http://tools.ietf.org/html/rfc6265.txt).
 * To have a class@Session handle cookies for your appliction
 * automatically, use a class@CookieJar.
 * @name and @value will be set for all cookies. If the cookie is
 * generated from a string that appears to have no name, then @name
 * will be the empty string.
 * @domain and @path give the host or domain, and path within that
 * host/domain, to restrict this cookie to. If @domain starts with
 * ".", that indicates a domain $(LPAREN)which matches the string after the
 * ".", or any hostname that has @domain as a suffix$(RPAREN). Otherwise, it
 * is a hostname and must match exactly.
 * @expires will be non-%NULL if the cookie uses either the original
 * "expires" attribute, or the newer "max-age" attribute. If @expires
 * is %NULL, it indicates that neither "expires" nor "max-age" was
 * specified, and the cookie expires at the end of the session.
 * If @http_only is set, the cookie should not be exposed to untrusted
 * code $(LPAREN)eg, javascript$(RPAREN), so as to minimize the danger posed by
 * cross-site scripting attacks.
 */
struct SoupCookie;

/**
 * Automatic cookie handling for SoupSession.
 * A #SoupCookieJar stores struct@Cookies and arrange for them to be sent with
 * the appropriate class@Messages. #SoupCookieJar implements
 * iface@SessionFeature, so you can add a cookie jar to a session with
 * [Soup.Session.addFeature] or [Soup.Session.addFeatureByType].
 * Note that the base #SoupCookieJar class does not support any form
 * of long-term cookie persistence.
 */
struct SoupCookieJar
{
  ObjectC parentInstance;
}

struct SoupCookieJarClass
{
  GObjectClass parentClass;

  extern(C) void function(SoupCookieJar* jar) save;

  extern(C) bool function(SoupCookieJar* jar) isPersistent;

  extern(C) void function(SoupCookieJar* jar, SoupCookie* oldCookie, SoupCookie* newCookie) changed;

  void*[6] padding;
}

/**
 * Database-based Cookie Jar.
 * #SoupCookieJarDB is a class@CookieJar that reads cookies from and writes
 * them to a sqlite database in the new Mozilla format.
 * $(LPAREN)This is identical to `SoupCookieJarSqlite` in
 * libsoup-gnome; it has just been moved into libsoup proper, and
 * renamed to avoid conflicting.$(RPAREN)
 */
struct SoupCookieJarDB;

struct SoupCookieJarDBClass
{
  SoupCookieJarClass parentClass;
}

/**
 * Text-file-based $(LPAREN)"cookies.txt"$(RPAREN) Cookie Jar
 * #SoupCookieJarText is a class@CookieJar that reads cookies from and writes
 * them to a text file in format similar to Mozilla's "cookies.txt".
 */
struct SoupCookieJarText;

struct SoupCookieJarTextClass
{
  SoupCookieJarClass parentClass;
}

/**
 * Automatic HTTP Strict Transport Security enforcing for class@Session.
 * A #SoupHSTSEnforcer stores HSTS policies and enforces them when
 * required. #SoupHSTSEnforcer implements iface@SessionFeature, so you
 * can add an HSTS enforcer to a session with
 * [Soup.Session.addFeature] or [Soup.Session.addFeatureByType].
 * #SoupHSTSEnforcer keeps track of all the HTTPS destinations that,
 * when connected to, return the Strict-Transport-Security header with
 * valid values. #SoupHSTSEnforcer will forget those destinations
 * upon expiry or when the server requests it.
 * When the class@Session the #SoupHSTSEnforcer is attached to queues or
 * restarts a message, the #SoupHSTSEnforcer will rewrite the URI to HTTPS if
 * the destination is a known HSTS host and is contacted over an insecure
 * transport protocol $(LPAREN)HTTP$(RPAREN). Users of #SoupHSTSEnforcer are advised to listen
 * to changes in the property@Message:uri property in order to be aware of
 * changes in the message URI.
 * Note that #SoupHSTSEnforcer does not support any form of long-term
 * HSTS policy persistence. See class@HSTSEnforcerDB for a persistent
 * enforcer.
 */
struct SoupHSTSEnforcer
{
  ObjectC parentInstance;
}

/**
 * Class structure for #SoupHSTSEnforcer.
 */
struct SoupHSTSEnforcerClass
{
  /**
   * The parent class.
   */
  GObjectClass parentClass;

  /**
   * The @is_persistent function advertises whether the enforcer is persistent or
   * whether changes made to it will be lost when the underlying class@Session is finished.
   */
  extern(C) bool function(SoupHSTSEnforcer* hstsEnforcer) isPersistent;

  /**
   * The @has_valid_policy function is called to check whether there is a valid
   * policy for the given domain. This method should return %TRUE for #SoupHSTSEnforcer to
   * change the scheme of the #GUri in the #SoupMessage to HTTPS. Implementations might want to
   * chain up to the @has_valid_policy in the parent class to check, for instance, for runtime
   * policies.
   */
  extern(C) bool function(SoupHSTSEnforcer* hstsEnforcer, const(char)* domain) hasValidPolicy;

  /**
   * The class closure for the #SoupHSTSEnforcer::changed signal.
   */
  extern(C) void function(SoupHSTSEnforcer* enforcer, SoupHSTSPolicy* oldPolicy, SoupHSTSPolicy* newPolicy) changed;

  void*[4] padding;
}

/**
 * Persistent HTTP Strict Transport Security enforcer.
 * #SoupHSTSEnforcerDB is a class@HSTSEnforcer that uses a SQLite
 * database as a backend for persistency.
 */
struct SoupHSTSEnforcerDB;

struct SoupHSTSEnforcerDBClass
{
  SoupHSTSEnforcerClass parentClass;
}

/**
 * #SoupHSTSPolicy implements HTTP policies, as described by
 * [RFC 6797](http://tools.ietf.org/html/rfc6797).
 * @domain represents the host that this policy applies to. The domain
 * must be IDNA-canonicalized. [Soup.HSTSPolicy.new_] and related methods
 * will do this for you.
 * @max_age contains the 'max-age' value from the Strict Transport
 * Security header and indicates the time to live of this policy,
 * in seconds.
 * @expires will be non-%NULL if the policy has been set by the host and
 * hence has an expiry time. If @expires is %NULL, it indicates that the
 * policy is a permanent session policy set by the user agent.
 * If @include_subdomains is %TRUE, the Strict Transport Security policy
 * must also be enforced on subdomains of @domain.
 */
struct SoupHSTSPolicy;

/**
 * Debug logging support
 * #SoupLogger watches a class@Session and logs the HTTP traffic that
 * it generates, for debugging purposes. Many applications use an
 * environment variable to determine whether or not to use
 * #SoupLogger, and to determine the amount of debugging output.
 * To use #SoupLogger, first create a logger with [Soup.Logger.new_], optionally
 * configure it with [Soup.Logger.setRequestFilter],
 * [Soup.Logger.setResponseFilter], and [Soup.Logger.setPrinter], and
 * then attach it to a session $(LPAREN)or multiple sessions$(RPAREN) with
 * [Soup.Session.addFeature].
 * By default, the debugging output is sent to `stdout`, and looks something
 * like:
 * ```
 * > POST /unauth HTTP/1.1
 * > Soup-Debug-Timestamp: 1200171744
 * > Soup-Debug: SoupSession 1 $(LPAREN)0x612190$(RPAREN), SoupMessage 1 $(LPAREN)0x617000$(RPAREN), GSocket 1 $(LPAREN)0x612220$(RPAREN)
 * > Host: localhost
 * > Content-Type: text/plain
 * > Connection: close
 * &lt; HTTP/1.1 201 Created
 * &lt; Soup-Debug-Timestamp: 1200171744
 * &lt; Soup-Debug: SoupMessage 1 $(LPAREN)0x617000$(RPAREN)
 * &lt; Date: Sun, 12 Jan 2008 21:02:24 GMT
 * &lt; Content-Length: 0
 * ```
 * The `Soup-Debug-Timestamp` line gives the time $(LPAREN)as a `time_t`$(RPAREN) when the
 * request was sent, or the response fully received.
 * The `Soup-Debug` line gives further debugging information about the
 * class@Session, class@Message, and [Gio.Socket] involved; the hex
 * numbers are the addresses of the objects in question $(LPAREN)which may be useful if
 * you are running in a debugger$(RPAREN). The decimal IDs are simply counters that
 * uniquely identify objects across the lifetime of the #SoupLogger. In
 * particular, this can be used to identify when multiple messages are sent
 * across the same connection.
 * Currently, the request half of the message is logged just before
 * the first byte of the request gets written to the network $(LPAREN)from the
 * signal@Message::starting signal$(RPAREN).
 * The response is logged just after the last byte of the response body is read
 * from the network $(LPAREN)from the signal@Message::got-body or
 * signal@Message::got-informational signal$(RPAREN), which means that the
 * signal@Message::got-headers signal, and anything triggered off it $(LPAREN)such as
 * #SoupMessage::authenticate$(RPAREN) will be emitted *before* the response headers are
 * actually logged.
 * If the response doesn't happen to trigger the signal@Message::got-body nor
 * signal@Message::got-informational signals due to, for example, a
 * cancellation before receiving the last byte of the response body, the
 * response will still be logged on the event of the signal@Message::finished
 * signal.
 */
struct SoupLogger;

struct SoupLoggerClass
{
  GObjectClass parentClass;
}

/**
 * Represents an HTTP message being sent or received.
 * A #SoupMessage represents an HTTP message that is being sent or
 * received.
 * You would create a #SoupMessage with [Soup.Message.new_] or
 * [Soup.Message.newFromUri], set up its fields appropriately, and send it.
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
struct SoupMessage;

/**
 * #SoupMessageBody represents the request or response body of a
 * class@Message.
 * Note that while @length always reflects the full length of the
 * message body, @data is normally %NULL, and will only be filled in
 * after [Soup.MessageBody.flatten] is called. For client-side
 * messages, this automatically happens for the response body after it
 * has been fully read. Likewise, for server-side
 * messages, the request body is automatically filled in after being
 * read.
 * As an added bonus, when @data is filled in, it is always terminated
 * with a `\0` byte $(LPAREN)which is not reflected in @length$(RPAREN).
 */
struct SoupMessageBody
{
  /**
   * the data
   */
  const(ubyte)* data;

  /**
   * length of @data
   */
  long length;
}

struct SoupMessageClass
{
  GObjectClass parentClass;
}

/**
 * The HTTP message headers associated with a request or response.
 */
struct SoupMessageHeaders;

/**
 * An opaque type used to iterate over a %SoupMessageHeaders
 * structure.
 * After intializing the iterator with [Soup.MessageHeadersIter.init_], call
 * [Soup.MessageHeadersIter.next] to fetch data from it.
 * You may not modify the headers while iterating over them.
 */
struct SoupMessageHeadersIter
{
  void*[3] dummy;
}

/**
 * Contains metrics collected while loading a class@Message either from the
 * network or the disk cache.
 * Metrics are not collected by default for a class@Message, you need to add the
 * flag %SOUP_MESSAGE_COLLECT_METRICS to enable the feature.
 * Temporal metrics are expressed as a monotonic time and always start with a
 * fetch start event and finish with response end. All other events are optional.
 * An event can be 0 because it hasn't happened yet, because it's optional or
 * because the load failed before the event reached.
 * Size metrics are expressed in bytes and are updated while the class@Message is
 * being loaded. You can connect to different class@Message signals to get the
 * final result of every value.
 */
struct SoupMessageMetrics;

/**
 * Represents a multipart HTTP message body, parsed according to the
 * syntax of RFC 2046.
 * Of particular interest to HTTP are `multipart/byte-ranges` and
 * `multipart/form-data`,
 * Although the headers of a #SoupMultipart body part will contain the
 * full headers from that body part, libsoup does not interpret them
 * according to MIME rules. For example, each body part is assumed to
 * have "binary" Content-Transfer-Encoding, even if its headers
 * explicitly state otherwise. In other words, don't try to use
 * #SoupMultipart for handling real MIME multiparts.
 */
struct SoupMultipart;

/**
 * Handles streams of multipart messages.
 * This adds support for the multipart responses. For handling the
 * multiple parts the user needs to wrap the [Gio.InputStream] obtained by
 * sending the request with a class@MultipartInputStream and use
 * [Soup.MultipartInputStream.nextPart] before reading. Responses
 * which are not wrapped will be treated like non-multipart responses.
 * Note that although #SoupMultipartInputStream is a [Gio.InputStream],
 * you should not read directly from it, and the results are undefined
 * if you do.
 */
struct SoupMultipartInputStream;

struct SoupMultipartInputStreamClass
{
  GFilterInputStreamClass parentClass;
}

/**
 * Represents a byte range as used in the Range header.
 * If @end is non-negative, then @start and @end represent the bounds
 * of of the range, counting from 0. $(LPAREN)Eg, the first 500 bytes would be
 * represented as @start \= 0 and @end \= 499.$(RPAREN)
 * If @end is -1 and @start is non-negative, then this represents a
 * range starting at @start and ending with the last byte of the
 * requested resource body. $(LPAREN)Eg, all but the first 500 bytes would be
 * @start \= 500, and @end \= -1.$(RPAREN)
 * If @end is -1 and @start is negative, then it represents a "suffix
 * range", referring to the last -@start bytes of the resource body.
 * $(LPAREN)Eg, the last 500 bytes would be @start \= -500 and @end \= -1.$(RPAREN)
 */
struct SoupRange
{
  /**
   * the start of the range
   */
  long start;

  /**
   * the end of the range
   */
  long end;
}

/**
 * A HTTP server.
 * #SoupServer implements a simple HTTP server.
 * To begin, create a server using [Soup.Server.new_]. Add at least one
 * handler by calling [Soup.Server.addHandler] or
 * [Soup.Server.addEarlyHandler]; the handler will be called to
 * process any requests underneath the path you pass. $(LPAREN)If you want all
 * requests to go to the same handler, just pass "/" $(LPAREN)or %NULL$(RPAREN) for
 * the path.$(RPAREN)
 * When a new connection is accepted $(LPAREN)or a new request is started on
 * an existing persistent connection$(RPAREN), the #SoupServer will emit
 * signal@Server::request-started and then begin processing the request
 * as described below, but note that once the message is assigned a
 * status-code, then callbacks after that point will be
 * skipped. Note also that it is not defined when the callbacks happen
 * relative to various class@ServerMessage signals.
 * Once the headers have been read, #SoupServer will check if there is
 * a class@AuthDomain `$(LPAREN)qv$(RPAREN)` covering the Request-URI; if so, and if the
 * message does not contain suitable authorization, then the
 * class@AuthDomain will set a status of %SOUP_STATUS_UNAUTHORIZED on
 * the message.
 * After checking for authorization, #SoupServer will look for "early"
 * handlers $(LPAREN)added with [Soup.Server.addEarlyHandler]$(RPAREN) matching the
 * Request-URI. If one is found, it will be run; in particular, this
 * can be used to connect to signals to do a streaming read of the
 * request body.
 * $(LPAREN)At this point, if the request headers contain `Expect:
 * 100-continue`, and a status code has been set, then
 * #SoupServer will skip the remaining steps and return the response.
 * If the request headers contain `Expect:
 * 100-continue` and no status code has been set,
 * #SoupServer will return a %SOUP_STATUS_CONTINUE status before
 * continuing.$(RPAREN)
 * The server will then read in the response body $(LPAREN)if present$(RPAREN). At
 * this point, if there are no handlers at all defined for the
 * Request-URI, then the server will return %SOUP_STATUS_NOT_FOUND to
 * the client.
 * Otherwise $(LPAREN)assuming no previous step assigned a status to the
 * message$(RPAREN) any "normal" handlers $(LPAREN)added with
 * [Soup.Server.addHandler]$(RPAREN) for the message's Request-URI will be
 * run.
 * Then, if the path has a WebSocket handler registered $(LPAREN)and has
 * not yet been assigned a status$(RPAREN), #SoupServer will attempt to
 * validate the WebSocket handshake, filling in the response and
 * setting a status of %SOUP_STATUS_SWITCHING_PROTOCOLS or
 * %SOUP_STATUS_BAD_REQUEST accordingly.
 * If the message still has no status code at this point $(LPAREN)and has not
 * been paused with [Soup.ServerMessage.pause]$(RPAREN), then it will be
 * given a status of %SOUP_STATUS_INTERNAL_SERVER_ERROR $(LPAREN)because at
 * least one handler ran, but returned without assigning a status$(RPAREN).
 * Finally, the server will emit signal@Server::request-finished $(LPAREN)or
 * signal@Server::request-aborted if an I/O error occurred before
 * handling was completed$(RPAREN).
 * If you want to handle the special "*" URI $(LPAREN)eg, "OPTIONS *"$(RPAREN), you
 * must explicitly register a handler for "*"; the default handler
 * will not be used for that case.
 * If you want to process https connections in addition to $(LPAREN)or instead
 * of$(RPAREN) http connections, you can set the property@Server:tls-certificate
 * property.
 * Once the server is set up, make one or more calls to
 * [Soup.Server.listen], [Soup.Server.listenLocal], or
 * [Soup.Server.listenAll] to tell it where to listen for
 * connections. $(LPAREN)All ports on a #SoupServer use the same handlers; if
 * you need to handle some ports differently, such as returning
 * different data for http and https, you'll need to create multiple
 * `SoupServer`s, or else check the passed-in URI in the handler
 * function.$(RPAREN).
 * #SoupServer will begin processing connections as soon as you return
 * to $(LPAREN)or start$(RPAREN) the main loop for the current thread-default
 * [GLib.MainContext].
 */
struct SoupServer
{
  ObjectC parentInstance;
}

struct SoupServerClass
{
  GObjectClass parentClass;

  extern(C) void function(SoupServer* server, SoupServerMessage* msg) requestStarted;

  extern(C) void function(SoupServer* server, SoupServerMessage* msg) requestRead;

  extern(C) void function(SoupServer* server, SoupServerMessage* msg) requestFinished;

  extern(C) void function(SoupServer* server, SoupServerMessage* msg) requestAborted;

  void*[6] padding;
}

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
struct SoupServerMessage;

struct SoupServerMessageClass
{
  GObjectClass parentClass;
}

/**
 * Soup session state object.
 * #SoupSession is the object that controls client-side HTTP. A
 * #SoupSession encapsulates all of the state that libsoup is keeping
 * on behalf of your program; cached HTTP connections, authentication
 * information, etc. It also keeps track of various global options
 * and features that you are using.
 * Most applications will only need a single #SoupSession; the primary
 * reason you might need multiple sessions is if you need to have
 * multiple independent authentication contexts. $(LPAREN)Eg, you are
 * connecting to a server and authenticating as two different users at
 * different times; the easiest way to ensure that each class@Message
 * is sent with the authentication information you intended is to use
 * one session for the first user, and a second session for the other
 * user.$(RPAREN)
 * Additional #SoupSession functionality is provided by
 * iface@SessionFeature objects, which can be added to a session with
 * [Soup.Session.addFeature] or [Soup.Session.addFeatureByType]
 * For example, class@Logger provides support for
 * logging HTTP traffic, class@ContentDecoder provides support for
 * compressed response handling, and class@ContentSniffer provides
 * support for HTML5-style response body content sniffing.
 * Additionally, subtypes of class@Auth can be added
 * as features, to add support for additional authentication types.
 * All `SoupSession`s are created with a class@AuthManager, and support
 * for %SOUP_TYPE_AUTH_BASIC and %SOUP_TYPE_AUTH_DIGEST. Additionally,
 * sessions using the plain #SoupSession class $(LPAREN)rather than one of its deprecated
 * subtypes$(RPAREN) have a class@ContentDecoder by default.
 * Note that all async methods will invoke their callbacks on the thread-default
 * context at the time of the function call.
 */
struct SoupSession
{
  ObjectC parentInstance;
}

struct SoupSessionClass
{
  GObjectClass parentClass;

  extern(C) void function(SoupSession* session, SoupMessage* msg) requestQueued;

  extern(C) void function(SoupSession* session, SoupMessage* msg) requestUnqueued;

  extern(C) void function() SoupReserved1;

  extern(C) void function() SoupReserved2;

  extern(C) void function() SoupReserved3;

  extern(C) void function() SoupReserved4;

  extern(C) void function() SoupReserved5;

  extern(C) void function() SoupReserved6;

  extern(C) void function() SoupReserved7;

  extern(C) void function() SoupReserved8;
}

/**
 * Interface for miscellaneous class@Session features.
 * #SoupSessionFeature is the interface used by classes that extend
 * the functionality of a class@Session. Some features like HTTP
 * authentication handling are implemented internally via
 * `SoupSessionFeature`s. Other features can be added to the session
 * by the application. $(LPAREN)Eg, class@Logger, class@CookieJar.$(RPAREN)
 * See [Soup.Session.addFeature], etc, to add a feature to a session.
 */
struct SoupSessionFeature;

/**
 * The interface implemented by iface@SessionFeatures.
 */
struct SoupSessionFeatureInterface;

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
struct SoupWebsocketConnection;

/**
 * The abstract base class for class@WebsocketConnection.
 */
struct SoupWebsocketConnectionClass
{
  GObjectClass parentClass;
}

/**
 * A WebSocket extension
 * #SoupWebsocketExtension is the base class for WebSocket extension objects.
 */
struct SoupWebsocketExtension
{
  ObjectC parentInstance;
}

/**
 * The class structure for the #SoupWebsocketExtension.
 */
struct SoupWebsocketExtensionClass
{
  /**
   * the parent class
   */
  GObjectClass parentClass;

  /**
   * the name of the extension
   */
  const(char)* name;

  /**
   * called to configure the extension with the given parameters
   */
  extern(C) bool function(SoupWebsocketExtension* extension, SoupWebsocketConnectionType connectionType, GHashTable* params, GError** _err) configure;

  /**
   * called by the client to build the request header.
   * It should include the parameters string starting with ';'
   */
  extern(C) char* function(SoupWebsocketExtension* extension) getRequestParams;

  /**
   * called by the server to build the response header.
   * It should include the parameters string starting with ';'
   */
  extern(C) char* function(SoupWebsocketExtension* extension) getResponseParams;

  /**
   * called to process the payload data of a message
   * before it's sent. Reserved bits of the header should be changed.
   */
  extern(C) GBytes* function(SoupWebsocketExtension* extension, ubyte* header, GBytes* payload, GError** _err) processOutgoingMessage;

  /**
   * called to process the payload data of a message
   * after it's received. Reserved bits of the header should be cleared.
   */
  extern(C) GBytes* function(SoupWebsocketExtension* extension, ubyte* header, GBytes* payload, GError** _err) processIncomingMessage;

  void*[6] padding;
}

/**
 * A SoupWebsocketExtensionDeflate is a class@WebsocketExtension
 * implementing permessage-deflate $(LPAREN)RFC 7692$(RPAREN).
 * This extension is used by default in a class@Session when class@WebsocketExtensionManager
 * feature is present, and always used by class@Server.
 */
struct SoupWebsocketExtensionDeflate;

struct SoupWebsocketExtensionDeflateClass
{
  SoupWebsocketExtensionClass parentClass;
}

/**
 * SoupWebsocketExtensionManager is the iface@SessionFeature that handles WebSockets
 * extensions for a class@Session.
 * A #SoupWebsocketExtensionManager is added to the session by default, and normally
 * you don't need to worry about it at all. However, if you want to
 * disable WebSocket extensions, you can remove the feature from the
 * session with [Soup.Session.removeFeatureByType] or disable it on
 * individual requests with [Soup.Message.disableFeature].
 */
struct SoupWebsocketExtensionManager;

struct SoupWebsocketExtensionManagerClass
{
  GObjectClass parentClass;
}

alias extern(C) bool function(SoupAuthDomain* domain, SoupServerMessage* msg, const(char)* username, const(char)* password, void* userData) SoupAuthDomainBasicAuthCallback;

alias extern(C) char* function(SoupAuthDomain* domain, SoupServerMessage* msg, const(char)* username, void* userData) SoupAuthDomainDigestAuthCallback;

alias extern(C) bool function(SoupAuthDomain* domain, SoupServerMessage* msg, void* userData) SoupAuthDomainFilter;

alias extern(C) bool function(SoupAuthDomain* domain, SoupServerMessage* msg, const(char)* username, void* userData) SoupAuthDomainGenericAuthCallback;

alias extern(C) SoupLoggerLogLevel function(SoupLogger* logger, SoupMessage* msg, void* userData) SoupLoggerFilter;

alias extern(C) void function(SoupLogger* logger, SoupLoggerLogLevel level, char direction, const(char)* data, void* userData) SoupLoggerPrinter;

alias extern(C) void function(const(char)* name, const(char)* value, void* userData) SoupMessageHeadersForeachFunc;

alias extern(C) void function(SoupServer* server, SoupServerMessage* msg, const(char)* path, GHashTable* query, void* userData) SoupServerCallback;

alias extern(C) void function(SoupServer* server, SoupServerMessage* msg, const(char)* path, SoupWebsocketConnection* connection, void* userData) SoupServerWebsocketCallback;

