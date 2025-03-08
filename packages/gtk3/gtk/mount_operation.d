module gtk.mount_operation;

import gdk.screen;
import gid.gid;
import gio.mount_operation;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.window;

/**
    This should not be accessed directly. Use the accessor functions below.
*/
class MountOperation : gio.mount_operation.MountOperation
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_mount_operation_get_type != &gidSymbolNotFound ? gtk_mount_operation_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new #GtkMountOperation
    Params:
      parent =       transient parent of the window, or null
    Returns:     a new #GtkMountOperation
  */
  this(gtk.window.Window parent = null)
  {
    GMountOperation* _cretval;
    _cretval = gtk_mount_operation_new(parent ? cast(GtkWindow*)parent.cPtr(No.dup) : null);
    this(_cretval, Yes.take);
  }

  /**
      Gets the transient parent used by the #GtkMountOperation
    Returns:     the transient parent for windows shown by op
  */
  gtk.window.Window getParent()
  {
    GtkWindow* _cretval;
    _cretval = gtk_mount_operation_get_parent(cast(GtkMountOperation*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.window.Window)(cast(GtkWindow*)_cretval, No.take);
    return _retval;
  }

  /**
      Gets the screen on which windows of the #GtkMountOperation
    will be shown.
    Returns:     the screen on which windows of op are shown
  */
  gdk.screen.Screen getScreen()
  {
    GdkScreen* _cretval;
    _cretval = gtk_mount_operation_get_screen(cast(GtkMountOperation*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.screen.Screen)(cast(GdkScreen*)_cretval, No.take);
    return _retval;
  }

  /**
      Returns whether the #GtkMountOperation is currently displaying
    a window.
    Returns:     true if op is currently displaying a window
  */
  bool isShowing()
  {
    bool _retval;
    _retval = gtk_mount_operation_is_showing(cast(GtkMountOperation*)cPtr);
    return _retval;
  }

  /**
      Sets the transient parent for windows shown by the
    #GtkMountOperation.
    Params:
      parent =       transient parent of the window, or null
  */
  void setParent(gtk.window.Window parent = null)
  {
    gtk_mount_operation_set_parent(cast(GtkMountOperation*)cPtr, parent ? cast(GtkWindow*)parent.cPtr(No.dup) : null);
  }

  /**
      Sets the screen to show windows of the #GtkMountOperation on.
    Params:
      screen =       a #GdkScreen
  */
  void setScreen(gdk.screen.Screen screen)
  {
    gtk_mount_operation_set_screen(cast(GtkMountOperation*)cPtr, screen ? cast(GdkScreen*)screen.cPtr(No.dup) : null);
  }
}
