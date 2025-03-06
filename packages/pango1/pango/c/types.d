module pango.c.types;

public import gid.basictypes;
public import gobject.c.types;
public import gio.c.types;
public import harfbuzz.c.types;
public import cairo.c.types;
import pango.types;

/**
    A [pango.types.GLYPH_UNKNOWN_FLAG] represents a single glyph in the output form of a string.
*/
alias PangoGlyph = uint;

/**
    The `PangoGlyphUnit` type is used to store dimensions within
  Pango.
  
  Dimensions are stored in 1/PANGO_SCALE of a device unit.
  (A device unit might be a pixel for screen display, or
  a point on a printer.) PANGO_SCALE is currently 1024, and
  may change in the future (unlikely though), but you should not
  depend on its exact value.
  
  The PANGO_PIXELS() macro can be used to convert from glyph units
  into device units with correct rounding.
*/
alias PangoGlyphUnit = int;

/**
    A `PangoLayoutRun` represents a single run within a [pango.layout_line.LayoutLine].
  
  It is simply an alternate name for [pango.glyph_item.GlyphItem].
  See the [pango.glyph_item.GlyphItem] docs for details on the fields.
*/
alias PangoLayoutRun = PangoGlyphItem;


// Enums
alias PangoAlignment = pango.types.Alignment;
alias PangoAttrType = pango.types.AttrType;
alias PangoBaselineShift = pango.types.BaselineShift;
alias PangoBidiType = pango.types.BidiType;
alias PangoCoverageLevel = pango.types.CoverageLevel;
alias PangoDirection = pango.types.Direction;
alias PangoEllipsizeMode = pango.types.EllipsizeMode;
alias PangoFontMask = pango.types.FontMask;
alias PangoFontScale = pango.types.FontScale;
alias PangoGravity = pango.types.Gravity;
alias PangoGravityHint = pango.types.GravityHint;
alias PangoLayoutDeserializeError = pango.types.LayoutDeserializeError;
alias PangoLayoutDeserializeFlags = pango.types.LayoutDeserializeFlags;
alias PangoLayoutSerializeFlags = pango.types.LayoutSerializeFlags;
alias PangoOverline = pango.types.Overline;
alias PangoRenderPart = pango.types.RenderPart;
alias PangoScript = pango.types.Script;
alias PangoShapeFlags = pango.types.ShapeFlags;
alias PangoShowFlags = pango.types.ShowFlags;
alias PangoStretch = pango.types.Stretch;
alias PangoStyle = pango.types.Style;
alias PangoTabAlign = pango.types.TabAlign;
alias PangoTextTransform = pango.types.TextTransform;
alias PangoUnderline = pango.types.Underline;
alias PangoVariant = pango.types.Variant;
alias PangoWeight = pango.types.Weight;
alias PangoWrapMode = pango.types.WrapMode;
/**
    The [pango.analysis.Analysis] structure stores information about
  the properties of a segment of text.
*/
struct PangoAnalysis
{
  /**
      unused, reserved
  */
  void* shapeEngine;

  /**
      unused, reserved
  */
  void* langEngine;

  /**
      the font for this segment.
  */
  PangoFont* font;

  /**
      the bidirectional level for this segment.
  */
  ubyte level;

  /**
      the glyph orientation for this segment (A [pango.types.Gravity]).
  */
  ubyte gravity;

  /**
      boolean flags for this segment (Since: 1.16).
  */
  ubyte flags;

  /**
      the detected script for this segment (A [pango.types.Script]) (Since: 1.18).
  */
  ubyte script;

  /**
      the detected language for this segment.
  */
  PangoLanguage* language;

  /**
      extra attributes for this segment.
  */
  GSList* extraAttrs;
}

/**
    The [pango.types.AttrClass] structure stores the type and operations for
  a particular type of attribute.
  
  The functions in this structure should not be called directly. Instead,
  one should use the wrapper functions provided for [pango.attribute.Attribute].
*/
struct PangoAttrClass
{
  /**
      the type ID for this attribute
  */
  PangoAttrType type;

  /** */
  extern(C) PangoAttribute* function(const(PangoAttribute)* attr) copy;

  /** */
  extern(C) void function(PangoAttribute* attr) destroy;

  /** */
  extern(C) bool function(const(PangoAttribute)* attr1, const(PangoAttribute)* attr2) equal;
}

