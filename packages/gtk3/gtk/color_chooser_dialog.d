module gtk.color_chooser_dialog;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.color_chooser;
import gtk.color_chooser_mixin;
import gtk.dialog;
import gtk.types;
import gtk.window;

/**
    The #GtkColorChooserDialog widget is a dialog for choosing
  a color. It implements the #GtkColorChooser interface.
*/
class ColorChooserDialog : gtk.dialog.Dialog, gtk.color_chooser.ColorChooser
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_color_chooser_dialog_get_type != &gidSymbolNotFound ? gtk_color_chooser_dialog_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin ColorChooserT!();

  /**
      Creates a new #GtkColorChooserDialog.
    Params:
      title =       Title of the dialog, or null
      parent =       Transient parent of the dialog, or null
    Returns:     a new #GtkColorChooserDialog
  */
  this(string title = null, gtk.window.Window parent = null)
  {
    GtkWidget* _cretval;
    const(char)* _title = title.toCString(No.Alloc);
    _cretval = gtk_color_chooser_dialog_new(_title, parent ? cast(GtkWindow*)parent.cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }
}
