module gstrtp.c.types;

public import gid.basictypes;
public import gst.c.types;
public import gstbase.c.types;

/**
    Different types of feedback messages.
*/
enum GstRTCPFBType
{
  /**
      Invalid type
  */
  fbTypeInvalid = 0,

  /**
      Generic NACK
  */
  rtpfbTypeNack = 1,

  /**
      Temporary Maximum Media Stream Bit Rate Request
  */
  rtpfbTypeTmmbr = 3,

  /**
      Temporary Maximum Media Stream Bit Rate
       Notification
  */
  rtpfbTypeTmmbn = 4,

  /**
      Request an SR packet for early
       synchronization
  */
  rtpfbTypeRtcpSrReq = 5,

  /** */
  rtpfbTypeTwcc = 15,

  /**
      Picture Loss Indication
  */
  psfbTypePli = 1,

  /**
      Slice Loss Indication
  */
  psfbTypeSli = 2,

  /**
      Reference Picture Selection Indication
  */
  psfbTypeRpsi = 3,

  /**
      Application layer Feedback
  */
  psfbTypeAfb = 15,

  /**
      Full Intra Request Command
  */
  psfbTypeFir = 4,

  /**
      Temporal-Spatial Trade-off Request
  */
  psfbTypeTstr = 5,

  /**
      Temporal-Spatial Trade-off Notification
  */
  psfbTypeTstn = 6,

  /**
      Video Back Channel Message
  */
  psfbTypeVbcn = 7,
}

/**
    Different types of SDES content.
*/
enum GstRTCPSDESType
{
  /**
      Invalid SDES entry
  */
  invalid = -1,

  /**
      End of SDES list
  */
  end = 0,

  /**
      Canonical name
  */
  cname = 1,

  /**
      User name
  */
  name = 2,

  /**
      User's electronic mail address
  */
  email = 3,

  /**
      User's phone number
  */
  phone = 4,

  /**
      Geographic user location
  */
  loc = 5,

  /**
      Name of application or tool
  */
  tool = 6,

  /**
      Notice about the source
  */
  note = 7,

  /**
      Private extensions
  */
  priv = 8,

  /**
      H.323 callable address
  */
  h323Caddr = 9,

  /**
      Application Specific Identifier (RFC6776)
  */
  apsi = 10,

  /**
      Reporting Group Identifier (RFC8861)
  */
  rgrp = 11,

  /**
      RtpStreamId SDES item (RFC8852).
  */
  rtpStreamId = 12,

  /**
      RepairedRtpStreamId SDES item (RFC8852).
  */
  repairedRtpStreamId = 13,

  /**
      CLUE CaptId (RFC8849)
  */
  ccid = 14,

  /**
      MID SDES item (RFC8843).
  */
  mid = 15,
}

/**
    Different RTCP packet types.
*/
enum GstRTCPType
{
  /**
      Invalid type
  */
  invalid = 0,

  /**
      Sender report
  */
  sr = 200,

  /**
      Receiver report
  */
  rr = 201,

  /**
      Source description
  */
  sdes = 202,

  /**
      Goodbye
  */
  bye = 203,

  /**
      Application defined
  */
  app = 204,

  /**
      Transport layer feedback.
  */
  rtpfb = 205,

  /**
      Payload-specific feedback.
  */
  psfb = 206,

  /**
      Extended report.
  */
  xr = 207,
}

/**
    Types of RTCP Extended Reports, those are defined in RFC 3611 and other RFCs
  according to the [IANA registry](https://www.iana.org/assignments/rtcp-xr-block-types/rtcp-xr-block-types.xhtml).
*/
enum GstRTCPXRType
{
  /**
      Invalid XR Report Block
  */
  invalid = -1,

  /**
      Loss RLE Report Block
  */
  lrle = 1,

  /**
      Duplicate RLE Report Block
  */
  drle = 2,

  /**
      Packet Receipt Times Report Block
  */
  prt = 3,