/**
    The [pango.attr_color.AttrColor] structure is used to represent attributes that
  are colors.
*/
struct PangoAttrColor
{
  /**
      the common portion of the attribute
  */
  PangoAttribute attr;

  /**
      the [pango.color.Color] which is the value of the attribute
  */
  PangoColor color;
}

/**
    The [pango.attr_float.AttrFloat] structure is used to represent attributes with
  a float or double value.
*/
struct PangoAttrFloat
{
  /**
      the common portion of the attribute
  */
  PangoAttribute attr;

  /**
      the value of the attribute
  */
  double value;
}

/**
    The [pango.attr_font_desc.AttrFontDesc] structure is used to store an attribute that
  sets all aspects of the font description at once.
*/
struct PangoAttrFontDesc
{
  /**
      the common portion of the attribute
  */
  PangoAttribute attr;

  /**
      the font description which is the value of this attribute
  */
  PangoFontDescription* desc;
}

/**
    The [pango.attr_font_features.AttrFontFeatures] structure is used to represent OpenType
  font features as an attribute.
*/
struct PangoAttrFontFeatures
{
  /**
      the common portion of the attribute
  */
  PangoAttribute attr;

  /**
      the features, as a string in CSS syntax
  */
  char* features;
}

/**
    The [pango.attr_int.AttrInt] structure is used to represent attributes with
  an integer or enumeration value.
*/
struct PangoAttrInt
{
  /**
      the common portion of the attribute
  */
  PangoAttribute attr;

  /**
      the value of the attribute
  */
  int value;
}

/**
    A [pango.attr_iterator.AttrIterator] is used to iterate through a [pango.attr_list.AttrList].
  
  A new iterator is created with [pango.attr_list.AttrList.getIterator].
  Once the iterator is created, it can be advanced through the style
  changes in the text using [pango.attr_iterator.AttrIterator.next]. At each
  style change, the range of the current style segment and the attributes
  currently in effect can be queried.
*/
struct PangoAttrIterator;

/**
    The [pango.attr_language.AttrLanguage] structure is used to represent attributes that
  are languages.
*/
struct PangoAttrLanguage
{
  /**
      the common portion of the attribute
  */
  PangoAttribute attr;

  /**
      the [pango.language.Language] which is the value of the attribute
  */
  PangoLanguage* value;
}

/**
    A [pango.attr_list.AttrList] represents a list of attributes that apply to a section
  of text.
  
  The attributes in a [pango.attr_list.AttrList] are, in general, allowed to overlap in
  an arbitrary fashion. However, if the attributes are manipulated only through
  [pango.attr_list.AttrList.change], the overlap between properties will meet
  stricter criteria.
  
  Since the [pango.attr_list.AttrList] structure is stored as a linear list, it is not
  suitable for storing attributes for large amounts of text. In general, you
  should not use a single [pango.attr_list.AttrList] for more than one paragraph of text.
*/
struct PangoAttrList;

/**
    The [pango.attr_shape.AttrShape] structure is used to represent attributes which
  impose shape restrictions.
*/
struct PangoAttrShape
{
  /**
      the common portion of the attribute
  */
  PangoAttribute attr;

  /**
      the ink rectangle to restrict to
  */
  PangoRectangle inkRect;

  /**
      the logical rectangle to restrict to
  */
  PangoRectangle logicalRect;

  /**
      user data set (see [pango.attr_shape.AttrShape.newWithData])
  */
  void* data;

  /**
      copy function for the user data
  */
  PangoAttrDataCopyFunc copyFunc;

  /**
      destroy function for the user data
  */
  GDestroyNotify destroyFunc;
}

/**
    The [pango.attr_size.AttrSize] structure is used to represent attributes which
  set font size.
*/
struct PangoAttrSize
{
  /**
      the common portion of the attribute
  */
  PangoAttribute attr;

  /**
      size of font, in units of 1/`PANGO_SCALE` of a point (for
      [pango.types.AttrType.Size]) or of a device unit (for [pango.types.AttrType.AbsoluteSize])
  */
  int size;

  /**
      whether the font size is in device units or points.
      This field is only present for compatibility with Pango-1.8.0
      ([pango.types.AttrType.AbsoluteSize] was added in 1.8.1); and always will
      be false for [pango.types.AttrType.Size] and true for [pango.types.AttrType.AbsoluteSize].
  */
  uint absolute;
}

