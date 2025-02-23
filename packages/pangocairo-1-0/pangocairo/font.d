module pangocairo.font;

public import pangocairo.font_iface_proxy;
import cairo.scaled_font;
import gid.gid;
import pangocairo.c.functions;
import pangocairo.c.types;
import pangocairo.types;

/**
 * `PangoCairoFont` is an interface exported by fonts for
 * use with Cairo.
 * The actual type of the font will depend on the particular
 * font technology Cairo was compiled to use.
 */
interface Font
{

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())pango_cairo_font_get_type != &gidSymbolNotFound ? pango_cairo_font_get_type() : cast(GType)0;
  }

  /**
   * Gets the `cairo_scaled_font_t` used by font.
   * The scaled font can be referenced and kept using
   * [cairo.ScaledFont.reference].
   * Returns: the `cairo_scaled_font_t`
   *   used by font
   */
  ScaledFont getScaledFont();
}
