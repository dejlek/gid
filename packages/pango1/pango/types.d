module pango.types;

import gid.gid;
import pango.attribute;
import pango.c.functions;
import pango.c.types;
import pango.font;
import pango.fontset;
import pango.glyph_item;


// Aliases

/** */
alias Glyph = PangoGlyph;

/** */
alias GlyphUnit = PangoGlyphUnit;

/** */
alias LayoutRun = pango.glyph_item.GlyphItem;

// Structs

/** */
alias GlyphGeometry = PangoGlyphGeometry;

/** */
alias GlyphVisAttr = PangoGlyphVisAttr;

/** */
alias LogAttr = PangoLogAttr;

/** */
alias Rectangle = PangoRectangle;

// Callbacks

/**
    Type of a function that can duplicate user data for an attribute.
  Returns:     new copy of user_data.
*/
alias AttrDataCopyFunc = void* delegate();

/**
    Type of a function filtering a list of attributes.

  ## Parameters
  $(LIST
    * $(B attribute)       a Pango attribute
  )
  Returns:     true if the attribute should be selected for
      filtering, false otherwise.
*/
alias AttrFilterFunc = bool delegate(pango.attribute.Attribute attribute);

/**
    Callback used when enumerating fonts in a fontset.
  
  See [pango.fontset.Fontset.foreach_].

  ## Parameters
  $(LIST
    * $(B fontset)       a [pango.fontset.Fontset]
    * $(B font)       a font from fontset
  )
  Returns:     if true, stop iteration and return immediately.
*/
alias FontsetForeachFunc = bool delegate(pango.fontset.Fontset fontset, pango.font.Font font);

/**
    [pango.types.Alignment] describes how to align the lines of a [pango.layout.Layout]
  within the available space.
  
  If the [pango.layout.Layout] is set to justify using [pango.layout.Layout.setJustify],
  this only affects partial lines.
  
  See [pango.layout.Layout.setAutoDir] for how text direction affects
  the interpretation of [pango.types.Alignment] values.
*/
enum Alignment
{
  /**
      Put all available space on the right
  */
  Left = 0,

  /**
      Center the line within the available space
  */
  Center = 1,

  /**
      Put all available space on the left
  */
  Right = 2,
}

/**
    The [pango.types.AttrType] distinguishes between different types of attributes.
  
  Along with the predefined values, it is possible to allocate additional
  values for custom attributes using `func@AttrType.register`. The predefined
  values are given below. The type of structure used to store the attribute is
  listed in parentheses after the description.
*/
enum AttrType
{
  /**
      does not happen
  */
  Invalid = 0,

  /**
      language ([pango.attr_language.AttrLanguage])
  */
  Language = 1,

  /**
      font family name list ([pango.attr_string.AttrString])
  */
  Family = 2,

  /**
      font slant style ([pango.attr_int.AttrInt])
  */
  Style = 3,

  /**
      font weight ([pango.attr_int.AttrInt])
  */
  Weight = 4,

  /**
      font variant (normal or small caps) ([pango.attr_int.AttrInt])
  */
  Variant = 5,

  /**
      font stretch ([pango.attr_int.AttrInt])
  */
  Stretch = 6,

  /**
      font size in points scaled by `PANGO_SCALE` ([pango.attr_int.AttrInt])
  */
  Size = 7,

  /**
      font description ([pango.attr_font_desc.AttrFontDesc])
  */
  FontDesc = 8,

  /**
      foreground color ([pango.attr_color.AttrColor])
  */
  Foreground = 9,

  /**
      background color ([pango.attr_color.AttrColor])
  */
  Background = 10,

  /**
      whether the text has an underline ([pango.attr_int.AttrInt])
  */
  Underline = 11,

  /**
      whether the text is struck-through ([pango.attr_int.AttrInt])
  */
  Strikethrough = 12,

  /**
      baseline displacement ([pango.attr_int.AttrInt])
  */
  Rise = 13,

  /**
      shape ([pango.attr_shape.AttrShape])
  */
  Shape = 14,

  /**
      font size scale factor ([pango.attr_float.AttrFloat])
  */
  Scale = 15,

  /**
      whether fallback is enabled ([pango.attr_int.AttrInt])
  */
  Fallback = 16,

  /**
      letter spacing (`struct@PangoAttrInt`)
  */
  LetterSpacing = 17,

  /**
      underline color ([pango.attr_color.AttrColor])
  */
  UnderlineColor = 18,

  /**
      strikethrough color ([pango.attr_color.AttrColor])
  */
  StrikethroughColor = 19,

