module gstrtsp.c.types;

public import gid.basictypes;
public import gio.c.types;
public import gst.c.types;
public import gstbase.c.types;
public import gstsdp.c.types;

/**
    Authentication methods, ordered by strength
*/
enum GstRTSPAuthMethod
{
  /**
      no authentication
  */
  none = 0,

  /**
      basic authentication
  */
  basic = 1,

  /**
      digest authentication
  */
  digest = 2,
}

/**
    The possible events for the connection.
*/
enum GstRTSPEvent : uint
{
  /**
      connection is readable
  */
  read = 1,

  /**
      connection is writable
  */
  write = 2,
}

/**
    The possible network families.
*/
enum GstRTSPFamily
{
  /**
      unknown network family
  */
  none = 0,

  /**
      internet
  */
  inet = 1,

  /**
      internet V6
  */
  inet6 = 2,
}

/**
    Enumeration of rtsp header fields
*/
enum GstRTSPHeaderField
{
  /** */
  invalid = 0,

  /** */
  accept = 1,

  /** */
  acceptEncoding = 2,

  /** */
  acceptLanguage = 3,

  /** */
  allow = 4,

  /** */
  authorization = 5,

  /** */
  bandwidth = 6,

  /** */
  blocksize = 7,

  /** */
  cacheControl = 8,

  /** */
  conference = 9,

  /** */
  connection = 10,

  /** */
  contentBase = 11,

  /** */
  contentEncoding = 12,

  /** */
  contentLanguage = 13,

  /** */
  contentLength = 14,

  /** */
  contentLocation = 15,

  /** */
  contentType = 16,

  /** */
  cseq = 17,

  /** */
  date = 18,

  /** */
  expires = 19,

  /** */
  from = 20,

  /** */
  ifModifiedSince = 21,

  /** */
  lastModified = 22,

  /** */
  proxyAuthenticate = 23,

  /** */
  proxyRequire = 24,

  /** */
  public_ = 25,

  /** */
  range = 26,

  /** */
  referer = 27,

  /** */
  require = 28,

  /** */
  retryAfter = 29,

  /** */
  rtpInfo = 30,

  /** */
  scale = 31,

  /** */
  session = 32,

  /** */
  server = 33,

  /** */
  speed = 34,

  /** */
  transport = 35,

  /** */
  unsupported = 36,

  /** */
  userAgent = 37,

  /** */
  via = 38,

  /** */
  wwwAuthenticate = 39,

  /** */
  clientChallenge = 40,

  /** */
  realChallenge1 = 41,

  /** */
  realChallenge2 = 42,

  /** */
  realChallenge3 = 43,

  /** */
  subscribe = 44,

  /** */
  alert = 45,

  /** */
  clientId = 46,

  /** */
  companyId = 47,

  /** */
  guid = 48,

  /** */
  regionData = 49,

  /** */
  maxAsmWidth = 50,

  /** */
  language = 51,

  /** */
  playerStartTime = 52,

  /** */
  location = 53,

  /** */
  etag = 54,

  /** */
  ifMatch = 55,

  /** */
  acceptCharset = 56,

  /** */
  supported = 57,

  /** */
  vary = 58,

  /** */
  xAccelerateStreaming = 59,

  /** */
  xAcceptAuthent = 60,

  /** */
  xAcceptProxyAuthent = 61,

  /** */
  xBroadcastId = 62,

  /** */
  xBurstStreaming = 63,

  /** */
  xNotice = 64,

  /** */
  xPlayerLagTime = 65,

  /** */
  xPlaylist = 66,

  /** */
  xPlaylistChangeNotice = 67,

  /** */
  xPlaylistGenId = 68,

  /** */
  xPlaylistSeekId = 69,

  /** */
  xProxyClientAgent = 70,

  /** */
  xProxyClientVerb = 71,

  /** */
  xRecedingPlaylistchange = 72,

  /** */
  xRtpInfo = 73,

  /** */
  xStartupprofile = 74,

  /** */
  timestamp = 75,

  /** */
  authenticationInfo = 76,

  /** */
  host = 77,

  /** */
  pragma_ = 78,

  /** */
  xServerIpAddress = 79,

  /** */
  xSessioncookie = 80,

  /** */
  rtcpInterval = 81,

  /** */
  keymgmt = 82,

  /** */
  pipelinedRequests = 83,

  /** */
  mediaProperties = 84,

