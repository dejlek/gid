module harfbuzz.c.types;

public import gid.basictypes;
public import gobject.c.types;
public import freetype2.c.types;

/**
    Data type for booleans.
*/
alias hb_bool_t = int;

/**
    Data type for holding Unicode codepoints. Also
  used to hold glyph IDs.
*/
alias hb_codepoint_t = uint;

/**
    Data type for holding color values. Colors are eight bits per
  channel RGB plus alpha transparency.
*/
alias hb_color_t = uint;

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  
  This method should retrieve the extents for a font, for horizontal-direction
  text segments. Extents must be returned in an #hb_glyph_extents output
  parameter.
*/
alias hb_font_get_font_h_extents_func_t = hb_font_get_font_extents_func_t;

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  
  This method should retrieve the extents for a font, for vertical-direction
  text segments. Extents must be returned in an #hb_glyph_extents output
  parameter.
*/
alias hb_font_get_font_v_extents_func_t = hb_font_get_font_extents_func_t;

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  
  This method should retrieve the advance for a specified glyph, in
  horizontal-direction text segments. Advances must be returned in
  an #hb_position_t output parameter.
*/
alias hb_font_get_glyph_h_advance_func_t = hb_font_get_glyph_advance_func_t;

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  
  This method should retrieve the advances for a sequence of glyphs, in
  horizontal-direction text segments.
*/
alias hb_font_get_glyph_h_advances_func_t = hb_font_get_glyph_advances_func_t;

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  
  This method should retrieve the kerning-adjustment value for a glyph-pair in
  the specified font, for horizontal text segments.
*/
alias hb_font_get_glyph_h_kerning_func_t = hb_font_get_glyph_kerning_func_t;

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  
  This method should retrieve the (X,Y) coordinates (in font units) of the
  origin for a glyph, for horizontal-direction text segments. Each
  coordinate must be returned in an #hb_position_t output parameter.
*/
alias hb_font_get_glyph_h_origin_func_t = hb_font_get_glyph_origin_func_t;

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  
  This method should retrieve the advance for a specified glyph, in
  vertical-direction text segments. Advances must be returned in
  an #hb_position_t output parameter.
*/
alias hb_font_get_glyph_v_advance_func_t = hb_font_get_glyph_advance_func_t;

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  
  This method should retrieve the advances for a sequence of glyphs, in
  vertical-direction text segments.
*/
alias hb_font_get_glyph_v_advances_func_t = hb_font_get_glyph_advances_func_t;

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  
  This method should retrieve the kerning-adjustment value for a glyph-pair in
  the specified font, for vertical text segments.
*/
alias hb_font_get_glyph_v_kerning_func_t = hb_font_get_glyph_kerning_func_t;

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  
  This method should retrieve the (X,Y) coordinates (in font units) of the
  origin for a glyph, for vertical-direction text segments. Each coordinate
  must be returned in an #hb_position_t output parameter.
*/
alias hb_font_get_glyph_v_origin_func_t = hb_font_get_glyph_origin_func_t;

/**
    Data type for bitmasks.
*/
alias hb_mask_t = uint;

/**
    An integral type representing an OpenType 'name' table name identifier.
  There are predefined name IDs, as well as name IDs return from other
  API.  These can be used to fetch name strings from a font face.
*/
alias hb_ot_name_id_t = uint;

/**
    Data type for holding a single coordinate value.
  Contour points and other multi-dimensional data are
  stored as tuples of #hb_position_t's.
*/
alias hb_position_t = int;

/**
    Data type for tag identifiers. Tags are four
  byte integers, each byte representing a character.
  
  Tags are used to identify tables, design-variation axes,
  scripts, languages, font features, and baselines with
  human-readable names.
*/
alias hb_tag_t = uint;

/**
    The selectors defined for specifying AAT feature settings.
*/
enum hb_aat_layout_feature_selector_t
{
  /**
      Initial, unset feature selector
  */
  invalid = 65535,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ALL_TYPOGRAPHIC
  */
  allTypeFeaturesOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ALL_TYPOGRAPHIC
  */
  allTypeFeaturesOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  requiredLigaturesOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  requiredLigaturesOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  commonLigaturesOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  commonLigaturesOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  rareLigaturesOn = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  rareLigaturesOff = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  logosOn = 6,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  logosOff = 7,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  rebusPicturesOn = 8,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  rebusPicturesOff = 9,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  diphthongLigaturesOn = 10,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  diphthongLigaturesOff = 11,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  squaredLigaturesOn = 12,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  squaredLigaturesOff = 13,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  abbrevSquaredLigaturesOn = 14,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  abbrevSquaredLigaturesOff = 15,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  symbolLigaturesOn = 16,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  symbolLigaturesOff = 17,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  contextualLigaturesOn = 18,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  contextualLigaturesOff = 19,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  historicalLigaturesOn = 20,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  historicalLigaturesOff = 21,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  unconnected = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  partiallyConnected = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  cursive = 2,

  /**
      Deprecated
  */
  upperAndLowerCase = 0,

  /**
      Deprecated
  */
  allCaps = 1,

  /**
      Deprecated
  */
  allLowerCase = 2,

  /**
      Deprecated
  */
  smallCaps = 3,

  /**
      Deprecated
  */
  initialCaps = 4,

  /**
      Deprecated
  */
  initialCapsAndSmallCaps = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_SUBSTITUTION
  */
  substituteVerticalFormsOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_SUBSTITUTION
  */
  substituteVerticalFormsOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LINGUISTIC_REARRANGEMENT
  */
  linguisticRearrangementOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LINGUISTIC_REARRANGEMENT
  */
  linguisticRearrangementOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_SPACING
  */
  monospacedNumbers = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_SPACING
  */
  proportionalNumbers = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_SPACING
  */
  thirdWidthNumbers = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_SPACING
  */
  quarterWidthNumbers = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
  */
  wordInitialSwashesOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
  */
  wordInitialSwashesOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
  */
  wordFinalSwashesOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
  */
  wordFinalSwashesOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
  */
  lineInitialSwashesOn = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
  */
  lineInitialSwashesOff = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
  */
  lineFinalSwashesOn = 6,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
  */
  lineFinalSwashesOff = 7,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
  */
  nonFinalSwashesOn = 8,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
  */
  nonFinalSwashesOff = 9,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_DIACRITICS_TYPE
  */
  showDiacritics = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_DIACRITICS_TYPE
  */
  hideDiacritics = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_DIACRITICS_TYPE
  */
  decomposeDiacritics = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION
  */
  normalPosition = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION
  */
  superiors = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION
  */
  inferiors = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION
  */
  ordinals = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION
  */
  scientificInferiors = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_FRACTIONS
  */
  noFractions = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_FRACTIONS
  */
  verticalFractions = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_FRACTIONS
  */
  diagonalFractions = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_OVERLAPPING_CHARACTERS_TYPE
  */
  preventOverlapOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_OVERLAPPING_CHARACTERS_TYPE
  */
  preventOverlapOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  hyphensToEmDashOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  hyphensToEmDashOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  hyphenToEnDashOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  hyphenToEnDashOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  slashedZeroOn = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  slashedZeroOff = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  formInterrobangOn = 6,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  formInterrobangOff = 7,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  smartQuotesOn = 8,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  smartQuotesOff = 9,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  periodsToEllipsisOn = 10,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  periodsToEllipsisOff = 11,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  hyphenToMinusOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  hyphenToMinusOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  asteriskToMultiplyOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  asteriskToMultiplyOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  slashToDivideOn = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  slashToDivideOff = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  inequalityLigaturesOn = 6,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  inequalityLigaturesOff = 7,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  exponentsOn = 8,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  exponentsOff = 9,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  mathematicalGreekOn = 10,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  mathematicalGreekOff = 11,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
  */
  noOrnaments = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
  */
  dingbats = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
  */
  piCharacters = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
  */
  fleurons = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
  */
  decorativeBorders = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
  */
  internationalSymbols = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
  */
  mathSymbols = 6,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_ALTERNATIVES
  */
  noAlternates = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE
  */
  designLevel1 = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE
  */
  designLevel2 = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE
  */
  designLevel3 = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE
  */
  designLevel4 = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE
  */
  designLevel5 = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS
  */
  noStyleOptions = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS
  */
  displayText = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS
  */
  engravedText = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS
  */
  illuminatedCaps = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS
  */
  titlingCaps = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS
  */
  tallCaps = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  traditionalCharacters = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  simplifiedCharacters = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  jis1978Characters = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  jis1983Characters = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  jis1990Characters = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  traditionalAltOne = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  traditionalAltTwo = 6,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  traditionalAltThree = 7,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  traditionalAltFour = 8,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  traditionalAltFive = 9,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  expertCharacters = 10,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  jis2004Characters = 11,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  hojoCharacters = 12,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  nlccharacters = 13,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  traditionalNamesCharacters = 14,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_CASE
  */
  lowerCaseNumbers = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_CASE
  */
  upperCaseNumbers = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
  */
  proportionalText = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
  */
  monospacedText = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
  */
  halfWidthText = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
  */
  thirdWidthText = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
  */
  quarterWidthText = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
  */
  altProportionalText = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
  */
  altHalfWidthText = 6,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
  */
  noTransliteration = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
  */
  hanjaToHangul = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
  */
  hiraganaToKatakana = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
  */
  katakanaToHiragana = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
  */
  kanaToRomanization = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
  */
  romanizationToHiragana = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
  */
  romanizationToKatakana = 6,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
  */
  hanjaToHangulAltOne = 7,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
  */
  hanjaToHangulAltTwo = 8,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
  */
  hanjaToHangulAltThree = 9,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  noAnnotation = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  boxAnnotation = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  roundedBoxAnnotation = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  circleAnnotation = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  invertedCircleAnnotation = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  parenthesisAnnotation = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  periodAnnotation = 6,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  romanNumeralAnnotation = 7,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  diamondAnnotation = 8,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  invertedBoxAnnotation = 9,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  invertedRoundedBoxAnnotation = 10,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_KANA_SPACING_TYPE
  */
  fullWidthKana = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_KANA_SPACING_TYPE
  */
  proportionalKana = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_SPACING_TYPE
  */
  fullWidthIdeographs = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_SPACING_TYPE
  */
  proportionalIdeographs = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_SPACING_TYPE
  */
  halfWidthIdeographs = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE
  */
  canonicalCompositionOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE
  */
  canonicalCompositionOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE
  */
  compatibilityCompositionOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE
  */
  compatibilityCompositionOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE
  */
  transcodingCompositionOn = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE
  */
  transcodingCompositionOff = 5,

  /**
      Deprecated; use #HB_AAT_LAYOUT_FEATURE_SELECTOR_RUBY_KANA_OFF instead
  */
  noRubyKana = 0,

  /**
      Deprecated; use #HB_AAT_LAYOUT_FEATURE_SELECTOR_RUBY_KANA_ON instead
  */
  rubyKana = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_RUBY_KANA
  */
  rubyKanaOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_RUBY_KANA
  */
  rubyKanaOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE
  */
  noCjkSymbolAlternatives = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE
  */
  cjkSymbolAltOne = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE
  */
  cjkSymbolAltTwo = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE
  */
  cjkSymbolAltThree = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE
  */
  cjkSymbolAltFour = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE
  */
  cjkSymbolAltFive = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE
  */
  noIdeographicAlternatives = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE
  */
  ideographicAltOne = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE
  */
  ideographicAltTwo = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE
  */
  ideographicAltThree = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE
  */
  ideographicAltFour = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE
  */
  ideographicAltFive = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_VERTICAL_ROMAN_PLACEMENT_TYPE
  */
  cjkVerticalRomanCentered = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_VERTICAL_ROMAN_PLACEMENT_TYPE
  */
  cjkVerticalRomanHbaseline = 1,

