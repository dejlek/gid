/// Module for [RTSPTransport] class
module gstrtsp.rtsptransport;

import gid.gid;
import gstrtsp.c.functions;
import gstrtsp.c.types;
import gstrtsp.rtsprange;
import gstrtsp.types;

/**
    Provides helper functions to deal with RTSP transport strings.
*/
class RTSPTransport
{
  GstRTSPTransport cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstRtsp.RTSPTransport");

    cInstance = *cast(GstRTSPTransport*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gstrtsp.types.RTSPTransMode trans()
  {
    return cast(gstrtsp.types.RTSPTransMode)(cast(GstRTSPTransport*)cPtr).trans;
  }

  @property void trans(gstrtsp.types.RTSPTransMode propval)
  {
    (cast(GstRTSPTransport*)cPtr).trans = cast(GstRTSPTransMode)propval;
  }

  @property gstrtsp.types.RTSPProfile profile()
  {
    return cast(gstrtsp.types.RTSPProfile)(cast(GstRTSPTransport*)cPtr).profile;
  }

  @property void profile(gstrtsp.types.RTSPProfile propval)
  {
    (cast(GstRTSPTransport*)cPtr).profile = cast(GstRTSPProfile)propval;
  }

  @property gstrtsp.types.RTSPLowerTrans lowerTransport()
  {
    return cast(gstrtsp.types.RTSPLowerTrans)(cast(GstRTSPTransport*)cPtr).lowerTransport;
  }

  @property void lowerTransport(gstrtsp.types.RTSPLowerTrans propval)
  {
    (cast(GstRTSPTransport*)cPtr).lowerTransport = cast(GstRTSPLowerTrans)propval;
  }

  @property string destination()
  {
    return cToD!(string)(cast(void*)(cast(GstRTSPTransport*)cPtr).destination);
  }

  @property void destination(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstRTSPTransport*)cPtr).destination);
    dToC(propval, cast(void*)&(cast(GstRTSPTransport*)cPtr).destination);
  }

  @property string source()
  {
    return cToD!(string)(cast(void*)(cast(GstRTSPTransport*)cPtr).source);
  }

  @property void source(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstRTSPTransport*)cPtr).source);
    dToC(propval, cast(void*)&(cast(GstRTSPTransport*)cPtr).source);
  }

  @property uint layers()
  {
    return (cast(GstRTSPTransport*)cPtr).layers;
  }

  @property void layers(uint propval)
  {
    (cast(GstRTSPTransport*)cPtr).layers = propval;
  }

  @property bool modePlay()
  {
    return (cast(GstRTSPTransport*)cPtr).modePlay;
  }

  @property void modePlay(bool propval)
  {
    (cast(GstRTSPTransport*)cPtr).modePlay = propval;
  }

  @property bool modeRecord()
  {
    return (cast(GstRTSPTransport*)cPtr).modeRecord;
  }

  @property void modeRecord(bool propval)
  {
    (cast(GstRTSPTransport*)cPtr).modeRecord = propval;
  }

  @property bool append()
  {
    return (cast(GstRTSPTransport*)cPtr).append;
  }

  @property void append(bool propval)
  {
    (cast(GstRTSPTransport*)cPtr).append = propval;
  }

  @property gstrtsp.rtsprange.RTSPRange interleaved()
  {
    return new gstrtsp.rtsprange.RTSPRange(cast(GstRTSPRange*)&(cast(GstRTSPTransport*)cPtr).interleaved);
  }

  @property uint ttl()
  {
    return (cast(GstRTSPTransport*)cPtr).ttl;
  }

  @property void ttl(uint propval)
  {
    (cast(GstRTSPTransport*)cPtr).ttl = propval;
  }

  @property gstrtsp.rtsprange.RTSPRange port()
  {
    return new gstrtsp.rtsprange.RTSPRange(cast(GstRTSPRange*)&(cast(GstRTSPTransport*)cPtr).port);
  }

  @property gstrtsp.rtsprange.RTSPRange clientPort()
  {
    return new gstrtsp.rtsprange.RTSPRange(cast(GstRTSPRange*)&(cast(GstRTSPTransport*)cPtr).clientPort);
  }

  @property gstrtsp.rtsprange.RTSPRange serverPort()
  {
    return new gstrtsp.rtsprange.RTSPRange(cast(GstRTSPRange*)&(cast(GstRTSPTransport*)cPtr).serverPort);
  }

  @property uint ssrc()
  {
    return (cast(GstRTSPTransport*)cPtr).ssrc;
  }

  @property void ssrc(uint propval)
  {
    (cast(GstRTSPTransport*)cPtr).ssrc = propval;
  }

  /**
      Convert transport into a string that can be used to signal the transport in
      an RTSP SETUP response.
      Returns: a string describing the RTSP transport
        or null when the transport is invalid.
  */
  string asText()
  {
    char* _cretval;
    _cretval = gst_rtsp_transport_as_text(cast(GstRTSPTransport*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Get the media type of transport. This media type is typically
      used to generate #GstCaps events.
  
      Params:
        mediaType = media type of transport
      Returns: #GST_RTSP_OK.
  */
  gstrtsp.types.RTSPResult getMediaType(out string mediaType)
  {
    GstRTSPResult _cretval;
    char* _mediaType;
    _cretval = gst_rtsp_transport_get_media_type(cast(GstRTSPTransport*)cPtr, &_mediaType);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    mediaType = _mediaType.fromCString(No.Free);
    return _retval;
  }

  /**
      Get the #GstElement that can handle the buffers transported over trans.
      
      It is possible that there are several managers available, use option to
      selected one.
      
      manager will contain an element name or null when no manager is
      needed/available for trans.
  
      Params:
        trans = a #GstRTSPTransMode
        manager = location to hold the result
        option = option index.
      Returns: #GST_RTSP_OK.
  */
  static gstrtsp.types.RTSPResult getManager(gstrtsp.types.RTSPTransMode trans, out string manager, uint option)
  {
    GstRTSPResult _cretval;
    char* _manager;
    _cretval = gst_rtsp_transport_get_manager(trans, &_manager, option);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    manager = _manager.fromCString(No.Free);
    return _retval;
  }

  /**
      Get the mime type of the transport mode trans. This mime type is typically
      used to generate #GstCaps events.
  
      Params:
        trans = a #GstRTSPTransMode
        mime = location to hold the result
      Returns: #GST_RTSP_OK.
  
      Deprecated: This functions only deals with the GstRTSPTransMode and only
           returns the mime type for #GST_RTSP_PROFILE_AVP. Use
           [gstrtsp.rtsptransport.RTSPTransport.getMediaType] instead.
  */
  static gstrtsp.types.RTSPResult getMime(gstrtsp.types.RTSPTransMode trans, out string mime)
  {
    GstRTSPResult _cretval;
    char* _mime;
    _cretval = gst_rtsp_transport_get_mime(trans, &_mime);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    mime = _mime.fromCString(No.Free);
    return _retval;
  }

  /**
      Initialize transport so that it can be used.
  
      Params:
        transport = a #GstRTSPTransport
      Returns: #GST_RTSP_OK.
  */
  static gstrtsp.types.RTSPResult init_(out gstrtsp.rtsptransport.RTSPTransport transport)
  {
    GstRTSPResult _cretval;
    GstRTSPTransport _transport;
    _cretval = gst_rtsp_transport_init(&_transport);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    transport = new gstrtsp.rtsptransport.RTSPTransport(cast(void*)&_transport);
    return _retval;
  }

  /**
      Allocate a new initialized #GstRTSPTransport. Use [gstrtsp.rtsptransport.RTSPTransport.free]
      after usage.
  
      Params:
        transport = location to hold the new #GstRTSPTransport
      Returns: a #GstRTSPResult.
  */
  static gstrtsp.types.RTSPResult new_(out gstrtsp.rtsptransport.RTSPTransport transport)
  {
    GstRTSPResult _cretval;
    GstRTSPTransport* _transport;
    _cretval = gst_rtsp_transport_new(&_transport);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    transport = new gstrtsp.rtsptransport.RTSPTransport(cast(void*)_transport);
    return _retval;
  }

  /**
      Parse the RTSP transport string str into transport.
  
      Params:
        str = a transport string
        transport = a #GstRTSPTransport
      Returns: a #GstRTSPResult.
  */
  static gstrtsp.types.RTSPResult parse(string str, out gstrtsp.rtsptransport.RTSPTransport transport)
  {
    GstRTSPResult _cretval;
    const(char)* _str = str.toCString(No.Alloc);
    GstRTSPTransport _transport;
    _cretval = gst_rtsp_transport_parse(_str, &_transport);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    transport = new gstrtsp.rtsptransport.RTSPTransport(cast(void*)&_transport);
    return _retval;
  }
}
