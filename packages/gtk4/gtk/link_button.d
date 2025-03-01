module gtk.link_button;

import gid.global;
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
 * A `GtkLinkButton` is a button with a hyperlink.
 * ![An example GtkLinkButton](link-button.png)
 * It is useful to show quick links to resources.
 * A link button is created by calling either [gtk.link_button.LinkButton.new_] or
 * [gtk.link_button.LinkButton.newWithLabel]. If using the former, the URI you
 * pass to the constructor is used as a label for the widget.
 * The URI bound to a `GtkLinkButton` can be set specifically using
 * [gtk.link_button.LinkButton.setUri].
 * By default, `GtkLinkButton` calls [gtk.file_launcher.FileLauncher.launch] when the button
 * is clicked. This behaviour can be overridden by connecting to the
 * signal@Gtk.LinkButton::activate-link signal and returning %TRUE from
 * the signal handler.
 * # CSS nodes
 * `GtkLinkButton` has a single CSS node with name button. To differentiate
 * it from a plain `GtkButton`, it gets the .link style class.
 * # Accessibility
 * `GtkLinkButton` uses the %GTK_ACCESSIBLE_ROLE_LINK role.
 */
class LinkButton : Button
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_link_button_get_type != &gidSymbolNotFound ? gtk_link_button_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GtkLinkButton` with the URI as its text.
   * Params:
   *   uri = a valid URI
   * Returns: a new link button widget.
   */
  this(string uri)
  {
    GtkWidget* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    _cretval = gtk_link_button_new(_uri);
    this(_cretval, No.Take);
  }

  /**
   * Creates a new `GtkLinkButton` containing a label.
   * Params:
   *   uri = a valid URI
   *   label = the text of the button
   * Returns: a new link button widget.
   */
  static LinkButton newWithLabel(string uri, string label)
  {
    GtkWidget* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_link_button_new_with_label(_uri, _label);
    auto _retval = ObjectG.getDObject!LinkButton(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Retrieves the URI of the `GtkLinkButton`.
   * Returns: a valid URI. The returned string is owned by the link button
   *   and should not be modified or freed.
   */
  string getUri()
  {
    const(char)* _cretval;
    _cretval = gtk_link_button_get_uri(cast(GtkLinkButton*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Retrieves the “visited” state of the `GtkLinkButton`.
   * The button becomes visited when it is clicked. If the URI
   * is changed on the button, the “visited” state is unset again.
   * The state may also be changed using [gtk.link_button.LinkButton.setVisited].
   * Returns: %TRUE if the link has been visited, %FALSE otherwise
   */
  bool getVisited()
  {
    bool _retval;
    _retval = gtk_link_button_get_visited(cast(GtkLinkButton*)cPtr);
    return _retval;
  }

  /**
   * Sets uri as the URI where the `GtkLinkButton` points.
   * As a side-effect this unsets the “visited” state of the button.
   * Params:
   *   uri = a valid URI
   */
  void setUri(string uri)
  {
    const(char)* _uri = uri.toCString(No.Alloc);
    gtk_link_button_set_uri(cast(GtkLinkButton*)cPtr, _uri);
  }

  /**
   * Sets the “visited” state of the `GtkLinkButton`.
   * See [gtk.link_button.LinkButton.getVisited] for more details.
   * Params:
   *   visited = the new “visited” state
   */
  void setVisited(bool visited)
  {
    gtk_link_button_set_visited(cast(GtkLinkButton*)cPtr, visited);
  }

  /**
   * Emitted each time the `GtkLinkButton` is clicked.
   * The default handler will call [gtk.file_launcher.FileLauncher.launch] with the URI
   * stored inside the [gtk.link_button.LinkButton.utf8] property.
   * To override the default behavior, you can connect to the
   * ::activate-link signal and stop the propagation of the signal
   * by returning %TRUE from your handler.
   *   linkButton = the instance the signal is connected to
   * Returns: %TRUE if the signal has been handled
   */
  alias ActivateLinkCallbackDlg = bool delegate(LinkButton linkButton);
  alias ActivateLinkCallbackFunc = bool function(LinkButton linkButton);

  /**
   * Connect to ActivateLink signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectActivateLink(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ActivateLinkCallbackDlg) || is(T : ActivateLinkCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto linkButton = getVal!LinkButton(_paramVals);
      _retval = _dClosure.dlg(linkButton);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate-link", closure, after);
  }
}
