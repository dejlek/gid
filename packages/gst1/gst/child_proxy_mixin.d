module gst.child_proxy_mixin;

public import gst.child_proxy_iface_proxy;
public import gid.gid;
public import gobject.dclosure;
public import gobject.object;
public import gobject.param_spec;
public import gobject.value;
public import gst.c.functions;
public import gst.c.types;
public import gst.types;

/**
    This interface abstracts handling of property sets for elements with
  children. Imagine elements such as mixers or polyphonic generators. They all
  have multiple #GstPad or some kind of voice objects. Another use case are
  container elements like #GstBin.
  The element implementing the interface acts as a parent for those child
  objects.
  
  By implementing this interface the child properties can be accessed from the
  parent element by using [gst.child_proxy.ChildProxy.get] and [gst.child_proxy.ChildProxy.set].
  
  Property names are written as `child-name::property-name`. The whole naming
  scheme is recursive. Thus `child1::child2::property` is valid too, if
  `child1` and `child2` implement the #GstChildProxy interface.
*/
template ChildProxyT()
{

  /**
      Emits the #GstChildProxy::child-added signal.
    Params:
      child =       the newly added child
      name =       the name of the new child
  */
  override void childAdded(gobject.object.ObjectG child, string name)
  {
    const(char)* _name = name.toCString(No.alloc);
    gst_child_proxy_child_added(cast(GstChildProxy*)cPtr, child ? cast(ObjectC*)child.cPtr(No.dup) : null, _name);
  }

  /**
      Emits the #GstChildProxy::child-removed signal.
    Params:
      child =       the removed child
      name =       the name of the old child
  */
  override void childRemoved(gobject.object.ObjectG child, string name)
  {
    const(char)* _name = name.toCString(No.alloc);
    gst_child_proxy_child_removed(cast(GstChildProxy*)cPtr, child ? cast(ObjectC*)child.cPtr(No.dup) : null, _name);
  }

  /**
      Fetches a child by its number.
    Params:
      index =       the child's position in the child list
    Returns:     the child object or null if
          not found (index too high).
  */
  override gobject.object.ObjectG getChildByIndex(uint index)
  {
    ObjectC* _cretval;
    _cretval = gst_child_proxy_get_child_by_index(cast(GstChildProxy*)cPtr, index);
    auto _retval = ObjectG.getDObject!(gobject.object.ObjectG)(cast(ObjectC*)_cretval, Yes.take);
    return _retval;
  }

  /**
      Looks up a child element by the given name.
    
    This virtual method has a default implementation that uses #GstObject
    together with [gst.object.ObjectGst.getName]. If the interface is to be used with
    #GObjects, this methods needs to be overridden.
    Params:
      name =       the child's name
    Returns:     the child object or null if
          not found.
  */
  override gobject.object.ObjectG getChildByName(string name)
  {
    ObjectC* _cretval;
    const(char)* _name = name.toCString(No.alloc);
    _cretval = gst_child_proxy_get_child_by_name(cast(GstChildProxy*)cPtr, _name);
    auto _retval = ObjectG.getDObject!(gobject.object.ObjectG)(cast(ObjectC*)_cretval, Yes.take);
    return _retval;
  }

  /**
      Looks up a child element by the given full-path name.
    
    Similar to [gst.child_proxy.ChildProxy.getChildByName], this method
    searches and returns a child given a name. The difference is that
    this method allows a hierarchical path in the form of
    child1::child2::child3. In the later example this method would
    return a reference to child3, if found. The name should be made of
    element names only and should not contain any property names.
    Params:
      name =       the full-path child's name
    Returns:     the child object or null if
          not found.
  */
  override gobject.object.ObjectG getChildByNameRecurse(string name)
  {
    ObjectC* _cretval;
    const(char)* _name = name.toCString(No.alloc);
    _cretval = gst_child_proxy_get_child_by_name_recurse(cast(GstChildProxy*)cPtr, _name);
    auto _retval = ObjectG.getDObject!(gobject.object.ObjectG)(cast(ObjectC*)_cretval, Yes.take);
    return _retval;
  }

  /**
      Gets the number of child objects this parent contains.
    Returns:     the number of child objects
  */
  override uint getChildrenCount()
  {
    uint _retval;
    _retval = gst_child_proxy_get_children_count(cast(GstChildProxy*)cPtr);
    return _retval;
  }

  /**
      Gets a single property using the GstChildProxy mechanism.
    You are responsible for freeing it by calling [gobject.value.Value.unset]
    Params:
      name =       name of the property
      value =       a #GValue that should take the result.
  */
  override void getChildProxyProperty(string name, out gobject.value.Value value)
  {
    const(char)* _name = name.toCString(No.alloc);
    GValue _value;
    gst_child_proxy_get_property(cast(GstChildProxy*)cPtr, _name, &_value);
    value = new gobject.value.Value(cast(void*)&_value, No.take);
  }

  /**
      Looks up which object and #GParamSpec would be effected by the given name.
    Params:
      name =       name of the property to look up
      target =       pointer to a #GObject that
            takes the real object to set property on
      pspec =       pointer to take the #GParamSpec
            describing the property
    Returns:     true if target and pspec could be found. false otherwise. In that
      case the values for pspec and target are not modified. Unref target after
      usage. For plain #GObject target is the same as object.
  */
  override bool lookup(string name, out gobject.object.ObjectG target, out gobject.param_spec.ParamSpec pspec)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.alloc);
    ObjectC* _target;
    GParamSpec* _pspec;
    _retval = gst_child_proxy_lookup(cast(GstChildProxy*)cPtr, _name, &_target, &_pspec);
    target = new gobject.object.ObjectG(cast(void*)_target, Yes.take);
    pspec = new gobject.param_spec.ParamSpec(cast(void*)_pspec, No.take);
    return _retval;
  }

  /**
      Sets a single property using the GstChildProxy mechanism.
    Params:
      name =       name of the property to set
      value =       new #GValue for the property
  */
  override void setProperty(string name, gobject.value.Value value)
  {
    const(char)* _name = name.toCString(No.alloc);
    gst_child_proxy_set_property(cast(GstChildProxy*)cPtr, _name, value ? cast(const(GValue)*)value.cPtr(No.dup) : null);
  }

  /**
      Will be emitted after the object was added to the child_proxy.
  
    ## Parameters
    $(LIST
      * $(B object)       the #GObject that was added
      * $(B name)       the name of the new child
      * $(B childProxy) the instance the signal is connected to
    )
  */
  alias ChildAddedCallbackDlg = void delegate(gobject.object.ObjectG object, string name, gst.child_proxy.ChildProxy childProxy);

  /** ditto */
  alias ChildAddedCallbackFunc = void function(gobject.object.ObjectG object, string name, gst.child_proxy.ChildProxy childProxy);

  /**
    Connect to ChildAdded signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectChildAdded(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ChildAddedCallbackDlg) || is(T : ChildAddedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto childProxy = getVal!(gst.child_proxy.ChildProxy)(_paramVals);
      auto object = getVal!(gobject.object.ObjectG)(&_paramVals[1]);
      auto name = getVal!(string)(&_paramVals[2]);
      _dClosure.dlg(object, name, childProxy);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("child-added", closure, after);
  }

  /**
      Will be emitted after the object was removed from the child_proxy.
  
    ## Parameters
    $(LIST
      * $(B object)       the #GObject that was removed
      * $(B name)       the name of the old child
      * $(B childProxy) the instance the signal is connected to
    )
  */
  alias ChildRemovedCallbackDlg = void delegate(gobject.object.ObjectG object, string name, gst.child_proxy.ChildProxy childProxy);

  /** ditto */
  alias ChildRemovedCallbackFunc = void function(gobject.object.ObjectG object, string name, gst.child_proxy.ChildProxy childProxy);

  /**
    Connect to ChildRemoved signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectChildRemoved(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ChildRemovedCallbackDlg) || is(T : ChildRemovedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto childProxy = getVal!(gst.child_proxy.ChildProxy)(_paramVals);
      auto object = getVal!(gobject.object.ObjectG)(&_paramVals[1]);
      auto name = getVal!(string)(&_paramVals[2]);
      _dClosure.dlg(object, name, childProxy);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("child-removed", closure, after);
  }
}