  /**
      Receiver Reference Time Report Block
  */
  rrt = 4,

  /**
      Delay since the last Receiver Report
  */
  dlrr = 5,

  /**
      Statistics Summary Report Block
  */
  ssumm = 6,

  /**
      VoIP Metrics Report Block
  */
  voipMetrics = 7,
}

/**
    Additional RTP buffer flags. These flags can potentially be used on any
  buffers carrying RTP packets.
  
  Note that these are only valid for #GstCaps of type: application/x-rtp (x-rtcp).
  They can conflict with other extended buffer flags.
*/
enum GstRTPBufferFlags : uint
{
  /**
      The #GstBuffer was once wrapped
              in a retransmitted packet as specified by RFC 4588.
  */
  retransmission = 1048576,

  /**
      The packet represents redundant RTP packet.
              The flag is used in gstrtpstorage to be able to hold the packetback
              and use it only for recovery from packet loss.
              Since: 1.14
  */
  redundant = 2097152,

  /**
      Offset to define more flags.
  */
  last = 268435456,
}

/**
    Additional mapping flags for [gstrtp.rtpbuffer.RTPBuffer.map].
*/
enum GstRTPBufferMapFlags : uint
{
  /**
      Skip mapping and validation of RTP
              padding and RTP pad count when present. Useful for buffers where
              the padding may be encrypted.
  */
  skipPadding = 65536,

  /**
      Offset to define more flags
  */
  last = 16777216,
}

/**
    Direction to which to apply the RTP Header Extension
*/
enum GstRTPHeaderExtensionDirection : uint
{
  /**
      Neither send nor
    receive RTP Header Extensions
  */
  inactive = 0,

  /**
      Only send RTP Header
    Extensions @GST_RTP_HEADER_EXTENSION_DIRECTION_RECVONLY: Only
    receive RTP Header Extensions
  */
  sendonly = 1,

  /** */
  recvonly = 2,

  /**
      Send and receive RTP
    Header Extensions ext
  */
  sendrecv = 3,

  /**
      RTP header extension
    direction is inherited from the stream
  */
  inherited = 4,
}

/**
    Flags that apply to a RTP Audio/Video header extension.
*/
enum GstRTPHeaderExtensionFlags : uint
{
  /**
      The one byte rtp extension header.
                 1-16 data bytes per extension with a maximum of
                 14 extension ids in total.
  */
  oneByte = 1,

  /**
      The two byte rtp extension header.
                 256 data bytes per extension with a maximum of 255 (or 256
                 including appbits) extensions in total.
  */
  twoByte = 2,
}

/**
    Standard predefined fixed payload types.
  
  The official list is at:
  http://www.iana.org/assignments/rtp-parameters
  
  Audio:
  reserved: 19
  unassigned: 20-23,
  
  Video:
  unassigned: 24, 27, 29, 30, 35-71, 77-95
  Reserved for RTCP conflict avoidance: 72-76
*/
enum GstRTPPayload
{
  /**
      ITU-T G.711. mu-law audio (RFC 3551)
  */
  pcmu = 0,

  /**
      RFC 3551 says reserved
  */
  _1016 = 1,

  /**
      RFC 3551 says reserved
  */
  g721 = 2,

  /**
      GSM audio
  */
  gsm = 3,

  /**
      ITU G.723.1 audio
  */
  g723 = 4,

  /**
      IMA ADPCM wave type (RFC 3551)
  */
  dvi48000 = 5,

  /**
      IMA ADPCM wave type (RFC 3551)
  */
  dvi416000 = 6,

  /**
      experimental linear predictive encoding
  */
  lpc = 7,

  /**
      ITU-T G.711 A-law audio (RFC 3551)
  */
  pcma = 8,

  /**
      ITU-T G.722 (RFC 3551)
  */
  g722 = 9,

  /**
      stereo PCM
  */
  l16Stereo = 10,