/**
    The [pango.attr_string.AttrString] structure is used to represent attributes with
  a string value.
*/
struct PangoAttrString
{
  /**
      the common portion of the attribute
  */
  PangoAttribute attr;

  /**
      the string which is the value of the attribute
  */
  char* value;
}

/**
    The [pango.attribute.Attribute] structure represents the common portions of all
  attributes.
  
  Particular types of attributes include this structure as their initial
  portion. The common portion of the attribute holds the range to which
  the value in the type-specific part of the attribute applies and should
  be initialized using [pango.attribute.Attribute.init_]. By default, an attribute
  will have an all-inclusive range of [0,`G_MAXUINT`].
*/
struct PangoAttribute
{
  /**
      the class structure holding information about the type of the attribute
  */
  const(PangoAttrClass)* klass;

  /**
      the start index of the range (in bytes).
  */
  uint startIndex;

  /**
      end index of the range (in bytes). The character at this index
      is not included in the range.
  */
  uint endIndex;
}

/**
    The [pango.color.Color] structure is used to
  represent a color in an uncalibrated RGB color-space.
*/
struct PangoColor
{
  /**
      value of red component
  */
  ushort red;

  /**
      value of green component
  */
  ushort green;

  /**
      value of blue component
  */
  ushort blue;
}

/**
    A [pango.context.Context] stores global information used to control the
  itemization process.
  
  The information stored by [pango.context.Context] includes the fontmap used
  to look up fonts, and default values such as the default language,
  default gravity, or default font.
  
  To obtain a [pango.context.Context], use [pango.font_map.FontMap.createContext].
*/
struct PangoContext;

/** */
struct PangoContextClass;

/**
    A [pango.coverage.Coverage] structure is a map from Unicode characters
  to [pango.types.CoverageLevel] values.
  
  It is often necessary in Pango to determine if a particular
  font can represent a particular character, and also how well
  it can represent that character. The [pango.coverage.Coverage] is a data
  structure that is used to represent that information. It is an
  opaque structure with no public fields.
*/
struct PangoCoverage;

/**
    A [pango.font.Font] is used to represent a font in a
  rendering-system-independent manner.
*/
struct PangoFont
{
  /** */
  ObjectC parentInstance;
}

/** */
struct PangoFontClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) PangoFontDescription* function(PangoFont* font) describe;

  /** */
  extern(C) PangoCoverage* function(PangoFont* font, PangoLanguage* language) getCoverage;

  /** */
  extern(C) void function(PangoFont* font, PangoGlyph glyph, PangoRectangle* inkRect, PangoRectangle* logicalRect) getGlyphExtents;

  /** */
  extern(C) PangoFontMetrics* function(PangoFont* font, PangoLanguage* language) getMetrics;

  /** */
  extern(C) PangoFontMap* function(PangoFont* font) getFontMap;

  /** */
  extern(C) PangoFontDescription* function(PangoFont* font) describeAbsolute;

  /** */
  extern(C) void function(PangoFont* font, hb_feature_t* features, uint len, uint* numFeatures) getFeatures;

  /** */
  extern(C) hb_font_t* function(PangoFont* font) createHbFont;
}

/**
    A [pango.font_description.FontDescription] describes a font in an implementation-independent
  manner.
  
  [pango.font_description.FontDescription] structures are used both to list what fonts are
  available on the system and also for specifying the characteristics of
  a font to load.
*/
struct PangoFontDescription;

/**
    A [pango.font_face.FontFace] is used to represent a group of fonts with
  the same family, slant, weight, and width, but varying sizes.
*/
struct PangoFontFace
{
  /** */
  ObjectC parentInstance;
}

/** */
struct PangoFontFaceClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) const(char)* function(PangoFontFace* face) getFaceName;

  /** */
  extern(C) PangoFontDescription* function(PangoFontFace* face) describe;

  /** */
  extern(C) void function(PangoFontFace* face, int** sizes, int* nSizes) listSizes;

  /** */
  extern(C) bool function(PangoFontFace* face) isSynthesized;

  /** */
  extern(C) PangoFontFamily* function(PangoFontFace* face) getFamily;

  /** */
  extern(C) void function() PangoReserved3;

  /** */
  extern(C) void function() PangoReserved4;
}

