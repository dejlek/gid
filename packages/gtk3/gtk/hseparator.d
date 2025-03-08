module gtk.hseparator;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.separator;
import gtk.types;

/**
    The #GtkHSeparator widget is a horizontal separator, used to group the
  widgets within a window. It displays a horizontal line with a shadow to
  make it appear sunken into the interface.
  
  > The #GtkHSeparator widget is not used as a separator within menus.
  > To create a separator in a menu create an empty #GtkSeparatorMenuItem
  > widget using [gtk.separator_menu_item.SeparatorMenuItem.new_] and add it to the menu with
  > [gtk.menu_shell.MenuShell.append].
  
  GtkHSeparator has been deprecated, use #GtkSeparator instead.
*/
class HSeparator : gtk.separator.Separator
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_hseparator_get_type != &gidSymbolNotFound ? gtk_hseparator_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new #GtkHSeparator.
    Returns:     a new #GtkHSeparator.
  
    Deprecated:     Use [gtk.separator.Separator.new_] with [gtk.types.Orientation.horizontal] instead
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_hseparator_new();
    this(_cretval, No.take);
  }
}