  /**
      mono PCM
  */
  l16Mono = 11,

  /**
      EIA & TIA standard IS-733
  */
  qcelp = 12,

  /**
      Comfort Noise (RFC 3389)
  */
  cn = 13,

  /**
      Audio MPEG 1-3.
  */
  mpa = 14,

  /**
      ITU-T G.728 Speech coder (RFC 3551)
  */
  g728 = 15,

  /**
      IMA ADPCM wave type (RFC 3551)
  */
  dvi411025 = 16,

  /**
      IMA ADPCM wave type (RFC 3551)
  */
  dvi422050 = 17,

  /**
      ITU-T G.729 Speech coder (RFC 3551)
  */
  g729 = 18,

  /**
      See RFC 2029
  */
  cellb = 25,

  /**
      ISO Standards 10918-1 and 10918-2 (RFC 2435)
  */
  jpeg = 26,

  /**
      nv encoding by Ron Frederick
  */
  nv = 28,

  /**
      ITU-T Recommendation H.261 (RFC 2032)
  */
  h261 = 31,

  /**
      Video MPEG 1 & 2 (RFC 2250)
  */
  mpv = 32,

  /**
      MPEG-2 transport stream (RFC 2250)
  */
  mp2t = 33,

  /**
      Video H263 (RFC 2190)
  */
  h263 = 34,
}

/**
    The transfer profile to use.
*/
enum GstRTPProfile
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
  avpf = 3,

  /**
      the secure Audio/Visual profile with feedback (RFC 5124)
  */
  savpf = 4,
}

/**
    Note: The API in this module is not yet declared stable.
  
  The GstRTPCBuffer helper functions makes it easy to parse and create regular
  #GstBuffer objects that contain compound RTCP packets. These buffers are typically
  of 'application/x-rtcp' #GstCaps.
  
  An RTCP buffer consists of 1 or more #GstRTCPPacket structures that you can
  retrieve with [gstrtp.rtcpbuffer.RTCPBuffer.getFirstPacket]. #GstRTCPPacket acts as a pointer
  into the RTCP buffer; you can move to the next packet with
  [gstrtp.rtcppacket.RTCPPacket.moveToNext].
*/
struct GstRTCPBuffer
{
  /** */
  GstBuffer* buffer;

  /** */
  GstMapInfo map;
}

/**
    Data structure that points to a packet at @offset in @buffer.
  The size of the structure is made public to allow stack allocations.
*/
struct GstRTCPPacket
{
  /**
      pointer to RTCP buffer
  */
  GstRTCPBuffer* rtcp;

  /**
      offset of packet in buffer data
  */
  uint offset;

  /** */
  bool padding;

  /** */
  ubyte count;

  /** */
  GstRTCPType type;

  /** */
  ushort length;

  /** */
  uint itemOffset;

  /** */
  uint itemCount;

  /** */
  uint entryOffset;
}

/**
    Provides a base class for audio RTP payloaders for frame or sample based
  audio codecs (constant bitrate)
  
  This class derives from GstRTPBasePayload. It can be used for payloading
  audio codecs. It will only work with constant bitrate codecs. It supports
  both frame based and sample based codecs. It takes care of packing up the
  audio data into RTP packets and filling up the headers accordingly. The
  payloading is done based on the maximum MTU (mtu) and the maximum time per
  packet (max-ptime). The general idea is to divide large data buffers into
  smaller RTP packets. The RTP packet size is the minimum of either the MTU,
  max-ptime (if set) or available data. The RTP packet size is always larger or
  equal to min-ptime (if set). If min-ptime is not set, any residual data is
  sent in a last RTP packet. In the case of frame based codecs, the resulting
  RTP packets always contain full frames.
  
  ## Usage
  
  To use this base class, your child element needs to call either
  [gstrtp.rtpbase_audio_payload.RTPBaseAudioPayload.setFrameBased] or
  [gstrtp.rtpbase_audio_payload.RTPBaseAudioPayload.setSampleBased]. This is usually done in the
  element's `_init()` function. Then, the child element must call either
  [gstrtp.rtpbase_audio_payload.RTPBaseAudioPayload.setFrameOptions],
  [gstrtp.rtpbase_audio_payload.RTPBaseAudioPayload.setSampleOptions] or
  gst_rtp_base_audio_payload_set_samplebits_options. Since
  GstRTPBaseAudioPayload derives from GstRTPBasePayload, the child element
  must set any variables or call/override any functions required by that base
  class. The child element does not need to override any other functions
  specific to GstRTPBaseAudioPayload.
*/
struct GstRTPBaseAudioPayload
{
  /** */
  GstRTPBasePayload payload;