  /**
      Deprecated; use #HB_AAT_LAYOUT_FEATURE_SELECTOR_CJK_ITALIC_ROMAN_OFF instead
  */
  noCjkItalicRoman = 0,

  /**
      Deprecated; use #HB_AAT_LAYOUT_FEATURE_SELECTOR_CJK_ITALIC_ROMAN_ON instead
  */
  cjkItalicRoman = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ITALIC_CJK_ROMAN
  */
  cjkItalicRomanOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ITALIC_CJK_ROMAN
  */
  cjkItalicRomanOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CASE_SENSITIVE_LAYOUT
  */
  caseSensitiveLayoutOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CASE_SENSITIVE_LAYOUT
  */
  caseSensitiveLayoutOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CASE_SENSITIVE_LAYOUT
  */
  caseSensitiveSpacingOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CASE_SENSITIVE_LAYOUT
  */
  caseSensitiveSpacingOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ALTERNATE_KANA
  */
  alternateHorizKanaOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ALTERNATE_KANA
  */
  alternateHorizKanaOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ALTERNATE_KANA
  */
  alternateVertKanaOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ALTERNATE_KANA
  */
  alternateVertKanaOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  noStylisticAlternates = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltOneOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltOneOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltTwoOn = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltTwoOff = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltThreeOn = 6,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltThreeOff = 7,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltFourOn = 8,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltFourOff = 9,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltFiveOn = 10,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltFiveOff = 11,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltSixOn = 12,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltSixOff = 13,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltSevenOn = 14,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltSevenOff = 15,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltEightOn = 16,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltEightOff = 17,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltNineOn = 18,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltNineOff = 19,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltTenOn = 20,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltTenOff = 21,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltElevenOn = 22,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltElevenOff = 23,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltTwelveOn = 24,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltTwelveOff = 25,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltThirteenOn = 26,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltThirteenOff = 27,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltFourteenOn = 28,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltFourteenOff = 29,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltFifteenOn = 30,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltFifteenOff = 31,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltSixteenOn = 32,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltSixteenOff = 33,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltSeventeenOn = 34,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltSeventeenOff = 35,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltEighteenOn = 36,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltEighteenOff = 37,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltNineteenOn = 38,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltNineteenOff = 39,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltTwentyOn = 40,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  stylisticAltTwentyOff = 41,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES
  */
  contextualAlternatesOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES
  */
  contextualAlternatesOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES
  */
  swashAlternatesOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES
  */
  swashAlternatesOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES
  */
  contextualSwashAlternatesOn = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES
  */
  contextualSwashAlternatesOff = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LOWER_CASE
  */
  defaultLowerCase = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LOWER_CASE
  */
  lowerCaseSmallCaps = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LOWER_CASE
  */
  lowerCasePetiteCaps = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_UPPER_CASE
  */
  defaultUpperCase = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_UPPER_CASE
  */
  upperCaseSmallCaps = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_UPPER_CASE
  */
  upperCasePetiteCaps = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_ROMAN_SPACING_TYPE
  */
  halfWidthCjkRoman = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_ROMAN_SPACING_TYPE
  */
  proportionalCjkRoman = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_ROMAN_SPACING_TYPE
  */
  defaultCjkRoman = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_ROMAN_SPACING_TYPE
  */
  fullWidthCjkRoman = 3,
}

/**
    The possible feature types defined for AAT shaping, from Apple [Font Feature Registry](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html).
*/
enum hb_aat_layout_feature_type_t
{
  /**
      Initial, unset feature type
  */
  invalid = 65535,

  /**
      [All Typographic Features](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type0)
  */
  allTypographic = 0,

  /**
      [Ligatures](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type1)
  */
  ligatures = 1,

  /**
      [Cursive Connection](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type2)
  */
  cursiveConnection = 2,

  /**
      [Letter Case](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type3)
  */
  letterCase = 3,

  /**
      [Vertical Substitution](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type4)
  */
  verticalSubstitution = 4,

  /**
      [Linguistic Rearrangement](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type5)
  */
  linguisticRearrangement = 5,

  /**
      [Number Spacing](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type6)
  */
  numberSpacing = 6,

  /**
      [Smart Swash](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type8)
  */
  smartSwashType = 8,

  /**
      [Diacritics](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type9)
  */
  diacriticsType = 9,

  /**
      [Vertical Position](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type10)
  */
  verticalPosition = 10,

  /**
      [Fractions](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type11)
  */
  fractions = 11,

  /**
      [Overlapping Characters](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type13)
  */
  overlappingCharactersType = 13,

  /**
      [Typographic Extras](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type14)
  */
  typographicExtras = 14,

  /**
      [Mathematical Extras](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type15)
  */
  mathematicalExtras = 15,

  /**
      [Ornament Sets](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type16)
  */
  ornamentSetsType = 16,

  /**
      [Character Alternatives](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type17)
  */
  characterAlternatives = 17,

  /**
      [Design Complexity](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type18)
  */
  designComplexityType = 18,

  /**
      [Style Options](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type19)
  */
  styleOptions = 19,

  /**
      [Character Shape](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type20)
  */
  characterShape = 20,

  /**
      [Number Case](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type21)
  */
  numberCase = 21,

  /**
      [Text Spacing](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type22)
  */
  textSpacing = 22,

  /**
      [Transliteration](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type23)
  */
  transliteration = 23,

  /**
      [Annotation](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type24)
  */
  annotationType = 24,

  /**
      [Kana Spacing](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type25)
  */
  kanaSpacingType = 25,

  /**
      [Ideographic Spacing](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type26)
  */
  ideographicSpacingType = 26,

  /**
      [Unicode Decomposition](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type27)
  */
  unicodeDecompositionType = 27,

  /**
      [Ruby Kana](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type28)
  */
  rubyKana = 28,

  /**
      [CJK Symbol Alternatives](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type29)
  */
  cjkSymbolAlternativesType = 29,

  /**
      [Ideographic Alternatives](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type30)
  */
  ideographicAlternativesType = 30,

  /**
      [CJK Vertical Roman Placement](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type31)
  */
  cjkVerticalRomanPlacementType = 31,

  /**
      [Italic CJK Roman](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type32)
  */
  italicCjkRoman = 32,

  /**
      [Case Sensitive Layout](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type33)
  */
  caseSensitiveLayout = 33,

  /**
      [Alternate Kana](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type34)
  */
  alternateKana = 34,

  /**
      [Stylistic Alternatives](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type35)
  */
  stylisticAlternatives = 35,

  /**
      [Contextual Alternatives](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type36)
  */
  contextualAlternatives = 36,

  /**
      [Lower Case](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type37)
  */
  lowerCase = 37,

  /**
      [Upper Case](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type38)
  */
  upperCase = 38,

  /**
      [Language Tag](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type39)
  */
  languageTagType = 39,

  /**
      [CJK Roman Spacing](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type103)
  */
  cjkRomanSpacingType = 103,
}

/**
    Data type for holding HarfBuzz's clustering behavior options. The cluster level
  dictates one aspect of how HarfBuzz will treat non-base characters
  during shaping.
  
  In @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES, non-base
  characters are merged into the cluster of the base character that precedes them.
  
  In @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_CHARACTERS, non-base characters are initially
  assigned their own cluster values, which are not merged into preceding base
  clusters. This allows HarfBuzz to perform additional operations like reorder
  sequences of adjacent marks.
  
  @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES is the default, because it maintains
  backward compatibility with older versions of HarfBuzz. New client programs that
  do not need to maintain such backward compatibility are recommended to use
  @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_CHARACTERS instead of the default.
*/
enum hb_buffer_cluster_level_t
{
  /**
      Return cluster values grouped by graphemes into
      monotone order.
  */
  monotoneGraphemes = 0,

  /**
      Return cluster values grouped into monotone order.
  */
  monotoneCharacters = 1,

  /**
      Don't group cluster values.
  */
  characters = 2,

  /**
      Default cluster level,
      equal to @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES.
  */
  default_ = 0,
}

/**
    The type of #hb_buffer_t contents.
*/
enum hb_buffer_content_type_t
{
  /**
      Initial value for new buffer.
  */
  invalid = 0,

  /**
      The buffer contains input characters (before shaping).
  */
  unicode = 1,

  /**
      The buffer contains output glyphs (after shaping).
  */
  glyphs = 2,
}

/**
    Flags from comparing two #hb_buffer_t's.
  
  Buffer with different #hb_buffer_content_type_t cannot be meaningfully
  compared in any further detail.
  
  For buffers with differing length, the per-glyph comparison is not
  attempted, though we do still scan reference buffer for dotted circle and
  `.notdef` glyphs.
  
  If the buffers have the same length, we compare them glyph-by-glyph and
  report which aspect(s) of the glyph info/position are different.
*/
enum hb_buffer_diff_flags_t : uint
{
  /**
      equal buffers.
  */
  equal = 0,

  /**
      buffers with different
        #hb_buffer_content_type_t.
  */
  contentTypeMismatch = 1,

  /**
      buffers with differing length.
  */
  lengthMismatch = 2,

  /**
      `.notdef` glyph is present in the
        reference buffer.
  */
  notdefPresent = 4,

  /**
      dotted circle glyph is present
        in the reference buffer.
  */
  dottedCirclePresent = 8,

  /**
      difference in #hb_glyph_info_t.codepoint
  */
  codepointMismatch = 16,

  /**
      difference in #hb_glyph_info_t.cluster
  */
  clusterMismatch = 32,

  /**
      difference in #hb_glyph_flags_t.
  */
  glyphFlagsMismatch = 64,

  /**
      difference in #hb_glyph_position_t.
  */
  positionMismatch = 128,
}

/**
    Flags for #hb_buffer_t.
*/
enum hb_buffer_flags_t : uint
{
  /**
      the default buffer flag.
  */
  default_ = 0,

  /**
      flag indicating that special handling of the beginning
                         of text paragraph can be applied to this buffer. Should usually
                         be set, unless you are passing to the buffer only part
                         of the text without the full context.
  */
  bot = 1,

  /**
      flag indicating that special handling of the end of text
                         paragraph can be applied to this buffer, similar to
                         @HB_BUFFER_FLAG_BOT.
  */
  eot = 2,

  /**
      flag indication that character with Default_Ignorable
                         Unicode property should use the corresponding glyph
                         from the font, instead of hiding them (done by
                         replacing them with the space glyph and zeroing the
                         advance width.)  This flag takes precedence over
                         @HB_BUFFER_FLAG_REMOVE_DEFAULT_IGNORABLES.
  */
  preserveDefaultIgnorables = 4,

  /**
      flag indication that character with Default_Ignorable
                         Unicode property should be removed from glyph string
                         instead of hiding them (done by replacing them with the
                         space glyph and zeroing the advance width.)
                         @HB_BUFFER_FLAG_PRESERVE_DEFAULT_IGNORABLES takes
                         precedence over this flag. Since: 1.8.0
  */
  removeDefaultIgnorables = 8,

  /**
      flag indicating that a dotted circle should
                         not be inserted in the rendering of incorrect
                         character sequences (such at <0905 093E>). Since: 2.4.0
  */
  doNotInsertDottedCircle = 16,

  /**
      flag indicating that the [harfbuzz.global.shape] call and its variants
                         should perform various verification processes on the results
                         of the shaping operation on the buffer.  If the verification
                         fails, then either a buffer message is sent, if a message
                         handler is installed on the buffer, or a message is written
                         to standard error.  In either case, the shaping result might
                         be modified to show the failed output. Since: 3.4.0
  */
  verify = 32,

