module gtk.separator_menu_item;

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
 * The #GtkSeparatorMenuItem is a separator used to group
 * items within a menu. It displays a horizontal line with a shadow to
 * make it appear sunken into the interface.
 * # CSS nodes
 * GtkSeparatorMenuItem has a single CSS node with name separator.
 */
class SeparatorMenuItem : gtk.menu_item.MenuItem
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_separator_menu_item_get_type != &gidSymbolNotFound ? gtk_separator_menu_item_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new #GtkSeparatorMenuItem.
   * Returns: a new #GtkSeparatorMenuItem.
   */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_separator_menu_item_new();
    this(_cretval, No.Take);
  }
}