  /** */
  GstRTPBaseAudioPayloadPrivate* priv;

  /** */
  GstClockTime baseTs;

  /** */
  int frameSize;

  /** */
  int frameDuration;

  /** */
  int sampleSize;

  /** */
  void*[4] GstReserved;
}

/**
    Base class for audio RTP payloader.
*/
struct GstRTPBaseAudioPayloadClass
{
  /**
      the parent class
  */
  GstRTPBasePayloadClass parentClass;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstRTPBaseAudioPayloadPrivate;

/**
    Provides a base class for RTP depayloaders
  
  In order to handle RTP header extensions correctly if the
  depayloader aggregates multiple RTP packet payloads into one output
  buffer this class provides the function
  [gstrtp.rtpbase_depayload.RTPBaseDepayload.setAggregateHdrextEnabled]. If the
  aggregation is enabled the virtual functions
  @GstRTPBaseDepayload.process or
  @GstRTPBaseDepayload.process_rtp_packet must tell the base class
  what happens to the current RTP packet. By default the base class
  assumes that the packet payload is used with the next output
  buffer.
  
  If the RTP packet will not be used with an output buffer
  [gstrtp.rtpbase_depayload.RTPBaseDepayload.dropped] must be called. A typical
  situation would be if we are waiting for a keyframe.
  
  If the RTP packet will be used but not with the current output
  buffer but with the next one [gstrtp.rtpbase_depayload.RTPBaseDepayload.delayed] must
  be called. This may happen if the current RTP packet signals the
  start of a new output buffer and the currently processed output
  buffer will be pushed first. The undelay happens implicitly once
  the current buffer has been pushed or
  [gstrtp.rtpbase_depayload.RTPBaseDepayload.flush] has been called.
  
  If [gstrtp.rtpbase_depayload.RTPBaseDepayload.flush] is called all RTP packets that
  have not been dropped since the last output buffer are dropped,
  e.g. if an output buffer is discarded due to malformed data. This
  may or may not include the current RTP packet depending on the 2nd
  parameter @keep_current.
  
  Be aware that in case [gstrtp.rtpbase_depayload.RTPBaseDepayload.pushList] is used
  each buffer will see the same list of RTP header extensions.
*/
struct GstRTPBaseDepayload
{
  /** */
  GstElement parent;

  /** */
  GstPad* sinkpad;

  /** */
  GstPad* srcpad;

  /** */
  uint clockRate;

  /** */
  GstSegment segment;

  /** */
  bool needNewsegment;

  /** */
  GstRTPBaseDepayloadPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/**
    Base class for RTP depayloaders.
*/
struct GstRTPBaseDepayloadClass
{
  /**
      the parent class
  */
  GstElementClass parentClass;

  /**
      configure the depayloader
  */
  extern(C) bool function(GstRTPBaseDepayload* filter, GstCaps* caps) setCaps;

  /**
      process incoming rtp packets. Subclass must implement either
      this method or @process_rtp_packet to process incoming rtp packets.
      If the child returns a buffer without a valid timestamp, the timestamp
      of the provided buffer will be applied to the result buffer and the
      buffer will be pushed. If this function returns null, nothing is pushed.
  */
  extern(C) GstBuffer* function(GstRTPBaseDepayload* base, GstBuffer* in_) process;

