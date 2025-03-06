module gtk.shortcuts_section;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gtk.box;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;

/**
    A GtkShortcutsSection collects all the keyboard shortcuts and gestures
  for a major application mode. If your application needs multiple sections,
  you should give each section a unique #GtkShortcutsSection:section-name and
  a #GtkShortcutsSection:title that can be shown in the section selector of
  the GtkShortcutsWindow.
  
  The #GtkShortcutsSection:max-height property can be used to influence how
  the groups in the section are distributed over pages and columns.
  
  This widget is only meant to be used with #GtkShortcutsWindow.
*/
class ShortcutsSection : gtk.box.Box
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_shortcuts_section_get_type != &gidSymbolNotFound ? gtk_shortcuts_section_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /** */
  alias ChangeCurrentPageCallbackDlg = bool delegate(int object, gtk.shortcuts_section.ShortcutsSection shortcutsSection);

  /** ditto */
  alias ChangeCurrentPageCallbackFunc = bool function(int object, gtk.shortcuts_section.ShortcutsSection shortcutsSection);

  /**
    Connect to ChangeCurrentPage signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectChangeCurrentPage(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ChangeCurrentPageCallbackDlg) || is(T : ChangeCurrentPageCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto shortcutsSection = getVal!(gtk.shortcuts_section.ShortcutsSection)(_paramVals);
      auto object = getVal!(int)(&_paramVals[1]);
      _retval = _dClosure.dlg(object, shortcutsSection);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("change-current-page", closure, after);
  }
}
