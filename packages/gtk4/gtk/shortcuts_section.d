module gtk.shortcuts_section;

import gid.global;
import gobject.dclosure;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.box;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.shortcuts_group;
import gtk.types;

/**
 * A `GtkShortcutsSection` collects all the keyboard shortcuts and gestures
 * for a major application mode.
 * If your application needs multiple sections, you should give each
 * section a unique property@Gtk.ShortcutsSection:section-name and
 * a [gtk.shortcuts_section.ShortcutsSection.utf8] that can be shown in the
 * section selector of the [gtk.shortcuts_window.ShortcutsWindow].
 * The property@Gtk.ShortcutsSection:max-height property can be used
 * to influence how the groups in the section are distributed over pages
 * and columns.
 * This widget is only meant to be used with [gtk.shortcuts_window.ShortcutsWindow].
 * The recommended way to construct a `GtkShortcutsSection` is with
 * [gtk.builder.Builder], by using the `<child>` tag to populate a
 * `GtkShortcutsSection` with one or more [gtk.shortcuts_group.ShortcutsGroup]
 * instances, which in turn contain one or more [gtk.shortcuts_shortcut.ShortcutsShortcut]
 * objects.
 * If you need to add a group programmatically, use
 * [gtk.shortcuts_section.ShortcutsSection.addGroup].
 */
class ShortcutsSection : Box
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

  /**
   * Adds a group to the shortcuts section.
   * This is the programmatic equivalent to using [gtk.builder.Builder] and a
   * `<child>` tag to add the child.
   * Adding children with the `GtkBox` API is not appropriate, as
   * `GtkShortcutsSection` manages its children internally.
   * Params:
   *   group = the `GtkShortcutsGroup` to add
   */
  void addGroup(ShortcutsGroup group)
  {
    gtk_shortcuts_section_add_group(cast(GtkShortcutsSection*)cPtr, group ? cast(GtkShortcutsGroup*)group.cPtr(No.Dup) : null);
  }

  alias ChangeCurrentPageCallbackDlg = bool delegate(int object, ShortcutsSection shortcutsSection);
  alias ChangeCurrentPageCallbackFunc = bool function(int object, ShortcutsSection shortcutsSection);

  /**
   * Connect to ChangeCurrentPage signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectChangeCurrentPage(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ChangeCurrentPageCallbackDlg) || is(T : ChangeCurrentPageCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto shortcutsSection = getVal!ShortcutsSection(_paramVals);
      auto object = getVal!int(&_paramVals[1]);
      _retval = _dClosure.dlg(object, shortcutsSection);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("change-current-page", closure, after);
  }
}
