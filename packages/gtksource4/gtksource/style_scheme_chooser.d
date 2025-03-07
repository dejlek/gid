module gtksource.style_scheme_chooser;

public import gtksource.style_scheme_chooser_iface_proxy;
import gid.gid;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.style_scheme;
import gtksource.types;

/** */
interface StyleSchemeChooser
{

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_style_scheme_chooser_get_type != &gidSymbolNotFound ? gtk_source_style_scheme_chooser_get_type() : cast(GType)0;
  }

  /**
      Gets the currently-selected scheme.
    Returns:     the currently-selected scheme.
  */
  gtksource.style_scheme.StyleScheme getStyleScheme();

  /**
      Sets the scheme.
    Params:
      scheme =       a #GtkSourceStyleScheme
  */
  void setStyleScheme(gtksource.style_scheme.StyleScheme scheme);
}
