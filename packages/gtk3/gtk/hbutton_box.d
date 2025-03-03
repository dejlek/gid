module gtk.hbutton_box;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.button_box;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;

class HButtonBox : gtk.button_box.ButtonBox
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_hbutton_box_get_type != &gidSymbolNotFound ? gtk_hbutton_box_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new horizontal button box.
   * Returns: a new button box #GtkWidget.

   * Deprecated: Use [gtk.button_box.ButtonBox.new_] with %GTK_ORIENTATION_HORIZONTAL instead
   */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_hbutton_box_new();
    this(_cretval, No.Take);
  }
}
