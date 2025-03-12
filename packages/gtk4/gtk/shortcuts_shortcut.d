module gtk.shortcuts_shortcut;

import gid.gid;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
    A [gtk.shortcuts_shortcut.ShortcutsShortcut] represents a single keyboard shortcut or gesture
  with a short text.
  
  This widget is only meant to be used with [gtk.shortcuts_window.ShortcutsWindow].
*/
class ShortcutsShortcut : gtk.widget.Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_shortcuts_shortcut_get_type != &gidSymbolNotFound ? gtk_shortcuts_shortcut_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override ShortcutsShortcut self()
  {
    return this;
  }
}
