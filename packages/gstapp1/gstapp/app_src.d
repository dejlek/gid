module gstapp.app_src;

import gid.gid;
import gobject.dclosure;
import gst.buffer;
import gst.buffer_list;
import gst.caps;
import gst.sample;
import gst.types;
import gst.urihandler;
import gst.urihandler_mixin;
import gstapp.c.functions;
import gstapp.c.types;
import gstapp.types;
import gstbase.base_src;

/**
    The appsrc element can be used by applications to insert data into a
  GStreamer pipeline. Unlike most GStreamer elements, appsrc provides
  external API functions.
  
  appsrc can be used by linking with the libgstapp library to access the
  methods directly or by using the appsrc action signals.
  
  Before operating appsrc, the caps property must be set to fixed caps
  describing the format of the data that will be pushed with appsrc. An
  exception to this is when pushing buffers with unknown caps, in which case no
  caps should be set. This is typically true of file-like sources that push raw
  byte buffers. If you don't want to explicitly set the caps, you can use
  gst_app_src_push_sample. This method gets the caps associated with the
  sample and sets them on the appsrc replacing any previously set caps (if
  different from sample's caps).
  
  The main way of handing data to the appsrc element is by calling the
  [gstapp.app_src.AppSrc.pushBuffer] method or by emitting the push-buffer action signal.
  This will put the buffer onto a queue from which appsrc will read from in its
  streaming thread. It is important to note that data transport will not happen
  from the thread that performed the push-buffer call.
  
  The "max-bytes", "max-buffers" and "max-time" properties control how much
  data can be queued in appsrc before appsrc considers the queue full. A
  filled internal queue will always signal the "enough-data" signal, which
  signals the application that it should stop pushing data into appsrc. The
  "block" property will cause appsrc to block the push-buffer method until
  free data becomes available again.
  
  When the internal queue is running out of data, the "need-data" signal is
  emitted, which signals the application that it should start pushing more data
  into appsrc.
  
  In addition to the "need-data" and "enough-data" signals, appsrc can emit the
  "seek-data" signal when the "stream-mode" property is set to "seekable" or
  "random-access". The signal argument will contain the new desired position in
  the stream expressed in the unit set with the "format" property. After
  receiving the seek-data signal, the application should push-buffers from the
  new position.
  
  These signals allow the application to operate the appsrc in two different
  ways:
  
  The push mode, in which the application repeatedly calls the push-buffer/push-sample
  method with a new buffer/sample. Optionally, the queue size in the appsrc
  can be controlled with the enough-data and need-data signals by respectively
  stopping/starting the push-buffer/push-sample calls. This is a typical
  mode of operation for the stream-type "stream" and "seekable". Use this
  mode when implementing various network protocols or hardware devices.
  
  The pull mode, in which the need-data signal triggers the next push-buffer call.
  This mode is typically used in the "random-access" stream-type. Use this
  mode for file access or other randomly accessible sources. In this mode, a
  buffer of exactly the amount of bytes given by the need-data signal should be
  pushed into appsrc.
  
  In all modes, the size property on appsrc should contain the total stream
  size in bytes. Setting this property is mandatory in the random-access mode.
  For the stream and seekable modes, setting this property is optional but
  recommended.
  
  When the application has finished pushing data into appsrc, it should call
  [gstapp.app_src.AppSrc.endOfStream] or emit the end-of-stream action signal. After
  this call, no more buffers can be pushed into appsrc until a flushing seek
  occurs or the state of the appsrc has gone through READY.
*/
class AppSrc : gstbase.base_src.BaseSrc, gst.urihandler.URIHandler
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_app_src_get_type != &gidSymbolNotFound ? gst_app_src_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin URIHandlerT!();

  /**
      Indicates to the appsrc element that the last buffer queued in the
    element is the last buffer of the stream.
    Returns:     #GST_FLOW_OK when the EOS was successfully queued.
      #GST_FLOW_FLUSHING when appsrc is not PAUSED or PLAYING.
  */
  gst.types.FlowReturn endOfStream()
  {
    GstFlowReturn _cretval;
    _cretval = gst_app_src_end_of_stream(cast(GstAppSrc*)cPtr);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Get the configured caps on appsrc.
    Returns:     the #GstCaps produced by the source. gst_caps_unref() after usage.
  */
  gst.caps.Caps getCaps()
  {
    GstCaps* _cretval;
    _cretval = gst_app_src_get_caps(cast(GstAppSrc*)cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the number of currently queued buffers inside appsrc.
    Returns:     The number of currently queued buffers.
  */
  ulong getCurrentLevelBuffers()
  {
    ulong _retval;
    _retval = gst_app_src_get_current_level_buffers(cast(GstAppSrc*)cPtr);
    return _retval;
  }

  /**
      Get the number of currently queued bytes inside appsrc.
    Returns:     The number of currently queued bytes.
  */
  ulong getCurrentLevelBytes()
  {
    ulong _retval;
    _retval = gst_app_src_get_current_level_bytes(cast(GstAppSrc*)cPtr);
    return _retval;
  }

  /**
      Get the amount of currently queued time inside appsrc.
    Returns:     The amount of currently queued time.
  */
  gst.types.ClockTime getCurrentLevelTime()
  {
    gst.types.ClockTime _retval;
    _retval = gst_app_src_get_current_level_time(cast(GstAppSrc*)cPtr);
    return _retval;
  }

  /**
      Get the duration of the stream in nanoseconds. A value of GST_CLOCK_TIME_NONE means that the duration is
    not known.
    Returns:     the duration of the stream previously set with [gstapp.app_src.AppSrc.setDuration];
  */
  gst.types.ClockTime getDuration()
  {
    gst.types.ClockTime _retval;
    _retval = gst_app_src_get_duration(cast(GstAppSrc*)cPtr);
    return _retval;
  }

  /**
      Check if appsrc will emit the "new-preroll" and "new-buffer" signals.
    Returns:     true if appsrc is emitting the "new-preroll" and "new-buffer"
      signals.
  */
  bool getEmitSignals()
  {
    bool _retval;
    _retval = gst_app_src_get_emit_signals(cast(GstAppSrc*)cPtr);
    return _retval;
  }

  /**
      Retrieve the min and max latencies in min and max respectively.
    Params:
      min =       the min latency
      max =       the max latency
  */
  void getLatency(out ulong min, out ulong max)
  {
    gst_app_src_get_latency(cast(GstAppSrc*)cPtr, cast(ulong*)&min, cast(ulong*)&max);
  }

  /**
      Returns the currently set #GstAppLeakyType. See [gstapp.app_src.AppSrc.setLeakyType]
    for more details.
    Returns:     The currently set #GstAppLeakyType.
  */
  gstapp.types.AppLeakyType getLeakyType()
  {
    GstAppLeakyType _cretval;
    _cretval = gst_app_src_get_leaky_type(cast(GstAppSrc*)cPtr);
    gstapp.types.AppLeakyType _retval = cast(gstapp.types.AppLeakyType)_cretval;
    return _retval;
  }

  /**
      Get the maximum amount of buffers that can be queued in appsrc.
    Returns:     The maximum amount of buffers that can be queued.
  */
  ulong getMaxBuffers()
  {
    ulong _retval;
    _retval = gst_app_src_get_max_buffers(cast(GstAppSrc*)cPtr);
    return _retval;
  }

  /**
      Get the maximum amount of bytes that can be queued in appsrc.
    Returns:     The maximum amount of bytes that can be queued.
  */
  ulong getMaxBytes()
  {
    ulong _retval;
    _retval = gst_app_src_get_max_bytes(cast(GstAppSrc*)cPtr);
    return _retval;
  }

  /**
      Get the maximum amount of time that can be queued in appsrc.
    Returns:     The maximum amount of time that can be queued.
  */
  gst.types.ClockTime getMaxTime()
  {
    gst.types.ClockTime _retval;
    _retval = gst_app_src_get_max_time(cast(GstAppSrc*)cPtr);
    return _retval;
  }

  /**
      Get the size of the stream in bytes. A value of -1 means that the size is
    not known.
    Returns:     the size of the stream previously set with [gstapp.app_src.AppSrc.setSize];
  */
  long getSize()
  {
    long _retval;
    _retval = gst_app_src_get_size(cast(GstAppSrc*)cPtr);
    return _retval;
  }

  /**
      Get the stream type. Control the stream type of appsrc
    with [gstapp.app_src.AppSrc.setStreamType].
    Returns:     the stream type.
  */
  gstapp.types.AppStreamType getStreamType()
  {
    GstAppStreamType _cretval;
    _cretval = gst_app_src_get_stream_type(cast(GstAppSrc*)cPtr);
    gstapp.types.AppStreamType _retval = cast(gstapp.types.AppStreamType)_cretval;
    return _retval;
  }

  /**
      Adds a buffer to the queue of buffers that the appsrc element will
    push to its source pad.  This function takes ownership of the buffer.
    
    When the block property is TRUE, this function can block until free
    space becomes available in the queue.
    Params:
      buffer =       a #GstBuffer to push
    Returns:     #GST_FLOW_OK when the buffer was successfully queued.
      #GST_FLOW_FLUSHING when appsrc is not PAUSED or PLAYING.
      #GST_FLOW_EOS when EOS occurred.
  */
  gst.types.FlowReturn pushBuffer(gst.buffer.Buffer buffer)
  {
    GstFlowReturn _cretval;
    _cretval = gst_app_src_push_buffer(cast(GstAppSrc*)cPtr, buffer ? cast(GstBuffer*)buffer.cPtr(Yes.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Adds a buffer list to the queue of buffers and buffer lists that the
    appsrc element will push to its source pad.  This function takes ownership
    of buffer_list.
    
    When the block property is TRUE, this function can block until free
    space becomes available in the queue.
    Params:
      bufferList =       a #GstBufferList to push
    Returns:     #GST_FLOW_OK when the buffer list was successfully queued.
      #GST_FLOW_FLUSHING when appsrc is not PAUSED or PLAYING.
      #GST_FLOW_EOS when EOS occurred.
  */
  gst.types.FlowReturn pushBufferList(gst.buffer_list.BufferList bufferList)
  {
    GstFlowReturn _cretval;
    _cretval = gst_app_src_push_buffer_list(cast(GstAppSrc*)cPtr, bufferList ? cast(GstBufferList*)bufferList.cPtr(Yes.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  /**
      Extract a buffer from the provided sample and adds it to the queue of
    buffers that the appsrc element will push to its source pad. Any
    previous caps that were set on appsrc will be replaced by the caps
    associated with the sample if not equal.
    
    This function does not take ownership of the
    sample so the sample needs to be unreffed after calling this function.
    
    When the block property is TRUE, this function can block until free
    space becomes available in the queue.
    Params:
      sample =       a #GstSample from which buffer and caps may be
        extracted
    Returns:     #GST_FLOW_OK when the buffer was successfully queued.
      #GST_FLOW_FLUSHING when appsrc is not PAUSED or PLAYING.
      #GST_FLOW_EOS when EOS occurred.
  */
  gst.types.FlowReturn pushSample(gst.sample.Sample sample)
  {
    GstFlowReturn _cretval;
    _cretval = gst_app_src_push_sample(cast(GstAppSrc*)cPtr, sample ? cast(GstSample*)sample.cPtr(No.Dup) : null);
    gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
    return _retval;
  }

  alias setCaps = gstbase.base_src.BaseSrc.setCaps;

  /**
      Set the capabilities on the appsrc element.  This function takes
    a copy of the caps structure. After calling this method, the source will
    only produce caps that match caps. caps must be fixed and the caps on the
    buffers must match the caps or left NULL.
    Params:
      caps =       caps to set
  */
  void setCaps(gst.caps.Caps caps = null)
  {
    gst_app_src_set_caps(cast(GstAppSrc*)cPtr, caps ? cast(const(GstCaps)*)caps.cPtr(No.Dup) : null);
  }

  /**
      Set the duration of the stream in nanoseconds. A value of GST_CLOCK_TIME_NONE means that the duration is
    not known.
    Params:
      duration =       the duration to set
  */
  void setDuration(gst.types.ClockTime duration)
  {
    gst_app_src_set_duration(cast(GstAppSrc*)cPtr, duration);
  }

  /**
      Make appsrc emit the "new-preroll" and "new-buffer" signals. This option is
    by default disabled because signal emission is expensive and unneeded when
    the application prefers to operate in pull mode.
    Params:
      emit =       the new state
  */
  void setEmitSignals(bool emit)
  {
    gst_app_src_set_emit_signals(cast(GstAppSrc*)cPtr, emit);
  }

  /**
      Configure the min and max latency in src. If min is set to -1, the
    default latency calculations for pseudo-live sources will be used.
    Params:
      min =       the min latency
      max =       the max latency
  */
  void setLatency(ulong min, ulong max)
  {
    gst_app_src_set_latency(cast(GstAppSrc*)cPtr, min, max);
  }

  /**
      When set to any other value than GST_APP_LEAKY_TYPE_NONE then the appsrc
    will drop any buffers that are pushed into it once its internal queue is
    full. The selected type defines whether to drop the oldest or new
    buffers.
    Params:
      leaky =       the #GstAppLeakyType
  */
  void setLeakyType(gstapp.types.AppLeakyType leaky)
  {
    gst_app_src_set_leaky_type(cast(GstAppSrc*)cPtr, leaky);
  }

  /**
      Set the maximum amount of buffers that can be queued in appsrc.
    After the maximum amount of buffers are queued, appsrc will emit the
    "enough-data" signal.
    Params:
      max =       the maximum number of buffers to queue
  */
  void setMaxBuffers(ulong max)
  {
    gst_app_src_set_max_buffers(cast(GstAppSrc*)cPtr, max);
  }

  /**
      Set the maximum amount of bytes that can be queued in appsrc.
    After the maximum amount of bytes are queued, appsrc will emit the
    "enough-data" signal.
    Params:
      max =       the maximum number of bytes to queue
  */
  void setMaxBytes(ulong max)
  {
    gst_app_src_set_max_bytes(cast(GstAppSrc*)cPtr, max);
  }

  /**
      Set the maximum amount of time that can be queued in appsrc.
    After the maximum amount of time are queued, appsrc will emit the
    "enough-data" signal.
    Params:
      max =       the maximum amonut of time to queue
  */
  void setMaxTime(gst.types.ClockTime max)
  {
    gst_app_src_set_max_time(cast(GstAppSrc*)cPtr, max);
  }

  /**
      Set the size of the stream in bytes. A value of -1 means that the size is
    not known.
    Params:
      size =       the size to set
  */
  void setSize(long size)
  {
    gst_app_src_set_size(cast(GstAppSrc*)cPtr, size);
  }

  /**
      Set the stream type on appsrc. For seekable streams, the "seek" signal must
    be connected to.
    
    A stream_type stream
    Params:
      type =       the new state
  */
  void setStreamType(gstapp.types.AppStreamType type)
  {
    gst_app_src_set_stream_type(cast(GstAppSrc*)cPtr, type);
  }

  /**
      Notify appsrc that no more buffer are available.
  
    ## Parameters
    $(LIST
      * $(B appSrc) the instance the signal is connected to
    )
    Returns: 
  */
  alias EndOfStreamCallbackDlg = gst.types.FlowReturn delegate(gstapp.app_src.AppSrc appSrc);

  /** ditto */
  alias EndOfStreamCallbackFunc = gst.types.FlowReturn function(gstapp.app_src.AppSrc appSrc);

  /**
    Connect to EndOfStream signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectEndOfStream(T)(T callback, Flag!"After" after = No.After)
  if (is(T : EndOfStreamCallbackDlg) || is(T : EndOfStreamCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto appSrc = getVal!(gstapp.app_src.AppSrc)(_paramVals);
      auto _dretval = _dClosure.dlg(appSrc);
      GstFlowReturn _retval = cast(GstFlowReturn)_dretval;
      setVal!gst.types.FlowReturn(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("end-of-stream", closure, after);
  }

  /**
      Signal that the source has enough data. It is recommended that the
    application stops calling push-buffer until the need-data signal is
    emitted again to avoid excessive buffer queueing.
  
    ## Parameters
    $(LIST
      * $(B appSrc) the instance the signal is connected to
    )
  */
  alias EnoughDataCallbackDlg = void delegate(gstapp.app_src.AppSrc appSrc);

  /** ditto */
  alias EnoughDataCallbackFunc = void function(gstapp.app_src.AppSrc appSrc);

  /**
    Connect to EnoughData signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectEnoughData(T)(T callback, Flag!"After" after = No.After)
  if (is(T : EnoughDataCallbackDlg) || is(T : EnoughDataCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto appSrc = getVal!(gstapp.app_src.AppSrc)(_paramVals);
      _dClosure.dlg(appSrc);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("enough-data", closure, after);
  }

  /**
      Signal that the source needs more data. In the callback or from another
    thread you should call push-buffer or end-of-stream.
    
    length is just a hint and when it is set to -1, any number of bytes can be
    pushed into appsrc.
    
    You can call push-buffer multiple times until the enough-data signal is
    fired.
  
    ## Parameters
    $(LIST
      * $(B length)       the amount of bytes needed.
      * $(B appSrc) the instance the signal is connected to
    )
  */
  alias NeedDataCallbackDlg = void delegate(uint length, gstapp.app_src.AppSrc appSrc);

  /** ditto */
  alias NeedDataCallbackFunc = void function(uint length, gstapp.app_src.AppSrc appSrc);

  /**
    Connect to NeedData signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectNeedData(T)(T callback, Flag!"After" after = No.After)
  if (is(T : NeedDataCallbackDlg) || is(T : NeedDataCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto appSrc = getVal!(gstapp.app_src.AppSrc)(_paramVals);
      auto length = getVal!(uint)(&_paramVals[1]);
      _dClosure.dlg(length, appSrc);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("need-data", closure, after);
  }

  /**
      Adds a buffer to the queue of buffers that the appsrc element will
    push to its source pad.
    
    This function does not take ownership of the buffer, but it takes a
    reference so the buffer can be unreffed at any time after calling this
    function.
    
    When the block property is TRUE, this function can block until free space
    becomes available in the queue.
  
    ## Parameters
    $(LIST
      * $(B buffer)       a buffer to push
      * $(B appSrc) the instance the signal is connected to
    )
    Returns: 
  */
  alias PushBufferCallbackDlg = gst.types.FlowReturn delegate(gst.buffer.Buffer buffer, gstapp.app_src.AppSrc appSrc);

  /** ditto */
  alias PushBufferCallbackFunc = gst.types.FlowReturn function(gst.buffer.Buffer buffer, gstapp.app_src.AppSrc appSrc);

  /**
    Connect to PushBuffer signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectPushBuffer(T)(T callback, Flag!"After" after = No.After)
  if (is(T : PushBufferCallbackDlg) || is(T : PushBufferCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto appSrc = getVal!(gstapp.app_src.AppSrc)(_paramVals);
      auto buffer = getVal!(gst.buffer.Buffer)(&_paramVals[1]);
      auto _dretval = _dClosure.dlg(buffer, appSrc);
      GstFlowReturn _retval = cast(GstFlowReturn)_dretval;
      setVal!gst.types.FlowReturn(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("push-buffer", closure, after);
  }

  /**
      Adds a buffer list to the queue of buffers and buffer lists that the
    appsrc element will push to its source pad.
    
    This function does not take ownership of the buffer list, but it takes a
    reference so the buffer list can be unreffed at any time after calling
    this function.
    
    When the block property is TRUE, this function can block until free space
    becomes available in the queue.
  
    ## Parameters
    $(LIST
      * $(B bufferList)       a buffer list to push
      * $(B appSrc) the instance the signal is connected to
    )
    Returns: 
  */
  alias PushBufferListCallbackDlg = gst.types.FlowReturn delegate(gst.buffer_list.BufferList bufferList, gstapp.app_src.AppSrc appSrc);

  /** ditto */
  alias PushBufferListCallbackFunc = gst.types.FlowReturn function(gst.buffer_list.BufferList bufferList, gstapp.app_src.AppSrc appSrc);

  /**
    Connect to PushBufferList signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectPushBufferList(T)(T callback, Flag!"After" after = No.After)
  if (is(T : PushBufferListCallbackDlg) || is(T : PushBufferListCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto appSrc = getVal!(gstapp.app_src.AppSrc)(_paramVals);
      auto bufferList = getVal!(gst.buffer_list.BufferList)(&_paramVals[1]);
      auto _dretval = _dClosure.dlg(bufferList, appSrc);
      GstFlowReturn _retval = cast(GstFlowReturn)_dretval;
      setVal!gst.types.FlowReturn(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("push-buffer-list", closure, after);
  }

  /**
      Extract a buffer from the provided sample and adds the extracted buffer
    to the queue of buffers that the appsrc element will
    push to its source pad. This function set the appsrc caps based on the caps
    in the sample and reset the caps if they change.
    Only the caps and the buffer of the provided sample are used and not
    for example the segment in the sample.
    
    This function does not take ownership of the sample, but it takes a
    reference so the sample can be unreffed at any time after calling this
    function.
    
    When the block property is TRUE, this function can block until free space
    becomes available in the queue.
  
    ## Parameters
    $(LIST
      * $(B sample)       a sample from which extract buffer to push
      * $(B appSrc) the instance the signal is connected to
    )
    Returns: 
  */
  alias PushSampleCallbackDlg = gst.types.FlowReturn delegate(gst.sample.Sample sample, gstapp.app_src.AppSrc appSrc);

  /** ditto */
  alias PushSampleCallbackFunc = gst.types.FlowReturn function(gst.sample.Sample sample, gstapp.app_src.AppSrc appSrc);

  /**
    Connect to PushSample signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectPushSample(T)(T callback, Flag!"After" after = No.After)
  if (is(T : PushSampleCallbackDlg) || is(T : PushSampleCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto appSrc = getVal!(gstapp.app_src.AppSrc)(_paramVals);
      auto sample = getVal!(gst.sample.Sample)(&_paramVals[1]);
      auto _dretval = _dClosure.dlg(sample, appSrc);
      GstFlowReturn _retval = cast(GstFlowReturn)_dretval;
      setVal!gst.types.FlowReturn(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("push-sample", closure, after);
  }

  /**
      Seek to the given offset. The next push-buffer should produce buffers from
    the new offset.
    This callback is only called for seekable stream types.
  
    ## Parameters
    $(LIST
      * $(B offset)       the offset to seek to
      * $(B appSrc) the instance the signal is connected to
    )
    Returns:     true if the seek succeeded.
  */
  alias SeekDataCallbackDlg = bool delegate(ulong offset, gstapp.app_src.AppSrc appSrc);

  /** ditto */
  alias SeekDataCallbackFunc = bool function(ulong offset, gstapp.app_src.AppSrc appSrc);

  /**
    Connect to SeekData signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectSeekData(T)(T callback, Flag!"After" after = No.After)
  if (is(T : SeekDataCallbackDlg) || is(T : SeekDataCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto appSrc = getVal!(gstapp.app_src.AppSrc)(_paramVals);
      auto offset = getVal!(ulong)(&_paramVals[1]);
      _retval = _dClosure.dlg(offset, appSrc);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("seek-data", closure, after);
  }
}