/**
    A [pango.font_family.FontFamily] is used to represent a family of related
  font faces.
  
  The font faces in a family share a common design, but differ in
  slant, weight, width or other aspects.
*/
struct PangoFontFamily
{
  /** */
  ObjectC parentInstance;
}

/** */
struct PangoFontFamilyClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(PangoFontFamily* family, PangoFontFace*** faces, int* nFaces) listFaces;

  /** */
  extern(C) const(char)* function(PangoFontFamily* family) getName;

  /** */
  extern(C) bool function(PangoFontFamily* family) isMonospace;

  /** */
  extern(C) bool function(PangoFontFamily* family) isVariable;

  /** */
  extern(C) PangoFontFace* function(PangoFontFamily* family, const(char)* name) getFace;

  /** */
  extern(C) void function() PangoReserved2;
}

/**
    A [pango.font_map.FontMap] represents the set of fonts available for a
  particular rendering system.
  
  This is a virtual object with implementations being specific to
  particular rendering systems.
*/
struct PangoFontMap
{
  /** */
  ObjectC parentInstance;
}

/**
    The [pango.font_map_class.FontMapClass] structure holds the virtual functions for
  a particular [pango.font_map.FontMap] implementation.
*/
struct PangoFontMapClass
{
  /**
      parent [gobject.object_class.ObjectClass]
  */
  GObjectClass parentClass;

  /** */
  extern(C) PangoFont* function(PangoFontMap* fontmap, PangoContext* context, const(PangoFontDescription)* desc) loadFont;

  /** */
  extern(C) void function(PangoFontMap* fontmap, PangoFontFamily*** families, int* nFamilies) listFamilies;

  /** */
  extern(C) PangoFontset* function(PangoFontMap* fontmap, PangoContext* context, const(PangoFontDescription)* desc, PangoLanguage* language) loadFontset;

  /**
      the type of rendering-system-dependent engines that
    can handle fonts of this fonts loaded with this fontmap.
  */
  const(char)* shapeEngineType;

  /** */
  extern(C) uint function(PangoFontMap* fontmap) getSerial;

  /** */
  extern(C) void function(PangoFontMap* fontmap) changed;

  /** */
  extern(C) PangoFontFamily* function(PangoFontMap* fontmap, const(char)* name) getFamily;

  /** */
  extern(C) PangoFontFace* function(PangoFontMap* fontmap, PangoFont* font) getFace;
}

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
struct PangoFontMetrics
{
  /** */
  uint refCount;

  /** */
  int ascent;

  /** */
  int descent;

  /** */
  int height;

  /** */
  int approximateCharWidth;

  /** */
  int approximateDigitWidth;

  /** */
  int underlinePosition;

  /** */
  int underlineThickness;

  /** */
  int strikethroughPosition;

  /** */
  int strikethroughThickness;
}

/**
    A [pango.fontset.Fontset] represents a set of [pango.font.Font] to use when rendering text.
  
  A [pango.fontset.Fontset] is the result of resolving a [pango.font_description.FontDescription]
  against a particular [pango.context.Context]. It has operations for finding the
  component font for a particular Unicode character, and for finding a
  composite set of metrics for the entire fontset.
*/
struct PangoFontset
{
  /** */
  ObjectC parentInstance;
}

/**
    The [pango.fontset_class.FontsetClass] structure holds the virtual functions for
  a particular [pango.fontset.Fontset] implementation.
*/
struct PangoFontsetClass
{
  /**
      parent [gobject.object_class.ObjectClass]
  */
  GObjectClass parentClass;

  /** */
  extern(C) PangoFont* function(PangoFontset* fontset, uint wc) getFont;

  /** */
  extern(C) PangoFontMetrics* function(PangoFontset* fontset) getMetrics;

  /** */
  extern(C) PangoLanguage* function(PangoFontset* fontset) getLanguage;

  /** */
  extern(C) void function(PangoFontset* fontset, PangoFontsetForeachFunc func, void* data) foreach_;

  /** */
  extern(C) void function() PangoReserved1;

  /** */
  extern(C) void function() PangoReserved2;

  /** */
  extern(C) void function() PangoReserved3;

  /** */
  extern(C) void function() PangoReserved4;
}

/**
    [pango.fontset_simple.FontsetSimple] is a implementation of the abstract
  [pango.fontset.Fontset] base class as an array of fonts.
  
  When creating a [pango.fontset_simple.FontsetSimple], you have to provide
  the array of fonts that make up the fontset.
*/
struct PangoFontsetSimple;

