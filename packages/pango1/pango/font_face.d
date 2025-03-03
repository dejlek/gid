module pango.font_face;

import gid.gid;
import gobject.object;
import pango.c.functions;
import pango.c.types;
import pango.font_description;
import pango.font_family;
import pango.types;

/**
 * A `PangoFontFace` is used to represent a group of fonts with
 * the same family, slant, weight, and width, but varying sizes.
 */
class FontFace : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())pango_font_face_get_type != &gidSymbolNotFound ? pango_font_face_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Returns a font description that matches the face.
   * The resulting font description will have the family, style,
   * variant, weight and stretch of the face, but its size field
   * will be unset.
   * Returns: a newly-created `PangoFontDescription` structure
   *   holding the description of the face. Use [pango.font_description.FontDescription.free]
   *   to free the result.
   */
  pango.font_description.FontDescription describe()
  {
    PangoFontDescription* _cretval;
    _cretval = pango_font_face_describe(cast(PangoFontFace*)cPtr);
    auto _retval = _cretval ? new pango.font_description.FontDescription(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Gets a name representing the style of this face.
   * Note that a font family may contain multiple faces
   * with the same name $(LPAREN)e.g. a variable and a non-variable
   * face for the same style$(RPAREN).
   * Returns: the face name for the face. This string is
   *   owned by the face object and must not be modified or freed.
   */
  string getFaceName()
  {
    const(char)* _cretval;
    _cretval = pango_font_face_get_face_name(cast(PangoFontFace*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * Gets the `PangoFontFamily` that face belongs to.
   * Returns: the `PangoFontFamily`
   */
  pango.font_family.FontFamily getFamily()
  {
    PangoFontFamily* _cretval;
    _cretval = pango_font_face_get_family(cast(PangoFontFace*)cPtr);
    auto _retval = ObjectG.getDObject!(pango.font_family.FontFamily)(cast(PangoFontFamily*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns whether a `PangoFontFace` is synthesized.
   * This will be the case if the underlying font rendering engine
   * creates this face from another face, by shearing, emboldening,
   * lightening or modifying it in some other way.
   * Returns: whether face is synthesized
   */
  bool isSynthesized()
  {
    bool _retval;
    _retval = pango_font_face_is_synthesized(cast(PangoFontFace*)cPtr);
    return _retval;
  }

  /**
   * List the available sizes for a font.
   * This is only applicable to bitmap fonts. For scalable fonts, stores
   * %NULL at the location pointed to by sizes and 0 at the location pointed
   * to by n_sizes. The sizes returned are in Pango units and are sorted
   * in ascending order.
   * Params:
   *   sizes = location to store a pointer to an array of int. This array
   *     should be freed with [glib.global.gfree].
   */
  void listSizes(out int[] sizes)
  {
    int _nSizes;
    int* _sizes;
    pango_font_face_list_sizes(cast(PangoFontFace*)cPtr, &_sizes, &_nSizes);
    sizes.length = _nSizes;
    sizes[0 .. $] = _sizes[0 .. _nSizes];
    safeFree(cast(void*)_sizes);
  }
}
