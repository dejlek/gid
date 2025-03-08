module gstrtsp.rtspextension_mixin;

public import gstrtsp.rtspextension_iface_proxy;
public import gid.gid;
public import gobject.dclosure;
public import gst.caps;
public import gst.structure;
public import gstrtsp.c.functions;
public import gstrtsp.c.types;
public import gstrtsp.rtspmessage;
public import gstrtsp.rtspurl;
public import gstrtsp.types;
public import gstsdp.sdpmedia;
public import gstsdp.sdpmessage;

/**
    This interface is implemented e.g. by the Windows Media Streaming RTSP
   exentension (rtspwms) and the RealMedia RTSP extension (rtspreal).
*/
template RTSPExtensionT()
{

  /** */
  override gstrtsp.types.RTSPResult afterSend(gstrtsp.rtspmessage.RTSPMessage req, gstrtsp.rtspmessage.RTSPMessage resp)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_extension_after_send(cast(GstRTSPExtension*)cPtr, req ? cast(GstRTSPMessage*)req.cPtr(No.Dup) : null, resp ? cast(GstRTSPMessage*)resp.cPtr(No.Dup) : null);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /** */
  override gstrtsp.types.RTSPResult beforeSend(gstrtsp.rtspmessage.RTSPMessage req)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_extension_before_send(cast(GstRTSPExtension*)cPtr, req ? cast(GstRTSPMessage*)req.cPtr(No.Dup) : null);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /** */
  override bool configureStream(gst.caps.Caps caps)
  {
    bool _retval;
    _retval = gst_rtsp_extension_configure_stream(cast(GstRTSPExtension*)cPtr, caps ? cast(GstCaps*)caps.cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  override bool detectServer(gstrtsp.rtspmessage.RTSPMessage resp)
  {
    bool _retval;
    _retval = gst_rtsp_extension_detect_server(cast(GstRTSPExtension*)cPtr, resp ? cast(GstRTSPMessage*)resp.cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  override gstrtsp.types.RTSPResult getTransports(gstrtsp.types.RTSPLowerTrans protocols, string transport)
  {
    GstRTSPResult _cretval;
    char* _transport = transport.toCString(No.Alloc);
    _cretval = gst_rtsp_extension_get_transports(cast(GstRTSPExtension*)cPtr, protocols, _transport);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /** */
  override gstrtsp.types.RTSPResult parseSdp(gstsdp.sdpmessage.SDPMessage sdp, gst.structure.Structure s)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_extension_parse_sdp(cast(GstRTSPExtension*)cPtr, sdp ? cast(GstSDPMessage*)sdp.cPtr(No.Dup) : null, s ? cast(GstStructure*)s.cPtr(No.Dup) : null);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /** */
  override gstrtsp.types.RTSPResult receiveRequest(gstrtsp.rtspmessage.RTSPMessage req)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_extension_receive_request(cast(GstRTSPExtension*)cPtr, req ? cast(GstRTSPMessage*)req.cPtr(No.Dup) : null);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /** */
  override gstrtsp.types.RTSPResult send(gstrtsp.rtspmessage.RTSPMessage req, gstrtsp.rtspmessage.RTSPMessage resp)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_extension_send(cast(GstRTSPExtension*)cPtr, req ? cast(GstRTSPMessage*)req.cPtr(No.Dup) : null, resp ? cast(GstRTSPMessage*)resp.cPtr(No.Dup) : null);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /** */
  override gstrtsp.types.RTSPResult setupMedia(gstsdp.sdpmedia.SDPMedia media)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_extension_setup_media(cast(GstRTSPExtension*)cPtr, media ? cast(GstSDPMedia*)media.cPtr : null);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /** */
  override gstrtsp.types.RTSPResult streamSelect(gstrtsp.rtspurl.RTSPUrl url)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_extension_stream_select(cast(GstRTSPExtension*)cPtr, url ? cast(GstRTSPUrl*)url.cPtr(No.Dup) : null);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /** */
  alias SendCallbackDlg = gstrtsp.types.RTSPResult delegate(void* object, void* p0, gstrtsp.rtspextension.RTSPExtension rTSPExtension);

  /** ditto */
  alias SendCallbackFunc = gstrtsp.types.RTSPResult function(void* object, void* p0, gstrtsp.rtspextension.RTSPExtension rTSPExtension);

  /**
    Connect to Send signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectSend(T)(T callback, Flag!"After" after = No.After)
  if (is(T : SendCallbackDlg) || is(T : SendCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto rTSPExtension = getVal!(gstrtsp.rtspextension.RTSPExtension)(_paramVals);
      auto object = getVal!(void*)(&_paramVals[1]);
      auto p0 = getVal!(void*)(&_paramVals[2]);
      auto _dretval = _dClosure.dlg(object, p0, rTSPExtension);
      GstRTSPResult _retval = cast(GstRTSPResult)_dretval;
      setVal!gstrtsp.types.RTSPResult(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("send", closure, after);
  }
}
