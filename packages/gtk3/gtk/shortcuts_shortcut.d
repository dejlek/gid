/// Module for [ShortcutsShortcut] class
module gtk.shortcuts_shortcut;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gtk.box;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;

/**
    A GtkShortcutsShortcut represents a single keyboard shortcut or gesture
    with a short text. This widget is only meant to be used with #GtkShortcutsWindow.
*/
class ShortcutsShortcut : gtk.box.Box
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_shortcuts_shortcut_get_type != &gidSymbolNotFound ? gtk_shortcuts_shortcut_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override ShortcutsShortcut self()
  {
    return this;
  }
}
