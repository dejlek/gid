module GtkSource.StyleSchemeChooserWidget;

import Gid.gid;
import Gtk.Accessible;
import Gtk.AccessibleT;
import Gtk.Buildable;
import Gtk.BuildableT;
import Gtk.ConstraintTarget;
import Gtk.ConstraintTargetT;
import Gtk.Widget;
import GtkSource.StyleSchemeChooser;
import GtkSource.StyleSchemeChooserT;
import GtkSource.Types;
import GtkSource.c.functions;
import GtkSource.c.types;

/**
 * A widget for choosing style schemes.
 * The `GtkSourceStyleSchemeChooserWidget` widget lets the user select a
 * style scheme. By default, the chooser presents a predefined list
 * of style schemes.
 * To change the initially selected style scheme,
 * use [GtkSource.StyleSchemeChooser.setStyleScheme].
 * To get the selected style scheme
 * use [GtkSource.StyleSchemeChooser.getStyleScheme].
 */
class StyleSchemeChooserWidget : Widget, StyleSchemeChooser
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_style_scheme_chooser_widget_get_type != &gidSymbolNotFound ? gtk_source_style_scheme_chooser_widget_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin StyleSchemeChooserT!();
}
