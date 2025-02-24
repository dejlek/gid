module gtk.color_chooser_dialog;

import gid.gid;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.color_chooser;
import gtk.color_chooser_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.dialog;
import gtk.native;
import gtk.native_mixin;
import gtk.root;
import gtk.root_mixin;
import gtk.shortcut_manager;
import gtk.shortcut_manager_mixin;
import gtk.types;
import gtk.window;

/**
 * A dialog for choosing a color.
 * ![An example GtkColorChooserDialog](colorchooser.png)
 * `GtkColorChooserDialog` implements the [Gtk.ColorChooser] interface
 * and does not provide much API of its own.
 * To create a `GtkColorChooserDialog`, use [Gtk.ColorChooserDialog.new_].
 * To change the initially selected color, use
 * [Gtk.ColorChooser.setRgba]. To get the selected color use
 * [Gtk.ColorChooser.getRgba].
 * `GtkColorChooserDialog` has been deprecated in favor of [Gtk.ColorDialog].
 * ## CSS nodes
 * `GtkColorChooserDialog` has a single CSS node with the name `window` and style
 * class `.colorchooser`.

 * Deprecated: Use [Gtk.ColorDialog] instead
 */
class ColorChooserDialog : Dialog, ColorChooser
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_color_chooser_dialog_get_type != &gidSymbolNotFound ? gtk_color_chooser_dialog_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin ColorChooserT!();

  /**
   * Creates a new `GtkColorChooserDialog`.
   * Params:
   *   title = Title of the dialog
   *   parent = Transient parent of the dialog
   * Returns: a new `GtkColorChooserDialog`

   * Deprecated: Use [Gtk.ColorDialog] instead
   */
  this(string title, Window parent)
  {
    GtkWidget* _cretval;
    const(char)* _title = title.toCString(No.Alloc);
    _cretval = gtk_color_chooser_dialog_new(_title, parent ? cast(GtkWindow*)parent.cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }
}
