module gtk.shortcuts_group;

import gid.gid;
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
import gtk.shortcuts_shortcut;
import gtk.types;

/**
    A [gtk.shortcuts_group.ShortcutsGroup] represents a group of related keyboard shortcuts
  or gestures.
  
  The group has a title. It may optionally be associated with a view
  of the application, which can be used to show only relevant shortcuts
  depending on the application context.
  
  This widget is only meant to be used with [gtk.shortcuts_window.ShortcutsWindow].
  
  The recommended way to construct a [gtk.shortcuts_group.ShortcutsGroup] is with
  [gtk.builder.Builder], by using the `<child>` tag to populate a
  [gtk.shortcuts_group.ShortcutsGroup] with one or more [gtk.shortcuts_shortcut.ShortcutsShortcut]
  instances.
  
  If you need to add a shortcut programmatically, use
  [gtk.shortcuts_group.ShortcutsGroup.addShortcut].
*/
class ShortcutsGroup : gtk.box.Box
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_shortcuts_group_get_type != &gidSymbolNotFound ? gtk_shortcuts_group_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Adds a shortcut to the shortcuts group.
    
    This is the programmatic equivalent to using [gtk.builder.Builder] and a
    `<child>` tag to add the child. Adding children with other API is not
    appropriate as [gtk.shortcuts_group.ShortcutsGroup] manages its children internally.
    Params:
      shortcut =       the [gtk.shortcuts_shortcut.ShortcutsShortcut] to add
  */
  void addShortcut(gtk.shortcuts_shortcut.ShortcutsShortcut shortcut)
  {
    gtk_shortcuts_group_add_shortcut(cast(GtkShortcutsGroup*)cPtr, shortcut ? cast(GtkShortcutsShortcut*)shortcut.cPtr(No.Dup) : null);
  }
}