  /**
      signal the depayloader about packet loss
  */
  extern(C) bool function(GstRTPBaseDepayload* filter, GstEvent* event) packetLost;

  /**
      custom event handling
  */
  extern(C) bool function(GstRTPBaseDepayload* filter, GstEvent* event) handleEvent;

  /**
      Same as the process virtual function, but slightly more
    efficient, since it is passed the rtp buffer structure that has already
    been mapped (with GST_MAP_READ) by the base class and thus does not have
    to be mapped again by the subclass. Can be used by the subclass to process
    incoming rtp packets. If the subclass returns a buffer without a valid
    timestamp, the timestamp of the input buffer will be applied to the result
    buffer and the output buffer will be pushed out. If this function returns
    null, nothing is pushed out. Since: 1.6.
  */
  extern(C) GstBuffer* function(GstRTPBaseDepayload* base, GstRTPBuffer* rtpBuffer) processRtpPacket;

  /** */
  void*[3] GstReserved;
}

/** */
struct GstRTPBaseDepayloadPrivate;

/**
    Provides a base class for RTP payloaders
*/
struct GstRTPBasePayload
{
  /** */
  GstElement element;

  /** */
  GstPad* sinkpad;

  /** */
  GstPad* srcpad;

  /** */
  uint tsBase;

  /** */
  ushort seqnumBase;

  /** */
  char* media;

  /** */
  char* encodingName;

  /** */
  bool dynamic;

  /** */
  uint clockRate;

  /** */
  int tsOffset;

  /** */
  uint timestamp;

  /** */
  short seqnumOffset;

  /** */
  ushort seqnum;

  /** */
  long maxPtime;

  /** */
  uint pt;

  /** */
  uint ssrc;

  /** */
  uint currentSsrc;

  /** */
  uint mtu;

  /** */
  GstSegment segment;

  /** */
  ulong minPtime;

  /** */
  ulong ptime;

  /** */
  ulong ptimeMultiple;

  /** */
  GstRTPBasePayloadPrivate* priv;

  /** */
  void*[4] GstReserved;
}

/**
    Base class for audio RTP payloader.
*/
struct GstRTPBasePayloadClass
{
  /**
      the parent class
  */
  GstElementClass parentClass;

  /**
      get desired caps
  */
  extern(C) GstCaps* function(GstRTPBasePayload* payload, GstPad* pad, GstCaps* filter) getCaps;

  /**
      configure the payloader
  */
  extern(C) bool function(GstRTPBasePayload* payload, GstCaps* caps) setCaps;

  /**
      process data
  */
  extern(C) GstFlowReturn function(GstRTPBasePayload* payload, GstBuffer* buffer) handleBuffer;

  /**
      custom event handling on the sinkpad
  */
  extern(C) bool function(GstRTPBasePayload* payload, GstEvent* event) sinkEvent;

  /**
      custom event handling on the srcpad
  */
  extern(C) bool function(GstRTPBasePayload* payload, GstEvent* event) srcEvent;

  /**
      custom query handling
  */
  extern(C) bool function(GstRTPBasePayload* payload, GstPad* pad, GstQuery* query) query;

  /** */
  void*[4] GstReserved;
}

/** */
struct GstRTPBasePayloadPrivate;

/**
    The GstRTPBuffer helper functions makes it easy to parse and create regular
  #GstBuffer objects that contain RTP payloads. These buffers are typically of
  'application/x-rtp' #GstCaps.
*/
struct GstRTPBuffer
{
  /**
      pointer to RTP buffer
  */
  GstBuffer* buffer;

  /**
      internal state
  */
  uint state;

  /**
      array of data
  */
  void*[4] data;

  /**
      array of size
  */
  size_t[4] size;