  /**
      font size in pixels scaled by `PANGO_SCALE` ([pango.attr_int.AttrInt])
  */
  AbsoluteSize = 20,

  /**
      base text gravity ([pango.attr_int.AttrInt])
  */
  Gravity = 21,

  /**
      gravity hint ([pango.attr_int.AttrInt])
  */
  GravityHint = 22,

  /**
      OpenType font features ([pango.attr_font_features.AttrFontFeatures]). Since 1.38
  */
  FontFeatures = 23,

  /**
      foreground alpha ([pango.attr_int.AttrInt]). Since 1.38
  */
  ForegroundAlpha = 24,

  /**
      background alpha ([pango.attr_int.AttrInt]). Since 1.38
  */
  BackgroundAlpha = 25,

  /**
      whether breaks are allowed ([pango.attr_int.AttrInt]). Since 1.44
  */
  AllowBreaks = 26,

  /**
      how to render invisible characters ([pango.attr_int.AttrInt]). Since 1.44
  */
  Show = 27,

  /**
      whether to insert hyphens at intra-word line breaks ([pango.attr_int.AttrInt]). Since 1.44
  */
  InsertHyphens = 28,

  /**
      whether the text has an overline ([pango.attr_int.AttrInt]). Since 1.46
  */
  Overline = 29,

  /**
      overline color ([pango.attr_color.AttrColor]). Since 1.46
  */
  OverlineColor = 30,

  /**
      line height factor ([pango.attr_float.AttrFloat]). Since: 1.50
  */
  LineHeight = 31,

  /**
      line height ([pango.attr_int.AttrInt]). Since: 1.50
  */
  AbsoluteLineHeight = 32,

  /** */
  TextTransform = 33,

  /**
      override segmentation to classify the range of the attribute as a single word ([pango.attr_int.AttrInt]). Since 1.50
  */
  Word = 34,

  /**
      override segmentation to classify the range of the attribute as a single sentence ([pango.attr_int.AttrInt]). Since 1.50
  */
  Sentence = 35,

  /**
      baseline displacement ([pango.attr_int.AttrInt]). Since 1.50
  */
  BaselineShift = 36,

  /**
      font-relative size change ([pango.attr_int.AttrInt]). Since 1.50
  */
  FontScale = 37,
}

/**
    An enumeration that affects baseline shifts between runs.
*/
enum BaselineShift
{
  /**
      Leave the baseline unchanged
  */
  None = 0,

  /**
      Shift the baseline to the superscript position,
      relative to the previous run
  */
  Superscript = 1,

  /**
      Shift the baseline to the subscript position,
      relative to the previous run
  */
  Subscript = 2,
}

/**
    [pango.types.BidiType] represents the bidirectional character
  type of a Unicode character.
  
  The values in this enumeration are specified by the
  [Unicode bidirectional algorithm](http://www.unicode.org/reports/tr9/).

  Deprecated:     Use fribidi for this information
*/
enum BidiType
{
  /**
      Left-to-Right
  */
  L = 0,

  /**
      Left-to-Right Embedding
  */
  Lre = 1,

  /**
      Left-to-Right Override
  */
  Lro = 2,

  /**
      Right-to-Left
  */
  R = 3,

  /**
      Right-to-Left Arabic
  */
  Al = 4,

  /**
      Right-to-Left Embedding
  */
  Rle = 5,

  /**
      Right-to-Left Override
  */
  Rlo = 6,

  /**
      Pop Directional Format
  */
  Pdf = 7,

  /**
      European Number
  */
  En = 8,

  /**
      European Number Separator
  */
  Es = 9,

  /**
      European Number Terminator
  */
  Et = 10,

  /**
      Arabic Number
  */
  An = 11,

  /**
      Common Number Separator
  */
  Cs = 12,

  /**
      Nonspacing Mark
  */
  Nsm = 13,

  /**
      Boundary Neutral
  */
  Bn = 14,

  /**
      Paragraph Separator
  */
  B = 15,

  /**
      Segment Separator
  */
  S = 16,

  /**
      Whitespace
  */
  Ws = 17,

  /**
      Other Neutrals
  */
  On = 18,

  /**
      Left-to-Right isolate. Since 1.48.6
  */
  Lri = 19,

  /**
      Right-to-Left isolate. Since 1.48.6
  */
  Rli = 20,

  /**
      First strong isolate. Since 1.48.6
  */
  Fsi = 21,

  /**
      Pop directional isolate. Since 1.48.6
  */
  Pdi = 22,
}

