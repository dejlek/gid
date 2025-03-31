/// Module for [StyleSchemeChooser] interface mixin
module gtksource.style_scheme_chooser_mixin;

public import gtksource.style_scheme_chooser_iface_proxy;
public import gid.gid;
public import gobject.object;
public import gtksource.c.functions;
public import gtksource.c.types;
public import gtksource.style_scheme;
public import gtksource.types;

/** */
template StyleSchemeChooserT()
{

  /**
      Gets the currently-selected scheme.
      Returns: the currently-selected scheme.
  */
  override gtksource.style_scheme.StyleScheme getStyleScheme()
  {
    GtkSourceStyleScheme* _cretval;
    _cretval = gtk_source_style_scheme_chooser_get_style_scheme(cast(GtkSourceStyleSchemeChooser*)cPtr);
    auto _retval = ObjectG.getDObject!(gtksource.style_scheme.StyleScheme)(cast(GtkSourceStyleScheme*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the scheme.
  
      Params:
        scheme = a #GtkSourceStyleScheme
  */
  override void setStyleScheme(gtksource.style_scheme.StyleScheme scheme)
  {
    gtk_source_style_scheme_chooser_set_style_scheme(cast(GtkSourceStyleSchemeChooser*)cPtr, scheme ? cast(GtkSourceStyleScheme*)scheme.cPtr(No.Dup) : null);
  }
}