  /**
      flag indicating that the @HB_GLYPH_FLAG_UNSAFE_TO_CONCAT
                         glyph-flag should be produced by the shaper. By default
                         it will not be produced since it incurs a cost. Since: 4.0.0
  */
  produceUnsafeToConcat = 64,

  /**
      flag indicating that the @HB_GLYPH_FLAG_SAFE_TO_INSERT_TATWEEL
                         glyph-flag should be produced by the shaper. By default
                         it will not be produced. Since: 5.1.0
  */
  produceSafeToInsertTatweel = 128,

  /**
      All currently defined flags: Since: 4.4.0
  */
  defined = 255,
}

/**
    Flags that control what glyph information are serialized in [harfbuzz.global.bufferSerializeGlyphs].
*/
enum hb_buffer_serialize_flags_t : uint
{
  /**
      serialize glyph names, clusters and positions.
  */
  default_ = 0,

  /**
      do not serialize glyph cluster.
  */
  noClusters = 1,

  /**
      do not serialize glyph position information.
  */
  noPositions = 2,

  /**
      do no serialize glyph name.
  */
  noGlyphNames = 4,

  /**
      serialize glyph extents.
  */
  glyphExtents = 8,

  /**
      serialize glyph flags. Since: 1.5.0
  */
  glyphFlags = 16,

  /**
      do not serialize glyph advances,
     glyph offsets will reflect absolute glyph positions. Since: 1.8.0
  */
  noAdvances = 32,

  /**
      All currently defined flags. Since: 4.4.0
  */
  defined = 63,
}

/**
    The buffer serialization and de-serialization format used in
  [harfbuzz.global.bufferSerializeGlyphs] and [harfbuzz.global.bufferDeserializeGlyphs].
*/
enum hb_buffer_serialize_format_t
{
  /**
      a human-readable, plain text format.
  */
  text = 1413830740,

  /**
      a machine-readable JSON format.
  */
  json = 1246973774,

  /**
      invalid format.
  */
  invalid = 0,
}

/**
    The direction of a text segment or buffer.
  
  A segment can also be tested for horizontal or vertical
  orientation (irrespective of specific direction) with
  HB_DIRECTION_IS_HORIZONTAL() or HB_DIRECTION_IS_VERTICAL().
*/
enum hb_direction_t
{
  /**
      Initial, unset direction.
  */
  invalid = 0,

  /**
      Text is set horizontally from left to right.
  */
  ltr = 4,

  /**
      Text is set horizontally from right to left.
  */
  rtl = 5,

  /**
      Text is set vertically from top to bottom.
  */
  ttb = 6,

  /**
      Text is set vertically from bottom to top.
  */
  btt = 7,
}

/**
    Flags for #hb_glyph_info_t.
*/
enum hb_glyph_flags_t : uint
{
  /**
      Indicates that if input text is broken at the
    				   beginning of the cluster this glyph is part of,
    				   then both sides need to be re-shaped, as the
    				   result might be different.
    				   On the flip side, it means that when this
    				   flag is not present, then it is safe to break
    				   the glyph-run at the beginning of this
    				   cluster, and the two sides will represent the
    				   exact same result one would get if breaking
    				   input text at the beginning of this cluster
    				   and shaping the two sides separately.
    				   This can be used to optimize paragraph
    				   layout, by avoiding re-shaping of each line
    				   after line-breaking.
  */
  unsafeToBreak = 1,

  /**
      Indicates that if input text is changed on one
    				   side of the beginning of the cluster this glyph
    				   is part of, then the shaping results for the
    				   other side might change.
    				   Note that the absence of this flag will NOT by
    				   itself mean that it IS safe to concat text.
    				   Only two pieces of text both of which clear of
    				   this flag can be concatenated safely.
    				   This can be used to optimize paragraph
    				   layout, by avoiding re-shaping of each line
    				   after line-breaking, by limiting the
    				   reshaping to a small piece around the
    				   breaking position only, even if the breaking
    				   position carries the
    				   #HB_GLYPH_FLAG_UNSAFE_TO_BREAK or when
    				   hyphenation or other text transformation
    				   happens at line-break position, in the following
    				   way:
    				   1. Iterate back from the line-break position
    				   until the first cluster start position that is
    				   NOT unsafe-to-concat, 2. shape the segment from
    				   there till the end of line, 3. check whether the
    				   resulting glyph-run also is clear of the
    				   unsafe-to-concat at its start-of-text position;
    				   if it is, just splice it into place and the line
    				   is shaped; If not, move on to a position further
    				   back that is clear of unsafe-to-concat and retry
    				   from there, and repeat.
    				   At the start of next line a similar algorithm can
    				   be implemented. That is: 1. Iterate forward from
    				   the line-break position until the first cluster
    				   start position that is NOT unsafe-to-concat, 2.
    				   shape the segment from beginning of the line to
    				   that position, 3. check whether the resulting
    				   glyph-run also is clear of the unsafe-to-concat
    				   at its end-of-text position; if it is, just splice
    				   it into place and the beginning is shaped; If not,
    				   move on to a position further forward that is clear
    				   of unsafe-to-concat and retry up to there, and repeat.
    				   A slight complication will arise in the
    				   implementation of the algorithm above,
    				   because while our buffer API has a way to
    				   return flags for position corresponding to
    				   start-of-text, there is currently no position
    				   corresponding to end-of-text.  This limitation
    				   can be alleviated by shaping more text than needed
    				   and looking for unsafe-to-concat flag within text
    				   clusters.
    				   The #HB_GLYPH_FLAG_UNSAFE_TO_BREAK flag will
    				   always imply this flag.
    			   To use this flag, you must enable the buffer flag
    			   @HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CONCAT during
    			   shaping, otherwise the buffer flag will not be
    			   reliably produced.
    				   Since: 4.0.0
  */
  unsafeToConcat = 2,

  /**
      In scripts that use elongation (Arabic,
    				   Mongolian, Syriac, etc.), this flag signifies
    				   that it is safe to insert a U+0640 TATWEEL
    				   character before this cluster for elongation.
    				   This flag does not determine the
    				   script-specific elongation places, but only
    				   when it is safe to do the elongation without
    				   interrupting text shaping.
    				   Since: 5.1.0
  */
  safeToInsertTatweel = 4,

  /**
      All the currently defined flags.
  */
  defined = 7,
}

/**
    Data type holding the memory modes available to
  client programs.
  
  Regarding these various memory-modes:
  
  $(LIST
    * In no case shall the HarfBuzz client modify memory
      that is passed to HarfBuzz in a blob.  If there is
      any such possibility, @HB_MEMORY_MODE_DUPLICATE should be used
      such that HarfBuzz makes a copy immediately,
    
    * Use @HB_MEMORY_MODE_READONLY otherwise, unless you really really
      really know what you are doing,
    
    * @HB_MEMORY_MODE_WRITABLE is appropriate if you really made a
      copy of data solely for the purpose of passing to
      HarfBuzz and doing that just once (no reuse!),
    
    * If the font is mmap()ed, it's okay to use
      @HB_MEMORY_MODE_READONLY_MAY_MAKE_WRITABLE, however, using that mode
      correctly is very tricky.  Use @HB_MEMORY_MODE_READONLY instead.
  )
*/
enum hb_memory_mode_t
{
  /**
      HarfBuzz immediately makes a copy of the data.
  */
  duplicate = 0,

  /**
      HarfBuzz client will never modify the data,
        and HarfBuzz will never modify the data.
  */
  readonly = 1,

  /**
      HarfBuzz client made a copy of the data solely
        for HarfBuzz, so HarfBuzz may modify the data.
  */
  writable = 2,

  /**
      See above
  */
  readonlyMayMakeWritable = 3,
}

/**
    Flags that describe the properties of color palette.
*/
enum hb_ot_color_palette_flags_t : uint
{
  /**
      Default indicating that there is nothing special
      to note about a color palette.
  */
  default_ = 0,

  /**
      Flag indicating that the color
      palette is appropriate to use when displaying the font on a light background such as white.
  */
  usableWithLightBackground = 1,

  /**
      Flag indicating that the color
      palette is appropriate to use when displaying the font on a dark background such as black.
  */
  usableWithDarkBackground = 2,
}

/**
    Baseline tags from [Baseline Tags](https://docs.microsoft.com/en-us/typography/opentype/spec/baselinetags) registry.
*/
enum hb_ot_layout_baseline_tag_t
{
  /**
      The baseline used by alphabetic scripts such as Latin, Cyrillic and Greek.
    In vertical writing mode, the alphabetic baseline for characters rotated 90 degrees clockwise.
    (This would not apply to alphabetic characters that remain upright in vertical writing mode, since these
    characters are not rotated.)
  */
  roman = 1919905134,

  /**
      The hanging baseline. In horizontal direction, this is the horizontal
    line from which syllables seem, to hang in Tibetan and other similar scripts. In vertical writing mode,
    for Tibetan (or some other similar script) characters rotated 90 degrees clockwise.
  */
  hanging = 1751215719,

  /**
      Ideographic character face bottom or left edge,
    if the direction is horizontal or vertical, respectively.
  */
  ideoFaceBottomOrLeft = 1768121954,

  /**
      Ideographic character face top or right edge,
    if the direction is horizontal or vertical, respectively.
  */
  ideoFaceTopOrRight = 1768121972,

  /**
      The center of the ideographic character face. Since: 4.0.0
  */
  ideoFaceCentral = 1231251043,

  /**
      Ideographic em-box bottom or left edge,
    if the direction is horizontal or vertical, respectively.
  */
  ideoEmboxBottomOrLeft = 1768187247,

  /**
      Ideographic em-box top or right edge baseline,
  */
  ideoEmboxTopOrRight = 1768191088,

  /**
      The center of the ideographic em-box. Since: 4.0.0
    if the direction is horizontal or vertical, respectively.
  */
  ideoEmboxCentral = 1231315813,

  /**
      The baseline about which mathematical characters are centered.
    In vertical writing mode when mathematical characters rotated 90 degrees clockwise, are centered.
  */
  math = 1835103336,
}

/**
    The GDEF classes defined for glyphs.
*/
enum hb_ot_layout_glyph_class_t
{
  /**
      Glyphs not matching the other classifications
  */
  unclassified = 0,

  /**
      Spacing, single characters, capable of accepting marks
  */
  baseGlyph = 1,

  /**
      Glyphs that represent ligation of multiple characters
  */
  ligature = 2,

  /**
      Non-spacing, combining glyphs that represent marks
  */
  mark = 3,

  /**
      Spacing glyphs that represent part of a single character
  */
  component = 4,
}

/**
    The 'MATH' table constants, refer to
  [OpenType documentation](https://docs.microsoft.com/en-us/typography/opentype/spec/math#mathconstants-table)
  For more explanations.
*/
enum hb_ot_math_constant_t
{
  /**
      scriptPercentScaleDown
  */
  scriptPercentScaleDown = 0,

  /**
      scriptScriptPercentScaleDown
  */
  scriptScriptPercentScaleDown = 1,

  /**
      delimitedSubFormulaMinHeight
  */
  delimitedSubFormulaMinHeight = 2,

  /**
      displayOperatorMinHeight
  */
  displayOperatorMinHeight = 3,

  /**
      mathLeading
  */
  mathLeading = 4,

  /**
      axisHeight
  */
  axisHeight = 5,

  /**
      accentBaseHeight
  */
  accentBaseHeight = 6,

  /**
      flattenedAccentBaseHeight
  */
  flattenedAccentBaseHeight = 7,

  /**
      subscriptShiftDown
  */
  subscriptShiftDown = 8,

