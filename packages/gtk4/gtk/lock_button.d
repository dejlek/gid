/// Module for [LockButton] class
module gtk.lock_button;

import gid.gid;
import gio.permission;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.button;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;

/**
    [gtk.lock_button.LockButton] is a widget to obtain and revoke authorizations
    needed to operate the controls.
    
    ![An example GtkLockButton](lock-button.png)
    
    It is typically used in preference dialogs or control panels.
    
    The required authorization is represented by a [gio.permission.Permission] object.
    Concrete implementations of [gio.permission.Permission] may use PolicyKit or some
    other authorization framework. To obtain a PolicyKit-based
    [gio.permission.Permission], use `polkit_permission_new()`.
    
    If the user is not currently allowed to perform the action, but can
    obtain the permission, the widget looks like this:
    
    ![](lockbutton-locked.png)
    
    and the user can click the button to request the permission. Depending
    on the platform, this may pop up an authentication dialog or ask the user
    to authenticate in some other way. Once the user has obtained the permission,
    the widget changes to this:
    
    ![](lockbutton-unlocked.png)
    
    and the permission can be dropped again by clicking the button. If the user
    is not able to obtain the permission at all, the widget looks like this:
    
    ![](lockbutton-sorry.png)
    
    If the user has the permission and cannot drop it, the button is hidden.
    
    The text (and tooltips) that are shown in the various cases can be adjusted
    with the `property@Gtk.LockButton:text-lock`,
    `property@Gtk.LockButton:text-unlock`,
    `property@Gtk.LockButton:tooltip-lock`,
    `property@Gtk.LockButton:tooltip-unlock` and
    `property@Gtk.LockButton:tooltip-not-authorized` properties.

    Deprecated: This widget will be removed in GTK 5
*/
class LockButton : gtk.button.Button
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
    return cast(void function())gtk_lock_button_get_type != &gidSymbolNotFound ? gtk_lock_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override LockButton self()
  {
    return this;
  }

  /**
      Creates a new lock button which reflects the permission.
  
      Params:
        permission = a [gio.permission.Permission]
      Returns: a new [gtk.lock_button.LockButton]
  
      Deprecated: This widget will be removed in GTK 5
  */
  this(gio.permission.Permission permission = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_lock_button_new(permission ? cast(GPermission*)permission.cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Obtains the [gio.permission.Permission] object that controls button.
      Returns: the [gio.permission.Permission] of button
  
      Deprecated: This widget will be removed in GTK 5
  */
  gio.permission.Permission getPermission()
  {
    GPermission* _cretval;
    _cretval = gtk_lock_button_get_permission(cast(GtkLockButton*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.permission.Permission)(cast(GPermission*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the [gio.permission.Permission] object that controls button.
  
      Params:
        permission = a [gio.permission.Permission] object
  
      Deprecated: This widget will be removed in GTK 5
  */
  void setPermission(gio.permission.Permission permission = null)
  {
    gtk_lock_button_set_permission(cast(GtkLockButton*)cPtr, permission ? cast(GPermission*)permission.cPtr(No.Dup) : null);
  }
}
