module pango.color;

import gid.gid;
import gobject.boxed;
import pango.c.functions;
import pango.c.types;
import pango.types;

/**
    The [pango.color.Color] structure is used to
  represent a color in an uncalibrated RGB color-space.
*/
class Color : gobject.boxed.Boxed
{

  this()
  {
    super(safeMalloc(PangoColor.sizeof), Yes.Take);
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())pango_color_get_type != &gidSymbolNotFound ? pango_color_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  @property ushort red()
  {
    return (cast(PangoColor*)cPtr).red;
  }

  @property void red(ushort propval)
  {
    (cast(PangoColor*)cPtr).red = propval;
  }

  @property ushort green()
  {
    return (cast(PangoColor*)cPtr).green;
  }

  @property void green(ushort propval)
  {
    (cast(PangoColor*)cPtr).green = propval;
  }

  @property ushort blue()
  {
    return (cast(PangoColor*)cPtr).blue;
  }

  @property void blue(ushort propval)
  {
    (cast(PangoColor*)cPtr).blue = propval;
  }

  /**
      Creates a copy of src.
    
    The copy should be freed with [pango.color.Color.free].
    Primarily used by language bindings, not that useful
    otherwise (since colors can just be copied by assignment
    in C).
    Returns:     the newly allocated [pango.color.Color],
        which should be freed with [pango.color.Color.free]
  */
  pango.color.Color copy()
  {
    PangoColor* _cretval;
    _cretval = pango_color_copy(cast(const(PangoColor)*)cPtr);
    auto _retval = _cretval ? new pango.color.Color(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Fill in the fields of a color from a string specification.
    
    The string can either one of a large set of standard names.
    (Taken from the CSS Color [specification](https://www.w3.org/TR/css-color-4/#named-colors),
    or it can be a value in the form `#rgb`, `#rrggbb`,
    `#rrrgggbbb` or `#rrrrggggbbbb`, where `r`, `g` and `b`
    are hex digits of the red, green, and blue components
    of the color, respectively. (White in the four forms is
    `#fff`, `#ffffff`, `#fffffffff` and `#ffffffffffff`.)
    Params:
      spec =       a string specifying the new color
    Returns:     true if parsing of the specifier succeeded,
        otherwise false
  */
  bool parse(string spec)
  {
    bool _retval;
    const(char)* _spec = spec.toCString(No.Alloc);
    _retval = pango_color_parse(cast(PangoColor*)cPtr, _spec);
    return _retval;
  }

  /**
      Fill in the fields of a color from a string specification.
    
    The string can either one of a large set of standard names.
    (Taken from the CSS Color [specification](https://www.w3.org/TR/css-color-4/#named-colors),
    or it can be a hexadecimal value in the form `#rgb`,
    `#rrggbb`, `#rrrgggbbb` or `#rrrrggggbbbb` where `r`, `g`
    and `b` are hex digits of the red, green, and blue components
    of the color, respectively. (White in the four forms is
    `#fff`, `#ffffff`, `#fffffffff` and `#ffffffffffff`.)
    
    Additionally, parse strings of the form `#rgba`, `#rrggbbaa`,
    `#rrrrggggbbbbaaaa`, if alpha is not null, and set alpha
    to the value specified by the hex digits for `a`. If no alpha
    component is found in spec, alpha is set to 0xffff (for a
    solid color).
    Params:
      alpha =       return location for alpha
      spec =       a string specifying the new color
    Returns:     true if parsing of the specifier succeeded,
        otherwise false
  */
  bool parseWithAlpha(out ushort alpha, string spec)
  {
    bool _retval;
    const(char)* _spec = spec.toCString(No.Alloc);
    _retval = pango_color_parse_with_alpha(cast(PangoColor*)cPtr, cast(ushort*)&alpha, _spec);
    return _retval;
  }

  /**
      Returns a textual specification of color.
    
    The string is in the hexadecimal form `#rrrrggggbbbb`,
    where `r`, `g` and `b` are hex digits representing the
    red, green, and blue components respectively.
    Returns:     a newly-allocated text string that must
        be freed with [glib.global.gfree].
  */
  string toString_()
  {
    char* _cretval;
    _cretval = pango_color_to_string(cast(const(PangoColor)*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
