module gstrtp.rtpbase_payload;

import gid.gid;
import gobject.dclosure;
import gst.buffer;
import gst.buffer_list;
import gst.element;
import gst.structure;
import gst.types;
import gstrtp.c.functions;
import gstrtp.c.types;
import gstrtp.rtpheader_extension;
import gstrtp.types;

/**
    Provides a base class for RTP payloaders
*/
class RTPBasePayload : gst.element.Element
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_rtp_base_payload_get_type != &gidSymbolNotFound ? gst_rtp_base_payload_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override RTPBasePayload self()
  {
    return this;
  }

  /**
      Allocate a new #GstBuffer with enough data to hold an RTP packet with
    minimum csrc_count CSRCs, a payload length of payload_len and padding of
    pad_len. If payload has #GstRTPBasePayload:source-info true additional
    CSRCs may be allocated and filled with RTP source information.
    Params:
      payloadLen =       the length of the payload
      padLen =       the amount of padding
      csrcCount =       the minimum number of CSRC entries
    Returns:     A newly allocated buffer that can hold an RTP packet with given
      parameters.
  */
  gst.buffer.Buffer allocateOutputBuffer(uint payloadLen, ubyte padLen, ubyte csrcCount)
  {
    GstBuffer* _cretval;
    _cretval = gst_rtp_base_payload_allocate_output_buffer(cast(GstRTPBasePayload*)cPtr, payloadLen, padLen, csrcCount);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Count the total number of RTP sources found in the meta of buffer, which
    will be automically added by [gstrtp.rtpbase_payload.RTPBasePayload.allocateOutputBuffer].
    If #GstRTPBasePayload:source-info is false the count will be 0.
    Params:
      buffer =       a #GstBuffer, typically the buffer to payload
    Returns:     The number of sources.
  */
  uint getSourceCount(gst.buffer.Buffer buffer)
  {
    uint _retval;
    _retval = gst_rtp_base_payload_get_source_count(cast(GstRTPBasePayload*)cPtr, buffer ? cast(GstBuffer*)buffer.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Check if the packet with size and duration would exceed the configured
    maximum size.
    Params:
      size =       the size of the packet
      duration =       the duration of the packet
    Returns:     true if the packet of size and duration would exceed the
      configured MTU or max_ptime.
  */
  bool isFilled(uint size, gst.types.ClockTime duration)
  {
    bool _retval;
    _retval = gst_rtp_base_payload_is_filled(cast(GstRTPBasePayload*)cPtr, size, duration);
    return _retval;
  }

  /**
      Queries whether the payloader will add contributing sources (CSRCs) to the
    RTP header from #GstRTPSourceMeta.
    Returns:     true if source-info is enabled.
  */
  bool isSourceInfoEnabled()
  {
    bool _retval;
    _retval = gst_rtp_base_payload_is_source_info_enabled(cast(GstRTPBasePayload*)cPtr);
    return _retval;
  }

  /**
      Push buffer to the peer element of the payloader. The SSRC, payload type,
    seqnum and timestamp of the RTP buffer will be updated first.
    
    This function takes ownership of buffer.
    Params:
      buffer =       a #GstBuffer
    Returns:     a #GstFlowReturn.
  */
  gst.types.FlowReturn push(gst.buffer.Buffer buffer)
  {
    GstFlowReturn _cretval;
    _cretval = gst_rtp_base_payload_push(cast(GstRTPBasePayload*)cPtr, buffer ? cast(GstBuffer*)buffer.cPtr(Yes.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Push list to the peer element of the payloader. The SSRC, payload type,
    seqnum and timestamp of the RTP buffer will be updated first.
    
    This function takes ownership of list.
    Params:
      list =       a #GstBufferList
    Returns:     a #GstFlowReturn.
  */
  gst.types.FlowReturn pushList(gst.buffer_list.BufferList list)
  {
    GstFlowReturn _cretval;
    _cretval = gst_rtp_base_payload_push_list(cast(GstRTPBasePayload*)cPtr, list ? cast(GstBufferList*)list.cPtr(Yes.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Set the rtp options of the payloader. These options will be set in the caps
    of the payloader. Subclasses must call this method before calling
    [gstrtp.rtpbase_payload.RTPBasePayload.push] or [gstrtp.rtpbase_payload.RTPBasePayload.setOutcaps].
    Params:
      media =       the media type (typically "audio" or "video")
      dynamic =       if the payload type is dynamic
      encodingName =       the encoding name
      clockRate =       the clock rate of the media
  */
  void setOptions(string media, bool dynamic, string encodingName, uint clockRate)
  {
    const(char)* _media = media.toCString(No.Alloc);
    const(char)* _encodingName = encodingName.toCString(No.Alloc);
    gst_rtp_base_payload_set_options(cast(GstRTPBasePayload*)cPtr, _media, dynamic, _encodingName, clockRate);
  }

  /**
      Configure the output caps with the optional fields.
    Params:
      s =       a #GstStructure with the caps fields
    Returns:     true if the caps could be set.
  */
  bool setOutcapsStructure(gst.structure.Structure s = null)
  {
    bool _retval;
    _retval = gst_rtp_base_payload_set_outcaps_structure(cast(GstRTPBasePayload*)cPtr, s ? cast(GstStructure*)s.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Enable or disable adding contributing sources to RTP packets from
    #GstRTPSourceMeta.
    Params:
      enable =       whether to add contributing sources to RTP packets
  */
  void setSourceInfoEnabled(bool enable)
  {
    gst_rtp_base_payload_set_source_info_enabled(cast(GstRTPBasePayload*)cPtr, enable);
  }

  /**
      Add ext as an extension for writing part of an RTP header extension onto
    outgoing RTP packets.
  
    ## Parameters
    $(LIST
      * $(B ext)       the #GstRTPHeaderExtension
      * $(B rTPBasePayload) the instance the signal is connected to
    )
  */
  alias AddExtensionCallbackDlg = void delegate(gstrtp.rtpheader_extension.RTPHeaderExtension ext, gstrtp.rtpbase_payload.RTPBasePayload rTPBasePayload);

  /** ditto */
  alias AddExtensionCallbackFunc = void function(gstrtp.rtpheader_extension.RTPHeaderExtension ext, gstrtp.rtpbase_payload.RTPBasePayload rTPBasePayload);

  /**
    Connect to AddExtension signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectAddExtension(T)(T callback, Flag!"After" after = No.After)
  if (is(T : AddExtensionCallbackDlg) || is(T : AddExtensionCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto rTPBasePayload = getVal!(gstrtp.rtpbase_payload.RTPBasePayload)(_paramVals);
      auto ext = getVal!(gstrtp.rtpheader_extension.RTPHeaderExtension)(&_paramVals[1]);
      _dClosure.dlg(ext, rTPBasePayload);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("add-extension", closure, after);
  }

  /**
      Clear all RTP header extensions used by this payloader.
  
    ## Parameters
    $(LIST
      * $(B rTPBasePayload) the instance the signal is connected to
    )
  */
  alias ClearExtensionsCallbackDlg = void delegate(gstrtp.rtpbase_payload.RTPBasePayload rTPBasePayload);

  /** ditto */
  alias ClearExtensionsCallbackFunc = void function(gstrtp.rtpbase_payload.RTPBasePayload rTPBasePayload);

  /**
    Connect to ClearExtensions signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectClearExtensions(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ClearExtensionsCallbackDlg) || is(T : ClearExtensionsCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto rTPBasePayload = getVal!(gstrtp.rtpbase_payload.RTPBasePayload)(_paramVals);
      _dClosure.dlg(rTPBasePayload);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("clear-extensions", closure, after);
  }

  /**
      The returned ext must be configured with the correct ext_id and with the
    necessary attributes as required by the extension implementation.
  
    ## Parameters
    $(LIST
      * $(B extId)       the extension id being requested
      * $(B extUri)       the extension URI being requested
      * $(B rTPBasePayload) the instance the signal is connected to
    )
    Returns:     the #GstRTPHeaderExtension for ext_id, or null
  */
  alias RequestExtensionCallbackDlg = gstrtp.rtpheader_extension.RTPHeaderExtension delegate(uint extId, string extUri, gstrtp.rtpbase_payload.RTPBasePayload rTPBasePayload);

  /** ditto */
  alias RequestExtensionCallbackFunc = gstrtp.rtpheader_extension.RTPHeaderExtension function(uint extId, string extUri, gstrtp.rtpbase_payload.RTPBasePayload rTPBasePayload);

  /**
    Connect to RequestExtension signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectRequestExtension(T)(T callback, Flag!"After" after = No.After)
  if (is(T : RequestExtensionCallbackDlg) || is(T : RequestExtensionCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto rTPBasePayload = getVal!(gstrtp.rtpbase_payload.RTPBasePayload)(_paramVals);
      auto extId = getVal!(uint)(&_paramVals[1]);
      auto extUri = getVal!(string)(&_paramVals[2]);
      auto _retval = _dClosure.dlg(extId, extUri, rTPBasePayload);
      setVal!gstrtp.rtpheader_extension.RTPHeaderExtension(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("request-extension", closure, after);
  }
}
