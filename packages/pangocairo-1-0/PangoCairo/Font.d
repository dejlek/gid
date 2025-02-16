module PangoCairo.Font;

public import PangoCairo.FontIfaceProxy;
import Gid.gid;
import PangoCairo.Types;
import PangoCairo.c.functions;
import PangoCairo.c.types;
import cairo.ScaledFont;

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
    import Gid.loader : gidSymbolNotFound;
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
