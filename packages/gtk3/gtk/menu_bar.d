module gtk.menu_bar;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gio.menu_model;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.menu_shell;
import gtk.types;

/**
    The #GtkMenuBar is a subclass of #GtkMenuShell which contains one or
  more #GtkMenuItems. The result is a standard menu bar which can hold
  many menu items.
  
  # CSS nodes
  
  GtkMenuBar has a single CSS node with name menubar.
*/
class MenuBar : gtk.menu_shell.MenuShell
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_menu_bar_get_type != &gidSymbolNotFound ? gtk_menu_bar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override MenuBar self()
  {
    return this;
  }

  /**
      Creates a new #GtkMenuBar
    Returns:     the new menu bar, as a #GtkWidget
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_menu_bar_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new #GtkMenuBar and populates it with menu items
    and submenus according to model.
    
    The created menu items are connected to actions found in the
    #GtkApplicationWindow to which the menu bar belongs - typically
    by means of being contained within the #GtkApplicationWindows
    widget hierarchy.
    Params:
      model =       a #GMenuModel
    Returns:     a new #GtkMenuBar
  */
  static gtk.menu_bar.MenuBar newFromModel(gio.menu_model.MenuModel model)
  {
    GtkWidget* _cretval;
    _cretval = gtk_menu_bar_new_from_model(model ? cast(GMenuModel*)model.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.menu_bar.MenuBar)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the current child pack direction of the menubar.
    See [gtk.menu_bar.MenuBar.setChildPackDirection].
    Returns:     the child pack direction
  */
  gtk.types.PackDirection getChildPackDirection()
  {
    GtkPackDirection _cretval;
    _cretval = gtk_menu_bar_get_child_pack_direction(cast(GtkMenuBar*)cPtr);
    gtk.types.PackDirection _retval = cast(gtk.types.PackDirection)_cretval;
    return _retval;
  }

  /**
      Retrieves the current pack direction of the menubar.
    See [gtk.menu_bar.MenuBar.setPackDirection].
    Returns:     the pack direction
  */
  gtk.types.PackDirection getPackDirection()
  {
    GtkPackDirection _cretval;
    _cretval = gtk_menu_bar_get_pack_direction(cast(GtkMenuBar*)cPtr);
    gtk.types.PackDirection _retval = cast(gtk.types.PackDirection)_cretval;
    return _retval;
  }

  /**
      Sets how widgets should be packed inside the children of a menubar.
    Params:
      childPackDir =       a new #GtkPackDirection
  */
  void setChildPackDirection(gtk.types.PackDirection childPackDir)
  {
    gtk_menu_bar_set_child_pack_direction(cast(GtkMenuBar*)cPtr, childPackDir);
  }

  /**
      Sets how items should be packed inside a menubar.
    Params:
      packDir =       a new #GtkPackDirection
  */
  void setPackDirection(gtk.types.PackDirection packDir)
  {
    gtk_menu_bar_set_pack_direction(cast(GtkMenuBar*)cPtr, packDir);
  }
}
