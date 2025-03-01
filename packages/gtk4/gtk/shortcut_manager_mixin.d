module gtk.shortcut_manager_mixin;

public import gtk.shortcut_manager_iface_proxy;
public import gid.global;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

/**
 * The `GtkShortcutManager` interface is used to implement
 * shortcut scopes.
 * This is important for [gtk.native.Native] widgets that have their
 * own surface, since the event controllers that are used to implement
 * managed and global scopes are limited to the same native.
 * Examples for widgets implementing `GtkShortcutManager` are
 * [gtk.window.Window] and [gtk.popover.Popover].
 * Every widget that implements `GtkShortcutManager` will be used as a
 * %GTK_SHORTCUT_SCOPE_MANAGED.
 */
template ShortcutManagerT()
{
}
