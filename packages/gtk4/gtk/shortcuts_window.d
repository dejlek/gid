module gtk.shortcuts_window;

import gid.gid;
import gobject.dclosure;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.native;
import gtk.native_mixin;
import gtk.root;
import gtk.root_mixin;
import gtk.shortcut_manager;
import gtk.shortcut_manager_mixin;
import gtk.shortcuts_section;
import gtk.types;
import gtk.window;

/**
    A [gtk.shortcuts_window.ShortcutsWindow] shows information about the keyboard shortcuts
  and gestures of an application.
  
  The shortcuts can be grouped, and you can have multiple sections in this
  window, corresponding to the major modes of your application.
  
  Additionally, the shortcuts can be filtered by the current view, to avoid
  showing information that is not relevant in the current application context.
  
  The recommended way to construct a [gtk.shortcuts_window.ShortcutsWindow] is with
  [gtk.builder.Builder], by using the `<child>` tag to populate a
  [gtk.shortcuts_window.ShortcutsWindow] with one or more [gtk.shortcuts_section.ShortcutsSection] objects,
  which contain one or more [gtk.shortcuts_group.ShortcutsGroup] instances, which, in turn,
  contain [gtk.shortcuts_shortcut.ShortcutsShortcut] instances.
  
  If you need to add a section programmatically, use [gtk.shortcuts_window.ShortcutsWindow.addSection]
  instead of [gtk.window.Window.setChild], as the shortcuts window manages
  its children directly.
  
  # A simple example:
  
  ![](gedit-shortcuts.png)
  
  This example has as single section. As you can see, the shortcut groups
  are arranged in columns, and spread across several pages if there are too
  many to find on a single page.
  
  The .ui file for this example can be found [here](https://gitlab.gnome.org/GNOME/gtk/tree/main/demos/gtk-demo/shortcuts-gedit.ui).
  
  # An example with multiple views:
  
  ![](clocks-shortcuts.png)
  
  This example shows a [gtk.shortcuts_window.ShortcutsWindow] that has been configured to show only
  the shortcuts relevant to the "stopwatch" view.
  
  The .ui file for this example can be found [here](https://gitlab.gnome.org/GNOME/gtk/tree/main/demos/gtk-demo/shortcuts-clocks.ui).
  
  # An example with multiple sections:
  
  ![](builder-shortcuts.png)
  
  This example shows a [gtk.shortcuts_window.ShortcutsWindow] with two sections, "Editor Shortcuts"
  and "Terminal Shortcuts".
  
  The .ui file for this example can be found [here](https://gitlab.gnome.org/GNOME/gtk/tree/main/demos/gtk-demo/shortcuts-builder.ui).
  
  ## CSS nodes
  
  [gtk.shortcuts_window.ShortcutsWindow] has a single CSS node with the name `window` and style
  class `.shortcuts`.
*/
class ShortcutsWindow : gtk.window.Window
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_shortcuts_window_get_type != &gidSymbolNotFound ? gtk_shortcuts_window_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
      Adds a section to the shortcuts window.
    
    This is the programmatic equivalent to using [gtk.builder.Builder] and a
    `<child>` tag to add the child.
    
    Using [gtk.window.Window.setChild] is not appropriate as the shortcuts
    window manages its children internally.
    Params:
      section =       the [gtk.shortcuts_section.ShortcutsSection] to add
  */
  void addSection(gtk.shortcuts_section.ShortcutsSection section)
  {
    gtk_shortcuts_window_add_section(cast(GtkShortcutsWindow*)cPtr, section ? cast(GtkShortcutsSection*)section.cPtr(No.Dup) : null);
  }

  /**
      Emitted when the user uses a keybinding to close the window.
    
    This is a [keybinding signal](class.SignalAction.html).
    
    The default binding for this signal is the Escape key.
  
    ## Parameters
    $(LIST
      * $(B shortcutsWindow) the instance the signal is connected to
    )
  */
  alias CloseCallbackDlg = void delegate(gtk.shortcuts_window.ShortcutsWindow shortcutsWindow);

  /** ditto */
  alias CloseCallbackFunc = void function(gtk.shortcuts_window.ShortcutsWindow shortcutsWindow);

  /**
    Connect to Close signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectClose(T)(T callback, Flag!"After" after = No.After)
  if (is(T : CloseCallbackDlg) || is(T : CloseCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto shortcutsWindow = getVal!(gtk.shortcuts_window.ShortcutsWindow)(_paramVals);
      _dClosure.dlg(shortcutsWindow);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("close", closure, after);
  }

  /**
      Emitted when the user uses a keybinding to start a search.
    
    This is a [keybinding signal](class.SignalAction.html).
    
    The default binding for this signal is Control-F.
  
    ## Parameters
    $(LIST
      * $(B shortcutsWindow) the instance the signal is connected to
    )
  */
  alias SearchCallbackDlg = void delegate(gtk.shortcuts_window.ShortcutsWindow shortcutsWindow);

  /** ditto */
  alias SearchCallbackFunc = void function(gtk.shortcuts_window.ShortcutsWindow shortcutsWindow);

  /**
    Connect to Search signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectSearch(T)(T callback, Flag!"After" after = No.After)
  if (is(T : SearchCallbackDlg) || is(T : SearchCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto shortcutsWindow = getVal!(gtk.shortcuts_window.ShortcutsWindow)(_paramVals);
      _dClosure.dlg(shortcutsWindow);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("search", closure, after);
  }
}
