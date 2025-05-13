/// Module for [FontChooserDialog] class
module gtk.font_chooser_dialog;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.dialog;
import gtk.font_chooser;
import gtk.font_chooser_mixin;
import gtk.types;
import gtk.window;

/**
    The #GtkFontChooserDialog widget is a dialog for selecting a font.
    It implements the #GtkFontChooser interface.
    
    # GtkFontChooserDialog as GtkBuildable
    
    The GtkFontChooserDialog implementation of the #GtkBuildable
    interface exposes the buttons with the names “select_button”
    and “cancel_button”.
*/
class FontChooserDialog : gtk.dialog.Dialog, gtk.font_chooser.FontChooser
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_font_chooser_dialog_get_type != &gidSymbolNotFound ? gtk_font_chooser_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FontChooserDialog self()
  {
    return this;
  }

  mixin FontChooserT!();

  /**
      Creates a new #GtkFontChooserDialog.
  
      Params:
        title = Title of the dialog, or null
        parent = Transient parent of the dialog, or null
      Returns: a new #GtkFontChooserDialog
  */
  this(string title = null, gtk.window.Window parent = null)
  {
    GtkWidget* _cretval;
    const(char)* _title = title.toCString(No.Alloc);
    _cretval = gtk_font_chooser_dialog_new(_title, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }
}
