module gtk.shortcut_manager;

public import gtk.shortcut_manager_iface_proxy;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
 * The `GtkShortcutManager` interface is used to implement
 * shortcut scopes.
 * This is important for [Gtk.Native] widgets that have their
 * own surface, since the event controllers that are used to implement
 * managed and global scopes are limited to the same native.
 * Examples for widgets implementing `GtkShortcutManager` are
 * [Gtk.Window] and [Gtk.Popover].
 * Every widget that implements `GtkShortcutManager` will be used as a
 * %GTK_SHORTCUT_SCOPE_MANAGED.
 */
interface ShortcutManager
{

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_shortcut_manager_get_type != &gidSymbolNotFound ? gtk_shortcut_manager_get_type() : cast(GType)0;
  }
}
