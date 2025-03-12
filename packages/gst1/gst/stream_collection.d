module gst.stream_collection;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gobject.param_spec;
import gst.c.functions;
import gst.c.types;
import gst.object;
import gst.stream;
import gst.types;

/**
    A collection of #GstStream that are available.
  
  A #GstStreamCollection will be provided by elements that can make those
  streams available. Applications can use the collection to show the user
  what streams are available by using %[gst.stream_collection.StreamCollection.getStream]
  
  Once posted, a #GstStreamCollection is immutable. Updates are made by sending
  a new #GstStreamCollection message, which may or may not share some of
  the #GstStream objects from the collection it replaces. The receiver can check
  the sender of a stream collection message to know which collection is
  obsoleted.
  
  Several elements in a pipeline can provide #GstStreamCollection.
  
  Applications can activate streams from a collection by using the
  #GST_EVENT_SELECT_STREAMS event on a pipeline, bin or element.
*/
class StreamCollection : gst.object.ObjectGst
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_stream_collection_get_type != &gidSymbolNotFound ? gst_stream_collection_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override StreamCollection self()
  {
    return this;
  }

  /**
      Create a new #GstStreamCollection.
    Params:
      upstreamId =       The stream id of the parent stream
    Returns:     The new #GstStreamCollection.
  */
  this(string upstreamId = null)
  {
    GstStreamCollection* _cretval;
    const(char)* _upstreamId = upstreamId.toCString(No.Alloc);
    _cretval = gst_stream_collection_new(_upstreamId);
    this(_cretval, Yes.Take);
  }

  /**
      Add the given stream to the collection.
    Params:
      stream =       the #GstStream to add
    Returns:     true if the stream was properly added, else false
  */
  bool addStream(gst.stream.Stream stream)
  {
    bool _retval;
    _retval = gst_stream_collection_add_stream(cast(GstStreamCollection*)cPtr, stream ? cast(GstStream*)stream.cPtr(Yes.Dup) : null);
    return _retval;
  }

  /**
      Get the number of streams this collection contains
    Returns:     The number of streams that collection contains
  */
  uint getSize()
  {
    uint _retval;
    _retval = gst_stream_collection_get_size(cast(GstStreamCollection*)cPtr);
    return _retval;
  }

  /**
      Retrieve the #GstStream with index index from the collection.
    
    The caller should not modify the returned #GstStream
    Params:
      index =       Index of the stream to retrieve
    Returns:     A #GstStream
  */
  gst.stream.Stream getStream(uint index)
  {
    GstStream* _cretval;
    _cretval = gst_stream_collection_get_stream(cast(GstStreamCollection*)cPtr, index);
    auto _retval = ObjectG.getDObject!(gst.stream.Stream)(cast(GstStream*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the upstream id of the collection.
    Returns:     The upstream id
  */
  string getUpstreamId()
  {
    const(char)* _cretval;
    _cretval = gst_stream_collection_get_upstream_id(cast(GstStreamCollection*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      The stream notify signal is used to be notified of property changes to
    streams within the collection.
  
    ## Parameters
    $(LIST
      * $(B propStream)       the #GstStream that originated the signal
      * $(B prop)       the property that changed
      * $(B streamCollection) the instance the signal is connected to
    )
  */
  alias StreamNotifyCallbackDlg = void delegate(gst.stream.Stream propStream, gobject.param_spec.ParamSpec prop, gst.stream_collection.StreamCollection streamCollection);

  /** ditto */
  alias StreamNotifyCallbackFunc = void function(gst.stream.Stream propStream, gobject.param_spec.ParamSpec prop, gst.stream_collection.StreamCollection streamCollection);

  /**
    Connect to StreamNotify signal.
    Params:
      detail = Signal detail or null (default)
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectStreamNotify(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (is(T : StreamNotifyCallbackDlg) || is(T : StreamNotifyCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto streamCollection = getVal!(gst.stream_collection.StreamCollection)(_paramVals);
      auto propStream = getVal!(gst.stream.Stream)(&_paramVals[1]);
      auto prop = getVal!(gobject.param_spec.ParamSpec)(&_paramVals[2]);
      _dClosure.dlg(propStream, prop, streamCollection);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("stream-notify"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }
}
