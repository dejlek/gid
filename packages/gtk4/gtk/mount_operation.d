module gtk.mount_operation;

import gdk.display;
import gid.gid;
import gio.mount_operation;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.window;

/**
    [gtk.mount_operation.MountOperation] is an implementation of [gio.mount_operation.MountOperation].
  
  The functions and objects described here make working with GTK and
  GIO more convenient.
  
  [gtk.mount_operation.MountOperation] is needed when mounting volumes:
  It is an implementation of [gio.mount_operation.MountOperation] that can be used with
  GIO functions for mounting volumes such as
  [gio.file.File.mountEnclosingVolume], [gio.file.File.mountMountable],
  [gio.volume.Volume.mount], [gio.mount.Mount.unmountWithOperation] and others.
  
  When necessary, [gtk.mount_operation.MountOperation] shows dialogs to let the user
  enter passwords, ask questions or show processes blocking unmount.
*/
class MountOperation : gio.mount_operation.MountOperation
{

  this(void* ptr, Flag!"Take" take = No.Take)
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
      Creates a new [gtk.mount_operation.MountOperation].
    Params:
      parent =       transient parent of the window
    Returns:     a new [gtk.mount_operation.MountOperation]
  */
  this(gtk.window.Window parent = null)
  {
    GMountOperation* _cretval;
    _cretval = gtk_mount_operation_new(parent ? cast(GtkWindow*)parent.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the display on which windows of the [gtk.mount_operation.MountOperation]
    will be shown.
    Returns:     the display on which windows of op are shown
  */
  gdk.display.Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gtk_mount_operation_get_display(cast(GtkMountOperation*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the transient parent used by the [gtk.mount_operation.MountOperation].
    Returns:     the transient parent for windows shown by op
  */
  gtk.window.Window getParent()
  {
    GtkWindow* _cretval;
    _cretval = gtk_mount_operation_get_parent(cast(GtkMountOperation*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.window.Window)(cast(GtkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the [gtk.mount_operation.MountOperation] is currently displaying
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
      Sets the display to show windows of the [gtk.mount_operation.MountOperation] on.
    Params:
      display =       a [gdk.display.Display]
  */
  void setDisplay(gdk.display.Display display)
  {
    gtk_mount_operation_set_display(cast(GtkMountOperation*)cPtr, display ? cast(GdkDisplay*)display.cPtr(No.Dup) : null);
  }

  /**
      Sets the transient parent for windows shown by the
    [gtk.mount_operation.MountOperation].
    Params:
      parent =       transient parent of the window
  */
  void setParent(gtk.window.Window parent = null)
  {
    gtk_mount_operation_set_parent(cast(GtkMountOperation*)cPtr, parent ? cast(GtkWindow*)parent.cPtr(No.Dup) : null);
  }
}
