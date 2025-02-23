module GtkSource.StyleSchemeChooserT;

public import GtkSource.StyleSchemeChooserIfaceProxy;
public import GObject.ObjectG;
public import Gid.gid;
public import GtkSource.StyleScheme;
public import GtkSource.Types;
public import GtkSource.c.functions;
public import GtkSource.c.types;

/**
 * Interface implemented by widgets for choosing style schemes.
 * `GtkSourceStyleSchemeChooser` is an interface that is implemented by widgets
 * for choosing style schemes.
 * In GtkSourceView, the main widgets that implement this interface are
 * class@StyleSchemeChooserWidget and class@StyleSchemeChooserButton.
 */
template StyleSchemeChooserT()
{

  /**
   * Gets the currently-selected scheme.
   * Returns: the currently-selected scheme.
   */
  override StyleScheme getStyleScheme()
  {
    GtkSourceStyleScheme* _cretval;
    _cretval = gtk_source_style_scheme_chooser_get_style_scheme(cast(GtkSourceStyleSchemeChooser*)cPtr);
    auto _retval = ObjectG.getDObject!StyleScheme(cast(GtkSourceStyleScheme*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Sets the scheme.
   * Params:
   *   scheme = a #GtkSourceStyleScheme
   */
  override void setStyleScheme(StyleScheme scheme)
  {
    gtk_source_style_scheme_chooser_set_style_scheme(cast(GtkSourceStyleSchemeChooser*)cPtr, scheme ? cast(GtkSourceStyleScheme*)scheme.cPtr(No.Dup) : null);
  }
}
