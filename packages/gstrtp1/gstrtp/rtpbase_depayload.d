module gstrtp.rtpbase_depayload;

import gid.gid;
import gobject.dclosure;
import gst.buffer;
import gst.buffer_list;
import gst.element;
import gst.types;
import gstrtp.c.functions;
import gstrtp.c.types;
import gstrtp.rtpheader_extension;
import gstrtp.types;

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
class RTPBaseDepayload : gst.element.Element
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_rtp_base_depayload_get_type != &gidSymbolNotFound ? gst_rtp_base_depayload_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Called from GstRTPBaseDepayload.process or
    GstRTPBaseDepayload.process_rtp_packet when the depayloader needs
    to keep the current input RTP header for use with the next output
    buffer.
    
    The delayed buffer will remain until the end of processing the
    current output buffer and then enqueued for processing with the
    next output buffer.
    
    A typical use-case is when the depayloader implementation will
    start a new output buffer for the current input RTP buffer but push
    the current output buffer first.
    
    Must be called with the stream lock held.
  */
  void delayed()
  {
    gst_rtp_base_depayload_delayed(cast(GstRTPBaseDepayload*)cPtr);
  }

  /**
      Called from GstRTPBaseDepayload.process or
    GstRTPBaseDepayload.process_rtp_packet if the depayloader does not
    use the current buffer for the output buffer. This will either drop
    the delayed buffer or the last buffer from the header extension
    cache.
    
    A typical use-case is when the depayloader implementation is
    dropping an input RTP buffer while waiting for the first keyframe.
    
    Must be called with the stream lock held.
  */
  void dropped()
  {
    gst_rtp_base_depayload_dropped(cast(GstRTPBaseDepayload*)cPtr);
  }

  /**
      If GstRTPBaseDepayload.process or
    GstRTPBaseDepayload.process_rtp_packet drop an output buffer this
    function tells the base class to flush header extension cache as
    well.
    
    This will not drop an input RTP header marked as delayed from
    [gstrtp.rtpbase_depayload.RTPBaseDepayload.delayed].
    
    If keep_current is true the current input RTP header will be kept
    and enqueued after flushing the previous input RTP headers.
    
    A typical use-case for keep_current is when the depayloader
    implementation invalidates the current output buffer and starts a
    new one with the current RTP input buffer.
    
    Must be called with the stream lock held.
    Params:
      keepCurrent =       if the current RTP buffer shall be kept
  */
  void flush(bool keepCurrent)
  {
    gst_rtp_base_depayload_flush(cast(GstRTPBaseDepayload*)cPtr, keepCurrent);
  }

  /**
      Queries whether header extensions will be aggregated per depayloaded buffers.
    Returns:     true if aggregate-header-extension is enabled.
  */
  bool isAggregateHdrextEnabled()
  {
    bool _retval;
    _retval = gst_rtp_base_depayload_is_aggregate_hdrext_enabled(cast(GstRTPBaseDepayload*)cPtr);
    return _retval;
  }

  /**
      Queries whether #GstRTPSourceMeta will be added to depayloaded buffers.
    Returns:     true if source-info is enabled.
  */
  bool isSourceInfoEnabled()
  {
    bool _retval;
    _retval = gst_rtp_base_depayload_is_source_info_enabled(cast(GstRTPBaseDepayload*)cPtr);
    return _retval;
  }

  /**
      Push out_buf to the peer of filter. This function takes ownership of
    out_buf.
    
    This function will by default apply the last incoming timestamp on
    the outgoing buffer when it didn't have a timestamp already.
    Params:
      outBuf =       a #GstBuffer
    Returns:     a #GstFlowReturn.
  */
  gst.types.FlowReturn push(gst.buffer.Buffer outBuf)
  {
    GstFlowReturn _cretval;
    _cretval = gst_rtp_base_depayload_push(cast(GstRTPBaseDepayload*)cPtr, outBuf ? cast(GstBuffer*)outBuf.cPtr(Yes.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Push out_list to the peer of filter. This function takes ownership of
    out_list.
    Params:
      outList =       a #GstBufferList
    Returns:     a #GstFlowReturn.
  */
  gst.types.FlowReturn pushList(gst.buffer_list.BufferList outList)
  {
    GstFlowReturn _cretval;
    _cretval = gst_rtp_base_depayload_push_list(cast(GstRTPBaseDepayload*)cPtr, outList ? cast(GstBufferList*)outList.cPtr(Yes.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Enable or disable aggregating header extensions.
    Params:
      enable =       whether to aggregate header extensions per output buffer
  */
  void setAggregateHdrextEnabled(bool enable)
  {
    gst_rtp_base_depayload_set_aggregate_hdrext_enabled(cast(GstRTPBaseDepayload*)cPtr, enable);
  }

  /**
      Enable or disable adding #GstRTPSourceMeta to depayloaded buffers.
    Params:
      enable =       whether to add meta about RTP sources to buffer
  */
  void setSourceInfoEnabled(bool enable)
  {
    gst_rtp_base_depayload_set_source_info_enabled(cast(GstRTPBaseDepayload*)cPtr, enable);
  }

  /**
      Add ext as an extension for reading part of an RTP header extension from
    incoming RTP packets.
  
    ## Parameters
    $(LIST
      * $(B ext)       the #GstRTPHeaderExtension
      * $(B rTPBaseDepayload) the instance the signal is connected to
    )
  */
  alias AddExtensionCallbackDlg = void delegate(gstrtp.rtpheader_extension.RTPHeaderExtension ext, gstrtp.rtpbase_depayload.RTPBaseDepayload rTPBaseDepayload);

  /** ditto */
  alias AddExtensionCallbackFunc = void function(gstrtp.rtpheader_extension.RTPHeaderExtension ext, gstrtp.rtpbase_depayload.RTPBaseDepayload rTPBaseDepayload);

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
      auto rTPBaseDepayload = getVal!(gstrtp.rtpbase_depayload.RTPBaseDepayload)(_paramVals);
      auto ext = getVal!(gstrtp.rtpheader_extension.RTPHeaderExtension)(&_paramVals[1]);
      _dClosure.dlg(ext, rTPBaseDepayload);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("add-extension", closure, after);
  }

  /**
      Clear all RTP header extensions used by this depayloader.
  
    ## Parameters
    $(LIST
      * $(B rTPBaseDepayload) the instance the signal is connected to
    )
  */
  alias ClearExtensionsCallbackDlg = void delegate(gstrtp.rtpbase_depayload.RTPBaseDepayload rTPBaseDepayload);

  /** ditto */
  alias ClearExtensionsCallbackFunc = void function(gstrtp.rtpbase_depayload.RTPBaseDepayload rTPBaseDepayload);

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
      auto rTPBaseDepayload = getVal!(gstrtp.rtpbase_depayload.RTPBaseDepayload)(_paramVals);
      _dClosure.dlg(rTPBaseDepayload);
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
      * $(B rTPBaseDepayload) the instance the signal is connected to
    )
    Returns:     the #GstRTPHeaderExtension for ext_id, or null
  */
  alias RequestExtensionCallbackDlg = gstrtp.rtpheader_extension.RTPHeaderExtension delegate(uint extId, string extUri, gstrtp.rtpbase_depayload.RTPBaseDepayload rTPBaseDepayload);

  /** ditto */
  alias RequestExtensionCallbackFunc = gstrtp.rtpheader_extension.RTPHeaderExtension function(uint extId, string extUri, gstrtp.rtpbase_depayload.RTPBaseDepayload rTPBaseDepayload);

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
      auto rTPBaseDepayload = getVal!(gstrtp.rtpbase_depayload.RTPBaseDepayload)(_paramVals);
      auto extId = getVal!(uint)(&_paramVals[1]);
      auto extUri = getVal!(string)(&_paramVals[2]);
      auto _retval = _dClosure.dlg(extId, extUri, rTPBaseDepayload);
      setVal!gstrtp.rtpheader_extension.RTPHeaderExtension(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("request-extension", closure, after);
  }
}
