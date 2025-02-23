module gtk.font_chooser_dialog;

import gid.gid;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.dialog;
import gtk.font_chooser;
import gtk.font_chooser_mixin;
import gtk.native;
import gtk.native_mixin;
import gtk.root;
import gtk.root_mixin;
import gtk.shortcut_manager;
import gtk.shortcut_manager_mixin;
import gtk.types;
import gtk.window;

/**
 * The `GtkFontChooserDialog` widget is a dialog for selecting a font.
 * ![An example GtkFontChooserDialog](fontchooser.png)
 * `GtkFontChooserDialog` implements the [Gtk.FontChooser] interface
 * and does not provide much API of its own.
 * To create a `GtkFontChooserDialog`, use [Gtk.FontChooserDialog.new_].
 * # GtkFontChooserDialog as GtkBuildable
 * The `GtkFontChooserDialog` implementation of the `GtkBuildable`
 * interface exposes the buttons with the names “select_button”
 * and “cancel_button”.
 * ## CSS nodes
 * `GtkFontChooserDialog` has a single CSS node with the name `window` and style
 * class `.fontchooser`.

 * Deprecated: Use [Gtk.FontDialog] instead
 */
class FontChooserDialog : Dialog, FontChooser
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_font_chooser_dialog_get_type != &gidSymbolNotFound ? gtk_font_chooser_dialog_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin FontChooserT!();

  /**
   * Creates a new `GtkFontChooserDialog`.
   * Params:
   *   title = Title of the dialog
   *   parent = Transient parent of the dialog
   * Returns: a new `GtkFontChooserDialog`

   * Deprecated: Use [Gtk.FontDialog] instead
   */
  this(string title, Window parent)
  {
    GtkWidget* _cretval;
    const(char)* _title = title.toCString(No.Alloc);
    _cretval = gtk_font_chooser_dialog_new(_title, parent ? cast(GtkWindow*)parent.cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }
}