  /**
      array of #GstMapInfo
  */
  GstMapInfo[4] map;
}

/**
    Instance struct for a RTP Audio/Video header extension.
*/
struct GstRTPHeaderExtension
{
  /**
      the parent #GObject
  */
  GstElement parent;

  /** */
  void*[4] GstReserved;
}

/**
    Base class for RTP Header extensions.
*/
struct GstRTPHeaderExtensionClass
{
  /**
      the parent class
  */
  GstElementClass parentClass;

  /**
      retrieve the supported flags
  */
  extern(C) GstRTPHeaderExtensionFlags function(GstRTPHeaderExtension* ext) getSupportedFlags;

  /**
      retrieve the maximum size for this extension based on the
        information available from input_meta.  Implementations should attempt
        to provide as accurate information as possible as the returned value
        will be used to control the amount of possible data in the payload.
        Implementations must return the maximum as the allocated size for
        writing the extension will be at least the size of the returned value.
        Return the amount of data read or <0 on failure.
  */
  extern(C) size_t function(GstRTPHeaderExtension* ext, const(GstBuffer)* inputMeta) getMaxSize;

  /**
      write into @data the information for this extension.  Various
        information is provided to help writing extensions in particular cases.
  */
  extern(C) ptrdiff_t function(GstRTPHeaderExtension* ext, const(GstBuffer)* inputMeta, GstRTPHeaderExtensionFlags writeFlags, GstBuffer* output, ubyte* data, size_t size) write;

  /**
      read from a rtp payloaded buffer and extract the extension
        information, optionally adding some meta onto the output buffer.
  */
  extern(C) bool function(GstRTPHeaderExtension* ext, GstRTPHeaderExtensionFlags readFlags, const(ubyte)* data, size_t size, GstBuffer* buffer) read;

  /**
      read any information from sink caps that the header
        extension needs for its function.
  */
  extern(C) bool function(GstRTPHeaderExtension* ext, const(GstCaps)* caps) setNonRtpSinkCaps;

  /**
      update depayloader non-RTP (depayloaded) caps with
        the information parsed from RTP header.
  */
  extern(C) bool function(GstRTPHeaderExtension* ext, GstCaps* caps) updateNonRtpSrcCaps;

  /**
      set the necessary attributes that may be signaled e.g. with
        an SDP.
  */
  extern(C) bool function(GstRTPHeaderExtension* ext, GstRTPHeaderExtensionDirection direction, const(char)* attributes) setAttributes;

  /**
      write the necessary caps field/s for the configured
        attributes e.g. as signalled with SDP.
  */
  extern(C) bool function(GstRTPHeaderExtension* ext, GstCaps* caps) setCapsFromAttributes;

  /** */
  void*[20] GstReserved;
}

/**
    Structure holding default payload type information.
*/
struct GstRTPPayloadInfo
{
  /**
      payload type, -1 means dynamic
  */
  ubyte payloadType;

  /**
      the media type(s), usually "audio", "video", "application", "text",
    "message".
  */
  const(char)* media;

  /**
      the encoding name of @pt
  */
  const(char)* encodingName;

  /**
      default clock rate, 0 = unknown/variable
  */
  uint clockRate;

  /**
      encoding parameters. For audio this is the number of
    channels. NULL = not applicable.
  */
  const(char)* encodingParameters;

  /**
      the bitrate of the media. 0 = unknown/variable.
  */
  uint bitrate;

  /** */
  void*[4] GstReserved;
}

/**
    Meta describing the source(s) of the buffer.
*/
struct GstRTPSourceMeta
{
  /**
      parent #GstMeta
  */
  GstMeta meta;

  /**
      the SSRC
  */
  uint ssrc;

  /**
      whether @ssrc is set and valid
  */
  bool ssrcValid;

  /**
      pointer to the CSRCs
  */
  uint[15] csrc;

  /**
      number of elements in @csrc
  */
  uint csrcCount;
}

