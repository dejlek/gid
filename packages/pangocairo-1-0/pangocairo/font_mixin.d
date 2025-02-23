module pangocairo.font_mixin;

public import pangocairo.font_iface_proxy;
public import cairo.scaled_font;
public import gid.gid;
public import pangocairo.c.functions;
public import pangocairo.c.types;
public import pangocairo.types;

/**
 * `PangoCairoFont` is an interface exported by fonts for
 * use with Cairo.
 * The actual type of the font will depend on the particular
 * font technology Cairo was compiled to use.
 */
template FontT()
{

  /**
   * Gets the `cairo_scaled_font_t` used by font.
   * The scaled font can be referenced and kept using
   * [cairo.ScaledFont.reference].
   * Returns: the `cairo_scaled_font_t`
   *   used by font
   */
  override ScaledFont getScaledFont()
  {
    cairo_scaled_font_t* _cretval;
    _cretval = pango_cairo_font_get_scaled_font(cast(PangoCairoFont*)cPtr);
    auto _retval = _cretval ? new ScaledFont(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
