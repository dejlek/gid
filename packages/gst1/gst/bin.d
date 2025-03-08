module gst.bin;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gobject.types;
import gst.c.functions;
import gst.c.types;
import gst.child_proxy;
import gst.child_proxy_mixin;
import gst.element;
import gst.iterator;
import gst.pad;
import gst.types;

/**
    #GstBin is an element that can contain other #GstElement, allowing them to be
  managed as a group.
  Pads from the child elements can be ghosted to the bin, see #GstGhostPad.
  This makes the bin look like any other elements and enables creation of
  higher-level abstraction elements.
  
  A new #GstBin is created with [gst.bin.Bin.new_]. Use a #GstPipeline instead if you
  want to create a toplevel bin because a normal bin doesn't have a bus or
  handle clock distribution of its own.
  
  After the bin has been created you will typically add elements to it with
  [gst.bin.Bin.add]. You can remove elements with [gst.bin.Bin.remove].
  
  An element can be retrieved from a bin with [gst.bin.Bin.getByName], using the
  elements name. [gst.bin.Bin.getByNameRecurseUp] is mainly used for internal
  purposes and will query the parent bins when the element is not found in the
  current bin.
  
  An iterator of elements in a bin can be retrieved with
  [gst.bin.Bin.iterateElements]. Various other iterators exist to retrieve the
  elements in a bin.
  
  [gst.object.ObjectGst.unref] is used to drop your reference to the bin.
  
  The #GstBin::element-added signal is fired whenever a new element is added to
  the bin. Likewise the #GstBin::element-removed signal is fired whenever an
  element is removed from the bin.
  
  A #GstBin internally intercepts every #GstMessage posted by its children and
  implements the following default behaviour for each of them:
  
  $(LIST
    * [gst.types.MessageType.eos]: This message is only posted by sinks in the PLAYING
  )
  state. If all sinks posted the EOS message, this bin will post and EOS
  message upwards.
  
  $(LIST
    * [gst.types.MessageType.segmentStart]: Just collected and never forwarded upwards.
      The messages are used to decide when all elements have completed playback
      of their segment.
    
    * [gst.types.MessageType.segmentDone]: Is posted by #GstBin when all elements that posted
      a SEGMENT_START have posted a SEGMENT_DONE.
    
    * [gst.types.MessageType.durationChanged]: Is posted by an element that detected a change
      in the stream duration. The duration change is posted to the
      application so that it can refetch the new duration with a duration
      query.
    
      Note that these messages can be posted before the bin is prerolled, in which
      case the duration query might fail.
    
      Note also that there might be a discrepancy (due to internal buffering/queueing)
      between the stream being currently displayed and the returned duration query.
    
      Applications might want to also query for duration (and changes) by
      listening to the [gst.types.MessageType.streamStart] message, signaling the active start
      of a (new) stream.
    
    * [gst.types.MessageType.clockLost]: This message is posted by an element when it
      can no longer provide a clock.
    
      The default bin behaviour is to check if the lost clock was the one provided
      by the bin. If so and the bin is currently in the PLAYING state, the message
      is forwarded to the bin parent.
    
      This message is also generated when a clock provider is removed from
      the bin. If this message is received by the application, it should
      PAUSE the pipeline and set it back to PLAYING to force a new clock
      distribution.
    
    * [gst.types.MessageType.clockProvide]: This message is generated when an element
      can provide a clock. This mostly happens when a new clock
      provider is added to the bin.
    
      The default behaviour of the bin is to mark the currently selected clock as
      dirty, which will perform a clock recalculation the next time the bin is
      asked to provide a clock.
    
      This message is never sent to the application but is forwarded to
      the parent of the bin.
    
    * OTHERS: posted upwards.
  )
    
  A #GstBin implements the following default behaviour for answering to a
  #GstQuery:
  
  $(LIST
    * [gst.types.QueryType.duration]: The bin will forward the query to all sink
      elements contained within and will return the maximum value.
      If no sinks are available in the bin, the query fails.
    
    * [gst.types.QueryType.position]: The query is sent to all sink elements in the bin and the
      MAXIMUM of all values is returned. If no sinks are available in the bin,
      the query fails.
    
    * OTHERS: the query is forwarded to all sink elements, the result
      of the first sink that answers the query successfully is returned. If no
      sink is in the bin, the query fails.
  )
    
  A #GstBin will by default forward any event sent to it to all sink
  ( [gst.types.EventTypeFlags.upstream] ) or source ( [gst.types.EventTypeFlags.downstream] ) elements
  depending on the event type.
  
  If all the elements return true, the bin will also return true, else false
  is returned. If no elements of the required type are in the bin, the event
  handler will return true.
*/
class Bin : gst.element.Element, gst.child_proxy.ChildProxy
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_bin_get_type != &gidSymbolNotFound ? gst_bin_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin ChildProxyT!();

  /**
      Creates a new bin with the given name.
    Params:
      name =       the name of the new bin
    Returns:     a new #GstBin
  */
  this(string name = null)
  {
    GstElement* _cretval;
    const(char)* _name = name.toCString(No.alloc);
    _cretval = gst_bin_new(_name);
    this(_cretval, No.take);
  }

  /**
      Adds the given element to the bin.  Sets the element's parent, and thus
    takes ownership of the element. An element can only be added to one bin.
    
    If the element's pads are linked to other pads, the pads will be unlinked
    before the element is added to the bin.
    
    > When you add an element to an already-running pipeline, you will have to
    > take care to set the state of the newly-added element to the desired
    > state (usually PLAYING or PAUSED, same you set the pipeline to originally)
    > with [gst.element.Element.setState], or use [gst.element.Element.syncStateWithParent].
    > The bin or pipeline will not take care of this for you.
    Params:
      element =       the #GstElement to add
    Returns:     true if the element could be added, false if
      the bin does not want to accept the element.
  */
  bool add(gst.element.Element element)
  {
    bool _retval;
    _retval = gst_bin_add(cast(GstBin*)cPtr, element ? cast(GstElement*)element.cPtr(No.dup) : null);
    return _retval;
  }

  /**
      Recursively looks for elements with an unlinked pad of the given
    direction within the specified bin and returns an unlinked pad
    if one is found, or null otherwise. If a pad is found, the caller
    owns a reference to it and should use [gst.object.ObjectGst.unref] on the
    pad when it is not needed any longer.
    Params:
      direction =       whether to look for an unlinked source or sink pad
    Returns:     unlinked pad of the given
      direction.
  */
  gst.pad.Pad findUnlinkedPad(gst.types.PadDirection direction)
  {
    GstPad* _cretval;
    _cretval = gst_bin_find_unlinked_pad(cast(GstBin*)cPtr, direction);
    auto _retval = ObjectG.getDObject!(gst.pad.Pad)(cast(GstPad*)_cretval, Yes.take);
    return _retval;
  }

  /**
      Looks for an element inside the bin that implements the given
    interface. If such an element is found, it returns the element.
    You can cast this element to the given interface afterwards.  If you want
    all elements that implement the interface, use
    [gst.bin.Bin.iterateAllByInterface]. This function recurses into child bins.
    Params:
      iface =       the #GType of an interface
    Returns:     A #GstElement inside the bin
      implementing the interface
  */
  gst.element.Element getByInterface(gobject.types.GType iface)
  {
    GstElement* _cretval;
    _cretval = gst_bin_get_by_interface(cast(GstBin*)cPtr, iface);
    auto _retval = ObjectG.getDObject!(gst.element.Element)(cast(GstElement*)_cretval, Yes.take);
    return _retval;
  }

  /**
      Gets the element with the given name from a bin. This
    function recurses into child bins.
    Params:
      name =       the element name to search for
    Returns:     the #GstElement with the given
      name
  */
  gst.element.Element getByName(string name)
  {
    GstElement* _cretval;
    const(char)* _name = name.toCString(No.alloc);
    _cretval = gst_bin_get_by_name(cast(GstBin*)cPtr, _name);
    auto _retval = ObjectG.getDObject!(gst.element.Element)(cast(GstElement*)_cretval, Yes.take);
    return _retval;
  }

  /**
      Gets the element with the given name from this bin. If the
    element is not found, a recursion is performed on the parent bin.
    Params:
      name =       the element name to search for
    Returns:     the #GstElement with the given
      name
  */
  gst.element.Element getByNameRecurseUp(string name)
  {
    GstElement* _cretval;
    const(char)* _name = name.toCString(No.alloc);
    _cretval = gst_bin_get_by_name_recurse_up(cast(GstBin*)cPtr, _name);
    auto _retval = ObjectG.getDObject!(gst.element.Element)(cast(GstElement*)_cretval, Yes.take);
    return _retval;
  }

  /** */
  gst.types.ElementFlags getSuppressedFlags()
  {
    GstElementFlags _cretval;
    _cretval = gst_bin_get_suppressed_flags(cast(GstBin*)cPtr);
    gst.types.ElementFlags _retval = cast(gst.types.ElementFlags)_cretval;
    return _retval;
  }

  /**
      Looks for all elements inside the bin with the given element factory name.
    The function recurses inside child bins. The iterator will yield a series of
    #GstElement.
    Params:
      factoryName =       the name of the #GstElementFactory
    Returns:     a #GstIterator of #GstElement
          for all elements in the bin with the given element factory name
  */
  gst.iterator.Iterator iterateAllByElementFactoryName(string factoryName)
  {
    GstIterator* _cretval;
    const(char)* _factoryName = factoryName.toCString(No.alloc);
    _cretval = gst_bin_iterate_all_by_element_factory_name(cast(GstBin*)cPtr, _factoryName);
    auto _retval = _cretval ? new gst.iterator.Iterator(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      Looks for all elements inside the bin that implements the given
    interface. You can safely cast all returned elements to the given interface.
    The function recurses inside child bins. The iterator will yield a series
    of #GstElement.
    Params:
      iface =       the #GType of an interface
    Returns:     a #GstIterator of #GstElement
          for all elements in the bin implementing the given interface
  */
  gst.iterator.Iterator iterateAllByInterface(gobject.types.GType iface)
  {
    GstIterator* _cretval;
    _cretval = gst_bin_iterate_all_by_interface(cast(GstBin*)cPtr, iface);
    auto _retval = _cretval ? new gst.iterator.Iterator(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      Gets an iterator for the elements in this bin.
    Returns:     a #GstIterator of #GstElement
  */
  gst.iterator.Iterator iterateElements()
  {
    GstIterator* _cretval;
    _cretval = gst_bin_iterate_elements(cast(GstBin*)cPtr);
    auto _retval = _cretval ? new gst.iterator.Iterator(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      Gets an iterator for the elements in this bin.
    This iterator recurses into GstBin children.
    Returns:     a #GstIterator of #GstElement
  */
  gst.iterator.Iterator iterateRecurse()
  {
    GstIterator* _cretval;
    _cretval = gst_bin_iterate_recurse(cast(GstBin*)cPtr);
    auto _retval = _cretval ? new gst.iterator.Iterator(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      Gets an iterator for all elements in the bin that have the
    #GST_ELEMENT_FLAG_SINK flag set.
    Returns:     a #GstIterator of #GstElement
  */
  gst.iterator.Iterator iterateSinks()
  {
    GstIterator* _cretval;
    _cretval = gst_bin_iterate_sinks(cast(GstBin*)cPtr);
    auto _retval = _cretval ? new gst.iterator.Iterator(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      Gets an iterator for the elements in this bin in topologically
    sorted order. This means that the elements are returned from
    the most downstream elements (sinks) to the sources.
    
    This function is used internally to perform the state changes
    of the bin elements and for clock selection.
    Returns:     a #GstIterator of #GstElement
  */
  gst.iterator.Iterator iterateSorted()
  {
    GstIterator* _cretval;
    _cretval = gst_bin_iterate_sorted(cast(GstBin*)cPtr);
    auto _retval = _cretval ? new gst.iterator.Iterator(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      Gets an iterator for all elements in the bin that have the
    #GST_ELEMENT_FLAG_SOURCE flag set.
    Returns:     a #GstIterator of #GstElement
  */
  gst.iterator.Iterator iterateSources()
  {
    GstIterator* _cretval;
    _cretval = gst_bin_iterate_sources(cast(GstBin*)cPtr);
    auto _retval = _cretval ? new gst.iterator.Iterator(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      Queries bin for the current latency and reconfigures this latency on all the
    elements using a LATENCY event.
    
    This method is typically called on the pipeline when a #GST_MESSAGE_LATENCY
    is posted on the bus.
    
    This function simply emits the #GstBin::do-latency signal so any custom latency
    calculations will be performed.
    Returns:     true if the latency could be queried and reconfigured.
  */
  bool recalculateLatency()
  {
    bool _retval;
    _retval = gst_bin_recalculate_latency(cast(GstBin*)cPtr);
    return _retval;
  }

  /**
      Removes the element from the bin, unparenting it as well.
    Unparenting the element means that the element will be dereferenced,
    so if the bin holds the only reference to the element, the element
    will be freed in the process of removing it from the bin.  If you
    want the element to still exist after removing, you need to call
    [gst.object.ObjectGst.ref_] before removing it from the bin.
    
    If the element's pads are linked to other pads, the pads will be unlinked
    before the element is removed from the bin.
    Params:
      element =       the #GstElement to remove
    Returns:     true if the element could be removed, false if
      the bin does not want to remove the element.
  */
  bool remove(gst.element.Element element)
  {
    bool _retval;
    _retval = gst_bin_remove(cast(GstBin*)cPtr, element ? cast(GstElement*)element.cPtr(No.dup) : null);
    return _retval;
  }

  /**
      Suppresses the given flags on the bin. #GstElementFlags of a
    child element are propagated when it is added to the bin.
    When suppressed flags are set, those specified flags will
    not be propagated to the bin.
    Params:
      flags =       the #GstElementFlags to suppress
  */
  void setSuppressedFlags(gst.types.ElementFlags flags)
  {
    gst_bin_set_suppressed_flags(cast(GstBin*)cPtr, flags);
  }

  /**
      Synchronizes the state of every child of bin with the state
    of bin. See also [gst.element.Element.syncStateWithParent].
    Returns:     true if syncing the state was successful for all children,
       otherwise false.
  */
  bool syncChildrenStates()
  {
    bool _retval;
    _retval = gst_bin_sync_children_states(cast(GstBin*)cPtr);
    return _retval;
  }

  /**
      Will be emitted after the element was added to sub_bin.
  
    ## Parameters
    $(LIST
      * $(B subBin)       the #GstBin the element was added to
      * $(B element)       the #GstElement that was added to sub_bin
      * $(B bin) the instance the signal is connected to
    )
  */
  alias DeepElementAddedCallbackDlg = void delegate(gst.bin.Bin subBin, gst.element.Element element, gst.bin.Bin bin);

  /** ditto */
  alias DeepElementAddedCallbackFunc = void function(gst.bin.Bin subBin, gst.element.Element element, gst.bin.Bin bin);

  /**
    Connect to DeepElementAdded signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectDeepElementAdded(T)(T callback, Flag!"after" after = No.after)
  if (is(T : DeepElementAddedCallbackDlg) || is(T : DeepElementAddedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto bin = getVal!(gst.bin.Bin)(_paramVals);
      auto subBin = getVal!(gst.bin.Bin)(&_paramVals[1]);
      auto element = getVal!(gst.element.Element)(&_paramVals[2]);
      _dClosure.dlg(subBin, element, bin);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("deep-element-added", closure, after);
  }

  /**
      Will be emitted after the element was removed from sub_bin.
  
    ## Parameters
    $(LIST
      * $(B subBin)       the #GstBin the element was removed from
      * $(B element)       the #GstElement that was removed from sub_bin
      * $(B bin) the instance the signal is connected to
    )
  */
  alias DeepElementRemovedCallbackDlg = void delegate(gst.bin.Bin subBin, gst.element.Element element, gst.bin.Bin bin);

  /** ditto */
  alias DeepElementRemovedCallbackFunc = void function(gst.bin.Bin subBin, gst.element.Element element, gst.bin.Bin bin);

  /**
    Connect to DeepElementRemoved signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectDeepElementRemoved(T)(T callback, Flag!"after" after = No.after)
  if (is(T : DeepElementRemovedCallbackDlg) || is(T : DeepElementRemovedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto bin = getVal!(gst.bin.Bin)(_paramVals);
      auto subBin = getVal!(gst.bin.Bin)(&_paramVals[1]);
      auto element = getVal!(gst.element.Element)(&_paramVals[2]);
      _dClosure.dlg(subBin, element, bin);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("deep-element-removed", closure, after);
  }

  /**
      Will be emitted when the bin needs to perform latency calculations. This
    signal is only emitted for toplevel bins or when #GstBin:async-handling is
    enabled.
    
    Only one signal handler is invoked. If no signals are connected, the
    default handler is invoked, which will query and distribute the lowest
    possible latency to all sinks.
    
    Connect to this signal if the default latency calculations are not
    sufficient, like when you need different latencies for different sinks in
    the same pipeline.
  
    ## Parameters
    $(LIST
      * $(B bin) the instance the signal is connected to
    )
    Returns: 
  */
  alias DoLatencyCallbackDlg = bool delegate(gst.bin.Bin bin);

  /** ditto */
  alias DoLatencyCallbackFunc = bool function(gst.bin.Bin bin);

  /**
    Connect to DoLatency signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectDoLatency(T)(T callback, Flag!"after" after = No.after)
  if (is(T : DoLatencyCallbackDlg) || is(T : DoLatencyCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto bin = getVal!(gst.bin.Bin)(_paramVals);
      _retval = _dClosure.dlg(bin);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("do-latency", closure, after);
  }

  /**
      Will be emitted after the element was added to the bin.
  
    ## Parameters
    $(LIST
      * $(B element)       the #GstElement that was added to the bin
      * $(B bin) the instance the signal is connected to
    )
  */
  alias ElementAddedCallbackDlg = void delegate(gst.element.Element element, gst.bin.Bin bin);

  /** ditto */
  alias ElementAddedCallbackFunc = void function(gst.element.Element element, gst.bin.Bin bin);

  /**
    Connect to ElementAdded signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectElementAdded(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ElementAddedCallbackDlg) || is(T : ElementAddedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto bin = getVal!(gst.bin.Bin)(_paramVals);
      auto element = getVal!(gst.element.Element)(&_paramVals[1]);
      _dClosure.dlg(element, bin);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("element-added", closure, after);
  }

  /**
      Will be emitted after the element was removed from the bin.
  
    ## Parameters
    $(LIST
      * $(B element)       the #GstElement that was removed from the bin
      * $(B bin) the instance the signal is connected to
    )
  */
  alias ElementRemovedCallbackDlg = void delegate(gst.element.Element element, gst.bin.Bin bin);

  /** ditto */
  alias ElementRemovedCallbackFunc = void function(gst.element.Element element, gst.bin.Bin bin);

  /**
    Connect to ElementRemoved signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectElementRemoved(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ElementRemovedCallbackDlg) || is(T : ElementRemovedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto bin = getVal!(gst.bin.Bin)(_paramVals);
      auto element = getVal!(gst.element.Element)(&_paramVals[1]);
      _dClosure.dlg(element, bin);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("element-removed", closure, after);
  }
}
