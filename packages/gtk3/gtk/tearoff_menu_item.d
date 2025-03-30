/// Module for [TearoffMenuItem] class
module gtk.tearoff_menu_item;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.activatable;
import gtk.activatable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.menu_item;
import gtk.types;

/**
    A #GtkTearoffMenuItem is a special #GtkMenuItem which is used to
    tear off and reattach its menu.
    
    When its menu is shown normally, the #GtkTearoffMenuItem is drawn as a
    dotted line indicating that the menu can be torn off.  Activating it
    causes its menu to be torn off and displayed in its own window
    as a tearoff menu.
    
    When its menu is shown as a tearoff menu, the #GtkTearoffMenuItem is drawn
    as a dotted line which has a left pointing arrow graphic indicating that
    the tearoff menu can be reattached.  Activating it will erase the tearoff
    menu window.
    
    > #GtkTearoffMenuItem is deprecated and should not be used in newly
    > written code. Menus are not meant to be torn around.
*/
class TearoffMenuItem : gtk.menu_item.MenuItem
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
    return cast(void function())gtk_tearoff_menu_item_get_type != &gidSymbolNotFound ? gtk_tearoff_menu_item_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override TearoffMenuItem self()
  {
    return this;
  }

  /**
      Creates a new #GtkTearoffMenuItem.
      Returns: a new #GtkTearoffMenuItem.
  
      Deprecated: #GtkTearoffMenuItem is deprecated and should not be
            used in newly written code.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_tearoff_menu_item_new();
    this(_cretval, No.Take);
  }
}