  /**
      subscriptTopMax
  */
  subscriptTopMax = 9,

  /**
      subscriptBaselineDropMin
  */
  subscriptBaselineDropMin = 10,

  /**
      superscriptShiftUp
  */
  superscriptShiftUp = 11,

  /**
      superscriptShiftUpCramped
  */
  superscriptShiftUpCramped = 12,

  /**
      superscriptBottomMin
  */
  superscriptBottomMin = 13,

  /**
      superscriptBaselineDropMax
  */
  superscriptBaselineDropMax = 14,

  /**
      subSuperscriptGapMin
  */
  subSuperscriptGapMin = 15,

  /**
      superscriptBottomMaxWithSubscript
  */
  superscriptBottomMaxWithSubscript = 16,

  /**
      spaceAfterScript
  */
  spaceAfterScript = 17,

  /**
      upperLimitGapMin
  */
  upperLimitGapMin = 18,

  /**
      upperLimitBaselineRiseMin
  */
  upperLimitBaselineRiseMin = 19,

  /**
      lowerLimitGapMin
  */
  lowerLimitGapMin = 20,

  /**
      lowerLimitBaselineDropMin
  */
  lowerLimitBaselineDropMin = 21,

  /**
      stackTopShiftUp
  */
  stackTopShiftUp = 22,

  /**
      stackTopDisplayStyleShiftUp
  */
  stackTopDisplayStyleShiftUp = 23,

  /**
      stackBottomShiftDown
  */
  stackBottomShiftDown = 24,

  /**
      stackBottomDisplayStyleShiftDown
  */
  stackBottomDisplayStyleShiftDown = 25,

  /**
      stackGapMin
  */
  stackGapMin = 26,

  /**
      stackDisplayStyleGapMin
  */
  stackDisplayStyleGapMin = 27,

  /**
      stretchStackTopShiftUp
  */
  stretchStackTopShiftUp = 28,

  /**
      stretchStackBottomShiftDown
  */
  stretchStackBottomShiftDown = 29,

  /**
      stretchStackGapAboveMin
  */
  stretchStackGapAboveMin = 30,

  /**
      stretchStackGapBelowMin
  */
  stretchStackGapBelowMin = 31,

  /**
      fractionNumeratorShiftUp
  */
  fractionNumeratorShiftUp = 32,

  /**
      fractionNumeratorDisplayStyleShiftUp
  */
  fractionNumeratorDisplayStyleShiftUp = 33,

  /**
      fractionDenominatorShiftDown
  */
  fractionDenominatorShiftDown = 34,

  /**
      fractionDenominatorDisplayStyleShiftDown
  */
  fractionDenominatorDisplayStyleShiftDown = 35,

  /**
      fractionNumeratorGapMin
  */
  fractionNumeratorGapMin = 36,

  /**
      fractionNumDisplayStyleGapMin
  */
  fractionNumDisplayStyleGapMin = 37,

  /**
      fractionRuleThickness
  */
  fractionRuleThickness = 38,

  /**
      fractionDenominatorGapMin
  */
  fractionDenominatorGapMin = 39,

  /**
      fractionDenomDisplayStyleGapMin
  */
  fractionDenomDisplayStyleGapMin = 40,

  /**
      skewedFractionHorizontalGap
  */
  skewedFractionHorizontalGap = 41,

  /**
      skewedFractionVerticalGap
  */
  skewedFractionVerticalGap = 42,

  /**
      overbarVerticalGap
  */
  overbarVerticalGap = 43,

  /**
      overbarRuleThickness
  */
  overbarRuleThickness = 44,

  /**
      overbarExtraAscender
  */
  overbarExtraAscender = 45,

  /**
      underbarVerticalGap
  */
  underbarVerticalGap = 46,

  /**
      underbarRuleThickness
  */
  underbarRuleThickness = 47,

  /**
      underbarExtraDescender
  */
  underbarExtraDescender = 48,

  /**
      radicalVerticalGap
  */
  radicalVerticalGap = 49,

  /**
      radicalDisplayStyleVerticalGap
  */
  radicalDisplayStyleVerticalGap = 50,

  /**
      radicalRuleThickness
  */
  radicalRuleThickness = 51,

  /**
      radicalExtraAscender
  */
  radicalExtraAscender = 52,

  /**
      radicalKernBeforeDegree
  */
  radicalKernBeforeDegree = 53,

  /**
      radicalKernAfterDegree
  */
  radicalKernAfterDegree = 54,

  /**
      radicalDegreeBottomRaisePercent
  */
  radicalDegreeBottomRaisePercent = 55,
}

/**
    Flags for math glyph parts.
*/
enum hb_ot_math_glyph_part_flags_t : uint
{
  /**
      This is an extender glyph part that
    can be repeated to reach the desired length.
  */
  extender = 1,
}

/**
    The math kerning-table types defined for the four corners
  of a glyph.
*/
enum hb_ot_math_kern_t
{
  /**
      The top right corner of the glyph.
  */
  topRight = 0,

  /**
      The top left corner of the glyph.
  */
  topLeft = 1,

  /**
      The bottom right corner of the glyph.
  */
  bottomRight = 2,

  /**
      The bottom left corner of the glyph.
  */
  bottomLeft = 3,
}

/**
    Known metadata tags from https://docs.microsoft.com/en-us/typography/opentype/spec/meta
*/
enum hb_ot_meta_tag_t
{
  /**
      Design languages. Text, using only
    Basic Latin (ASCII) characters. Indicates languages and/or scripts
    for the user audiences that the font was primarily designed for.
  */
  designLanguages = 1684827751,

  /**
      Supported languages. Text, using
    only Basic Latin (ASCII) characters. Indicates languages and/or scripts
    that the font is declared to be capable of supporting.
  */
  supportedLanguages = 1936485991,
}

/**
    Metric tags corresponding to [MVAR Value
  Tags](https://docs.microsoft.com/en-us/typography/opentype/spec/mvar#value-tags)
*/
enum hb_ot_metrics_tag_t
{
  /**
      horizontal ascender.
  */
  horizontalAscender = 1751216995,

  /**
      horizontal descender.
  */
  horizontalDescender = 1751413603,

  /**
      horizontal line gap.
  */
  horizontalLineGap = 1751934832,

  /**
      horizontal clipping ascent.
  */
  horizontalClippingAscent = 1751346273,

  /**
      horizontal clipping descent.
  */
  horizontalClippingDescent = 1751346276,

  /**
      vertical ascender.
  */
  verticalAscender = 1986098019,

  /**
      vertical descender.
  */
  verticalDescender = 1986294627,

  /**
      vertical line gap.
  */
  verticalLineGap = 1986815856,

  /**
      horizontal caret rise.
  */
  horizontalCaretRise = 1751347827,

  /**
      horizontal caret run.
  */
  horizontalCaretRun = 1751347822,

  /**
      horizontal caret offset.
  */
  horizontalCaretOffset = 1751347046,

  /**
      vertical caret rise.
  */
  verticalCaretRise = 1986228851,

  /**
      vertical caret run.
  */
  verticalCaretRun = 1986228846,

  /**
      vertical caret offset.
  */
  verticalCaretOffset = 1986228070,

  /**
      x height.
  */
  xHeight = 2020108148,

  /**
      cap height.
  */
  capHeight = 1668311156,

  /**
      subscript em x size.
  */
  subscriptEmXSize = 1935833203,

  /**
      subscript em y size.
  */
  subscriptEmYSize = 1935833459,

  /**
      subscript em x offset.
  */
  subscriptEmXOffset = 1935833199,

  /**
      subscript em y offset.
  */
  subscriptEmYOffset = 1935833455,

  /**
      superscript em x size.
  */
  superscriptEmXSize = 1936750707,

  /**
      superscript em y size.
  */
  superscriptEmYSize = 1936750963,

  /**
      superscript em x offset.
  */
  superscriptEmXOffset = 1936750703,

  /**
      superscript em y offset.
  */
  superscriptEmYOffset = 1936750959,

  /**
      strikeout size.
  */
  strikeoutSize = 1937011315,

  /**
      strikeout offset.
  */
  strikeoutOffset = 1937011311,

  /**
      underline size.
  */
  underlineSize = 1970168947,

  /**
      underline offset.
  */
  underlineOffset = 1970168943,
}

/**
    An enum type representing the pre-defined name IDs.
  
  For more information on these fields, see the
  [OpenType spec](https://docs.microsoft.com/en-us/typography/opentype/spec/name#name-ids).
*/
enum hb_ot_name_id_predefined_t
{
  /**
      Copyright notice
  */
  copyright = 0,

  /**
      Font Family name
  */
  fontFamily = 1,

  /**
      Font Subfamily name
  */
  fontSubfamily = 2,

  /**
      Unique font identifier
  */
  uniqueId = 3,

  /**
      Full font name that reflects
    all family and relevant subfamily descriptors
  */
  fullName = 4,

  /**
      Version string
  */
  versionString = 5,

  /**
      PostScript name for the font
  */
  postscriptName = 6,

  /**
      Trademark
  */
  trademark = 7,

  /**
      Manufacturer Name
  */
  manufacturer = 8,

  /**
      Designer
  */
  designer = 9,

  /**
      Description
  */
  description = 10,

  /**
      URL of font vendor
  */
  vendorUrl = 11,

  /**
      URL of typeface designer
  */
  designerUrl = 12,

  /**
      License Description
  */
  license = 13,

  /**
      URL where additional licensing
    information can be found
  */
  licenseUrl = 14,

  /**
      Typographic Family name
  */
  typographicFamily = 16,

  /**
      Typographic Subfamily name
  */
  typographicSubfamily = 17,

  /**
      Compatible Full Name for MacOS
  */
  macFullName = 18,

  /**
      Sample text
  */
  sampleText = 19,

  /**
      PostScript CID findfont name
  */
  cidFindfontName = 20,

  /**
      WWS Family Name
  */
  wwsFamily = 21,

  /**
      WWS Subfamily Name
  */
  wwsSubfamily = 22,

  /**
      Light Background Palette
  */
  lightBackground = 23,

  /**
      Dark Background Palette
  */
  darkBackground = 24,

  /**
      Variations PostScript Name Prefix
  */
  variationsPsPrefix = 25,

  /**
      Value to represent a nonexistent name ID.
  */
  invalid = 65535,
}

/**
    Flags for #hb_ot_var_axis_info_t.
*/
enum hb_ot_var_axis_flags_t : uint
{
  /**
      The axis should not be exposed directly in user interfaces.
  */
  hidden = 1,
}

/**
    The values of this enumeration describe the compositing modes
  that can be used when combining temporary redirected drawing
  with the backdrop.
  
  See the OpenType spec [COLR](https://learn.microsoft.com/en-us/typography/opentype/spec/colr)
  section for details.
*/
enum hb_paint_composite_mode_t
{
  /**
      clear destination layer (bounded)
  */
  clear = 0,

  /**
      replace destination layer (bounded)
  */
  src = 1,

  /**
      ignore the source
  */
  dest = 2,

  /**
      draw source layer on top of destination layer
    (bounded)
  */
  srcOver = 3,

  /**
      draw destination on top of source
  */
  destOver = 4,

  /**
      draw source where there was destination content
    (unbounded)
  */
  srcIn = 5,

  /**
      leave destination only where there was
    source content (unbounded)
  */
  destIn = 6,

  /**
      draw source where there was no destination
    content (unbounded)
  */
  srcOut = 7,

  /**
      leave destination only where there was no
    source content
  */
  destOut = 8,

  /**
      draw source on top of destination content and
    only there
  */
  srcAtop = 9,

  /**
      leave destination on top of source content
    and only there (unbounded)
  */
  destAtop = 10,