/**
    [pango.types.CoverageLevel] is used to indicate how well a font can
  represent a particular Unicode character for a particular script.
  
  Since 1.44, only [pango.types.CoverageLevel.None] and [pango.types.CoverageLevel.Exact]
  will be returned.
*/
enum CoverageLevel
{
  /**
      The character is not representable with
      the font.
  */
  None = 0,

  /**
      The character is represented in a
      way that may be comprehensible but is not the correct
      graphical form. For instance, a Hangul character represented
      as a a sequence of Jamos, or a Latin transliteration of a
      Cyrillic word.
  */
  Fallback = 1,

  /**
      The character is represented as
      basically the correct graphical form, but with a stylistic
      variant inappropriate for the current script.
  */
  Approximate = 2,

  /**
      The character is represented as the
      correct graphical form.
  */
  Exact = 3,
}

/**
    [pango.types.Direction] represents a direction in the Unicode bidirectional
  algorithm.
  
  Not every value in this enumeration makes sense for every usage of
  [pango.types.Direction]; for example, the return value of `func@unichar_direction`
  and `func@find_base_dir` cannot be [pango.types.Direction.WeakLtr] or
  [pango.types.Direction.WeakRtl], since every character is either neutral
  or has a strong direction; on the other hand [pango.types.Direction.Neutral]
  doesn't make sense to pass to `func@itemize_with_base_dir`.
  
  The [pango.types.Direction.TtbLtr], [pango.types.Direction.TtbRtl] values come from
  an earlier interpretation of this enumeration as the writing direction
  of a block of text and are no longer used. See [pango.types.Gravity] for how
  vertical text is handled in Pango.
  
  If you are interested in text direction, you should really use fribidi
  directly. [pango.types.Direction] is only retained because it is used in some
  public apis.
*/
enum Direction
{
  /**
      A strong left-to-right direction
  */
  Ltr = 0,

  /**
      A strong right-to-left direction
  */
  Rtl = 1,

  /**
      Deprecated value; treated the
      same as [pango.types.Direction.Rtl].
  */
  TtbLtr = 2,

  /**
      Deprecated value; treated the
      same as [pango.types.Direction.Ltr]
  */
  TtbRtl = 3,

  /**
      A weak left-to-right direction
  */
  WeakLtr = 4,

  /**
      A weak right-to-left direction
  */
  WeakRtl = 5,

  /**
      No direction specified
  */
  Neutral = 6,
}

/**
    [pango.types.EllipsizeMode] describes what sort of ellipsization
  should be applied to text.
  
  In the ellipsization process characters are removed from the
  text in order to make it fit to a given width and replaced
  with an ellipsis.
*/
enum EllipsizeMode
{
  /**
      No ellipsization
  */
  None = 0,

  /**
      Omit characters at the start of the text
  */
  Start = 1,

  /**
      Omit characters in the middle of the text
  */
  Middle = 2,

  /**
      Omit characters at the end of the text
  */
  End = 3,
}

/**
    The bits in a [pango.types.FontMask] correspond to the set fields in a
  [pango.font_description.FontDescription].
*/
enum FontMask : uint
{
  /**
      the font family is specified.
  */
  Family = 1,

  /**
      the font style is specified.
  */
  Style = 2,

  /**
      the font variant is specified.
  */
  Variant = 4,

  /**
      the font weight is specified.
  */
  Weight = 8,

  /**
      the font stretch is specified.
  */
  Stretch = 16,

  /**
      the font size is specified.
  */
  Size = 32,

  /**
      the font gravity is specified (Since: 1.16.)
  */
  Gravity = 64,

  /**
      OpenType font variations are specified (Since: 1.42)
  */
  Variations = 128,
}

/**
    An enumeration that affects font sizes for superscript
  and subscript positioning and for (emulated) Small Caps.
*/
enum FontScale
{
  /**
      Leave the font size unchanged
  */
  None = 0,

  /**
      Change the font to a size suitable for superscripts
  */
  Superscript = 1,

  /**
      Change the font to a size suitable for subscripts
  */
  Subscript = 2,

  /**
      Change the font to a size suitable for Small Caps
  */
  SmallCaps = 3,
}

/**
    [pango.types.Gravity] represents the orientation of glyphs in a segment
  of text.
  
  This is useful when rendering vertical text layouts. In those situations,
  the layout is rotated using a non-identity [pango.matrix.Matrix], and then
  glyph orientation is controlled using [pango.types.Gravity].
  
  Not every value in this enumeration makes sense for every usage of
  [pango.types.Gravity]; for example, [pango.types.Gravity.Auto] only can be passed to
  [pango.context.Context.setBaseGravity] and can only be returned by
  [pango.context.Context.getBaseGravity].
  
  See also: [pango.types.GravityHint]
*/
enum Gravity
{
  /**
      Glyphs stand upright (default) <img align="right" valign="center" src="m-south.png">
  */
  South = 0,

