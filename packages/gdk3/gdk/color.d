module gdk.color;

import gdk.c.functions;
import gdk.c.types;
import gdk.types;
import gid.gid;
import gobject.boxed;

/**
    A #GdkColor is used to describe a color,
  similar to the XColor struct used in the X11 drawing API.

  Deprecated:     Use #GdkRGBA
*/
class Color : gobject.boxed.Boxed
{

  this()
  {
    super(gMalloc(GdkColor.sizeof), Yes.Take);
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_color_get_type != &gidSymbolNotFound ? gdk_color_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override Color self()
  {
    return this;
  }

  @property uint pixel()
  {
    return (cast(GdkColor*)cPtr).pixel;
  }

  @property void pixel(uint propval)
  {
    (cast(GdkColor*)cPtr).pixel = propval;
  }

  @property ushort red()
  {
    return (cast(GdkColor*)cPtr).red;
  }

  @property void red(ushort propval)
  {
    (cast(GdkColor*)cPtr).red = propval;
  }

  @property ushort green()
  {
    return (cast(GdkColor*)cPtr).green;
  }

  @property void green(ushort propval)
  {
    (cast(GdkColor*)cPtr).green = propval;
  }

  @property ushort blue()
  {
    return (cast(GdkColor*)cPtr).blue;
  }

  @property void blue(ushort propval)
  {
    (cast(GdkColor*)cPtr).blue = propval;
  }

  /**
      Makes a copy of a #GdkColor.
    
    The result must be freed using [gdk.color.Color.free].
    Returns:     a copy of color
  
    Deprecated:     Use #GdkRGBA
  */
  gdk.color.Color copy()
  {
    GdkColor* _cretval;
    _cretval = gdk_color_copy(cast(const(GdkColor)*)cPtr);
    auto _retval = _cretval ? new gdk.color.Color(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Compares two colors.
    Params:
      colorb =       another #GdkColor
    Returns:     true if the two colors compare equal
  
    Deprecated:     Use #GdkRGBA
  */
  bool equal(gdk.color.Color colorb)
  {
    bool _retval;
    _retval = gdk_color_equal(cast(const(GdkColor)*)cPtr, colorb ? cast(const(GdkColor)*)colorb.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      A hash function suitable for using for a hash
    table that stores #GdkColors.
    Returns:     The hash function applied to color
  
    Deprecated:     Use #GdkRGBA
  */
  uint hash()
  {
    uint _retval;
    _retval = gdk_color_hash(cast(const(GdkColor)*)cPtr);
    return _retval;
  }

  /**
      Returns a textual specification of color in the hexadecimal
    form “\#rrrrggggbbbb” where “r”, “g” and “b” are hex digits
    representing the red, green and blue components respectively.
    
    The returned string can be parsed by [gdk.color.Color.parse].
    Returns:     a newly-allocated text string
  
    Deprecated:     Use #GdkRGBA
  */
  string toString_()
  {
    char* _cretval;
    _cretval = gdk_color_to_string(cast(const(GdkColor)*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Parses a textual specification of a color and fill in the
    red, green, and blue fields of a #GdkColor.
    
    The string can either one of a large set of standard names
    (taken from the X11 `rgb.txt` file), or it can be a hexadecimal
    value in the form “\#rgb” “\#rrggbb”, “\#rrrgggbbb” or
    “\#rrrrggggbbbb” where “r”, “g” and “b” are hex digits of
    the red, green, and blue components of the color, respectively.
    (White in the four forms is “\#fff”, “\#ffffff”, “\#fffffffff”
    and “\#ffffffffffff”).
    Params:
      spec =       the string specifying the color
      color =       the #GdkColor to fill in
    Returns:     true if the parsing succeeded
  
    Deprecated:     Use #GdkRGBA
  */
  static bool parse(string spec, out gdk.color.Color color)
  {
    bool _retval;
    const(char)* _spec = spec.toCString(No.Alloc);
    GdkColor _color;
    _retval = gdk_color_parse(_spec, &_color);
    color = new gdk.color.Color(cast(void*)&_color, No.Take);
    return _retval;
  }
}