  /** */
  seekStyle = 85,

  /** */
  acceptRanges = 86,

  /** */
  frames = 87,

  /** */
  rateControl = 88,

  /** */
  last = 89,
}

/**
    The different transport methods.
*/
enum GstRTSPLowerTrans : uint
{
  /**
      invalid transport flag
  */
  unknown = 0,

  /**
      stream data over UDP
  */
  udp = 1,

  /**
      stream data over UDP multicast
  */
  udpMcast = 2,

  /**
      stream data over TCP
  */
  tcp = 4,

  /**
      stream data tunneled over HTTP.
  */
  http = 16,

  /**
      encrypt TCP and HTTP with TLS
  */
  tls = 32,
}

/**
    The different supported RTSP methods.
*/
enum GstRTSPMethod : uint
{
  /**
      invalid method
  */
  invalid = 0,

  /**
      the DESCRIBE method
  */
  describe = 1,

  /**
      the ANNOUNCE method
  */
  announce = 2,

  /**
      the GET_PARAMETER method
  */
  getParameter = 4,

  /**
      the OPTIONS method
  */
  options = 8,

  /**
      the PAUSE method
  */
  pause = 16,

  /**
      the PLAY method
  */
  play = 32,

  /**
      the RECORD method
  */
  record = 64,

  /**
      the REDIRECT method
  */
  redirect = 128,

  /**
      the SETUP method
  */
  setup = 256,

  /**
      the SET_PARAMETER method
  */
  setParameter = 512,

  /**
      the TEARDOWN method
  */
  teardown = 1024,

  /**
      the GET method (HTTP).
  */
  get = 2048,

  /**
      the POST method (HTTP).
  */
  post = 4096,
}

/**
    The type of a message.
*/
enum GstRTSPMsgType
{
  /**
      invalid message type
  */
  invalid = 0,

  /**
      RTSP request message
  */
  request = 1,

  /**
      RTSP response message
  */
  response = 2,

  /**
      HTTP request message.
  */
  httpRequest = 3,

  /**
      HTTP response message.
  */
  httpResponse = 4,

  /**
      data message
  */
  data = 5,
}

/**
    The transfer profile to use.
*/
enum GstRTSPProfile : uint
{
  /**
      invalid profile
  */
  unknown = 0,

  /**
      the Audio/Visual profile (RFC 3551)
  */
  avp = 1,

  /**
      the secure Audio/Visual profile (RFC 3711)
  */
  savp = 2,

  /**
      the Audio/Visual profile with feedback (RFC 4585)
  */
  avpf = 4,

  /**
      the secure Audio/Visual profile with feedback (RFC 5124)
  */
  savpf = 8,
}

/**
    Different possible time range units.
*/
enum GstRTSPRangeUnit
{
  /**
      SMPTE timecode
  */
  smpte = 0,

  /**
      29.97 frames per second
  */
  smpte30Drop = 1,

  /**
      25 frames per second
  */
  smpte25 = 2,

  /**
      Normal play time
  */
  npt = 3,

  /**
      Absolute time expressed as ISO 8601 timestamps
  */
  clock = 4,
}

/**
    Result codes from the RTSP functions.
*/
enum GstRTSPResult
{
  /**
      no error
  */
  ok = 0,

  /**
      RTSP request is successful, but was redirected.
  */
  okRedirect = 1,

  /**
      some unspecified error occurred
  */
  error = -1,

  /**
      invalid arguments were provided to a function
  */
  einval = -2,

  /**
      an operation was canceled
  */
  eintr = -3,

  /**
      no memory was available for the operation
  */
  enomem = -4,

  /**
      a host resolve error occurred
  */
  eresolv = -5,

  /**
      function not implemented
  */
  enotimpl = -6,

  /**
      a system error occurred, errno contains more details
  */
  esys = -7,

  /**
      a parsing error occurred
  */
  eparse = -8,

  /**
      windows networking could not start
  */
  ewsastart = -9,

  /**
      windows networking stack has wrong version
  */
  ewsaversion = -10,

  /**
      end-of-file was reached
  */
  eeof = -11,

  /**
      a network problem occurred, h_errno contains more details
  */
  enet = -12,

  /**
      the host is not an IP host
  */
  enotip = -13,

  /**
      a timeout occurred
  */
  etimeout = -14,

  /**
      the tunnel GET request has been performed
  */
  etget = -15,

