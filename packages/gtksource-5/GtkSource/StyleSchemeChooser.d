module GtkSource.StyleSchemeChooser;

public import GtkSource.StyleSchemeChooserIfaceProxy;
import GObject.ObjectG;
import Gid.gid;
import GtkSource.StyleScheme;
import GtkSource.Types;
import GtkSource.c.functions;
import GtkSource.c.types;

/**
 * Interface implemented by widgets for choosing style schemes.
 * `GtkSourceStyleSchemeChooser` is an interface that is implemented by widgets
 * for choosing style schemes.
 * In GtkSourceView, the main widgets that implement this interface are
 * class@StyleSchemeChooserWidget and class@StyleSchemeChooserButton.
 */
interface StyleSchemeChooser
{

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_style_scheme_chooser_get_type != &gidSymbolNotFound ? gtk_source_style_scheme_chooser_get_type() : cast(GType)0;
  }

  /**
   * Gets the currently-selected scheme.
   * Returns: the currently-selected scheme.
   */
  StyleScheme getStyleScheme();

  /**
   * Sets the scheme.
   * Params:
   *   scheme = a #GtkSourceStyleScheme
   */
  void setStyleScheme(StyleScheme scheme);
}
