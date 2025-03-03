module gtk.atcontext;

import gdk.display;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
 * `GtkATContext` is an abstract class provided by GTK to communicate to
 * platform-specific assistive technologies API.
 * Each platform supported by GTK implements a `GtkATContext` subclass, and
 * is responsible for updating the accessible state in response to state
 * changes in `GtkAccessible`.
 */
class ATContext : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_at_context_get_type != &gidSymbolNotFound ? gtk_at_context_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GtkATContext` instance for the given accessible role,
   * accessible instance, and display connection.
   * The `GtkATContext` implementation being instantiated will depend on the
   * platform.
   * Params:
   *   accessibleRole = the accessible role used by the `GtkATContext`
   *   accessible = the `GtkAccessible` implementation using the `GtkATContext`
   *   display = the `GdkDisplay` used by the `GtkATContext`
   * Returns: the `GtkATContext`
   */
  static gtk.atcontext.ATContext create(gtk.types.AccessibleRole accessibleRole, gtk.accessible.Accessible accessible, gdk.display.Display display)
  {
    GtkATContext* _cretval;
    _cretval = gtk_at_context_create(accessibleRole, accessible ? cast(GtkAccessible*)(cast(ObjectG)accessible).cPtr(No.Dup) : null, display ? cast(GdkDisplay*)display.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.atcontext.ATContext)(cast(GtkATContext*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Retrieves the `GtkAccessible` using this context.
   * Returns: a `GtkAccessible`
   */
  gtk.accessible.Accessible getAccessible()
  {
    GtkAccessible* _cretval;
    _cretval = gtk_at_context_get_accessible(cast(GtkATContext*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.accessible.Accessible)(cast(GtkAccessible*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Retrieves the accessible role of this context.
   * Returns: a `GtkAccessibleRole`
   */
  gtk.types.AccessibleRole getAccessibleRole()
  {
    GtkAccessibleRole _cretval;
    _cretval = gtk_at_context_get_accessible_role(cast(GtkATContext*)cPtr);
    gtk.types.AccessibleRole _retval = cast(gtk.types.AccessibleRole)_cretval;
    return _retval;
  }

  /**
   * Emitted when the attributes of the accessible for the
   * `GtkATContext` instance change.
   *   aTContext = the instance the signal is connected to
   */
  alias StateChangeCallbackDlg = void delegate(gtk.atcontext.ATContext aTContext);
  alias StateChangeCallbackFunc = void function(gtk.atcontext.ATContext aTContext);

  /**
   * Connect to StateChange signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectStateChange(T)(T callback, Flag!"After" after = No.After)
  if (is(T : StateChangeCallbackDlg) || is(T : StateChangeCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto aTContext = getVal!(gtk.atcontext.ATContext)(_paramVals);
      _dClosure.dlg(aTContext);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("state-change", closure, after);
  }
}