  /**
      source and destination are shown where there is only
    one of them
  */
  xor = 11,

  /**
      source and destination layers are accumulated
  */
  plus = 12,

  /**
      source and destination are complemented and
    multiplied. This causes the result to be at least as light as the lighter
    inputs.
  */
  screen = 13,

  /**
      multiplies or screens, depending on the
    lightness of the destination color.
  */
  overlay = 14,

  /**
      replaces the destination with the source if it
    is darker, otherwise keeps the source.
  */
  darken = 15,

  /**
      replaces the destination with the source if it
    is lighter, otherwise keeps the source.
  */
  lighten = 16,

  /**
      brightens the destination color to reflect
    the source color.
  */
  colorDodge = 17,

  /**
      darkens the destination color to reflect
    the source color.
  */
  colorBurn = 18,

  /**
      Multiplies or screens, dependent on source
    color.
  */
  hardLight = 19,

  /**
      Darkens or lightens, dependent on source
    color.
  */
  softLight = 20,

  /**
      Takes the difference of the source and
    destination color.
  */
  difference = 21,

  /**
      Produces an effect similar to difference, but
    with lower contrast.
  */
  exclusion = 22,

  /**
      source and destination layers are multiplied.
    This causes the result to be at least as dark as the darker inputs.
  */
  multiply = 23,

  /**
      Creates a color with the hue of the source
    and the saturation and luminosity of the target.
  */
  hslHue = 24,

  /**
      Creates a color with the saturation
    of the source and the hue and luminosity of the target. Painting with
    this mode onto a gray area produces no change.
  */
  hslSaturation = 25,

  /**
      Creates a color with the hue and saturation
    of the source and the luminosity of the target. This preserves the gray
    levels of the target and is useful for coloring monochrome images or
    tinting color images.
  */
  hslColor = 26,

  /**
      Creates a color with the luminosity of
    the source and the hue and saturation of the target. This produces an
    inverse effect to @HB_PAINT_COMPOSITE_MODE_HSL_COLOR.
  */
  hslLuminosity = 27,
}

/**
    The values of this enumeration determine how color values
  outside the minimum and maximum defined offset on a #hb_color_line_t
  are determined.
  
  See the OpenType spec [COLR](https://learn.microsoft.com/en-us/typography/opentype/spec/colr)
  section for details.
*/
enum hb_paint_extend_t
{
  /**
      Outside the defined interval,
      the color of the closest color stop is used.
  */
  pad = 0,

  /**
      The color line is repeated over
      repeated multiples of the defined interval
  */
  repeat = 1,

  /**
      The color line is repeated over
         repeated intervals, as for the repeat mode.
         However, in each repeated interval, the ordering of
         color stops is the reverse of the adjacent interval.
  */
  reflect = 2,
}

/**
    Data type for scripts. Each #hb_script_t's value is an #hb_tag_t corresponding
  to the four-letter values defined by [ISO 15924](https://unicode.org/iso15924/).
  
  See also the Script (sc) property of the Unicode Character Database.
*/
enum hb_script_t
{
  /**
      `Zyyy`
  */
  common = 1517910393,

  /**
      `Zinh`
  */
  inherited = 1516858984,

  /**
      `Zzzz`
  */
  unknown = 1517976186,

  /**
      `Arab`
  */
  arabic = 1098015074,

  /**
      `Armn`
  */
  armenian = 1098018158,

  /**
      `Beng`
  */
  bengali = 1113943655,

  /**
      `Cyrl`
  */
  cyrillic = 1132032620,

  /**
      `Deva`
  */
  devanagari = 1147500129,

  /**
      `Geor`
  */
  georgian = 1197830002,

  /**
      `Grek`
  */
  greek = 1198679403,

  /**
      `Gujr`
  */
  gujarati = 1198877298,

  /**
      `Guru`
  */
  gurmukhi = 1198879349,

  /**
      `Hang`
  */
  hangul = 1214344807,

  /**
      `Hani`
  */
  han = 1214344809,

  /**
      `Hebr`
  */
  hebrew = 1214603890,

  /**
      `Hira`
  */
  hiragana = 1214870113,

  /**
      `Knda`
  */
  kannada = 1265525857,

  /**
      `Kana`
  */
  katakana = 1264676449,

  /**
      `Laoo`
  */
  lao = 1281453935,

  /**
      `Latn`
  */
  latin = 1281455214,

  /**
      `Mlym`
  */
  malayalam = 1298954605,

  /**
      `Orya`
  */
  oriya = 1332902241,

  /**
      `Taml`
  */
  tamil = 1415671148,

  /**
      `Telu`
  */
  telugu = 1415933045,

  /**
      `Thai`
  */
  thai = 1416126825,

  /**
      `Tibt`
  */
  tibetan = 1416192628,

  /**
      `Bopo`
  */
  bopomofo = 1114599535,

  /**
      `Brai`
  */
  braille = 1114792297,

  /**
      `Cans`
  */
  canadianSyllabics = 1130458739,

  /**
      `Cher`
  */
  cherokee = 1130915186,

  /**
      `Ethi`
  */
  ethiopic = 1165256809,

  /**
      `Khmr`
  */
  khmer = 1265134962,

  /**
      `Mong`
  */
  mongolian = 1299148391,

  /**
      `Mymr`
  */
  myanmar = 1299803506,

  /**
      `Ogam`
  */
  ogham = 1332175213,

  /**
      `Runr`
  */
  runic = 1383427698,

  /**
      `Sinh`
  */
  sinhala = 1399418472,

  /**
      `Syrc`
  */
  syriac = 1400468067,

  /**
      `Thaa`
  */
  thaana = 1416126817,

  /**
      `Yiii`
  */
  yi = 1500080489,

  /**
      `Dsrt`
  */
  deseret = 1148416628,

  /**
      `Goth`
  */
  gothic = 1198486632,

  /**
      `Ital`
  */
  oldItalic = 1232363884,

  /**
      `Buhd`
  */
  buhid = 1114990692,

  /**
      `Hano`
  */
  hanunoo = 1214344815,

  /**
      `Tglg`
  */
  tagalog = 1416064103,

  /**
      `Tagb`
  */
  tagbanwa = 1415669602,

  /**
      `Cprt`
  */
  cypriot = 1131442804,

  /**
      `Limb`
  */
  limbu = 1281977698,

  /**
      `Linb`
  */
  linearB = 1281977954,

  /**
      `Osma`
  */
  osmanya = 1332964705,

  /**
      `Shaw`
  */
  shavian = 1399349623,

  /**
      `Tale`
  */
  taiLe = 1415670885,

  /**
      `Ugar`
  */
  ugaritic = 1432838514,

  /**
      `Bugi`
  */
  buginese = 1114990441,

  /**
      `Copt`
  */
  coptic = 1131376756,

  /**
      `Glag`
  */
  glagolitic = 1198285159,

  /**
      `Khar`
  */
  kharoshthi = 1265131890,

  /**
      `Talu`
  */
  newTaiLue = 1415670901,

  /**
      `Xpeo`
  */
  oldPersian = 1483761007,

  /**
      `Sylo`
  */
  sylotiNagri = 1400466543,

  /**
      `Tfng`
  */
  tifinagh = 1415999079,

  /**
      `Bali`
  */
  balinese = 1113681001,

  /**
      `Xsux`
  */
  cuneiform = 1483961720,

  /**
      `Nkoo`
  */
  nko = 1315663727,

  /**
      `Phag`
  */
  phagsPa = 1349017959,

  /**
      `Phnx`
  */
  phoenician = 1349021304,

  /**
      `Cari`
  */
  carian = 1130459753,

  /**
      `Cham`
  */
  cham = 1130914157,

  /**
      `Kali`
  */
  kayahLi = 1264675945,

  /**
      `Lepc`
  */
  lepcha = 1281716323,

  /**
      `Lyci`
  */
  lycian = 1283023721,

  /**
      `Lydi`
  */
  lydian = 1283023977,

  /**
      `Olck`
  */
  olChiki = 1332503403,

  /**
      `Rjng`
  */
  rejang = 1382706791,

  /**
      `Saur`
  */
  saurashtra = 1398895986,

  /**
      `Sund`
  */
  sundanese = 1400204900,

  /**
      `Vaii`
  */
  vai = 1449224553,

  /**
      `Avst`
  */
  avestan = 1098281844,

  /**
      `Bamu`
  */
  bamum = 1113681269,

  /**
      `Egyp`
  */
  egyptianHieroglyphs = 1164409200,

  /**
      `Armi`
  */
  imperialAramaic = 1098018153,

  /**
      `Phli`
  */
  inscriptionalPahlavi = 1349020777,

  /**
      `Prti`
  */
  inscriptionalParthian = 1349678185,

  /**
      `Java`
  */
  javanese = 1247901281,

  /**
      `Kthi`
  */
  kaithi = 1265920105,

  /**
      `Lisu`
  */
  lisu = 1281979253,

  /**
      `Mtei`
  */
  meeteiMayek = 1299473769,

  /**
      `Sarb`
  */
  oldSouthArabian = 1398895202,

  /**
      `Orkh`
  */
  oldTurkic = 1332898664,

  /**
      `Samr`
  */
  samaritan = 1398893938,

  /**
      `Lana`
  */
  taiTham = 1281453665,

  /**
      `Tavt`
  */
  taiViet = 1415673460,

  /**
      `Batk`
  */
  batak = 1113683051,

  /**
      `Brah`
  */
  brahmi = 1114792296,

  /**
      `Mand`
  */
  mandaic = 1298230884,

  /**
      `Cakm`
  */
  chakma = 1130457965,

  /**
      `Merc`
  */
  meroiticCursive = 1298494051,

  /**
      `Mero`
  */
  meroiticHieroglyphs = 1298494063,

  /**
      `Plrd`
  */
  miao = 1349284452,

  /**
      `Shrd`
  */
  sharada = 1399353956,

  /**
      `Sora`
  */
  soraSompeng = 1399812705,

  /**
      `Takr`
  */
  takri = 1415670642,

  /**
      `Bass`, Since: 0.9.30
  */
  bassaVah = 1113682803,

  /**
      `Aghb`, Since: 0.9.30
  */
  caucasianAlbanian = 1097295970,

  /**
      `Dupl`, Since: 0.9.30
  */
  duployan = 1148547180,

  /**
      `Elba`, Since: 0.9.30
  */
  elbasan = 1164730977,

  /**
      `Gran`, Since: 0.9.30
  */
  grantha = 1198678382,

  /**
      `Khoj`, Since: 0.9.30
  */
  khojki = 1265135466,

  /**
      `Sind`, Since: 0.9.30
  */
  khudawadi = 1399418468,

  /**
      `Lina`, Since: 0.9.30
  */
  linearA = 1281977953,

  /**
      `Mahj`, Since: 0.9.30
  */
  mahajani = 1298229354,

  /**
      `Mani`, Since: 0.9.30
  */
  manichaean = 1298230889,

  /**
      `Mend`, Since: 0.9.30
  */
  mendeKikakui = 1298493028,

  /**
      `Modi`, Since: 0.9.30
  */
  modi = 1299145833,

  /**
      `Mroo`, Since: 0.9.30
  */
  mro = 1299345263,

  /**
      `Nbat`, Since: 0.9.30
  */
  nabataean = 1315070324,

  /**
      `Narb`, Since: 0.9.30
  */
  oldNorthArabian = 1315009122,

  /**
      `Perm`, Since: 0.9.30
  */
  oldPermic = 1348825709,

  /**
      `Hmng`, Since: 0.9.30
  */
  pahawhHmong = 1215131239,