/** */
struct PangoFontsetSimpleClass;

/**
    The [pango.types.GlyphGeometry] structure contains width and positioning
  information for a single glyph.
  
  Note that @width is not guaranteed to be the same as the glyph
  extents. Kerning and other positioning applied during shaping will
  affect both the @width and the @x_offset for the glyphs in the
  glyph string that results from shaping.
  
  The information in this struct is intended for rendering the glyphs,
  as follows:
  
  1. Assume the current point is (x, y)
  2. Render the current glyph at (x + x_offset, y + y_offset),
  3. Advance the current point to (x + width, y)
  4. Render the next glyph
*/
struct PangoGlyphGeometry
{
  /**
      the logical width to use for the the character.
  */
  PangoGlyphUnit width;

  /**
      horizontal offset from nominal character position.
  */
  PangoGlyphUnit xOffset;

  /**
      vertical offset from nominal character position.
  */
  PangoGlyphUnit yOffset;
}

/**
    A [pango.glyph_info.GlyphInfo] structure represents a single glyph with
  positioning information and visual attributes.
*/
struct PangoGlyphInfo
{
  /**
      the glyph itself.
  */
  PangoGlyph glyph;

  /**
      the positional information about the glyph.
  */
  PangoGlyphGeometry geometry;

  /**
      the visual attributes of the glyph.
  */
  PangoGlyphVisAttr attr;
}

/**
    A [pango.glyph_item.GlyphItem] is a pair of a [pango.item.Item] and the glyphs
  resulting from shaping the items text.
  
  As an example of the usage of [pango.glyph_item.GlyphItem], the results
  of shaping text with [pango.layout.Layout] is a list of [pango.layout_line.LayoutLine],
  each of which contains a list of [pango.glyph_item.GlyphItem].
*/
struct PangoGlyphItem
{
  /**
      corresponding [pango.item.Item]
  */
  PangoItem* item;

  /**
      corresponding [pango.glyph_string.GlyphString]
  */
  PangoGlyphString* glyphs;

  /**
      shift of the baseline, relative to the baseline
      of the containing line. Positive values shift upwards
  */
  int yOffset;

  /**
      horizontal displacement to apply before the
      glyph item. Positive values shift right
  */
  int startXOffset;

  /**
      horizontal displacement to apply after th
      glyph item. Positive values shift right
  */
  int endXOffset;
}

/**
    A [pango.glyph_item_iter.GlyphItemIter] is an iterator over the clusters in a
  [pango.glyph_item.GlyphItem].
  
  The *forward direction* of the iterator is the logical direction of text.
  That is, with increasing @start_index and @start_char values. If @glyph_item
  is right-to-left (that is, if `glyph_item->item->analysis.level` is odd),
  then @start_glyph decreases as the iterator moves forward.  Moreover,
  in right-to-left cases, @start_glyph is greater than @end_glyph.
  
  An iterator should be initialized using either
  [pango.glyph_item_iter.GlyphItemIter.initStart] or
  [pango.glyph_item_iter.GlyphItemIter.initEnd], for forward and backward iteration
  respectively, and walked over using any desired mixture of
  [pango.glyph_item_iter.GlyphItemIter.nextCluster] and
  [pango.glyph_item_iter.GlyphItemIter.prevCluster].
  
  A common idiom for doing a forward iteration over the clusters is:
  
  ```
  PangoGlyphItemIter cluster_iter;
  gboolean have_cluster;
  
  for (have_cluster = pango_glyph_item_iter_init_start (&cluster_iter,
                                                        glyph_item, text);
       have_cluster;
       have_cluster = pango_glyph_item_iter_next_cluster (&cluster_iter))
  {
    ...
  }
  ```
  
  Note that @text is the start of the text for layout, which is then
  indexed by `glyph_item->item->offset` to get to the text of @glyph_item.
  The @start_index and @end_index values can directly index into @text. The
  @start_glyph, @end_glyph, @start_char, and @end_char values however are
  zero-based for the @glyph_item.  For each cluster, the item pointed at by
  the start variables is included in the cluster while the one pointed at by
  end variables is not.
  
  None of the members of a [pango.glyph_item_iter.GlyphItemIter] should be modified manually.
*/
struct PangoGlyphItemIter
{
  /** */
  PangoGlyphItem* glyphItem;