  /**
      the tunnel POST request has been performed
  */
  etpost = -16,

  /**
      last error
  */
  elast = -17,
}

/**
    The different RTSP states.
*/
enum GstRTSPState
{
  /**
      invalid state
  */
  invalid = 0,

  /**
      initializing
  */
  init_ = 1,

  /**
      ready for operation
  */
  ready = 2,

  /**
      seeking in progress
  */
  seeking = 3,

  /**
      playing
  */
  playing = 4,

  /**
      recording
  */
  recording = 5,
}

/**
    Enumeration of rtsp status codes
*/
enum GstRTSPStatusCode
{
  /** */
  invalid = 0,

  /** */
  continue_ = 100,

  /** */
  ok = 200,

  /** */
  created = 201,

  /** */
  lowOnStorage = 250,

  /** */
  multipleChoices = 300,

  /** */
  movedPermanently = 301,

  /** */
  moveTemporarily = 302,

  /** */
  seeOther = 303,

  /** */
  notModified = 304,

  /** */
  useProxy = 305,

  /**
      RTSP request is temporarily redirected
  */
  redirectTemporarily = 307,

  /**
      RTSP request is permanently redirected
  */
  redirectPermanently = 308,

  /** */
  badRequest = 400,

  /** */
  unauthorized = 401,

  /** */
  paymentRequired = 402,

  /** */
  forbidden = 403,

  /** */
  notFound = 404,

  /** */
  methodNotAllowed = 405,

  /** */
  notAcceptable = 406,

  /** */
  proxyAuthRequired = 407,

  /** */
  requestTimeout = 408,

  /** */
  gone = 410,

  /** */
  lengthRequired = 411,

  /** */
  preconditionFailed = 412,

  /** */
  requestEntityTooLarge = 413,

  /** */
  requestUriTooLarge = 414,

  /** */
  unsupportedMediaType = 415,

  /** */
  parameterNotUnderstood = 451,

  /** */
  conferenceNotFound = 452,

  /** */
  notEnoughBandwidth = 453,

  /** */
  sessionNotFound = 454,

  /** */
  methodNotValidInThisState = 455,

  /** */
  headerFieldNotValidForResource = 456,

  /** */
  invalidRange = 457,

  /** */
  parameterIsReadonly = 458,

  /** */
  aggregateOperationNotAllowed = 459,

  /** */
  onlyAggregateOperationAllowed = 460,

  /** */
  unsupportedTransport = 461,

  /** */
  destinationUnreachable = 462,

  /** */
  keyManagementFailure = 463,

  /** */
  internalServerError = 500,

  /** */
  notImplemented = 501,

  /** */
  badGateway = 502,

  /** */
  serviceUnavailable = 503,

  /** */
  gatewayTimeout = 504,

  /** */
  rtspVersionNotSupported = 505,

  /** */
  optionNotSupported = 551,
}

/**
    Possible time types.
*/
enum GstRTSPTimeType
{
  /**
      seconds
  */
  seconds = 0,

  /**
      now
  */
  now = 1,

  /**
      end
  */
  end = 2,

  /**
      frames and subframes
  */
  frames = 3,

  /**
      UTC time
  */
  utc = 4,
}

/**
    The transfer mode to use.
*/
enum GstRTSPTransMode : uint
{
  /**
      invalid tansport mode
  */
  unknown = 0,

  /**
      transfer RTP data
  */
  rtp = 1,

  /**
      transfer RDT (RealMedia) data
  */
  rdt = 2,
}

/**
    The supported RTSP versions.
*/
enum GstRTSPVersion
{
  /**
      unknown/invalid version
  */
  invalid = 0,

  /**
      version 1.0
  */
  _10 = 16,

  /**
      version 1.1.
  */
  _11 = 17,

  /**
      version 2.0.
  */
  _20 = 32,
}

/**
    RTSP Authentication credentials
*/
struct GstRTSPAuthCredential
{
  /**
      a #GstRTSPAuthMethod
  */
  GstRTSPAuthMethod scheme;

  /**
      A NULL-terminated array of #GstRTSPAuthParam
  */
  GstRTSPAuthParam** params;

  /**
      The authorization for the basic schem
  */
  char* authorization;
}

/**
    RTSP Authentication parameter
*/
struct GstRTSPAuthParam
{
  /**
      The name of the parameter
  */
  char* name;

  /**
      The value of the parameter
  */
  char* value;
}

