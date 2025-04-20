/// Module for [FontMetrics] class
module pango.font_metrics;

import gid.gid;
import gobject.boxed;
import pango.c.functions;
import pango.c.types;
import pango.types;

/**
    A [pango.font_metrics.FontMetrics] structure holds the overall metric information
    for a font.
    
    The information in a [pango.font_metrics.FontMetrics] structure may be restricted
    to a script. The fields of this structure are private to implementations
    of a font backend. See the documentation of the corresponding getters
    for documentation of their meaning.
    
    For an overview of the most important metrics, see:
    
    <picture>
      <source srcset="fontmetrics-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="Font metrics" src="fontmetrics-light.png">
    </picture>
*/
class FontMetrics : gobject.boxed.Boxed
{

  /**
      Create a `font_metrics.FontMetrics` boxed type.
  */
  this()
  {
    super(gMalloc(PangoFontMetrics.sizeof), Yes.Take);
  }

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())pango_font_metrics_get_type != &gidSymbolNotFound ? pango_font_metrics_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FontMetrics self()
  {
    return this;
  }

  /**
      Gets the approximate character width for a font metrics structure.
      
      This is merely a representative value useful, for example, for
      determining the initial size for a window. Actual characters in
      text will be wider and narrower than this.
      Returns: the character width, in Pango units.
  */
  int getApproximateCharWidth()
  {
    int _retval;
    _retval = pango_font_metrics_get_approximate_char_width(cast(PangoFontMetrics*)cPtr);
    return _retval;
  }

  /**
      Gets the approximate digit width for a font metrics structure.
      
      This is merely a representative value useful, for example, for
      determining the initial size for a window. Actual digits in
      text can be wider or narrower than this, though this value
      is generally somewhat more accurate than the result of
      [pango.font_metrics.FontMetrics.getApproximateCharWidth] for digits.
      Returns: the digit width, in Pango units.
  */
  int getApproximateDigitWidth()
  {
    int _retval;
    _retval = pango_font_metrics_get_approximate_digit_width(cast(PangoFontMetrics*)cPtr);
    return _retval;
  }

  /**
      Gets the ascent from a font metrics structure.
      
      The ascent is the distance from the baseline to the logical top
      of a line of text. (The logical top may be above or below the top
      of the actual drawn ink. It is necessary to lay out the text to
      figure where the ink will be.)
      Returns: the ascent, in Pango units.
  */
  int getAscent()
  {
    int _retval;
    _retval = pango_font_metrics_get_ascent(cast(PangoFontMetrics*)cPtr);
    return _retval;
  }

  /**
      Gets the descent from a font metrics structure.
      
      The descent is the distance from the baseline to the logical bottom
      of a line of text. (The logical bottom may be above or below the
      bottom of the actual drawn ink. It is necessary to lay out the text
      to figure where the ink will be.)
      Returns: the descent, in Pango units.
  */
  int getDescent()
  {
    int _retval;
    _retval = pango_font_metrics_get_descent(cast(PangoFontMetrics*)cPtr);
    return _retval;
  }

  /**
      Gets the line height from a font metrics structure.
      
      The line height is the recommended distance between successive
      baselines in wrapped text using this font.
      
      If the line height is not available, 0 is returned.
      Returns: the height, in Pango units
  */
  int getHeight()
  {
    int _retval;
    _retval = pango_font_metrics_get_height(cast(PangoFontMetrics*)cPtr);
    return _retval;
  }

  /**
      Gets the suggested position to draw the strikethrough.
      
      The value returned is the distance *above* the
      baseline of the top of the strikethrough.
      Returns: the suggested strikethrough position, in Pango units.
  */
  int getStrikethroughPosition()
  {
    int _retval;
    _retval = pango_font_metrics_get_strikethrough_position(cast(PangoFontMetrics*)cPtr);
    return _retval;
  }

  /**
      Gets the suggested thickness to draw for the strikethrough.
      Returns: the suggested strikethrough thickness, in Pango units.
  */
  int getStrikethroughThickness()
  {
    int _retval;
    _retval = pango_font_metrics_get_strikethrough_thickness(cast(PangoFontMetrics*)cPtr);
    return _retval;
  }

  /**
      Gets the suggested position to draw the underline.
      
      The value returned is the distance *above* the baseline of the top
      of the underline. Since most fonts have underline positions beneath
      the baseline, this value is typically negative.
      Returns: the suggested underline position, in Pango units.
  */
  int getUnderlinePosition()
  {
    int _retval;
    _retval = pango_font_metrics_get_underline_position(cast(PangoFontMetrics*)cPtr);
    return _retval;
  }

  /**
      Gets the suggested thickness to draw for the underline.
      Returns: the suggested underline thickness, in Pango units.
  */
  int getUnderlineThickness()
  {
    int _retval;
    _retval = pango_font_metrics_get_underline_thickness(cast(PangoFontMetrics*)cPtr);
    return _retval;
  }
}