  /**
      Glyphs are rotated 90 degrees counter-clockwise. <img align="right" valign="center" src="m-east.png">
  */
  East = 1,

  /**
      Glyphs are upside-down. <img align="right" valign="cener" src="m-north.png">
  */
  North = 2,

  /**
      Glyphs are rotated 90 degrees clockwise. <img align="right" valign="center" src="m-west.png">
  */
  West = 3,

  /**
      Gravity is resolved from the context matrix
  */
  Auto = 4,
}

/**
    [pango.types.GravityHint] defines how horizontal scripts should behave in a
  vertical context.
  
  That is, English excerpts in a vertical paragraph for example.
  
  See also [pango.types.Gravity]
*/
enum GravityHint
{
  /**
      scripts will take their natural gravity based
      on the base gravity and the script.  This is the default.
  */
  Natural = 0,

  /**
      always use the base gravity set, regardless of
      the script.
  */
  Strong = 1,

  /**
      for scripts not in their natural direction (eg.
      Latin in East gravity), choose per-script gravity such that every script
      respects the line progression. This means, Latin and Arabic will take
      opposite gravities and both flow top-to-bottom for example.
  */
  Line = 2,
}

/**
    Errors that can be returned by [pango.layout.Layout.deserialize].
*/
enum LayoutDeserializeError
{
  /**
      Unspecified error
  */
  Invalid = 0,

  /**
      A JSon value could not be
      interpreted
  */
  InvalidValue = 1,

  /**
      A required JSon member was
      not found
  */
  MissingValue = 2,
}

/**
    Flags that influence the behavior of [pango.layout.Layout.deserialize].
  
  New members may be added to this enumeration over time.
*/
enum LayoutDeserializeFlags : uint
{
  /**
      Default behavior
  */
  Default = 0,

  /**
      Apply context information
      from the serialization to the [pango.context.Context]
  */
  Context = 1,
}

/**
    Flags that influence the behavior of [pango.layout.Layout.serialize].
  
  New members may be added to this enumeration over time.
*/
enum LayoutSerializeFlags : uint
{
  /**
      Default behavior
  */
  Default = 0,

  /**
      Include context information
  */
  Context = 1,

  /**
      Include information about the formatted output
  */
  Output = 2,
}

/**
    The [pango.types.Overline] enumeration is used to specify whether text
  should be overlined, and if so, the type of line.
*/
enum Overline
{
  /**
      no overline should be drawn
  */
  None = 0,

  /**
      Draw a single line above the ink
      extents of the text being underlined.
  */
  Single = 1,
}

/**
    [pango.types.RenderPart] defines different items to render for such
  purposes as setting colors.
*/
enum RenderPart
{
  /**
      the text itself
  */
  Foreground = 0,

  /**
      the area behind the text
  */
  Background = 1,

  /**
      underlines
  */
  Underline = 2,

  /**
      strikethrough lines
  */
  Strikethrough = 3,

  /**
      overlines
  */
  Overline = 4,
}

/**
    The [pango.types.Script] enumeration identifies different writing
  systems.
  
  The values correspond to the names as defined in the Unicode standard. See
  [Unicode Standard Annex 24: Script names](http://www.unicode.org/reports/tr24/)
  
  Note that this enumeration is deprecated and will not be updated to include values
  in newer versions of the Unicode standard. Applications should use the
  [glib.types.UnicodeScript] enumeration instead,
  whose values are interchangeable with [pango.types.Script].
*/
enum Script
{
  /**
      a value never returned from [pango.global.scriptForUnichar]
  */
  InvalidCode = -1,

  /**
      a character used by multiple different scripts
  */
  Common = 0,

  /**
      a mark glyph that takes its script from the
    base glyph to which it is attached
  */
  Inherited = 1,

  /**
      Arabic
  */
  Arabic = 2,

  /**
      Armenian
  */
  Armenian = 3,

  /**
      Bengali
  */
  Bengali = 4,

  /**
      Bopomofo
  */
  Bopomofo = 5,

  /**
      Cherokee
  */
  Cherokee = 6,

  /**
      Coptic
  */
  Coptic = 7,

  /**
      Cyrillic
  */
  Cyrillic = 8,

  /**
      Deseret
  */
  Deseret = 9,