  /** */
  const(char)* text;

  /** */
  int startGlyph;

  /** */
  int startIndex;

  /** */
  int startChar;

  /** */
  int endGlyph;

  /** */
  int endIndex;

  /** */
  int endChar;
}

/**
    A [pango.glyph_string.GlyphString] is used to store strings of glyphs with geometry
  and visual attribute information.
  
  The storage for the glyph information is owned by the structure
  which simplifies memory management.
*/
struct PangoGlyphString
{
  /**
      number of glyphs in this glyph string
  */
  int numGlyphs;

  /**
      array of glyph information
  */
  PangoGlyphInfo* glyphs;

  /**
      logical cluster info, indexed by the byte index
      within the text corresponding to the glyph string
  */
  int* logClusters;

  /** */
  int space;
}

/**
    A [pango.types.GlyphVisAttr] structure communicates information between
  the shaping and rendering phases.
  
  Currently, it contains cluster start and color information.
  More attributes may be added in the future.
  
  Clusters are stored in visual order, within the cluster, glyphs
  are always ordered in logical order, since visual order is meaningless;
  that is, in Arabic text, accent glyphs follow the glyphs for the
  base character.
*/
struct PangoGlyphVisAttr
{
  /**
      set for the first logical glyph in each cluster.
  */
  uint isClusterStart;

  /**
      set if the the font will render this glyph with color. Since 1.50
  */
  uint isColor;
}

/**
    The [pango.item.Item] structure stores information about a segment of text.
  
  You typically obtain `PangoItems` by itemizing a piece of text
  with `func@itemize`.
*/
struct PangoItem
{
  /**
      byte offset of the start of this item in text.
  */
  int offset;

  /**
      length of this item in bytes.
  */
  int length;

  /**
      number of Unicode characters in the item.
  */
  int numChars;

  /**
      analysis results for the item.
  */
  PangoAnalysis analysis;
}

/**
    The [pango.language.Language] structure is used to
  represent a language.
  
  [pango.language.Language] pointers can be efficiently
  copied and compared with each other.
*/
struct PangoLanguage;

/**
    A [pango.layout.Layout] structure represents an entire paragraph of text.
  
  While complete access to the layout capabilities of Pango is provided
  using the detailed interfaces for itemization and shaping, using
  that functionality directly involves writing a fairly large amount
  of code. [pango.layout.Layout] provides a high-level driver for formatting
  entire paragraphs of text at once. This includes paragraph-level
  functionality such as line breaking, justification, alignment and
  ellipsization.
  
  A [pango.layout.Layout] is initialized with a [pango.context.Context], UTF-8 string
  and set of attributes for that string. Once that is done, the set of
  formatted lines can be extracted from the object, the layout can be
  rendered, and conversion between logical character positions within
  the layout's text, and the physical position of the resulting glyphs
  can be made.
  
  There are a number of parameters to adjust the formatting of a
  [pango.layout.Layout]. The following image shows adjustable parameters
  (on the left) and font metrics (on the right):
  
  <picture>
    <source srcset="layout-dark.png" media="(prefers-color-scheme: dark)">
    <img alt="Pango Layout Parameters" src="layout-light.png">
  </picture>
  
  The following images demonstrate the effect of alignment and
  justification on the layout of text:
  
  | | |
  | --- | --- |
  | ![align=left](align-left.png) | ![align=left, justify](align-left-justify.png) |
  | ![align=center](align-center.png) | ![align=center, justify](align-center-justify.png) |
  | ![align=right](align-right.png) | ![align=right, justify](align-right-justify.png) |
  
  
  It is possible, as well, to ignore the 2-D setup,
  and simply treat the results of a [pango.layout.Layout] as a list of lines.
*/
struct PangoLayout;

/** */
struct PangoLayoutClass;

/**
    A [pango.layout_iter.LayoutIter] can be used to iterate over the visual
  extents of a [pango.layout.Layout].
  
  To obtain a [pango.layout_iter.LayoutIter], use [pango.layout.Layout.getIter].
  
  The [pango.layout_iter.LayoutIter] structure is opaque, and has no user-visible fields.
*/
struct PangoLayoutIter;

