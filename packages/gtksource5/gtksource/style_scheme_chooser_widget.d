module gtksource.style_scheme_chooser_widget;

import gid.gid;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.style_scheme_chooser;
import gtksource.style_scheme_chooser_mixin;
import gtksource.types;

/**
 * A widget for choosing style schemes.
 * The `GtkSourceStyleSchemeChooserWidget` widget lets the user select a
 * style scheme. By default, the chooser presents a predefined list
 * of style schemes.
 * To change the initially selected style scheme,
 * use [gtksource.style_scheme_chooser.StyleSchemeChooser.setStyleScheme].
 * To get the selected style scheme
 * use [gtksource.style_scheme_chooser.StyleSchemeChooser.getStyleScheme].
 */
class StyleSchemeChooserWidget : gtk.widget.Widget, gtksource.style_scheme_chooser.StyleSchemeChooser
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_style_scheme_chooser_widget_get_type != &gidSymbolNotFound ? gtk_source_style_scheme_chooser_widget_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin StyleSchemeChooserT!();

  /**
   * Creates a new #GtkSourceStyleSchemeChooserWidget.
   * Returns: a new  #GtkSourceStyleSchemeChooserWidget.
   */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_source_style_scheme_chooser_widget_new();
    this(_cretval, No.Take);
  }
}