  /**
      `Palm`, Since: 0.9.30
  */
  palmyrene = 1348562029,

  /**
      `Pauc`, Since: 0.9.30
  */
  pauCinHau = 1348564323,

  /**
      `Phlp`, Since: 0.9.30
  */
  psalterPahlavi = 1349020784,

  /**
      `Sidd`, Since: 0.9.30
  */
  siddham = 1399415908,

  /**
      `Tirh`, Since: 0.9.30
  */
  tirhuta = 1416196712,

  /**
      `Wara`, Since: 0.9.30
  */
  warangCiti = 1466004065,

  /**
      `Ahom`, Since: 0.9.30
  */
  ahom = 1097363309,

  /**
      `Hluw`, Since: 0.9.30
  */
  anatolianHieroglyphs = 1215067511,

  /**
      `Hatr`, Since: 0.9.30
  */
  hatran = 1214346354,

  /**
      `Mult`, Since: 0.9.30
  */
  multani = 1299541108,

  /**
      `Hung`, Since: 0.9.30
  */
  oldHungarian = 1215655527,

  /**
      `Sgnw`, Since: 0.9.30
  */
  signwriting = 1399287415,

  /**
      `Adlm`, Since: 1.3.0
  */
  adlam = 1097100397,

  /**
      `Bhks`, Since: 1.3.0
  */
  bhaiksuki = 1114139507,

  /**
      `Marc`, Since: 1.3.0
  */
  marchen = 1298231907,

  /**
      `Osge`, Since: 1.3.0
  */
  osage = 1332963173,

  /**
      `Tang`, Since: 1.3.0
  */
  tangut = 1415671399,

  /**
      `Newa`, Since: 1.3.0
  */
  newa = 1315272545,

  /**
      `Gonm`, Since: 1.6.0
  */
  masaramGondi = 1198485101,

  /**
      `Nshu`, Since: 1.6.0
  */
  nushu = 1316186229,

  /**
      `Soyo`, Since: 1.6.0
  */
  soyombo = 1399814511,

  /**
      `Zanb`, Since: 1.6.0
  */
  zanabazarSquare = 1516334690,

  /**
      `Dogr`, Since: 1.8.0
  */
  dogra = 1148151666,

  /**
      `Gong`, Since: 1.8.0
  */
  gunjalaGondi = 1198485095,

  /**
      `Rohg`, Since: 1.8.0
  */
  hanifiRohingya = 1383032935,

  /**
      `Maka`, Since: 1.8.0
  */
  makasar = 1298230113,

  /**
      `Medf`, Since: 1.8.0
  */
  medefaidrin = 1298490470,

  /**
      `Sogo`, Since: 1.8.0
  */
  oldSogdian = 1399809903,

  /**
      `Sogd`, Since: 1.8.0
  */
  sogdian = 1399809892,

  /**
      `Elym`, Since: 2.4.0
  */
  elymaic = 1164736877,

  /**
      `Nand`, Since: 2.4.0
  */
  nandinagari = 1315008100,

  /**
      `Hmnp`, Since: 2.4.0
  */
  nyiakengPuachueHmong = 1215131248,

  /**
      `Wcho`, Since: 2.4.0
  */
  wancho = 1466132591,

  /**
      `Chrs`, Since: 2.6.7
  */
  chorasmian = 1130918515,

  /**
      `Diak`, Since: 2.6.7
  */
  divesAkuru = 1147756907,

  /**
      `Kits`, Since: 2.6.7
  */
  khitanSmallScript = 1265202291,

  /**
      `Yezi`, Since: 2.6.7
  */
  yezidi = 1499822697,

  /**
      `Cpmn`, Since: 3.0.0
  */
  cyproMinoan = 1131441518,

  /**
      `Ougr`, Since: 3.0.0
  */
  oldUyghur = 1333094258,

  /**
      `Tnsa`, Since: 3.0.0
  */
  tangsa = 1416524641,

  /**
      `Toto`, Since: 3.0.0
  */
  toto = 1416590447,

  /**
      `Vith`, Since: 3.0.0
  */
  vithkuqi = 1449751656,

  /**
      `Zmth`, Since: 3.4.0
  */
  math = 1517122664,

  /**
      `Kawi`, Since: 5.2.0
  */
  kawi = 1264678761,

  /**
      `Nagm`, Since: 5.2.0
  */
  nagMundari = 1315006317,

  /**
      No script set
  */
  invalid = 0,
}

/**
    Defined by [OpenType Design-Variation Axis Tag Registry](https://docs.microsoft.com/en-us/typography/opentype/spec/dvaraxisreg).
*/
enum hb_style_tag_t
{
  /**
      Used to vary between non-italic and italic.
    A value of 0 can be interpreted as "Roman" (non-italic); a value of 1 can
    be interpreted as (fully) italic.
  */
  italic = 1769234796,

  /**
      Used to vary design to suit different text sizes.
    Non-zero. Values can be interpreted as text size, in points.
  */
  opticalSize = 1869640570,

  /**
      Used to vary between upright and slanted text. Values
    must be greater than -90 and less than +90. Values can be interpreted as
    the angle, in counter-clockwise degrees, of oblique slant from whatever the
    designer considers to be upright for that font design. Typical right-leaning
    Italic fonts have a negative slant angle (typically around -12)
  */
  slantAngle = 1936486004,

  /**
      same as @HB_STYLE_TAG_SLANT_ANGLE expression as ratio.
    Typical right-leaning Italic fonts have a positive slant ratio (typically around 0.2)
  */
  slantRatio = 1399615092,

  /**
      Used to vary width of text from narrower to wider.
    Non-zero. Values can be interpreted as a percentage of whatever the font
    designer considers “normal width” for that font design.
  */
  width = 2003072104,

  /**
      Used to vary stroke thicknesses or other design details
    to give variation from lighter to blacker. Values can be interpreted in direct
    comparison to values for usWeightClass in the OS/2 table,
    or the CSS font-weight property.
  */
  weight = 2003265652,
}

/**
    Data type for the Canonical_Combining_Class (ccc) property
  from the Unicode Character Database.
  
  <note>Note: newer versions of Unicode may add new values.
  Client programs should be ready to handle any value in the 0..254 range
  being returned from [harfbuzz.global.unicodeCombiningClass].</note>
*/
enum hb_unicode_combining_class_t
{
  /**
      Spacing and enclosing marks; also many vowel and consonant signs, even if nonspacing
  */
  notReordered = 0,

  /**
      Marks which overlay a base letter or symbol
  */
  overlay = 1,

  /**
      Diacritic nukta marks in Brahmi-derived scripts
  */
  nukta = 7,

  /**
      Hiragana/Katakana voicing marks
  */
  kanaVoicing = 8,

  /**
      Viramas
  */
  virama = 9,

  /**
      [Hebrew]
  */
  ccc10 = 10,

  /**
      [Hebrew]
  */
  ccc11 = 11,

  /**
      [Hebrew]
  */
  ccc12 = 12,

  /**
      [Hebrew]
  */
  ccc13 = 13,

  /**
      [Hebrew]
  */
  ccc14 = 14,

  /**
      [Hebrew]
  */
  ccc15 = 15,

  /**
      [Hebrew]
  */
  ccc16 = 16,

  /**
      [Hebrew]
  */
  ccc17 = 17,

  /**
      [Hebrew]
  */
  ccc18 = 18,

  /**
      [Hebrew]
  */
  ccc19 = 19,

  /**
      [Hebrew]
  */
  ccc20 = 20,

  /**
      [Hebrew]
  */
  ccc21 = 21,

  /**
      [Hebrew]
  */
  ccc22 = 22,

  /**
      [Hebrew]
  */
  ccc23 = 23,

  /**
      [Hebrew]
  */
  ccc24 = 24,

  /**
      [Hebrew]
  */
  ccc25 = 25,

  /**
      [Hebrew]
  */
  ccc26 = 26,

  /**
      [Arabic]
  */
  ccc27 = 27,

  /**
      [Arabic]
  */
  ccc28 = 28,

  /**
      [Arabic]
  */
  ccc29 = 29,

  /**
      [Arabic]
  */
  ccc30 = 30,

  /**
      [Arabic]
  */
  ccc31 = 31,

  /**
      [Arabic]
  */
  ccc32 = 32,

  /**
      [Arabic]
  */
  ccc33 = 33,

  /**
      [Arabic]
  */
  ccc34 = 34,

  /**
      [Arabic]
  */
  ccc35 = 35,

  /**
      [Syriac]
  */
  ccc36 = 36,

  /**
      [Telugu]
  */
  ccc84 = 84,

  /**
      [Telugu]
  */
  ccc91 = 91,

  /**
      [Thai]
  */
  ccc103 = 103,

  /**
      [Thai]
  */
  ccc107 = 107,

  /**
      [Lao]
  */
  ccc118 = 118,

  /**
      [Lao]
  */
  ccc122 = 122,

  /**
      [Tibetan]
  */
  ccc129 = 129,

  /**
      [Tibetan]
  */
  ccc130 = 130,

  /**
      [Tibetan] Since: 7.2.0
  */
  ccc132 = 132,

  /**
      Marks attached at the bottom left
  */
  attachedBelowLeft = 200,

  /**
      Marks attached directly below
  */
  attachedBelow = 202,

  /**
      Marks attached directly above
  */
  attachedAbove = 214,

  /**
      Marks attached at the top right
  */
  attachedAboveRight = 216,

  /**
      Distinct marks at the bottom left
  */
  belowLeft = 218,

  /**
      Distinct marks directly below
  */
  below = 220,

  /**
      Distinct marks at the bottom right
  */
  belowRight = 222,

  /**
      Distinct marks to the left
  */
  left = 224,

  /**
      Distinct marks to the right
  */
  right = 226,

  /**
      Distinct marks at the top left
  */
  aboveLeft = 228,

  /**
      Distinct marks directly above
  */
  above = 230,

  /**
      Distinct marks at the top right
  */
  aboveRight = 232,

  /**
      Distinct marks subtending two bases
  */
  doubleBelow = 233,

  /**
      Distinct marks extending above two bases
  */
  doubleAbove = 234,

  /**
      Greek iota subscript only
  */
  iotaSubscript = 240,

  /**
      Invalid combining class
  */
  invalid = 255,
}

/**
    Data type for the "General_Category" (gc) property from
  the Unicode Character Database.
*/
enum hb_unicode_general_category_t
{
  /**
      [Cc]
  */
  control = 0,

  /**
      [Cf]
  */
  format = 1,

  /**
      [Cn]
  */
  unassigned = 2,

  /**
      [Co]
  */
  privateUse = 3,

  /**
      [Cs]
  */
  surrogate = 4,

  /**
      [Ll]
  */
  lowercaseLetter = 5,

  /**
      [Lm]
  */
  modifierLetter = 6,

  /**
      [Lo]
  */
  otherLetter = 7,

  /**
      [Lt]
  */
  titlecaseLetter = 8,

  /**
      [Lu]
  */
  uppercaseLetter = 9,

  /**
      [Mc]
  */
  spacingMark = 10,

  /**
      [Me]
  */
  enclosingMark = 11,

  /**
      [Mn]
  */
  nonSpacingMark = 12,

  /**
      [Nd]
  */
  decimalNumber = 13,

  /**
      [Nl]
  */
  letterNumber = 14,

  /**
      [No]
  */
  otherNumber = 15,

  /**
      [Pc]
  */
  connectPunctuation = 16,

  /**
      [Pd]
  */
  dashPunctuation = 17,

  /**
      [Pe]
  */
  closePunctuation = 18,

  /**
      [Pf]
  */
  finalPunctuation = 19,

  /**
      [Pi]
  */
  initialPunctuation = 20,

