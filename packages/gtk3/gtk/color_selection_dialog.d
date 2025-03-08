module gtk.color_selection_dialog;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.dialog;
import gtk.types;
import gtk.widget;

/** */
class ColorSelectionDialog : gtk.dialog.Dialog
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_color_selection_dialog_get_type != &gidSymbolNotFound ? gtk_color_selection_dialog_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new #GtkColorSelectionDialog.
    Params:
      title =       a string containing the title text for the dialog.
    Returns:     a #GtkColorSelectionDialog.
  */
  this(string title)
  {
    GtkWidget* _cretval;
    const(char)* _title = title.toCString(No.Alloc);
    _cretval = gtk_color_selection_dialog_new(_title);
    this(_cretval, No.Take);
  }

  /**
      Retrieves the #GtkColorSelection widget embedded in the dialog.
    Returns:     the embedded #GtkColorSelection
  */
  gtk.widget.Widget getColorSelection()
  {
    GtkWidget* _cretval;
    _cretval = gtk_color_selection_dialog_get_color_selection(cast(GtkColorSelectionDialog*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }
}
