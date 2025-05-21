/// Module for [StyleSchemeChooserButton] class
module gtksource.style_scheme_chooser_button;

import gid.gid;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.button;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.style_scheme_chooser;
import gtksource.style_scheme_chooser_mixin;
import gtksource.types;

/**
    A button to launch a style scheme selection dialog.
    
    The [gtksource.style_scheme_chooser_button.StyleSchemeChooserButton] is a button which displays
    the currently selected style scheme and allows to open a style scheme
    selection dialog to change the style scheme.
    It is suitable widget for selecting a style scheme in a preference dialog.
    
    In [gtksource.style_scheme_chooser_button.StyleSchemeChooserButton], a `class@StyleSchemeChooserWidget`
    is used to provide a dialog for selecting style schemes.
*/
class StyleSchemeChooserButton : gtk.button.Button, gtksource.style_scheme_chooser.StyleSchemeChooser
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_style_scheme_chooser_button_get_type != &gidSymbolNotFound ? gtk_source_style_scheme_chooser_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StyleSchemeChooserButton self()
  {
    return this;
  }

  mixin StyleSchemeChooserT!();

  /**
      Creates a new #GtkSourceStyleSchemeChooserButton.
      Returns: a new #GtkSourceStyleSchemeChooserButton.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_source_style_scheme_chooser_button_new();
    this(_cretval, No.Take);
  }
}