/**
    A [pango.layout_line.LayoutLine] represents one of the lines resulting from laying
  out a paragraph via [pango.layout.Layout].
  
  [pango.layout_line.LayoutLine] structures are obtained by calling
  [pango.layout.Layout.getLine] and are only valid until the text,
  attributes, or settings of the parent [pango.layout.Layout] are modified.
*/
struct PangoLayoutLine
{
  /**
      the layout this line belongs to, might be null
  */
  PangoLayout* layout;

  /**
      start of line as byte index into layout->text
  */
  int startIndex;

  /**
      length of line in bytes
  */
  int length;

  /**
      list of runs in the
      line, from left to right
  */
  GSList* runs;

  /**
      #TRUE if this is the first line of the paragraph
  */
  uint isParagraphStart;

  /**
      #Resolved PangoDirection of line
  */
  uint resolvedDir;
}

/**
    The [pango.types.LogAttr] structure stores information about the attributes of a
  single character.
*/
struct PangoLogAttr
{
  /**
      if set, can break line in front of character
  */
  uint isLineBreak;

  /**
      if set, must break line in front of character
  */
  uint isMandatoryBreak;

  /**
      if set, can break here when doing character wrapping
  */
  uint isCharBreak;

  /**
      is whitespace character
  */
  uint isWhite;

  /**
      if set, cursor can appear in front of character.
      i.e. this is a grapheme boundary, or the first character in the text.
      This flag implements Unicode's
      [Grapheme Cluster Boundaries](http://www.unicode.org/reports/tr29/)
      semantics.
  */
  uint isCursorPosition;

  /**
      is first character in a word
  */
  uint isWordStart;

  /**
      is first non-word char after a word
      Note that in degenerate cases, you could have both @is_word_start
      and @is_word_end set for some character.
  */
  uint isWordEnd;

  /**
      is a sentence boundary.
      There are two ways to divide sentences. The first assigns all
      inter-sentence whitespace/control/format chars to some sentence,
      so all chars are in some sentence; @is_sentence_boundary denotes
      the boundaries there. The second way doesn't assign
      between-sentence spaces, etc. to any sentence, so
      @is_sentence_start/@is_sentence_end mark the boundaries of those sentences.
  */
  uint isSentenceBoundary;

  /**
      is first character in a sentence
  */
  uint isSentenceStart;

  /**
      is first char after a sentence.
      Note that in degenerate cases, you could have both @is_sentence_start
      and @is_sentence_end set for some character. (e.g. no space after a
      period, so the next sentence starts right away)
  */
  uint isSentenceEnd;

  /**
      if set, backspace deletes one character
      rather than the entire grapheme cluster. This field is only meaningful
      on grapheme boundaries (where @is_cursor_position is set). In some languages,
      the full grapheme (e.g. letter + diacritics) is considered a unit, while in
      others, each decomposed character in the grapheme is a unit. In the default
      implementation of `func@break`, this bit is set on all grapheme boundaries
      except those following Latin, Cyrillic or Greek base characters.
  */
  uint backspaceDeletesCharacter;

  /**
      is a whitespace character that can possibly be
      expanded for justification purposes. (Since: 1.18)
  */
  uint isExpandableSpace;

  /**
      is a word boundary, as defined by UAX#29.
      More specifically, means that this is not a position in the middle of a word.
      For example, both sides of a punctuation mark are considered word boundaries.
      This flag is particularly useful when selecting text word-by-word. This flag
      implements Unicode's [Word Boundaries](http://www.unicode.org/reports/tr29/)
      semantics. (Since: 1.22)
  */
  uint isWordBoundary;

  /**
      when breaking lines before this char, insert a hyphen.
      Since: 1.50
  */
  uint breakInsertsHyphen;

  /**
      when breaking lines before this char, remove the
      preceding char. Since 1.50
  */
  uint breakRemovesPreceding;

  /** */
  uint reserved;
}

/**
    A [pango.matrix.Matrix] specifies a transformation between user-space
  and device coordinates.
  
  The transformation is given by
  
  ```
  x_device = x_user * matrix->xx + y_user * matrix->xy + matrix->x0;
  y_device = x_user * matrix->yx + y_user * matrix->yy + matrix->y0;
  ```
*/
struct PangoMatrix
{
  /**
      1st component of the transformation matrix
  */
  double xx;

  /**
      2nd component of the transformation matrix
  */
  double xy;

  /**
      3rd component of the transformation matrix
  */
  double yx;