  /**
      Devanagari
  */
  Devanagari = 10,

  /**
      Ethiopic
  */
  Ethiopic = 11,

  /**
      Georgian
  */
  Georgian = 12,

  /**
      Gothic
  */
  Gothic = 13,

  /**
      Greek
  */
  Greek = 14,

  /**
      Gujarati
  */
  Gujarati = 15,

  /**
      Gurmukhi
  */
  Gurmukhi = 16,

  /**
      Han
  */
  Han = 17,

  /**
      Hangul
  */
  Hangul = 18,

  /**
      Hebrew
  */
  Hebrew = 19,

  /**
      Hiragana
  */
  Hiragana = 20,

  /**
      Kannada
  */
  Kannada = 21,

  /**
      Katakana
  */
  Katakana = 22,

  /**
      Khmer
  */
  Khmer = 23,

  /**
      Lao
  */
  Lao = 24,

  /**
      Latin
  */
  Latin = 25,

  /**
      Malayalam
  */
  Malayalam = 26,

  /**
      Mongolian
  */
  Mongolian = 27,

  /**
      Myanmar
  */
  Myanmar = 28,

  /**
      Ogham
  */
  Ogham = 29,

  /**
      Old Italic
  */
  OldItalic = 30,

  /**
      Oriya
  */
  Oriya = 31,

  /**
      Runic
  */
  Runic = 32,

  /**
      Sinhala
  */
  Sinhala = 33,

  /**
      Syriac
  */
  Syriac = 34,

  /**
      Tamil
  */
  Tamil = 35,

  /**
      Telugu
  */
  Telugu = 36,

  /**
      Thaana
  */
  Thaana = 37,

  /**
      Thai
  */
  Thai = 38,

  /**
      Tibetan
  */
  Tibetan = 39,

  /**
      Canadian Aboriginal
  */
  CanadianAboriginal = 40,

  /**
      Yi
  */
  Yi = 41,

  /**
      Tagalog
  */
  Tagalog = 42,

  /**
      Hanunoo
  */
  Hanunoo = 43,

  /**
      Buhid
  */
  Buhid = 44,

  /**
      Tagbanwa
  */
  Tagbanwa = 45,

  /**
      Braille
  */
  Braille = 46,

  /**
      Cypriot
  */
  Cypriot = 47,

  /**
      Limbu
  */
  Limbu = 48,

  /**
      Osmanya
  */
  Osmanya = 49,

  /**
      Shavian
  */
  Shavian = 50,

  /**
      Linear B
  */
  LinearB = 51,

  /**
      Tai Le
  */
  TaiLe = 52,

  /**
      Ugaritic
  */
  Ugaritic = 53,

  /**
      New Tai Lue. Since 1.10
  */
  NewTaiLue = 54,

  /**
      Buginese. Since 1.10
  */
  Buginese = 55,

  /**
      Glagolitic. Since 1.10
  */
  Glagolitic = 56,

  /**
      Tifinagh. Since 1.10
  */
  Tifinagh = 57,

  /**
      Syloti Nagri. Since 1.10
  */
  SylotiNagri = 58,

  /**
      Old Persian. Since 1.10
  */
  OldPersian = 59,

  /**
      Kharoshthi. Since 1.10
  */
  Kharoshthi = 60,

  /**
      an unassigned code point. Since 1.14
  */
  Unknown = 61,

  /**
      Balinese. Since 1.14
  */
  Balinese = 62,

  /**
      Cuneiform. Since 1.14
  */
  Cuneiform = 63,

  /**
      Phoenician. Since 1.14
  */
  Phoenician = 64,

  /**
      Phags-pa. Since 1.14
  */
  PhagsPa = 65,

  /**
      N'Ko. Since 1.14
  */
  Nko = 66,

  /**
      Kayah Li. Since 1.20.1
  */
  KayahLi = 67,

  /**
      Lepcha. Since 1.20.1
  */
  Lepcha = 68,

  /**
      Rejang. Since 1.20.1
  */
  Rejang = 69,

  /**
      Sundanese. Since 1.20.1
  */
  Sundanese = 70,

  /**
      Saurashtra. Since 1.20.1
  */
  Saurashtra = 71,

  /**
      Cham. Since 1.20.1
  */
  Cham = 72,

  /**
      Ol Chiki. Since 1.20.1
  */
  OlChiki = 73,

  /**
      Vai. Since 1.20.1
  */
  Vai = 74,

  /**
      Carian. Since 1.20.1
  */
  Carian = 75,

  /**
      Lycian. Since 1.20.1
  */
  Lycian = 76,

