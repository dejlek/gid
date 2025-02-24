module gtk.popover_menu_bar;

import gid.gid;
import gio.menu_model;
import gobject.object;
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
 * `GtkPopoverMenuBar` presents a horizontal bar of items that pop
 * up popover menus when clicked.
 * ![An example GtkPopoverMenuBar](menubar.png)
 * The only way to create instances of `GtkPopoverMenuBar` is
 * from a `GMenuModel`.
 * # CSS nodes
 * ```
 * menubar
 * ├── item[.active]
 * ┊   ╰── popover
 * ╰── item
 * ╰── popover
 * ```
 * `GtkPopoverMenuBar` has a single CSS node with name menubar, below which
 * each item has its CSS node, and below that the corresponding popover.
 * The item whose popover is currently open gets the .active
 * style class.
 * # Accessibility
 * `GtkPopoverMenuBar` uses the %GTK_ACCESSIBLE_ROLE_MENU_BAR role,
 * the menu items use the %GTK_ACCESSIBLE_ROLE_MENU_ITEM role and
 * the menus use the %GTK_ACCESSIBLE_ROLE_MENU role.
 */
class PopoverMenuBar : Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_popover_menu_bar_get_type != &gidSymbolNotFound ? gtk_popover_menu_bar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a `GtkPopoverMenuBar` from a `GMenuModel`.
   * Params:
   *   model = a `GMenuModel`
   * Returns: a new `GtkPopoverMenuBar`
   */
  static PopoverMenuBar newFromModel(MenuModel model)
  {
    GtkWidget* _cretval;
    _cretval = gtk_popover_menu_bar_new_from_model(model ? cast(GMenuModel*)model.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!PopoverMenuBar(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Adds a custom widget to a generated menubar.
   * For this to work, the menu model of bar must have an
   * item with a `custom` attribute that matches id.
   * Params:
   *   child = the `GtkWidget` to add
   *   id = the ID to insert child at
   * Returns: %TRUE if id was found and the widget added
   */
  bool addChild(Widget child, string id)
  {
    bool _retval;
    const(char)* _id = id.toCString(No.Alloc);
    _retval = gtk_popover_menu_bar_add_child(cast(GtkPopoverMenuBar*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, _id);
    return _retval;
  }

  /**
   * Returns the model from which the contents of bar are taken.
   * Returns: a `GMenuModel`
   */
  MenuModel getMenuModel()
  {
    GMenuModel* _cretval;
    _cretval = gtk_popover_menu_bar_get_menu_model(cast(GtkPopoverMenuBar*)cPtr);
    auto _retval = ObjectG.getDObject!MenuModel(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Removes a widget that has previously been added with
   * [Gtk.PopoverMenuBar.addChild].
   * Params:
   *   child = the `GtkWidget` to remove
   * Returns: %TRUE if the widget was removed
   */
  bool removeChild(Widget child)
  {
    bool _retval;
    _retval = gtk_popover_menu_bar_remove_child(cast(GtkPopoverMenuBar*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
   * Sets a menu model from which bar should take
   * its contents.
   * Params:
   *   model = a `GMenuModel`
   */
  void setMenuModel(MenuModel model)
  {
    gtk_popover_menu_bar_set_menu_model(cast(GtkPopoverMenuBar*)cPtr, model ? cast(GMenuModel*)model.cPtr(No.Dup) : null);
  }
}
