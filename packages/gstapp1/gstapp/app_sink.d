module gstapp.app_sink;

import gid.gid;
import gobject.dclosure;
import gst.caps;
import gst.mini_object;
import gst.query;
import gst.sample;
import gst.types;
import gst.urihandler;
import gst.urihandler_mixin;
import gstapp.c.functions;
import gstapp.c.types;
import gstapp.types;
import gstbase.base_sink;

/**
    Appsink is a sink plugin that supports many different methods for making
  the application get a handle on the GStreamer data in a pipeline. Unlike
  most GStreamer elements, Appsink provides external API functions.
  
  appsink can be used by linking to the gstappsink.h header file to access the
  methods or by using the appsink action signals and properties.
  
  The normal way of retrieving samples from appsink is by using the
  [gstapp.app_sink.AppSink.pullSample] and [gstapp.app_sink.AppSink.pullPreroll] methods.
  These methods block until a sample becomes available in the sink or when the
  sink is shut down or reaches EOS. There are also timed variants of these
  methods, [gstapp.app_sink.AppSink.tryPullSample] and [gstapp.app_sink.AppSink.tryPullPreroll],
  which accept a timeout parameter to limit the amount of time to wait.
  
  Appsink will internally use a queue to collect buffers from the streaming
  thread. If the application is not pulling samples fast enough, this queue
  will consume a lot of memory over time. The "max-buffers", "max-time" and "max-bytes"
  properties can be used to limit the queue size. The "drop" property controls whether the
  streaming thread blocks or if older buffers are dropped when the maximum
  queue size is reached. Note that blocking the streaming thread can negatively
  affect real-time performance and should be avoided.
  
  If a blocking behaviour is not desirable, setting the "emit-signals" property
  to true will make appsink emit the "new-sample" and "new-preroll" signals
  when a sample can be pulled without blocking.
  
  The "caps" property on appsink can be used to control the formats that
  appsink can receive. This property can contain non-fixed caps, the format of
  the pulled samples can be obtained by getting the sample caps.
  
  If one of the pull-preroll or pull-sample methods return null, the appsink
  is stopped or in the EOS state. You can check for the EOS state with the
  "eos" property or with the [gstapp.app_sink.AppSink.isEos] method.
  
  The eos signal can also be used to be informed when the EOS state is reached
  to avoid polling.
*/
class AppSink : gstbase.base_sink.BaseSink, gst.urihandler.URIHandler
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_app_sink_get_type != &gidSymbolNotFound ? gst_app_sink_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin URIHandlerT!();

  /**
      Check if appsink supports buffer lists.
    Returns:     true if appsink supports buffer lists.
  */
  bool getBufferListSupport()
  {
    bool _retval;
    _retval = gst_app_sink_get_buffer_list_support(cast(GstAppSink*)cPtr);
    return _retval;
  }

  /**
      Get the configured caps on appsink.
    Returns:     the #GstCaps accepted by the sink. gst_caps_unref() after usage.
  */
  gst.caps.Caps getCaps()
  {
    GstCaps* _cretval;
    _cretval = gst_app_sink_get_caps(cast(GstAppSink*)cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      Check if appsink will drop old buffers when the maximum amount of queued
    data is reached (meaning max buffers, time or bytes limit, whichever is hit first).
    Returns:     true if appsink is dropping old buffers when the queue is
      filled.
  */
  bool getDrop()
  {
    bool _retval;
    _retval = gst_app_sink_get_drop(cast(GstAppSink*)cPtr);
    return _retval;
  }

  /**
      Check if appsink will emit the "new-preroll" and "new-sample" signals.
    Returns:     true if appsink is emitting the "new-preroll" and "new-sample"
      signals.
  */
  bool getEmitSignals()
  {
    bool _retval;
    _retval = gst_app_sink_get_emit_signals(cast(GstAppSink*)cPtr);
    return _retval;
  }

  /**
      Get the maximum amount of buffers that can be queued in appsink.
    Returns:     The maximum amount of buffers that can be queued.
  */
  uint getMaxBuffers()
  {
    uint _retval;
    _retval = gst_app_sink_get_max_buffers(cast(GstAppSink*)cPtr);
    return _retval;
  }

  /**
      Get the maximum total size, in bytes, that can be queued in appsink.
    Returns:     The maximum amount of bytes that can be queued
  */
  ulong getMaxBytes()
  {
    ulong _retval;
    _retval = gst_app_sink_get_max_bytes(cast(GstAppSink*)cPtr);
    return _retval;
  }

  /**
      Get the maximum total duration that can be queued in appsink.
    Returns:     The maximum total duration that can be queued.
  */
  gst.types.ClockTime getMaxTime()
  {
    gst.types.ClockTime _retval;
    _retval = gst_app_sink_get_max_time(cast(GstAppSink*)cPtr);
    return _retval;
  }

  /**
      Check if appsink will wait for all buffers to be consumed when an EOS is
    received.
    Returns:     true if appsink will wait for all buffers to be consumed when an
      EOS is received.
  */
  bool getWaitOnEos()
  {
    bool _retval;
    _retval = gst_app_sink_get_wait_on_eos(cast(GstAppSink*)cPtr);
    return _retval;
  }

  /**
      Check if appsink is EOS, which is when no more samples can be pulled because
    an EOS event was received.
    
    This function also returns true when the appsink is not in the PAUSED or
    PLAYING state.
    Returns:     true if no more samples can be pulled and the appsink is EOS.
  */
  bool isEos()
  {
    bool _retval;
    _retval = gst_app_sink_is_eos(cast(GstAppSink*)cPtr);
    return _retval;
  }

  /**
      Get the last preroll sample in appsink. This was the sample that caused the
    appsink to preroll in the PAUSED state.
    
    This function is typically used when dealing with a pipeline in the PAUSED
    state. Calling this function after doing a seek will give the sample right
    after the seek position.
    
    Calling this function will clear the internal reference to the preroll
    buffer.
    
    Note that the preroll sample will also be returned as the first sample
    when calling [gstapp.app_sink.AppSink.pullSample].
    
    If an EOS event was received before any buffers, this function returns
    null. Use gst_app_sink_is_eos () to check for the EOS condition.
    
    This function blocks until a preroll sample or EOS is received or the appsink
    element is set to the READY/NULL state.
    Returns:     a #GstSample or NULL when the appsink is stopped or EOS.
               Call gst_sample_unref() after usage.
  */
  gst.sample.Sample pullPreroll()
  {
    GstSample* _cretval;
    _cretval = gst_app_sink_pull_preroll(cast(GstAppSink*)cPtr);
    auto _retval = _cretval ? new gst.sample.Sample(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      This function blocks until a sample or EOS becomes available or the appsink
    element is set to the READY/NULL state.
    
    This function will only return samples when the appsink is in the PLAYING
    state. All rendered buffers will be put in a queue so that the application
    can pull samples at its own rate. Note that when the application does not
    pull samples fast enough, the queued buffers could consume a lot of memory,
    especially when dealing with raw video frames.
    
    If an EOS event was received before any buffers, this function returns
    null. Use gst_app_sink_is_eos () to check for the EOS condition.
    Returns:     a #GstSample or NULL when the appsink is stopped or EOS.
               Call gst_sample_unref() after usage.
  */
  gst.sample.Sample pullSample()
  {
    GstSample* _cretval;
    _cretval = gst_app_sink_pull_sample(cast(GstAppSink*)cPtr);
    auto _retval = _cretval ? new gst.sample.Sample(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      Instruct appsink to enable or disable buffer list support.
    
    For backwards-compatibility reasons applications need to opt in
    to indicate that they will be able to handle buffer lists.
    Params:
      enableLists =       enable or disable buffer list support
  */
  void setBufferListSupport(bool enableLists)
  {
    gst_app_sink_set_buffer_list_support(cast(GstAppSink*)cPtr, enableLists);
  }

  /**
      Set the capabilities on the appsink element.  This function takes
    a copy of the caps structure. After calling this method, the sink will only
    accept caps that match caps. If caps is non-fixed, or incomplete,
    you must check the caps on the samples to get the actual used caps.
    Params:
      caps =       caps to set
  */
  void setCaps(gst.caps.Caps caps = null)
  {
    gst_app_sink_set_caps(cast(GstAppSink*)cPtr, caps ? cast(const(GstCaps)*)caps.cPtr(No.dup) : null);
  }

  /**
      Instruct appsink to drop old buffers when the maximum amount of queued
    data is reached, that is, when any configured limit is hit (max-buffers, max-time or max-bytes).
    Params:
      drop =       the new state
  */
  void setDrop(bool drop)
  {
    gst_app_sink_set_drop(cast(GstAppSink*)cPtr, drop);
  }

  /**
      Make appsink emit the "new-preroll" and "new-sample" signals. This option is
    by default disabled because signal emission is expensive and unneeded when
    the application prefers to operate in pull mode.
    Params:
      emit =       the new state
  */
  void setEmitSignals(bool emit)
  {
    gst_app_sink_set_emit_signals(cast(GstAppSink*)cPtr, emit);
  }

  /**
      Set the maximum amount of buffers that can be queued in appsink. After this
    amount of buffers are queued in appsink, any more buffers will block upstream
    elements until a sample is pulled from appsink, unless 'drop' is set, in which
    case new buffers will be discarded.
    Params:
      max =       the maximum number of buffers to queue
  */
  void setMaxBuffers(uint max)
  {
    gst_app_sink_set_max_buffers(cast(GstAppSink*)cPtr, max);
  }

  /**
      Set the maximum total size that can be queued in appsink. After this
    amount of buffers are queued in appsink, any more buffers will block upstream
    elements until a sample is pulled from appsink, unless 'drop' is set, in which
    case new buffers will be discarded.
    Params:
      max =       the maximum total size of buffers to queue, in bytes
  */
  void setMaxBytes(ulong max)
  {
    gst_app_sink_set_max_bytes(cast(GstAppSink*)cPtr, max);
  }

  /**
      Set the maximum total duration that can be queued in appsink. After this
    amount of buffers are queued in appsink, any more buffers will block upstream
    elements until a sample is pulled from appsink, unless 'drop' is set, in which
    case new buffers will be discarded.
    Params:
      max =       the maximum total duration to queue
  */
  void setMaxTime(gst.types.ClockTime max)
  {
    gst_app_sink_set_max_time(cast(GstAppSink*)cPtr, max);
  }

  /**
      Instruct appsink to wait for all buffers to be consumed when an EOS is received.
    Params:
      wait =       the new state
  */
  void setWaitOnEos(bool wait)
  {
    gst_app_sink_set_wait_on_eos(cast(GstAppSink*)cPtr, wait);
  }

  /**
      Get the last preroll sample in appsink. This was the sample that caused the
    appsink to preroll in the PAUSED state.
    
    This function is typically used when dealing with a pipeline in the PAUSED
    state. Calling this function after doing a seek will give the sample right
    after the seek position.
    
    Calling this function will clear the internal reference to the preroll
    buffer.
    
    Note that the preroll sample will also be returned as the first sample
    when calling [gstapp.app_sink.AppSink.pullSample].
    
    If an EOS event was received before any buffers or the timeout expires,
    this function returns null. Use gst_app_sink_is_eos () to check for the EOS
    condition.
    
    This function blocks until a preroll sample or EOS is received, the appsink
    element is set to the READY/NULL state, or the timeout expires.
    Params:
      timeout =       the maximum amount of time to wait for the preroll sample
    Returns:     a #GstSample or NULL when the appsink is stopped or EOS or the timeout expires.
               Call gst_sample_unref() after usage.
  */
  gst.sample.Sample tryPullPreroll(gst.types.ClockTime timeout)
  {
    GstSample* _cretval;
    _cretval = gst_app_sink_try_pull_preroll(cast(GstAppSink*)cPtr, timeout);
    auto _retval = _cretval ? new gst.sample.Sample(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      This function blocks until a sample or EOS becomes available or the appsink
    element is set to the READY/NULL state or the timeout expires.
    
    This function will only return samples when the appsink is in the PLAYING
    state. All rendered buffers will be put in a queue so that the application
    can pull samples at its own rate. Note that when the application does not
    pull samples fast enough, the queued buffers could consume a lot of memory,
    especially when dealing with raw video frames.
    
    If an EOS event was received before any buffers or the timeout expires,
    this function returns null. Use gst_app_sink_is_eos () to check for the EOS
    condition.
    Params:
      timeout =       the maximum amount of time to wait for a sample
    Returns:     a #GstSample or NULL when the appsink is stopped or EOS or the timeout expires.
               Call gst_sample_unref() after usage.
  */
  gst.sample.Sample tryPullSample(gst.types.ClockTime timeout)
  {
    GstSample* _cretval;
    _cretval = gst_app_sink_try_pull_sample(cast(GstAppSink*)cPtr, timeout);
    auto _retval = _cretval ? new gst.sample.Sample(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      Signal that the end-of-stream has been reached. This signal is emitted from
    the streaming thread.
  
    ## Parameters
    $(LIST
      * $(B appSink) the instance the signal is connected to
    )
  */
  alias EosCallbackDlg = void delegate(gstapp.app_sink.AppSink appSink);

  /** ditto */
  alias EosCallbackFunc = void function(gstapp.app_sink.AppSink appSink);

  /**
    Connect to Eos signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectEos(T)(T callback, Flag!"after" after = No.after)
  if (is(T : EosCallbackDlg) || is(T : EosCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto appSink = getVal!(gstapp.app_sink.AppSink)(_paramVals);
      _dClosure.dlg(appSink);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("eos", closure, after);
  }

  /**
      Signal that a new preroll sample is available.
    
    This signal is emitted from the streaming thread and only when the
    "emit-signals" property is true.
    
    The new preroll sample can be retrieved with the "pull-preroll" action
    signal or [gstapp.app_sink.AppSink.pullPreroll] either from this signal callback
    or from any other thread.
    
    Note that this signal is only emitted when the "emit-signals" property is
    set to true, which it is not by default for performance reasons.
  
    ## Parameters
    $(LIST
      * $(B appSink) the instance the signal is connected to
    )
    Returns: 
  */
  alias NewPrerollCallbackDlg = gst.types.FlowReturn delegate(gstapp.app_sink.AppSink appSink);

  /** ditto */
  alias NewPrerollCallbackFunc = gst.types.FlowReturn function(gstapp.app_sink.AppSink appSink);

  /**
    Connect to NewPreroll signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectNewPreroll(T)(T callback, Flag!"after" after = No.after)
  if (is(T : NewPrerollCallbackDlg) || is(T : NewPrerollCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto appSink = getVal!(gstapp.app_sink.AppSink)(_paramVals);
      auto _dretval = _dClosure.dlg(appSink);
      GstFlowReturn _retval = cast(GstFlowReturn)_dretval;
      setVal!gst.types.FlowReturn(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("new-preroll", closure, after);
  }

  /**
      Signal that a new sample is available.
    
    This signal is emitted from the streaming thread and only when the
    "emit-signals" property is true.
    
    The new sample can be retrieved with the "pull-sample" action
    signal or [gstapp.app_sink.AppSink.pullSample] either from this signal callback
    or from any other thread.
    
    Note that this signal is only emitted when the "emit-signals" property is
    set to true, which it is not by default for performance reasons.
  
    ## Parameters
    $(LIST
      * $(B appSink) the instance the signal is connected to
    )
    Returns: 
  */
  alias NewSampleCallbackDlg = gst.types.FlowReturn delegate(gstapp.app_sink.AppSink appSink);

  /** ditto */
  alias NewSampleCallbackFunc = gst.types.FlowReturn function(gstapp.app_sink.AppSink appSink);

  /**
    Connect to NewSample signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectNewSample(T)(T callback, Flag!"after" after = No.after)
  if (is(T : NewSampleCallbackDlg) || is(T : NewSampleCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto appSink = getVal!(gstapp.app_sink.AppSink)(_paramVals);
      auto _dretval = _dClosure.dlg(appSink);
      GstFlowReturn _retval = cast(GstFlowReturn)_dretval;
      setVal!gst.types.FlowReturn(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("new-sample", closure, after);
  }

  /**
      Signal that a new downstream serialized event is available.
    
    This signal is emitted from the streaming thread and only when the
    "emit-signals" property is true.
    
    The new event can be retrieved with the "try-pull-object" action
    signal or [gstapp.app_sink.AppSink.pullObject] either from this signal callback
    or from any other thread.
    
    EOS will not be notified using this signal, use #GstAppSink::eos instead.
    EOS cannot be pulled either, use [gstapp.app_sink.AppSink.isEos] to check for it.
    
    Note that this signal is only emitted when the "emit-signals" property is
    set to true, which it is not by default for performance reasons.
    
    The callback should return true if the event has been handled, which will
    skip basesink handling of the event, false otherwise.
  
    ## Parameters
    $(LIST
      * $(B appSink) the instance the signal is connected to
    )
    Returns: 
  */
  alias NewSerializedEventCallbackDlg = bool delegate(gstapp.app_sink.AppSink appSink);

  /** ditto */
  alias NewSerializedEventCallbackFunc = bool function(gstapp.app_sink.AppSink appSink);

  /**
    Connect to NewSerializedEvent signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectNewSerializedEvent(T)(T callback, Flag!"after" after = No.after)
  if (is(T : NewSerializedEventCallbackDlg) || is(T : NewSerializedEventCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto appSink = getVal!(gstapp.app_sink.AppSink)(_paramVals);
      _retval = _dClosure.dlg(appSink);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("new-serialized-event", closure, after);
  }

  /**
      Signal that a new propose_allocation query is available.
    
    This signal is emitted from the streaming thread and only when the
    "emit-signals" property is true.
  
    ## Parameters
    $(LIST
      * $(B query)       the allocation query
      * $(B appSink) the instance the signal is connected to
    )
    Returns: 
  */
  alias ProposeAllocationCallbackDlg = bool delegate(gst.query.Query query, gstapp.app_sink.AppSink appSink);

  /** ditto */
  alias ProposeAllocationCallbackFunc = bool function(gst.query.Query query, gstapp.app_sink.AppSink appSink);

  /**
    Connect to ProposeAllocation signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectProposeAllocation(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ProposeAllocationCallbackDlg) || is(T : ProposeAllocationCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto appSink = getVal!(gstapp.app_sink.AppSink)(_paramVals);
      auto query = getVal!(gst.query.Query)(&_paramVals[1]);
      _retval = _dClosure.dlg(query, appSink);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("propose-allocation", closure, after);
  }

  /**
      Get the last preroll sample in appsink. This was the sample that caused the
    appsink to preroll in the PAUSED state.
    
    This function is typically used when dealing with a pipeline in the PAUSED
    state. Calling this function after doing a seek will give the sample right
    after the seek position.
    
    Calling this function will clear the internal reference to the preroll
    buffer.
    
    Note that the preroll sample will also be returned as the first sample
    when calling [gstapp.app_sink.AppSink.pullSample] or the "pull-sample" action signal.
    
    If an EOS event was received before any buffers, this function returns
    null. Use gst_app_sink_is_eos () to check for the EOS condition.
    
    This function blocks until a preroll sample or EOS is received or the appsink
    element is set to the READY/NULL state.
  
    ## Parameters
    $(LIST
      * $(B appSink) the instance the signal is connected to
    )
    Returns:     a #GstSample or null when the appsink is stopped or EOS.
  */
  alias PullPrerollCallbackDlg = gst.sample.Sample delegate(gstapp.app_sink.AppSink appSink);

  /** ditto */
  alias PullPrerollCallbackFunc = gst.sample.Sample function(gstapp.app_sink.AppSink appSink);

  /**
    Connect to PullPreroll signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectPullPreroll(T)(T callback, Flag!"after" after = No.after)
  if (is(T : PullPrerollCallbackDlg) || is(T : PullPrerollCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto appSink = getVal!(gstapp.app_sink.AppSink)(_paramVals);
      auto _retval = _dClosure.dlg(appSink);
      setVal!gst.sample.Sample(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("pull-preroll", closure, after);
  }

  /**
      This function blocks until a sample or EOS becomes available or the appsink
    element is set to the READY/NULL state.
    
    This function will only return samples when the appsink is in the PLAYING
    state. All rendered samples will be put in a queue so that the application
    can pull samples at its own rate.
    
    Note that when the application does not pull samples fast enough, the
    queued samples could consume a lot of memory, especially when dealing with
    raw video frames. It's possible to control the behaviour of the queue with
    the "drop" and "max-buffers" / "max-bytes" / "max-time" set of properties.
    
    If an EOS event was received before any buffers, this function returns
    null. Use gst_app_sink_is_eos () to check for the EOS condition.
  
    ## Parameters
    $(LIST
      * $(B appSink) the instance the signal is connected to
    )
    Returns:     a #GstSample or null when the appsink is stopped or EOS.
  */
  alias PullSampleCallbackDlg = gst.sample.Sample delegate(gstapp.app_sink.AppSink appSink);

  /** ditto */
  alias PullSampleCallbackFunc = gst.sample.Sample function(gstapp.app_sink.AppSink appSink);

  /**
    Connect to PullSample signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectPullSample(T)(T callback, Flag!"after" after = No.after)
  if (is(T : PullSampleCallbackDlg) || is(T : PullSampleCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto appSink = getVal!(gstapp.app_sink.AppSink)(_paramVals);
      auto _retval = _dClosure.dlg(appSink);
      setVal!gst.sample.Sample(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("pull-sample", closure, after);
  }

  /**
      This function blocks until a sample or an event becomes available or the appsink
    element is set to the READY/NULL state or the timeout expires.
    
    This function will only return samples when the appsink is in the PLAYING
    state. All rendered samples and events will be put in a queue so that the application
    can pull them at its own rate.
    Events can be pulled when the appsink is in the READY, PAUSED or PLAYING state.
    
    Note that when the application does not pull samples fast enough, the
    queued samples could consume a lot of memory, especially when dealing with
    raw video frames. It's possible to control the behaviour of the queue with
    the "drop" and "max-buffers" / "max-bytes" / "max-time" set of properties.
    
    This function will only pull serialized events, excluding
    the EOS event for which this functions returns
    null. Use [gstapp.app_sink.AppSink.isEos] to check for the EOS condition.
    
    This signal is a variant of #GstAppSink::try-pull-sample: that can be used
    to handle incoming events as well as samples.
    
    Note that future releases may extend this API to return other object types
    so make sure that your code is checking for the actual type it is handling.
  
    ## Parameters
    $(LIST
      * $(B timeout)       the maximum amount of time to wait for a sample
      * $(B appSink) the instance the signal is connected to
    )
    Returns:     a #GstSample or a #GstEvent or NULL when the appsink is stopped or EOS or the timeout expires.
  */
  alias TryPullObjectCallbackDlg = gst.mini_object.MiniObject delegate(ulong timeout, gstapp.app_sink.AppSink appSink);

  /** ditto */
  alias TryPullObjectCallbackFunc = gst.mini_object.MiniObject function(ulong timeout, gstapp.app_sink.AppSink appSink);

  /**
    Connect to TryPullObject signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectTryPullObject(T)(T callback, Flag!"after" after = No.after)
  if (is(T : TryPullObjectCallbackDlg) || is(T : TryPullObjectCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto appSink = getVal!(gstapp.app_sink.AppSink)(_paramVals);
      auto timeout = getVal!(ulong)(&_paramVals[1]);
      auto _retval = _dClosure.dlg(timeout, appSink);
      setVal!gst.mini_object.MiniObject(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("try-pull-object", closure, after);
  }

  /**
      Get the last preroll sample in appsink. This was the sample that caused the
    appsink to preroll in the PAUSED state.
    
    This function is typically used when dealing with a pipeline in the PAUSED
    state. Calling this function after doing a seek will give the sample right
    after the seek position.
    
    Calling this function will clear the internal reference to the preroll
    buffer.
    
    Note that the preroll sample will also be returned as the first sample
    when calling [gstapp.app_sink.AppSink.pullSample] or the "pull-sample" action signal.
    
    If an EOS event was received before any buffers or the timeout expires,
    this function returns null. Use gst_app_sink_is_eos () to check for the EOS
    condition.
    
    This function blocks until a preroll sample or EOS is received, the appsink
    element is set to the READY/NULL state, or the timeout expires.
  
    ## Parameters
    $(LIST
      * $(B timeout)       the maximum amount of time to wait for the preroll sample
      * $(B appSink) the instance the signal is connected to
    )
    Returns:     a #GstSample or null when the appsink
      is stopped or EOS or the timeout expires.
  */
  alias TryPullPrerollCallbackDlg = gst.sample.Sample delegate(ulong timeout, gstapp.app_sink.AppSink appSink);

  /** ditto */
  alias TryPullPrerollCallbackFunc = gst.sample.Sample function(ulong timeout, gstapp.app_sink.AppSink appSink);

  /**
    Connect to TryPullPreroll signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectTryPullPreroll(T)(T callback, Flag!"after" after = No.after)
  if (is(T : TryPullPrerollCallbackDlg) || is(T : TryPullPrerollCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto appSink = getVal!(gstapp.app_sink.AppSink)(_paramVals);
      auto timeout = getVal!(ulong)(&_paramVals[1]);
      auto _retval = _dClosure.dlg(timeout, appSink);
      setVal!gst.sample.Sample(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("try-pull-preroll", closure, after);
  }

  /**
      This function blocks until a sample or EOS becomes available or the appsink
    element is set to the READY/NULL state or the timeout expires.
    
    This function will only return samples when the appsink is in the PLAYING
    state. All rendered samples will be put in a queue so that the application
    can pull samples at its own rate.
    
    Note that when the application does not pull samples fast enough, the
    queued samples could consume a lot of memory, especially when dealing with
    raw video frames. It's possible to control the behaviour of the queue with
    the "drop" and "max-buffers" / "max-bytes" / "max-time" set of properties.
    
    If an EOS event was received before any buffers or the timeout expires,
    this function returns null. Use gst_app_sink_is_eos () to check
    for the EOS condition.
  
    ## Parameters
    $(LIST
      * $(B timeout)       the maximum amount of time to wait for a sample
      * $(B appSink) the instance the signal is connected to
    )
    Returns:     a #GstSample or NULL when the appsink is stopped or EOS or the timeout expires.
  */
  alias TryPullSampleCallbackDlg = gst.sample.Sample delegate(ulong timeout, gstapp.app_sink.AppSink appSink);

  /** ditto */
  alias TryPullSampleCallbackFunc = gst.sample.Sample function(ulong timeout, gstapp.app_sink.AppSink appSink);

  /**
    Connect to TryPullSample signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectTryPullSample(T)(T callback, Flag!"after" after = No.after)
  if (is(T : TryPullSampleCallbackDlg) || is(T : TryPullSampleCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto appSink = getVal!(gstapp.app_sink.AppSink)(_paramVals);
      auto timeout = getVal!(ulong)(&_paramVals[1]);
      auto _retval = _dClosure.dlg(timeout, appSink);
      setVal!gst.sample.Sample(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("try-pull-sample", closure, after);
  }
}