  /**
      [Po]
  */
  otherPunctuation = 21,

  /**
      [Ps]
  */
  openPunctuation = 22,

  /**
      [Sc]
  */
  currencySymbol = 23,

  /**
      [Sk]
  */
  modifierSymbol = 24,

  /**
      [Sm]
  */
  mathSymbol = 25,

  /**
      [So]
  */
  otherSymbol = 26,

  /**
      [Zl]
  */
  lineSeparator = 27,

  /**
      [Zp]
  */
  paragraphSeparator = 28,

  /**
      [Zs]
  */
  spaceSeparator = 29,
}

/**
    Structure representing a setting for an #hb_aat_layout_feature_type_t.
*/
struct hb_aat_layout_feature_selector_info_t
{
  /**
      The selector's name identifier
  */
  hb_ot_name_id_t nameId;

  /**
      The value to turn the selector on
  */
  hb_aat_layout_feature_selector_t enable;

  /**
      The value to turn the selector off
  */
  hb_aat_layout_feature_selector_t disable;

  /** */
  uint reserved;
}

/**
    Data type for blobs. A blob wraps a chunk of binary
  data and facilitates its lifecycle management between
  a client program and HarfBuzz.
*/
struct hb_blob_t;

/**
    The main structure holding the input text and its properties before shaping,
  and output glyphs and their information after shaping.
*/
struct hb_buffer_t;

/**
    A struct containing color information for a gradient.
*/
struct hb_color_line_t
{
  /** */
  void* data;

  /** */
  hb_color_line_get_color_stops_func_t getColorStops;

  /** */
  void* getColorStopsUserData;

  /** */
  hb_color_line_get_extend_func_t getExtend;

  /** */
  void* getExtendUserData;

  /** */
  void* reserved0;

  /** */
  void* reserved1;

  /** */
  void* reserved2;

  /** */
  void* reserved3;

  /** */
  void* reserved5;

  /** */
  void* reserved6;

  /** */
  void* reserved7;

  /** */
  void* reserved8;
}

/**
    Information about a color stop on a color line.
  
  Color lines typically have offsets ranging between 0 and 1,
  but that is not required.
  
  Note: despite @color being unpremultiplied here, interpolation in
  gradients shall happen in premultiplied space. See the OpenType spec
  [COLR](https://learn.microsoft.com/en-us/typography/opentype/spec/colr)
  section for details.
*/
struct hb_color_stop_t
{
  /**
      the offset of the color stop
  */
  float offset;

  /**
      whether the color is the foreground
  */
  hb_bool_t isForeground;

  /**
      the color, unpremultiplied
  */
  hb_color_t color;
}

/**
    Glyph draw callbacks.
  
  #hb_draw_move_to_func_t, #hb_draw_line_to_func_t and
  #hb_draw_cubic_to_func_t calls are necessary to be defined but we translate
  #hb_draw_quadratic_to_func_t calls to #hb_draw_cubic_to_func_t if the
  callback isn't defined.
*/
struct hb_draw_funcs_t;

/**
    Current drawing state.
*/
struct hb_draw_state_t
{
  /**
      Whether there is an open path
  */
  hb_bool_t pathOpen;

  /**
      X component of the start of current path
  */
  float pathStartX;

  /**
      Y component of the start of current path
  */
  float pathStartY;

  /**
      X component of current point
  */
  float currentX;

  /**
      Y component of current point
  */
  float currentY;

  /** */
  hb_var_num_t reserved1;

  /** */
  hb_var_num_t reserved2;

  /** */
  hb_var_num_t reserved3;

  /** */
  hb_var_num_t reserved4;

  /** */
  hb_var_num_t reserved5;

  /** */
  hb_var_num_t reserved6;

  /** */
  hb_var_num_t reserved7;
}

/**
    Data type for holding font faces.
*/
struct hb_face_t;

/**
    The #hb_feature_t is the structure that holds information about requested
  feature application. The feature will be applied with the given value to all
  glyphs which are in clusters between @start (inclusive) and @end (exclusive).
  Setting start to #HB_FEATURE_GLOBAL_START and end to #HB_FEATURE_GLOBAL_END
  specifies that the feature always applies to the entire buffer.
*/
struct hb_feature_t
{
  /**
      The #hb_tag_t tag of the feature
  */
  hb_tag_t tag;

  /**
      The value of the feature. 0 disables the feature, non-zero (usually
    1) enables the feature.  For features implemented as lookup type 3 (like
    'salt') the @value is a one based index into the alternates.
  */
  uint value;

  /**
      the cluster to start applying this feature setting (inclusive).
  */
  uint start;

  /**
      the cluster to end applying this feature setting (exclusive).
  */
  uint end;
}

/**
    Data type for holding fonts.
*/
struct hb_font_t;

/**
    Font-wide extent values, measured in font units.
  
  Note that typically @ascender is positive and @descender
  negative, in coordinate systems that grow up.
*/
struct hb_font_extents_t
{
  /**
      The height of typographic ascenders.
  */
  hb_position_t ascender;

  /**
      The depth of typographic descenders.
  */
  hb_position_t descender;

  /**
      The suggested line-spacing gap.
  */
  hb_position_t lineGap;

  /** */
  hb_position_t reserved9;

  /** */
  hb_position_t reserved8;

  /** */
  hb_position_t reserved7;

  /** */
  hb_position_t reserved6;

  /** */
  hb_position_t reserved5;

  /** */
  hb_position_t reserved4;

  /** */
  hb_position_t reserved3;

  /** */
  hb_position_t reserved2;

  /** */
  hb_position_t reserved1;
}

/**
    Data type containing a set of virtual methods used for
  working on #hb_font_t font objects.
  
  HarfBuzz provides a lightweight default function for each of
  the methods in #hb_font_funcs_t. Client programs can implement
  their own replacements for the individual font functions, as
  needed, and replace the default by calling the setter for a
  method.
*/
struct hb_font_funcs_t;

/**
    Glyph extent values, measured in font units.
  
  Note that @height is negative, in coordinate systems that grow up.
*/
struct hb_glyph_extents_t
{
  /**
      Distance from the x-origin to the left extremum of the glyph.
  */
  hb_position_t xBearing;

  /**
      Distance from the top extremum of the glyph to the y-origin.
  */
  hb_position_t yBearing;

  /**
      Distance from the left extremum of the glyph to the right extremum.
  */
  hb_position_t width;

  /**
      Distance from the top extremum of the glyph to the bottom extremum.
  */
  hb_position_t height;
}

/**
    The #hb_glyph_info_t is the structure that holds information about the
  glyphs and their relation to input text.
*/
struct hb_glyph_info_t
{
  /**
      either a Unicode code point (before shaping) or a glyph index
                (after shaping).
  */
  hb_codepoint_t codepoint;

  /** */
  hb_mask_t mask;

  /**
      the index of the character in the original text that corresponds
              to this #hb_glyph_info_t, or whatever the client passes to
              [harfbuzz.global.bufferAdd]. More than one #hb_glyph_info_t can have the same
              @cluster value, if they resulted from the same character (e.g. one
              to many glyph substitution), and when more than one character gets
              merged in the same glyph (e.g. many to one glyph substitution) the
              #hb_glyph_info_t will have the smallest cluster value of them.
              By default some characters are merged into the same cluster
              (e.g. combining marks have the same cluster as their bases)
              even if they are separate glyphs, [harfbuzz.global.bufferSetClusterLevel]
              allow selecting more fine-grained cluster handling.
  */
  uint cluster;

  /** */
  hb_var_int_t var1;

  /** */
  hb_var_int_t var2;
}

/**
    The #hb_glyph_position_t is the structure that holds the positions of the
  glyph in both horizontal and vertical directions. All positions in
  #hb_glyph_position_t are relative to the current point.
*/
struct hb_glyph_position_t
{
  /**
      how much the line advances after drawing this glyph when setting
                text in horizontal direction.
  */
  hb_position_t xAdvance;

  /**
      how much the line advances after drawing this glyph when setting
                text in vertical direction.
  */
  hb_position_t yAdvance;

  /**
      how much the glyph moves on the X-axis before drawing it, this
               should not affect how much the line advances.
  */
  hb_position_t xOffset;

  /**
      how much the glyph moves on the Y-axis before drawing it, this
               should not affect how much the line advances.
  */
  hb_position_t yOffset;

  /** */
  hb_var_int_t var;
}

/**
    Data type for languages. Each #hb_language_t corresponds to a BCP 47
  language tag.
*/
alias hb_language_t = hb_language_t_st*;

struct hb_language_t_st;

/**
    Data type for holding integer-to-integer hash maps.
*/
struct hb_map_t;

/**
    Pairs of glyph and color index.
  
  A color index of 0xFFFF does not refer to a palette
  color, but indicates that the foreground color should
  be used.
*/
struct hb_ot_color_layer_t
{
  /**
      the glyph ID of the layer
  */
  hb_codepoint_t glyph;

  /**
      the palette color index of the layer
  */
  uint colorIndex;
}

/**
    Data type to hold information for a "part" component of a math-variant glyph.
  Large variants for stretchable math glyphs (such as parentheses) can be constructed
  on the fly from parts.
*/
struct hb_ot_math_glyph_part_t
{
  /**
      The glyph index of the variant part
  */
  hb_codepoint_t glyph;

  /**
      The length of the connector on the starting side of the variant part
  */
  hb_position_t startConnectorLength;

  /**
      The length of the connector on the ending side of the variant part
  */
  hb_position_t endConnectorLength;

  /**
      The total advance of the part
  */
  hb_position_t fullAdvance;

  /**
      #hb_ot_math_glyph_part_flags_t flags for the part
  */
  hb_ot_math_glyph_part_flags_t flags;
}

/**
    Data type to hold math-variant information for a glyph.
*/
struct hb_ot_math_glyph_variant_t
{
  /**
      The glyph index of the variant
  */
  hb_codepoint_t glyph;

  /**
      The advance width of the variant
  */
  hb_position_t advance;
}

/**
    Data type to hold math kerning (cut-in) information for a glyph.
*/
struct hb_ot_math_kern_entry_t
{
  /**
      The maximum height at which this entry should be used
  */
  hb_position_t maxCorrectionHeight;

  /**
      The kern value of the entry
  */
  hb_position_t kernValue;
}

/**
    Structure representing a name ID in a particular language.
*/
struct hb_ot_name_entry_t
{
  /**
      name ID
  */
  hb_ot_name_id_t nameId;

  /** */
  hb_var_int_t var;

  /**
      language
  */
  hb_language_t language;
}

/**
    Use #hb_ot_var_axis_info_t instead.
*/
struct hb_ot_var_axis_t
{
  /**
      axis tag
  */
  hb_tag_t tag;

  /**
      axis name identifier
  */
  hb_ot_name_id_t nameId;

  /**
      minimum value of the axis
  */
  float minValue;

  /**
      default value of the axis
  */
  float defaultValue;

  /**
      maximum value of the axis
  */
  float maxValue;
}

/**
    Data type for holding variation-axis values.
  
  The minimum, default, and maximum values are in un-normalized, user scales.
  
  <note>Note: at present, the only flag defined for @flags is
  #HB_OT_VAR_AXIS_FLAG_HIDDEN.</note>
*/
struct hb_ot_var_axis_info_t
{
  /**
      Index of the axis in the variation-axis array
  */
  uint axisIndex;

  /**
      The #hb_tag_t tag identifying the design variation of the axis
  */
  hb_tag_t tag;

  /**
      The `name` table Name ID that provides display names for the axis
  */
  hb_ot_name_id_t nameId;

  /**
      The #hb_ot_var_axis_flags_t flags for the axis
  */
  hb_ot_var_axis_flags_t flags;

