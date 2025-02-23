module GtkSource.StyleSchemeChooserButton;

import Gid.gid;
import Gtk.Accessible;
import Gtk.AccessibleT;
import Gtk.Actionable;
import Gtk.ActionableT;
import Gtk.Buildable;
import Gtk.BuildableT;
import Gtk.Button;
import Gtk.ConstraintTarget;
import Gtk.ConstraintTargetT;
import GtkSource.StyleSchemeChooser;
import GtkSource.StyleSchemeChooserT;
import GtkSource.Types;
import GtkSource.c.functions;
import GtkSource.c.types;

/**
 * A button to launch a style scheme selection dialog.
 * The `GtkSourceStyleSchemeChooserButton` is a button which displays
 * the currently selected style scheme and allows to open a style scheme
 * selection dialog to change the style scheme.
 * It is suitable widget for selecting a style scheme in a preference dialog.
 * In `GtkSourceStyleSchemeChooserButton`, a class@StyleSchemeChooserWidget
 * is used to provide a dialog for selecting style schemes.
 */
class StyleSchemeChooserButton : Button, StyleSchemeChooser
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_style_scheme_chooser_button_get_type != &gidSymbolNotFound ? gtk_source_style_scheme_chooser_button_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin StyleSchemeChooserT!();
}