  /**
      Lydian. Since 1.20.1
  */
  Lydian = 77,

  /**
      Batak. Since 1.32
  */
  Batak = 78,

  /**
      Brahmi. Since 1.32
  */
  Brahmi = 79,

  /**
      Mandaic. Since 1.32
  */
  Mandaic = 80,

  /**
      Chakma. Since: 1.32
  */
  Chakma = 81,

  /**
      Meroitic Cursive. Since: 1.32
  */
  MeroiticCursive = 82,

  /**
      Meroitic Hieroglyphs. Since: 1.32
  */
  MeroiticHieroglyphs = 83,

  /**
      Miao. Since: 1.32
  */
  Miao = 84,

  /**
      Sharada. Since: 1.32
  */
  Sharada = 85,

  /**
      Sora Sompeng. Since: 1.32
  */
  SoraSompeng = 86,

  /**
      Takri. Since: 1.32
  */
  Takri = 87,

  /**
      Bassa. Since: 1.40
  */
  BassaVah = 88,

  /**
      Caucasian Albanian. Since: 1.40
  */
  CaucasianAlbanian = 89,

  /**
      Duployan. Since: 1.40
  */
  Duployan = 90,

  /**
      Elbasan. Since: 1.40
  */
  Elbasan = 91,

  /**
      Grantha. Since: 1.40
  */
  Grantha = 92,

  /**
      Kjohki. Since: 1.40
  */
  Khojki = 93,

  /**
      Khudawadi, Sindhi. Since: 1.40
  */
  Khudawadi = 94,

  /**
      Linear A. Since: 1.40
  */
  LinearA = 95,

  /**
      Mahajani. Since: 1.40
  */
  Mahajani = 96,

  /**
      Manichaean. Since: 1.40
  */
  Manichaean = 97,

  /**
      Mende Kikakui. Since: 1.40
  */
  MendeKikakui = 98,

  /**
      Modi. Since: 1.40
  */
  Modi = 99,

  /**
      Mro. Since: 1.40
  */
  Mro = 100,

  /**
      Nabataean. Since: 1.40
  */
  Nabataean = 101,

  /**
      Old North Arabian. Since: 1.40
  */
  OldNorthArabian = 102,

  /**
      Old Permic. Since: 1.40
  */
  OldPermic = 103,

  /**
      Pahawh Hmong. Since: 1.40
  */
  PahawhHmong = 104,

  /**
      Palmyrene. Since: 1.40
  */
  Palmyrene = 105,

  /**
      Pau Cin Hau. Since: 1.40
  */
  PauCinHau = 106,

  /**
      Psalter Pahlavi. Since: 1.40
  */
  PsalterPahlavi = 107,

  /**
      Siddham. Since: 1.40
  */
  Siddham = 108,

  /**
      Tirhuta. Since: 1.40
  */
  Tirhuta = 109,

  /**
      Warang Citi. Since: 1.40
  */
  WarangCiti = 110,

  /**
      Ahom. Since: 1.40
  */
  Ahom = 111,

  /**
      Anatolian Hieroglyphs. Since: 1.40
  */
  AnatolianHieroglyphs = 112,

  /**
      Hatran. Since: 1.40
  */
  Hatran = 113,

  /**
      Multani. Since: 1.40
  */
  Multani = 114,

  /**
      Old Hungarian. Since: 1.40
  */
  OldHungarian = 115,

  /**
      Signwriting. Since: 1.40
  */
  Signwriting = 116,
}

/**
    Flags influencing the shaping process.
  
  [pango.types.ShapeFlags] can be passed to `func@Pango.shape_with_flags`.
*/
enum ShapeFlags : uint
{
  /**
      Default value
  */
  None = 0,

  /**
      Round glyph positions and widths to whole device units
      This option should be set if the target renderer can't do subpixel positioning of glyphs
  */
  RoundPositions = 1,
}

/**
    These flags affect how Pango treats characters that are normally
  not visible in the output.
*/
enum ShowFlags : uint
{
  /**
      No special treatment for invisible characters
  */
  None = 0,

  /**
      Render spaces, tabs and newlines visibly
  */
  Spaces = 1,

  /**
      Render line breaks visibly
  */
  LineBreaks = 2,

  /**
      Render default-ignorable Unicode
      characters visibly
  */
  Ignorables = 4,
}

/**
    An enumeration specifying the width of the font relative to other designs
  within a family.
*/
enum Stretch
{
  /**
      ultra condensed width
  */
  UltraCondensed = 0,

  /**
      extra condensed width
  */
  ExtraCondensed = 1,

