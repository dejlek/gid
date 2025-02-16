module Gtk.ShortcutsShortcut;

import Gid.gid;
import Gtk.Accessible;
import Gtk.AccessibleT;
import Gtk.Buildable;
import Gtk.BuildableT;
import Gtk.ConstraintTarget;
import Gtk.ConstraintTargetT;
import Gtk.Types;
import Gtk.Widget;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * A `GtkShortcutsShortcut` represents a single keyboard shortcut or gesture
 * with a short text.
 * This widget is only meant to be used with `GtkShortcutsWindow`.
 */
class ShortcutsShortcut : Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_shortcuts_shortcut_get_type != &gidSymbolNotFound ? gtk_shortcuts_shortcut_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
