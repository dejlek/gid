module gstpbutils.discoverer;

import gid.gid;
import glib.error;
import gobject.dclosure;
import gobject.object;
import gst.element;
import gst.types;
import gstpbutils.c.functions;
import gstpbutils.c.types;
import gstpbutils.discoverer_info;
import gstpbutils.types;

/**
    The #GstDiscoverer is a utility object which allows to get as much
  information as possible from one or many URIs.
  
  It provides two APIs, allowing usage in blocking or non-blocking mode.
  
  The blocking mode just requires calling [gstpbutils.discoverer.Discoverer.discoverUri]
  with the URI one wishes to discover.
  
  The non-blocking mode requires a running #GMainLoop iterating a
  #GMainContext, where one connects to the various signals, appends the
  URIs to be processed (through [gstpbutils.discoverer.Discoverer.discoverUriAsync]) and then
  asks for the discovery to begin (through [gstpbutils.discoverer.Discoverer.start]).
  By default this will use the GLib default main context unless you have
  set a custom context using [glib.main_context.MainContext.pushThreadDefault].
  
  All the information is returned in a #GstDiscovererInfo structure.
*/
class Discoverer : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_discoverer_get_type != &gidSymbolNotFound ? gst_discoverer_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override Discoverer self()
  {
    return this;
  }

  /**
      Creates a new #GstDiscoverer with the provided timeout.
    Params:
      timeout =       timeout per file, in nanoseconds. Allowed are values between
            one second (#GST_SECOND) and one hour (3600 * #GST_SECOND)
    Returns:     The new #GstDiscoverer.
      If an error occurred when creating the discoverer, err will be set
      accordingly and null will be returned. If err is set, the caller must
      free it when no longer needed using [glib.error.ErrorG.free].
  */
  this(gst.types.ClockTime timeout)
  {
    GstDiscoverer* _cretval;
    GError *_err;
    _cretval = gst_discoverer_new(timeout, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  /**
      Synchronously discovers the given uri.
    
    A copy of uri will be made internally, so the caller can safely [glib.global.gfree]
    afterwards.
    Params:
      uri =       The URI to run on.
    Returns:     the result of the scanning. Can be null if an
      error occurred.
  */
  gstpbutils.discoverer_info.DiscovererInfo discoverUri(string uri)
  {
    GstDiscovererInfo* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    GError *_err;
    _cretval = gst_discoverer_discover_uri(cast(GstDiscoverer*)cPtr, _uri, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gstpbutils.discoverer_info.DiscovererInfo)(cast(GstDiscovererInfo*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Appends the given uri to the list of URIs to discoverer. The actual
    discovery of the uri will only take place if [gstpbutils.discoverer.Discoverer.start] has
    been called.
    
    A copy of uri will be made internally, so the caller can safely [glib.global.gfree]
    afterwards.
    Params:
      uri =       the URI to add.
    Returns:     true if the uri was successfully appended to the list of pending
      uris, else false
  */
  bool discoverUriAsync(string uri)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    _retval = gst_discoverer_discover_uri_async(cast(GstDiscoverer*)cPtr, _uri);
    return _retval;
  }

  /**
      Allow asynchronous discovering of URIs to take place.
    A #GMainLoop must be available for #GstDiscoverer to properly work in
    asynchronous mode.
  */
  void start()
  {
    gst_discoverer_start(cast(GstDiscoverer*)cPtr);
  }

  /**
      Stop the discovery of any pending URIs and clears the list of
    pending URIS (if any).
  */
  void stop()
  {
    gst_discoverer_stop(cast(GstDiscoverer*)cPtr);
  }

  /**
      Will be emitted in async mode when all information on a URI could be
    discovered, or an error occurred.
    
    When an error occurs, info might still contain some partial information,
    depending on the circumstances of the error.
  
    ## Parameters
    $(LIST
      * $(B info)       the results #GstDiscovererInfo
      * $(B error)       #GError, which will be non-NULL
                                                if an error occurred during
                                                discovery. You must not free
                                                this #GError, it will be freed by
                                                the discoverer.
      * $(B discoverer) the instance the signal is connected to
    )
  */
  alias DiscoveredCallbackDlg = void delegate(gstpbutils.discoverer_info.DiscovererInfo info, glib.error.ErrorG error, gstpbutils.discoverer.Discoverer discoverer);

  /** ditto */
  alias DiscoveredCallbackFunc = void function(gstpbutils.discoverer_info.DiscovererInfo info, glib.error.ErrorG error, gstpbutils.discoverer.Discoverer discoverer);

  /**
    Connect to Discovered signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectDiscovered(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DiscoveredCallbackDlg) || is(T : DiscoveredCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto discoverer = getVal!(gstpbutils.discoverer.Discoverer)(_paramVals);
      auto info = getVal!(gstpbutils.discoverer_info.DiscovererInfo)(&_paramVals[1]);
      auto error = getVal!(glib.error.ErrorG)(&_paramVals[2]);
      _dClosure.dlg(info, error, discoverer);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("discovered", closure, after);
  }

  /**
      Will be emitted in async mode when all pending URIs have been processed.
  
    ## Parameters
    $(LIST
      * $(B discoverer) the instance the signal is connected to
    )
  */
  alias FinishedCallbackDlg = void delegate(gstpbutils.discoverer.Discoverer discoverer);

  /** ditto */
  alias FinishedCallbackFunc = void function(gstpbutils.discoverer.Discoverer discoverer);

  /**
    Connect to Finished signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectFinished(T)(T callback, Flag!"After" after = No.After)
  if (is(T : FinishedCallbackDlg) || is(T : FinishedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto discoverer = getVal!(gstpbutils.discoverer.Discoverer)(_paramVals);
      _dClosure.dlg(discoverer);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("finished", closure, after);
  }

  /**
      Retrieves information about a URI from and external source of information,
    like a cache file. This is used by the discoverer to speed up the
    discovery.
  
    ## Parameters
    $(LIST
      * $(B uri)       THe URI to load the serialized info for
      * $(B discoverer) the instance the signal is connected to
    )
    Returns:     The #GstDiscovererInfo representing
      uri, or null if no information
  */
  alias LoadSerializedInfoCallbackDlg = gstpbutils.discoverer_info.DiscovererInfo delegate(string uri, gstpbutils.discoverer.Discoverer discoverer);

  /** ditto */
  alias LoadSerializedInfoCallbackFunc = gstpbutils.discoverer_info.DiscovererInfo function(string uri, gstpbutils.discoverer.Discoverer discoverer);

  /**
    Connect to LoadSerializedInfo signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectLoadSerializedInfo(T)(T callback, Flag!"After" after = No.After)
  if (is(T : LoadSerializedInfoCallbackDlg) || is(T : LoadSerializedInfoCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto discoverer = getVal!(gstpbutils.discoverer.Discoverer)(_paramVals);
      auto uri = getVal!(string)(&_paramVals[1]);
      auto _retval = _dClosure.dlg(uri, discoverer);
      setVal!gstpbutils.discoverer_info.DiscovererInfo(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("load-serialized-info", closure, after);
  }

  /**
      This signal is emitted after the source element has been created for, so
    the URI being discovered, so it can be configured by setting additional
    properties (e.g. set a proxy server for an http source, or set the device
    and read speed for an audio cd source).
    
    This signal is usually emitted from the context of a GStreamer streaming
    thread.
  
    ## Parameters
    $(LIST
      * $(B source)       source element
      * $(B discoverer) the instance the signal is connected to
    )
  */
  alias SourceSetupCallbackDlg = void delegate(gst.element.Element source, gstpbutils.discoverer.Discoverer discoverer);

  /** ditto */
  alias SourceSetupCallbackFunc = void function(gst.element.Element source, gstpbutils.discoverer.Discoverer discoverer);

  /**
    Connect to SourceSetup signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectSourceSetup(T)(T callback, Flag!"After" after = No.After)
  if (is(T : SourceSetupCallbackDlg) || is(T : SourceSetupCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto discoverer = getVal!(gstpbutils.discoverer.Discoverer)(_paramVals);
      auto source = getVal!(gst.element.Element)(&_paramVals[1]);
      _dClosure.dlg(source, discoverer);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("source-setup", closure, after);
  }

  /**
      Will be emitted when the discover starts analyzing the pending URIs
  
    ## Parameters
    $(LIST
      * $(B discoverer) the instance the signal is connected to
    )
  */
  alias StartingCallbackDlg = void delegate(gstpbutils.discoverer.Discoverer discoverer);

  /** ditto */
  alias StartingCallbackFunc = void function(gstpbutils.discoverer.Discoverer discoverer);

  /**
    Connect to Starting signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectStarting(T)(T callback, Flag!"After" after = No.After)
  if (is(T : StartingCallbackDlg) || is(T : StartingCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto discoverer = getVal!(gstpbutils.discoverer.Discoverer)(_paramVals);
      _dClosure.dlg(discoverer);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("starting", closure, after);
  }
}
