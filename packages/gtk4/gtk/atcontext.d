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
    [gtk.atcontext.ATContext] is an abstract class provided by GTK to communicate to
  platform-specific assistive technologies API.
  
  Each platform supported by GTK implements a [gtk.atcontext.ATContext] subclass, and
  is responsible for updating the accessible state in response to state
  changes in [gtk.accessible.Accessible].
*/
class ATContext : gobject.object.ObjectG
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_at_context_get_type != &gidSymbolNotFound ? gtk_at_context_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new [gtk.atcontext.ATContext] instance for the given accessible role,
    accessible instance, and display connection.
    
    The [gtk.atcontext.ATContext] implementation being instantiated will depend on the
    platform.
    Params:
      accessibleRole =       the accessible role used by the [gtk.atcontext.ATContext]
      accessible =       the [gtk.accessible.Accessible] implementation using the [gtk.atcontext.ATContext]
      display =       the [gdk.display.Display] used by the [gtk.atcontext.ATContext]
    Returns:     the [gtk.atcontext.ATContext]
  */
  static gtk.atcontext.ATContext create(gtk.types.AccessibleRole accessibleRole, gtk.accessible.Accessible accessible, gdk.display.Display display)
  {
    GtkATContext* _cretval;
    _cretval = gtk_at_context_create(accessibleRole, accessible ? cast(GtkAccessible*)(cast(ObjectG)accessible).cPtr(No.dup) : null, display ? cast(GdkDisplay*)display.cPtr(No.dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.atcontext.ATContext)(cast(GtkATContext*)_cretval, Yes.take);
    return _retval;
  }

  /**
      Retrieves the [gtk.accessible.Accessible] using this context.
    Returns:     a [gtk.accessible.Accessible]
  */
  gtk.accessible.Accessible getAccessible()
  {
    GtkAccessible* _cretval;
    _cretval = gtk_at_context_get_accessible(cast(GtkATContext*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.accessible.Accessible)(cast(GtkAccessible*)_cretval, No.take);
    return _retval;
  }

  /**
      Retrieves the accessible role of this context.
    Returns:     a [gtk.types.AccessibleRole]
  */
  gtk.types.AccessibleRole getAccessibleRole()
  {
    GtkAccessibleRole _cretval;
    _cretval = gtk_at_context_get_accessible_role(cast(GtkATContext*)cPtr);
    gtk.types.AccessibleRole _retval = cast(gtk.types.AccessibleRole)_cretval;
    return _retval;
  }

  /**
      Emitted when the attributes of the accessible for the
    [gtk.atcontext.ATContext] instance change.
  
    ## Parameters
    $(LIST
      * $(B aTContext) the instance the signal is connected to
    )
  */
  alias StateChangeCallbackDlg = void delegate(gtk.atcontext.ATContext aTContext);

  /** ditto */
  alias StateChangeCallbackFunc = void function(gtk.atcontext.ATContext aTContext);

  /**
    Connect to StateChange signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectStateChange(T)(T callback, Flag!"after" after = No.after)
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