  /**
      4th component of the transformation matrix
  */
  double yy;

  /**
      x translation
  */
  double x0;

  /**
      y translation
  */
  double y0;
}

/**
    The [pango.types.Rectangle] structure represents a rectangle.
  
  [pango.types.Rectangle] is frequently used to represent the logical or ink
  extents of a single glyph or section of text. (See, for instance,
  [pango.font.Font.getGlyphExtents].)
*/
struct PangoRectangle
{
  /**
      X coordinate of the left side of the rectangle.
  */
  int x;

  /**
      Y coordinate of the the top side of the rectangle.
  */
  int y;

  /**
      width of the rectangle.
  */
  int width;

  /**
      height of the rectangle.
  */
  int height;
}

/**
    [pango.renderer.Renderer] is a base class for objects that can render text
  provided as [pango.glyph_string.GlyphString] or [pango.layout.Layout].
  
  By subclassing [pango.renderer.Renderer] and overriding operations such as
  @draw_glyphs and @draw_rectangle, renderers for particular font
  backends and destinations can be created.
*/
struct PangoRenderer
{
  /** */
  ObjectC parentInstance;

  /** */
  PangoUnderline underline;

  /** */
  bool strikethrough;

  /** */
  int activeCount;

  /**
      the current transformation matrix for
      the Renderer; may be null, which should be treated the
      same as the identity matrix.
  */
  PangoMatrix* matrix;

  /** */
  PangoRendererPrivate* priv;
}

/**
    Class structure for [pango.renderer.Renderer].
  
  The following vfuncs take user space coordinates in Pango units
  and have default implementations:
  $(LIST
    * draw_glyphs
    * draw_rectangle
    * draw_error_underline
    * draw_shape
    * draw_glyph_item
  )
    
  The default draw_shape implementation draws nothing.
  
  The following vfuncs take device space coordinates as doubles
  and must be implemented:
  $(LIST
    * draw_trapezoid
    * draw_glyph
  )
*/
struct PangoRendererClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(PangoRenderer* renderer, PangoFont* font, PangoGlyphString* glyphs, int x, int y) drawGlyphs;

  /** */
  extern(C) void function(PangoRenderer* renderer, PangoRenderPart part, int x, int y, int width, int height) drawRectangle;

  /** */
  extern(C) void function(PangoRenderer* renderer, int x, int y, int width, int height) drawErrorUnderline;

  /** */
  extern(C) void function(PangoRenderer* renderer, PangoAttrShape* attr, int x, int y) drawShape;

  /** */
  extern(C) void function(PangoRenderer* renderer, PangoRenderPart part, double y1, double x11, double x21, double y2, double x12, double x22) drawTrapezoid;

  /** */
  extern(C) void function(PangoRenderer* renderer, PangoFont* font, PangoGlyph glyph, double x, double y) drawGlyph;

  /** */
  extern(C) void function(PangoRenderer* renderer, PangoRenderPart part) partChanged;

  /** */
  extern(C) void function(PangoRenderer* renderer) begin;

  /** */
  extern(C) void function(PangoRenderer* renderer) end;

  /** */
  extern(C) void function(PangoRenderer* renderer, PangoLayoutRun* run) prepareRun;

  /** */
  extern(C) void function(PangoRenderer* renderer, const(char)* text, PangoGlyphItem* glyphItem, int x, int y) drawGlyphItem;

  /** */
  extern(C) void function() PangoReserved2;

  /** */
  extern(C) void function() PangoReserved3;

  /** */
  extern(C) void function() PangoReserved4;
}

/** */
struct PangoRendererPrivate;

/**
    A [pango.script_iter.ScriptIter] is used to iterate through a string
  and identify ranges in different scripts.
*/
struct PangoScriptIter;

/**
    A [pango.tab_array.TabArray] contains an array of tab stops.
  
  [pango.tab_array.TabArray] can be used to set tab stops in a [pango.layout.Layout].
  Each tab stop has an alignment, a position, and optionally
  a character to use as decimal point.
*/
struct PangoTabArray;

alias extern(C) void* function(const(void)* userData) PangoAttrDataCopyFunc;

alias extern(C) bool function(PangoAttribute* attribute, void* userData) PangoAttrFilterFunc;

alias extern(C) bool function(PangoFontset* fontset, PangoFont* font, void* userData) PangoFontsetForeachFunc;