  /**
      The minimum value on the variation axis that the font covers
  */
  float minValue;

  /**
      The position on the variation axis corresponding to the font's defaults
  */
  float defaultValue;

  /**
      The maximum value on the variation axis that the font covers
  */
  float maxValue;

  /** */
  uint reserved;
}

/**
    Glyph paint callbacks.
  
  The callbacks assume that the caller maintains a stack
  of current transforms, clips and intermediate surfaces,
  as evidenced by the pairs of push/pop callbacks. The
  push/pop calls will be properly nested, so it is fine
  to store the different kinds of object on a single stack.
  
  Not all callbacks are required for all kinds of glyphs.
  For rendering COLRv0 or non-color outline glyphs, the
  gradient callbacks are not needed, and the composite
  callback only needs to handle simple alpha compositing
  (#HB_PAINT_COMPOSITE_MODE_SRC_OVER).
  
  The paint-image callback is only needed for glyphs
  with image blobs in the CBDT, sbix or SVG tables.
  
  The custom-palette-color callback is only necessary if
  you want to override colors from the font palette with
  custom colors.
*/
struct hb_paint_funcs_t;

/**
    The structure that holds various text properties of an #hb_buffer_t. Can be
  set and retrieved using [harfbuzz.global.bufferSetSegmentProperties] and
  [harfbuzz.global.bufferGetSegmentProperties], respectively.
*/
struct hb_segment_properties_t
{
  /**
      the #hb_direction_t of the buffer, see [harfbuzz.global.bufferSetDirection].
  */
  hb_direction_t direction;

  /**
      the #hb_script_t of the buffer, see [harfbuzz.global.bufferSetScript].
  */
  hb_script_t script;

  /**
      the #hb_language_t of the buffer, see [harfbuzz.global.bufferSetLanguage].
  */
  hb_language_t language;

  /** */
  void* reserved1;

  /** */
  void* reserved2;
}

/**
    Data type for holding a set of integers. #hb_set_t's are
  used to gather and contain glyph IDs, Unicode code
  points, and various other collections of discrete
  values.
*/
struct hb_set_t;

/**
    Data type for holding a shaping plan.
  
  Shape plans contain information about how HarfBuzz will shape a
  particular text segment, based on the segment's properties and the
  capabilities in the font face in use.
  
  Shape plans can be queried about how shaping will perform, given a set
  of specific input parameters (script, language, direction, features,
  etc.).
*/
struct hb_shape_plan_t;

/**
    Data type containing a set of virtual methods used for
  accessing various Unicode character properties.
  
  HarfBuzz provides a default function for each of the
  methods in #hb_unicode_funcs_t. Client programs can implement
  their own replacements for the individual Unicode functions, as
  needed, and replace the default by calling the setter for a
  method.
*/
struct hb_unicode_funcs_t;

/**
    Data structure for holding user-data keys.
*/
struct hb_user_data_key_t
{
  /** */
  char unused;
}

/** */
union hb_var_int_t
{
  /** */
  uint u32;

  /** */
  int i32;

  /** */
  ushort[2] u16;

  /** */
  short[2] i16;

  /** */
  ubyte[4] u8;

  /** */
  byte[4] i8;
}

/** */
union hb_var_num_t
{
  /** */
  float f;

  /** */
  uint u32;

  /** */
  int i32;

  /** */
  ushort[2] u16;

  /** */
  short[2] i16;

  /** */
  ubyte[4] u8;

  /** */
  byte[4] i8;
}

/**
    Data type for holding variation data. Registered OpenType
  variation-axis tags are listed in
  [OpenType Axis Tag Registry](https://docs.microsoft.com/en-us/typography/opentype/spec/dvaraxisreg).
*/
struct hb_variation_t
{
  /**
      The #hb_tag_t tag of the variation-axis name
  */
  hb_tag_t tag;

  /**
      The value of the variation axis
  */
  float value;
}

alias extern(C) hb_bool_t function(hb_buffer_t* buffer, hb_font_t* font, const(char)* message, void* userData) hb_buffer_message_func_t;

alias extern(C) uint function(hb_color_line_t* colorLine, void* colorLineData, uint start, uint* count, hb_color_stop_t* colorStops, void* userData) hb_color_line_get_color_stops_func_t;

alias extern(C) hb_paint_extend_t function(hb_color_line_t* colorLine, void* colorLineData, void* userData) hb_color_line_get_extend_func_t;

alias extern(C) void function(void* userData) hb_destroy_func_t;

alias extern(C) void function(hb_draw_funcs_t* dfuncs, void* drawData, hb_draw_state_t* st, void* userData) hb_draw_close_path_func_t;

alias extern(C) void function(hb_draw_funcs_t* dfuncs, void* drawData, hb_draw_state_t* st, float control1X, float control1Y, float control2X, float control2Y, float toX, float toY, void* userData) hb_draw_cubic_to_func_t;

alias extern(C) void function(hb_draw_funcs_t* dfuncs, void* drawData, hb_draw_state_t* st, float toX, float toY, void* userData) hb_draw_line_to_func_t;

alias extern(C) void function(hb_draw_funcs_t* dfuncs, void* drawData, hb_draw_state_t* st, float toX, float toY, void* userData) hb_draw_move_to_func_t;

alias extern(C) void function(hb_draw_funcs_t* dfuncs, void* drawData, hb_draw_state_t* st, float controlX, float controlY, float toX, float toY, void* userData) hb_draw_quadratic_to_func_t;

alias extern(C) void function(hb_font_t* font, void* fontData, hb_codepoint_t glyph, hb_draw_funcs_t* drawFuncs, void* drawData, void* userData) hb_font_draw_glyph_func_t;

alias extern(C) hb_bool_t function(hb_font_t* font, void* fontData, hb_font_extents_t* extents, void* userData) hb_font_get_font_extents_func_t;

alias extern(C) hb_position_t function(hb_font_t* font, void* fontData, hb_codepoint_t glyph, void* userData) hb_font_get_glyph_advance_func_t;

alias extern(C) void function(hb_font_t* font, void* fontData, uint count, const(hb_codepoint_t)* firstGlyph, uint glyphStride, hb_position_t* firstAdvance, uint advanceStride, void* userData) hb_font_get_glyph_advances_func_t;

alias extern(C) hb_bool_t function(hb_font_t* font, void* fontData, hb_codepoint_t glyph, uint pointIndex, hb_position_t* x, hb_position_t* y, void* userData) hb_font_get_glyph_contour_point_func_t;

alias extern(C) hb_bool_t function(hb_font_t* font, void* fontData, hb_codepoint_t glyph, hb_glyph_extents_t* extents, void* userData) hb_font_get_glyph_extents_func_t;

alias extern(C) hb_bool_t function(hb_font_t* font, void* fontData, const(char)* name, int len, hb_codepoint_t* glyph, void* userData) hb_font_get_glyph_from_name_func_t;

alias extern(C) hb_bool_t function(hb_font_t* font, void* fontData, hb_codepoint_t unicode, hb_codepoint_t variationSelector, hb_codepoint_t* glyph, void* userData) hb_font_get_glyph_func_t;

alias extern(C) hb_position_t function(hb_font_t* font, void* fontData, hb_codepoint_t firstGlyph, hb_codepoint_t secondGlyph, void* userData) hb_font_get_glyph_kerning_func_t;

alias extern(C) hb_bool_t function(hb_font_t* font, void* fontData, hb_codepoint_t glyph, char* name, uint size, void* userData) hb_font_get_glyph_name_func_t;

alias extern(C) hb_bool_t function(hb_font_t* font, void* fontData, hb_codepoint_t glyph, hb_position_t* x, hb_position_t* y, void* userData) hb_font_get_glyph_origin_func_t;

alias extern(C) void function(hb_font_t* font, void* fontData, hb_codepoint_t glyph, hb_draw_funcs_t* drawFuncs, void* drawData, void* userData) hb_font_get_glyph_shape_func_t;

alias extern(C) hb_bool_t function(hb_font_t* font, void* fontData, hb_codepoint_t unicode, hb_codepoint_t* glyph, void* userData) hb_font_get_nominal_glyph_func_t;

alias extern(C) uint function(hb_font_t* font, void* fontData, uint count, const(hb_codepoint_t)* firstUnicode, uint unicodeStride, hb_codepoint_t* firstGlyph, uint glyphStride, void* userData) hb_font_get_nominal_glyphs_func_t;

alias extern(C) hb_bool_t function(hb_font_t* font, void* fontData, hb_codepoint_t unicode, hb_codepoint_t variationSelector, hb_codepoint_t* glyph, void* userData) hb_font_get_variation_glyph_func_t;

alias extern(C) void function(hb_font_t* font, void* fontData, hb_codepoint_t glyph, hb_paint_funcs_t* paintFuncs, void* paintData, uint paletteIndex, hb_color_t foreground, void* userData) hb_font_paint_glyph_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, hb_bool_t isForeground, hb_color_t color, void* userData) hb_paint_color_func_t;

alias extern(C) hb_bool_t function(hb_paint_funcs_t* funcs, void* paintData, hb_codepoint_t glyph, hb_font_t* font, void* userData) hb_paint_color_glyph_func_t;

alias extern(C) hb_bool_t function(hb_paint_funcs_t* funcs, void* paintData, uint colorIndex, hb_color_t* color, void* userData) hb_paint_custom_palette_color_func_t;

alias extern(C) hb_bool_t function(hb_paint_funcs_t* funcs, void* paintData, hb_blob_t* image, uint width, uint height, hb_tag_t format, float slant, hb_glyph_extents_t* extents, void* userData) hb_paint_image_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, hb_color_line_t* colorLine, float x0, float y0, float x1, float y1, float x2, float y2, void* userData) hb_paint_linear_gradient_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, void* userData) hb_paint_pop_clip_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, hb_paint_composite_mode_t mode, void* userData) hb_paint_pop_group_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, void* userData) hb_paint_pop_transform_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, hb_codepoint_t glyph, hb_font_t* font, void* userData) hb_paint_push_clip_glyph_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, float xmin, float ymin, float xmax, float ymax, void* userData) hb_paint_push_clip_rectangle_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, void* userData) hb_paint_push_group_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, float xx, float yx, float xy, float yy, float dx, float dy, void* userData) hb_paint_push_transform_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, hb_color_line_t* colorLine, float x0, float y0, float r0, float x1, float y1, float r1, void* userData) hb_paint_radial_gradient_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, hb_color_line_t* colorLine, float x0, float y0, float startAngle, float endAngle, void* userData) hb_paint_sweep_gradient_func_t;

alias extern(C) hb_blob_t* function(hb_face_t* face, hb_tag_t tag, void* userData) hb_reference_table_func_t;

alias extern(C) hb_unicode_combining_class_t function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode, void* userData) hb_unicode_combining_class_func_t;

alias extern(C) hb_bool_t function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t a, hb_codepoint_t b, hb_codepoint_t* ab, void* userData) hb_unicode_compose_func_t;

alias extern(C) uint function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t u, hb_codepoint_t* decomposed, void* userData) hb_unicode_decompose_compatibility_func_t;

alias extern(C) hb_bool_t function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t ab, hb_codepoint_t* a, hb_codepoint_t* b, void* userData) hb_unicode_decompose_func_t;

alias extern(C) uint function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode, void* userData) hb_unicode_eastasian_width_func_t;

alias extern(C) hb_unicode_general_category_t function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode, void* userData) hb_unicode_general_category_func_t;

alias extern(C) hb_codepoint_t function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode, void* userData) hb_unicode_mirroring_func_t;

alias extern(C) hb_script_t function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode, void* userData) hb_unicode_script_func_t;

