/// Module for [StyleSchemeChooserButton] class
module gtksource.style_scheme_chooser_button;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.activatable;
import gtk.activatable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.button;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.style_scheme_chooser;
import gtksource.style_scheme_chooser_mixin;
import gtksource.types;

/** */
class StyleSchemeChooserButton : gtk.button.Button, gtksource.style_scheme_chooser.StyleSchemeChooser
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_style_scheme_chooser_button_get_type != &gidSymbolNotFound ? gtk_source_style_scheme_chooser_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
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