/**
    This object manages the RTSP connection to the server. It provides function
  to receive and send bytes and messages.
*/
struct GstRTSPConnection;

/**
    This interface is implemented e.g. by the Windows Media Streaming RTSP
   exentension (rtspwms) and the RealMedia RTSP extension (rtspreal).
*/
struct GstRTSPExtension;

/**
    An interface representing RTSP extensions.
*/
struct GstRTSPExtensionInterface
{
  /** */
  GTypeInterface parent;

  /** */
  extern(C) bool function(GstRTSPExtension* ext, GstRTSPMessage* resp) detectServer;

  /** */
  extern(C) GstRTSPResult function(GstRTSPExtension* ext, GstRTSPMessage* req) beforeSend;

  /** */
  extern(C) GstRTSPResult function(GstRTSPExtension* ext, GstRTSPMessage* req, GstRTSPMessage* resp) afterSend;

  /** */
  extern(C) GstRTSPResult function(GstRTSPExtension* ext, GstSDPMessage* sdp, GstStructure* s) parseSdp;

  /** */
  extern(C) GstRTSPResult function(GstRTSPExtension* ext, GstSDPMedia* media) setupMedia;

  /** */
  extern(C) bool function(GstRTSPExtension* ext, GstCaps* caps) configureStream;

  /** */
  extern(C) GstRTSPResult function(GstRTSPExtension* ext, GstRTSPLowerTrans protocols, char** transport) getTransports;

  /** */
  extern(C) GstRTSPResult function(GstRTSPExtension* ext, GstRTSPUrl* url) streamSelect;

  /** */
  extern(C) GstRTSPResult function(GstRTSPExtension* ext, GstRTSPMessage* req, GstRTSPMessage* resp) send;

  /** */
  extern(C) GstRTSPResult function(GstRTSPExtension* ext, GstRTSPMessage* req) receiveRequest;

  /** */
  void*[4] GstReserved;
}

/**
    Provides methods for creating and parsing request, response and data messages.
*/
struct GstRTSPMessage
{
  /**
      the message type
  */
  GstRTSPMsgType type;

  /** */
  /** */
  union TypeDataType
  {
    /** */
    /** */
    struct RequestType
    {
      /** */
      GstRTSPMethod method;

      /** */
      char* uri;

      /** */
      GstRTSPVersion version_;
    }

    RequestType request;

    /** */
    /** */
    struct ResponseType
    {
      /** */
      GstRTSPStatusCode code;

      /** */
      char* reason;

      /** */
      GstRTSPVersion version_;
    }

    ResponseType response;

    /** */
    /** */
    struct DataType
    {
      /** */
      ubyte channel;
    }

    DataType data;
  }

  TypeDataType type_data;

  /** */
  GArray* hdrFields;

  /** */
  ubyte* body_;

  /** */
  uint bodySize;

  /** */
  GstBuffer* bodyBuffer;

  /** */
  void*[3] GstReserved;
}

/**
    Provides helper functions to deal with time ranges.
*/
struct GstRTSPRange
{
  /**
      minimum value of the range
  */
  int min;

  /**
      maximum value of the range
  */
  int max;
}

/**
    A time indication.
*/
struct GstRTSPTime
{
  /**
      the time of the time
  */
  GstRTSPTimeType type;

  /**
      seconds when @type is GST_RTSP_TIME_SECONDS,
              GST_RTSP_TIME_UTC and GST_RTSP_TIME_FRAMES
  */
  double seconds;
}

/**
    Extra fields for a time indication.
*/
struct GstRTSPTime2
{
  /**
      frames and subframes when type in GstRTSPTime is
             GST_RTSP_TIME_FRAMES
  */
  double frames;

  /**
      year when type is GST_RTSP_TIME_UTC
  */
  uint year;

  /**
      month when type is GST_RTSP_TIME_UTC
  */
  uint month;

  /**
      day when type is GST_RTSP_TIME_UTC
  */
  uint day;
}

/**
    A time range.
*/
struct GstRTSPTimeRange
{
  /**
      the time units used
  */
  GstRTSPRangeUnit unit;

  /**
      the minimum interval
  */
  GstRTSPTime min;

  /**
      the maximum interval
  */
  GstRTSPTime max;

  /**
      extra fields in the minimum interval (Since: 1.2)
  */
  GstRTSPTime2 min2;

