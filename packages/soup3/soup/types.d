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
import soup.types;
import soup.websocket_connection;


// Enums
alias CacheType = SoupCacheType;
alias Cacheability = SoupCacheability;
alias CookieJarAcceptPolicy = SoupCookieJarAcceptPolicy;
alias DateFormat = SoupDateFormat;
alias Encoding = SoupEncoding;
alias Expectation = SoupExpectation;
alias HTTPVersion = SoupHTTPVersion;
alias LoggerLogLevel = SoupLoggerLogLevel;
alias MemoryUse = SoupMemoryUse;
alias MessageFlags = SoupMessageFlags;
alias MessageHeadersType = SoupMessageHeadersType;
alias MessagePriority = SoupMessagePriority;
alias SameSitePolicy = SoupSameSitePolicy;
alias ServerListenOptions = SoupServerListenOptions;
alias SessionError = SoupSessionError;
alias Status = SoupStatus;
alias TLDError = SoupTLDError;
alias URIComponent = SoupURIComponent;
alias WebsocketCloseCode = SoupWebsocketCloseCode;
alias WebsocketConnectionType = SoupWebsocketConnectionType;
alias WebsocketDataType = SoupWebsocketDataType;
alias WebsocketError = SoupWebsocketError;
alias WebsocketState = SoupWebsocketState;

// Structs
alias Range = SoupRange;

// Callbacks
alias AuthDomainBasicAuthCallback = bool delegate(AuthDomainBasic domain, ServerMessage msg, string username, string password);
alias AuthDomainDigestAuthCallback = string delegate(AuthDomainDigest domain, ServerMessage msg, string username);
alias AuthDomainFilter = bool delegate(AuthDomain domain, ServerMessage msg);
alias AuthDomainGenericAuthCallback = bool delegate(AuthDomain domain, ServerMessage msg, string username);
alias LoggerFilter = LoggerLogLevel delegate(Logger logger, Message msg);
alias LoggerPrinter = void delegate(Logger logger, LoggerLogLevel level, char direction, string data);
alias MessageHeadersForeachFunc = void delegate(string name, string value);
alias ServerCallback = void delegate(Server server, ServerMessage msg, string path, string[string] query);
alias ServerWebsocketCallback = void delegate(Server server, ServerMessage msg, string path, WebsocketConnection connection);

/**
 * A constant corresponding to 1 day.
 * For use with [Soup.Cookie.new_] and [Soup.Cookie.setMaxAge].
 */
enum COOKIE_MAX_AGE_ONE_DAY = 0;


/**
 * A constant corresponding to 1 hour.
 * For use with [Soup.Cookie.new_] and [Soup.Cookie.setMaxAge].
 */
enum COOKIE_MAX_AGE_ONE_HOUR = 3600;


/**
 * A constant corresponding to 1 week.
 * For use with [Soup.Cookie.new_] and [Soup.Cookie.setMaxAge].
 */
enum COOKIE_MAX_AGE_ONE_WEEK = 0;


/**
 * A constant corresponding to 1 year.
 * For use with [Soup.Cookie.new_] and [Soup.Cookie.setMaxAge].
 */
enum COOKIE_MAX_AGE_ONE_YEAR = 0;


/**
 * A macro containing the value
 * `multipart/form-data`; the MIME type used for
 * posting form data that contains files to be uploaded.
 */
enum FORM_MIME_TYPE_MULTIPART = "multipart/form-data";


/**
 * A macro containing the value
 * `application/x-www-form-urlencoded`; the default
 * MIME type for POSTing HTML form data.
 */
enum FORM_MIME_TYPE_URLENCODED = "application/x-www-form-urlencoded";


/**
 * An expiration date that is always in the past.
 */
enum HSTS_POLICY_MAX_AGE_PAST = 0;


/**
 * The set of #GUriFlags libsoup expects all #GUri to use.
 */
enum HTTP_URI_FLAGS = 482;


/**
 * Like func@get_major_version, but from the headers used at application
 * compile time, rather than from the library linked against at application run
 * time.
 */
enum MAJOR_VERSION = 3;


/**
 * Like func@get_micro_version, but from the headers used at
 * application compile time, rather than from the library linked
 * against at application run time.
 */
enum MICRO_VERSION = 5;


/**
 * Like func@get_minor_version, but from the headers used at
 * application compile time, rather than from the library linked
 * against at application run time.
 */
enum MINOR_VERSION = 4;


/**
 * A macro that should be defined by the user prior to including
 * `libsoup.h`.
 * The definition should be one of the predefined libsoup
 * version macros: %SOUP_VERSION_2_24, %SOUP_VERSION_2_26, ...
 * This macro defines the earliest version of libsoup that the package
 * is required to be able to compile against.
 * If the compiler is configured to warn about the use of deprecated
 * functions, then using functions that were deprecated in version
 * %SOUP_VERSION_MIN_REQUIRED or earlier will cause warnings $(LPAREN)but
 * using functions deprecated in later releases will not$(RPAREN).
 */
enum VERSION_MIN_REQUIRED = 2;

