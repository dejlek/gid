module gst.child_proxy;

public import gst.child_proxy_iface_proxy;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gobject.param_spec;
import gobject.value;
import gst.c.functions;
import gst.c.types;
import gst.types;

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
interface ChildProxy
{

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_child_proxy_get_type != &gidSymbolNotFound ? gst_child_proxy_get_type() : cast(GType)0;
  }

  /**
      Emits the #GstChildProxy::child-added signal.
    Params:
      child =       the newly added child
      name =       the name of the new child
  */
  void childAdded(gobject.object.ObjectG child, string name);

  /**
      Emits the #GstChildProxy::child-removed signal.
    Params:
      child =       the removed child
      name =       the name of the old child
  */
  void childRemoved(gobject.object.ObjectG child, string name);

  /**
      Fetches a child by its number.
    Params:
      index =       the child's position in the child list
    Returns:     the child object or null if
          not found (index too high).
  */
  gobject.object.ObjectG getChildByIndex(uint index);

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
  gobject.object.ObjectG getChildByName(string name);

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
  gobject.object.ObjectG getChildByNameRecurse(string name);

  /**
      Gets the number of child objects this parent contains.
    Returns:     the number of child objects
  */
  uint getChildrenCount();

  /**
      Gets a single property using the GstChildProxy mechanism.
    You are responsible for freeing it by calling [gobject.value.Value.unset]
    Params:
      name =       name of the property
      value =       a #GValue that should take the result.
  */
  void getChildProxyProperty(string name, out gobject.value.Value value);

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
  bool lookup(string name, out gobject.object.ObjectG target, out gobject.param_spec.ParamSpec pspec);

  /**
      Sets a single property using the GstChildProxy mechanism.
    Params:
      name =       name of the property to set
      value =       new #GValue for the property
  */
  void setProperty(string name, gobject.value.Value value);

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
  if (is(T : ChildAddedCallbackDlg) || is(T : ChildAddedCallbackFunc));

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
  if (is(T : ChildRemovedCallbackDlg) || is(T : ChildRemovedCallbackFunc));
  }