  /**
      condensed width
  */
  Condensed = 2,

  /**
      semi condensed width
  */
  SemiCondensed = 3,

  /**
      the normal width
  */
  Normal = 4,

  /**
      semi expanded width
  */
  SemiExpanded = 5,

  /**
      expanded width
  */
  Expanded = 6,

  /**
      extra expanded width
  */
  ExtraExpanded = 7,

  /**
      ultra expanded width
  */
  UltraExpanded = 8,
}

/**
    An enumeration specifying the various slant styles possible for a font.
*/
enum Style
{
  /**
      the font is upright.
  */
  Normal = 0,

  /**
      the font is slanted, but in a roman style.
  */
  Oblique = 1,

  /**
      the font is slanted in an italic style.
  */
  Italic = 2,
}

/**
    [pango.types.TabAlign] specifies where the text appears relative to the tab stop
  position.
*/
enum TabAlign
{
  /**
      the text appears to the right of the tab stop position
  */
  Left = 0,

  /**
      the text appears to the left of the tab stop position
      until the available space is filled. Since: 1.50
  */
  Right = 1,

  /**
      the text is centered at the tab stop position
      until the available space is filled. Since: 1.50
  */
  Center = 2,

  /**
      text before the first occurrence of the decimal point
      character appears to the left of the tab stop position (until the available
      space is filled), the rest to the right. Since: 1.50
  */
  Decimal = 3,
}

/**
    An enumeration that affects how Pango treats characters during shaping.
*/
enum TextTransform
{
  /**
      Leave text unchanged
  */
  None = 0,

  /**
      Display letters and numbers as lowercase
  */
  Lowercase = 1,

  /**
      Display letters and numbers as uppercase
  */
  Uppercase = 2,

  /**
      Display the first character of a word
      in titlecase
  */
  Capitalize = 3,
}

/**
    The [pango.types.Underline] enumeration is used to specify whether text
  should be underlined, and if so, the type of underlining.
*/
enum Underline
{
  /**
      no underline should be drawn
  */
  None = 0,

  /**
      a single underline should be drawn
  */
  Single = 1,

  /**
      a double underline should be drawn
  */
  Double = 2,

  /**
      a single underline should be drawn at a
      position beneath the ink extents of the text being
      underlined. This should be used only for underlining
      single characters, such as for keyboard accelerators.
      [pango.types.Underline.Single] should be used for extended
      portions of text.
  */
  Low = 3,

  /**
      an underline indicating an error should
      be drawn below. The exact style of rendering is up to the
      [pango.renderer.Renderer] in use, but typical styles include wavy
      or dotted lines.
      This underline is typically used to indicate an error such
      as a possible mispelling; in some cases a contrasting color
      may automatically be used. This type of underlining is
      available since Pango 1.4.
  */
  Error = 4,

  /**
      Like @PANGO_UNDERLINE_SINGLE, but
      drawn continuously across multiple runs. This type
      of underlining is available since Pango 1.46.
  */
  SingleLine = 5,

  /**
      Like @PANGO_UNDERLINE_DOUBLE, but
      drawn continuously across multiple runs. This type
      of underlining is available since Pango 1.46.
  */
  DoubleLine = 6,

  /**
      Like @PANGO_UNDERLINE_ERROR, but
      drawn continuously across multiple runs. This type
      of underlining is available since Pango 1.46.
  */
  ErrorLine = 7,
}

/**
    An enumeration specifying capitalization variant of the font.
*/
enum Variant
{
  /**
      A normal font.
  */
  Normal = 0,

  /**
      A font with the lower case characters
      replaced by smaller variants of the capital characters.
  */
  SmallCaps = 1,

  /**
      A font with all characters
      replaced by smaller variants of the capital characters. Since: 1.50
  */
  AllSmallCaps = 2,

  /**
      A font with the lower case characters
      replaced by smaller variants of the capital characters.
      Petite Caps can be even smaller than Small Caps. Since: 1.50
  */
  PetiteCaps = 3,

  /**
      A font with all characters
      replaced by smaller variants of the capital characters.
      Petite Caps can be even smaller than Small Caps. Since: 1.50
  */
  AllPetiteCaps = 4,

  /**
      A font with the upper case characters
      replaced by smaller variants of the capital letters. Since: 1.50
  */
  Unicase = 5,

  /**
      A font with capital letters that
      are more suitable for all-uppercase titles. Since: 1.50
  */
  TitleCaps = 6,
}

