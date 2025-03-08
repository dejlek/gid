module gtk.link_button;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.button;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;

/**
    A [gtk.link_button.LinkButton] is a button with a hyperlink.
  
  ![An example GtkLinkButton](link-button.png)
  
  It is useful to show quick links to resources.
  
  A link button is created by calling either [gtk.link_button.LinkButton.new_] or
  [gtk.link_button.LinkButton.newWithLabel]. If using the former, the URI you
  pass to the constructor is used as a label for the widget.
  
  The URI bound to a [gtk.link_button.LinkButton] can be set specifically using
  [gtk.link_button.LinkButton.setUri].
  
  By default, [gtk.link_button.LinkButton] calls [gtk.file_launcher.FileLauncher.launch] when the button
  is clicked. This behaviour can be overridden by connecting to the
  `signal@Gtk.LinkButton::activate-link` signal and returning true from
  the signal handler.
  
  # CSS nodes
  
  [gtk.link_button.LinkButton] has a single CSS node with name button. To differentiate
  it from a plain [gtk.button.Button], it gets the .link style class.
  
  # Accessibility
  
  [gtk.link_button.LinkButton] uses the [gtk.types.AccessibleRole.link] role.
*/
class LinkButton : gtk.button.Button
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_link_button_get_type != &gidSymbolNotFound ? gtk_link_button_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new [gtk.link_button.LinkButton] with the URI as its text.
    Params:
      uri =       a valid URI
    Returns:     a new link button widget.
  */
  this(string uri)
  {
    GtkWidget* _cretval;
    const(char)* _uri = uri.toCString(No.alloc);
    _cretval = gtk_link_button_new(_uri);
    this(_cretval, No.take);
  }

  /**
      Creates a new [gtk.link_button.LinkButton] containing a label.
    Params:
      uri =       a valid URI
      label =       the text of the button
    Returns:     a new link button widget.
  */
  static gtk.link_button.LinkButton newWithLabel(string uri, string label = null)
  {
    GtkWidget* _cretval;
    const(char)* _uri = uri.toCString(No.alloc);
    const(char)* _label = label.toCString(No.alloc);
    _cretval = gtk_link_button_new_with_label(_uri, _label);
    auto _retval = ObjectG.getDObject!(gtk.link_button.LinkButton)(cast(GtkWidget*)_cretval, No.take);
    return _retval;
  }

  /**
      Retrieves the URI of the [gtk.link_button.LinkButton].
    Returns:     a valid URI. The returned string is owned by the link button
        and should not be modified or freed.
  */
  string getUri()
  {
    const(char)* _cretval;
    _cretval = gtk_link_button_get_uri(cast(GtkLinkButton*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.free);
    return _retval;
  }

  /**
      Retrieves the “visited” state of the [gtk.link_button.LinkButton].
    
    The button becomes visited when it is clicked. If the URI
    is changed on the button, the “visited” state is unset again.
    
    The state may also be changed using [gtk.link_button.LinkButton.setVisited].
    Returns:     true if the link has been visited, false otherwise
  */
  bool getVisited()
  {
    bool _retval;
    _retval = gtk_link_button_get_visited(cast(GtkLinkButton*)cPtr);
    return _retval;
  }

  /**
      Sets uri as the URI where the [gtk.link_button.LinkButton] points.
    
    As a side-effect this unsets the “visited” state of the button.
    Params:
      uri =       a valid URI
  */
  void setUri(string uri)
  {
    const(char)* _uri = uri.toCString(No.alloc);
    gtk_link_button_set_uri(cast(GtkLinkButton*)cPtr, _uri);
  }

  /**
      Sets the “visited” state of the [gtk.link_button.LinkButton].
    
    See [gtk.link_button.LinkButton.getVisited] for more details.
    Params:
      visited =       the new “visited” state
  */
  void setVisited(bool visited)
  {
    gtk_link_button_set_visited(cast(GtkLinkButton*)cPtr, visited);
  }

  /**
      Emitted each time the [gtk.link_button.LinkButton] is clicked.
    
    The default handler will call [gtk.file_launcher.FileLauncher.launch] with the URI
    stored inside the [gtk.link_button.LinkButton.utf8] property.
    
    To override the default behavior, you can connect to the
    ::activate-link signal and stop the propagation of the signal
    by returning true from your handler.
  
    ## Parameters
    $(LIST
      * $(B linkButton) the instance the signal is connected to
    )
    Returns:     true if the signal has been handled
  */
  alias ActivateLinkCallbackDlg = bool delegate(gtk.link_button.LinkButton linkButton);

  /** ditto */
  alias ActivateLinkCallbackFunc = bool function(gtk.link_button.LinkButton linkButton);

  /**
    Connect to ActivateLink signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectActivateLink(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ActivateLinkCallbackDlg) || is(T : ActivateLinkCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto linkButton = getVal!(gtk.link_button.LinkButton)(_paramVals);
      _retval = _dClosure.dlg(linkButton);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate-link", closure, after);
  }
}
