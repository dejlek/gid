/// Module for [RTPBasePayload] class
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

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_rtp_base_payload_get_type != &gidSymbolNotFound ? gst_rtp_base_payload_get_type() : cast(GType)0;
  }

  /** */
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
        payloadLen = the length of the payload
        padLen = the amount of padding
        csrcCount = the minimum number of CSRC entries
      Returns: A newly allocated buffer that can hold an RTP packet with given
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
        buffer = a #GstBuffer, typically the buffer to payload
      Returns: The number of sources.
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
        size = the size of the packet
        duration = the duration of the packet
      Returns: true if the packet of size and duration would exceed the
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
      Returns: true if source-info is enabled.
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
        buffer = a #GstBuffer
      Returns: a #GstFlowReturn.
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
        list = a #GstBufferList
      Returns: a #GstFlowReturn.
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
        media = the media type (typically "audio" or "video")
        dynamic = if the payload type is dynamic
        encodingName = the encoding name
        clockRate = the clock rate of the media
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
        s = a #GstStructure with the caps fields
      Returns: true if the caps could be set.
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
        enable = whether to add contributing sources to RTP packets
  */
  void setSourceInfoEnabled(bool enable)
  {
    gst_rtp_base_payload_set_source_info_enabled(cast(GstRTPBasePayload*)cPtr, enable);
  }

  /**
      Connect to `AddExtension` signal.
  
      Add ext as an extension for writing part of an RTP header extension onto
      outgoing RTP packets.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gstrtp.rtpheader_extension.RTPHeaderExtension ext, gstrtp.rtpbase_payload.RTPBasePayload rTPBasePayload))
  
          `ext` the #GstRTPHeaderExtension (optional)
  
          `rTPBasePayload` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectAddExtension(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gstrtp.rtpheader_extension.RTPHeaderExtension)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gstrtp.rtpbase_payload.RTPBasePayload)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("add-extension", closure, after);
  }

  /**
      Connect to `ClearExtensions` signal.
  
      Clear all RTP header extensions used by this payloader.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gstrtp.rtpbase_payload.RTPBasePayload rTPBasePayload))
  
          `rTPBasePayload` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectClearExtensions(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gstrtp.rtpbase_payload.RTPBasePayload)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("clear-extensions", closure, after);
  }

  /**
      Connect to `RequestExtension` signal.
  
      The returned ext must be configured with the correct ext_id and with the
      necessary attributes as required by the extension implementation.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D gstrtp.rtpheader_extension.RTPHeaderExtension callback(uint extId, string extUri, gstrtp.rtpbase_payload.RTPBasePayload rTPBasePayload))
  
          `extId` the extension id being requested (optional)
  
          `extUri` the extension URI being requested (optional)
  
          `rTPBasePayload` the instance the signal is connected to (optional)
  
          `Returns` the #GstRTPHeaderExtension for ext_id, or null
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRequestExtension(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T : gstrtp.rtpheader_extension.RTPHeaderExtension)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == string)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gstrtp.rtpbase_payload.RTPBasePayload)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!gstrtp.rtpheader_extension.RTPHeaderExtension(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("request-extension", closure, after);
  }
}