  /**
      extra fields in the maximum interval (Since: 1.2)
  */
  GstRTSPTime2 max2;
}

/**
    Provides helper functions to deal with RTSP transport strings.
*/
struct GstRTSPTransport
{
  /**
      the transport mode
  */
  GstRTSPTransMode trans;

  /**
      the tansport profile
  */
  GstRTSPProfile profile;

  /**
      the lower transport
  */
  GstRTSPLowerTrans lowerTransport;

  /**
      the destination ip/hostname
  */
  char* destination;

  /**
      the source ip/hostname
  */
  char* source;

  /**
      the number of layers
  */
  uint layers;

  /**
      if play mode was selected
  */
  bool modePlay;

  /**
      if record mode was selected
  */
  bool modeRecord;

  /**
      is append mode was selected
  */
  bool append;

  /**
      the interleave range
  */
  GstRTSPRange interleaved;

  /**
      the time to live for multicast UDP
  */
  uint ttl;

  /**
      the port pair for multicast sessions
  */
  GstRTSPRange port;

  /**
      the client port pair for receiving data. For TCP
      based transports, applications can use this field to store the
      sender and receiver ports of the client.
  */
  GstRTSPRange clientPort;

  /**
      the server port pair for receiving data. For TCP
      based transports, applications can use this field to store the
      sender and receiver ports of the server.
  */
  GstRTSPRange serverPort;

  /**
      the ssrc that the sender/receiver will use
  */
  uint ssrc;

  /** */
  void*[4] GstReserved;
}

/**
    Provides helper functions to handle RTSP urls.
*/
struct GstRTSPUrl
{
  /**
      the transports allowed
  */
  GstRTSPLowerTrans transports;

  /**
      the family
  */
  GstRTSPFamily family;

  /**
      the user
  */
  char* user;

  /**
      the password
  */
  char* passwd;

  /**
      the host
  */
  char* host;

  /**
      the port
  */
  ushort port;

  /**
      the absolute path
  */
  char* abspath;

  /**
      additional query parameters
  */
  char* query;
}

/**
    Opaque RTSP watch object that can be used for asynchronous RTSP
  operations.
*/
struct GstRTSPWatch;

/**
    Callback functions from a #GstRTSPWatch.
*/
struct GstRTSPWatchFuncs
{
  /**
      callback when a message was received
  */
  extern(C) GstRTSPResult function(GstRTSPWatch* watch, GstRTSPMessage* message, void* userData) messageReceived;

  /**
      callback when a message was sent
  */
  extern(C) GstRTSPResult function(GstRTSPWatch* watch, uint id, void* userData) messageSent;

  /**
      callback when the connection is closed
  */
  extern(C) GstRTSPResult function(GstRTSPWatch* watch, void* userData) closed;

  /**
      callback when an error occurred
  */
  extern(C) GstRTSPResult function(GstRTSPWatch* watch, GstRTSPResult result, void* userData) error;

  /**
      a client started a tunneled connection. The tunnelid of the
      connection must be saved.
  */
  extern(C) GstRTSPStatusCode function(GstRTSPWatch* watch, void* userData) tunnelStart;

  /**
      a client finished a tunneled connection. In this callback
      you usually pair the tunnelid of this connection with the saved one using
      [gstrtsp.rtspconnection.RTSPConnection.doTunnel].
  */
  extern(C) GstRTSPResult function(GstRTSPWatch* watch, void* userData) tunnelComplete;

  /**
      callback when an error occurred with more information than
      the @error callback.
  */
  extern(C) GstRTSPResult function(GstRTSPWatch* watch, GstRTSPResult result, GstRTSPMessage* message, uint id, void* userData) errorFull;

  /**
      callback when the post connection of a tunnel is closed.
  */
  extern(C) GstRTSPResult function(GstRTSPWatch* watch, void* userData) tunnelLost;

  /**
      callback when an HTTP response to the GET request
      is about to be sent for a tunneled connection. The response can be
      modified in the callback. Since: 1.4.
  */
  extern(C) GstRTSPResult function(GstRTSPWatch* watch, GstRTSPMessage* request, GstRTSPMessage* response, void* userData) tunnelHttpResponse;

  /** */
  void*[3] GstReserved;
}

alias extern(C) bool function(GTlsConnection* conn, GTlsCertificate* peerCert, GTlsCertificateFlags errors, void* userData) GstRTSPConnectionAcceptCertificateFunc;