/**
    An enumeration specifying the weight (boldness) of a font.
  
  Weight is specified as a numeric value ranging from 100 to 1000.
  This enumeration simply provides some common, predefined values.
*/
enum Weight
{
  /**
      the thin weight (= 100) Since: 1.24
  */
  Thin = 100,

  /**
      the ultralight weight (= 200)
  */
  Ultralight = 200,

  /**
      the light weight (= 300)
  */
  Light = 300,

  /**
      the semilight weight (= 350) Since: 1.36.7
  */
  Semilight = 350,

  /**
      the book weight (= 380) Since: 1.24)
  */
  Book = 380,

  /**
      the default weight (= 400)
  */
  Normal = 400,

  /**
      the medium weight (= 500) Since: 1.24
  */
  Medium = 500,

  /**
      the semibold weight (= 600)
  */
  Semibold = 600,

  /**
      the bold weight (= 700)
  */
  Bold = 700,

  /**
      the ultrabold weight (= 800)
  */
  Ultrabold = 800,

  /**
      the heavy weight (= 900)
  */
  Heavy = 900,

  /**
      the ultraheavy weight (= 1000) Since: 1.24
  */
  Ultraheavy = 1000,
}

/**
    [pango.types.WrapMode] describes how to wrap the lines of a [pango.layout.Layout]
  to the desired width.
  
  For @PANGO_WRAP_WORD, Pango uses break opportunities that are determined
  by the Unicode line breaking algorithm. For @PANGO_WRAP_CHAR, Pango allows
  breaking at grapheme boundaries that are determined by the Unicode text
  segmentation algorithm.
*/
enum WrapMode
{
  /**
      wrap lines at word boundaries.
  */
  Word = 0,

  /**
      wrap lines at character boundaries.
  */
  Char = 1,

  /**
      wrap lines at word boundaries, but fall back to
      character boundaries if there is not enough space for a full word.
  */
  WordChar = 2,
}

/**
    Whether the segment should be shifted to center around the baseline.
  
  This is mainly used in vertical writing directions.
*/
enum ANALYSIS_FLAG_CENTERED_BASELINE = 1;

/**
    Whether this run holds ellipsized text.
*/
enum ANALYSIS_FLAG_IS_ELLIPSIS = 2;

/**
    Whether to add a hyphen at the end of the run during shaping.
*/
enum ANALYSIS_FLAG_NEED_HYPHEN = 4;

/**
    Value for @start_index in [pango.attribute.Attribute] that indicates
  the beginning of the text.
*/
enum ATTR_INDEX_FROM_TEXT_BEGINNING = 0;

/**
    Value for @end_index in [pango.attribute.Attribute] that indicates
  the end of the text.
*/
enum ATTR_INDEX_TO_TEXT_END = 4294967295;

/**
    A [pango.types.GLYPH_UNKNOWN_FLAG] value that indicates a zero-width empty glpyh.
  
  This is useful for example in shaper modules, to use as the glyph for
  various zero-width Unicode characters (those passing `func@is_zero_width`).
*/
enum GLYPH_EMPTY = 268435455;

/**
    A [pango.types.GLYPH_UNKNOWN_FLAG] value for invalid input.
  
  [pango.layout.Layout] produces one such glyph per invalid input UTF-8 byte and such
  a glyph is rendered as a crossed box.
  
  Note that this value is defined such that it has the `PANGO_GLYPH_UNKNOWN_FLAG`
  set.
*/
enum GLYPH_INVALID_INPUT = 4294967295;

/**
    Flag used in [pango.types.GLYPH_UNKNOWN_FLAG] to turn a `gunichar` value of a valid Unicode
  character into an unknown-character glyph for that `gunichar`.
  
  Such unknown-character glyphs may be rendered as a 'hex box'.
*/
enum GLYPH_UNKNOWN_FLAG = 268435456;

/**
    The scale between dimensions used for Pango distances and device units.
  
  The definition of device units is dependent on the output device; it will
  typically be pixels for a screen, and points for a printer. `PANGO_SCALE` is
  currently 1024, but this may be changed in the future.
  
  When setting font sizes, device units are always considered to be
  points (as in "12 point font"), rather than pixels.
*/
enum SCALE = 1024;

/**
    The major component of the version of Pango available at compile-time.
*/
enum VERSION_MAJOR = 1;

/**
    The micro component of the version of Pango available at compile-time.
*/
enum VERSION_MICRO = 1;

/**
    The minor component of the version of Pango available at compile-time.
*/
enum VERSION_MINOR = 52;

/**
    A string literal containing the version of Pango available at compile-time.
*/
enum VERSION_STRING = "1.52.1";
