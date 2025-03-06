module harfbuzz.types;

import gid.gid;
import harfbuzz.blob;
import harfbuzz.buffer;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.color_line;
import harfbuzz.color_stop;
import harfbuzz.draw_funcs;
import harfbuzz.draw_state;
import harfbuzz.face;
import harfbuzz.font;
import harfbuzz.paint_funcs;
import harfbuzz.unicode_funcs;


// Aliases

/** */
alias Bool = hb_bool_t;

/** */
alias Codepoint = hb_codepoint_t;

/** */
alias Color = hb_color_t;

/** */
alias FontGetFontHExtentsFunc = harfbuzz.types.FontGetFontExtentsFunc;

/** */
alias FontGetFontVExtentsFunc = harfbuzz.types.FontGetFontExtentsFunc;

/** */
alias FontGetGlyphHAdvanceFunc = harfbuzz.types.FontGetGlyphAdvanceFunc;

/** */
alias FontGetGlyphHKerningFunc = harfbuzz.types.FontGetGlyphKerningFunc;

/** */
alias FontGetGlyphHOriginFunc = harfbuzz.types.FontGetGlyphOriginFunc;

/** */
alias FontGetGlyphVAdvanceFunc = harfbuzz.types.FontGetGlyphAdvanceFunc;

/** */
alias FontGetGlyphVKerningFunc = harfbuzz.types.FontGetGlyphKerningFunc;

/** */
alias FontGetGlyphVOriginFunc = harfbuzz.types.FontGetGlyphOriginFunc;

/** */
alias Mask = hb_mask_t;

/** */
alias OtNameId = hb_ot_name_id_t;

/** */
alias Position = hb_position_t;

/** */
alias Tag = hb_tag_t;

// Structs

/** */
alias AatLayoutFeatureSelectorInfo = hb_aat_layout_feature_selector_info_t;

/** */
alias FontExtents = hb_font_extents_t;

/** */
alias GlyphExtents = hb_glyph_extents_t;

/** */
alias Language = hb_language_t;

/** */
alias OtColorLayer = hb_ot_color_layer_t;

/** */
alias OtMathKernEntry = hb_ot_math_kern_entry_t;

/** */
alias OtVarAxis = hb_ot_var_axis_t;

/** */
alias VarInt = hb_var_int_t;

/** */
alias VarNum = hb_var_num_t;

// Callbacks

/**
    A callback method for #hb_buffer_t. The method gets called with the
  #hb_buffer_t it was set on, the #hb_font_t the buffer is shaped with and a
  message describing what step of the shaping process will be performed.
  Returning `false` from this method will skip this shaping step and move to
  the next one.

  ## Parameters
  $(LIST
    * $(B buffer)       An #hb_buffer_t to work upon
    * $(B font)       The #hb_font_t the buffer is shaped with
    * $(B message)       `NULL`-terminated message passed to the function
  )
  Returns:     `true` to perform the shaping step, `false` to skip it.
*/
alias BufferMessageFunc = harfbuzz.types.Bool delegate(harfbuzz.buffer.Buffer buffer, harfbuzz.font.Font font, string message);

/**
    A virtual method for the #hb_color_line_t to fetch color stops.

  ## Parameters
  $(LIST
    * $(B colorLine)       a #hb_color_line_t object
    * $(B colorLineData)       the data accompanying color_line
    * $(B start)       the index of the first color stop to return
    * $(B colorStops)       Array of #hb_color_stop_t to populate
  )
  Returns:     the total number of color stops in color_line
*/
alias ColorLineGetColorStopsFunc = uint delegate(harfbuzz.color_line.ColorLine colorLine, void* colorLineData, uint start, ref harfbuzz.color_stop.ColorStop[] colorStops);

/**
    A virtual method for the hb_color_line_t to fetches the extend mode.

  ## Parameters
  $(LIST
    * $(B colorLine)       a #hb_color_line_t object
    * $(B colorLineData)       the data accompanying color_line
  )
  Returns:     the extend mode of color_line
*/
alias ColorLineGetExtendFunc = harfbuzz.types.PaintExtend delegate(harfbuzz.color_line.ColorLine colorLine, void* colorLineData);

/**
    A virtual method for destroy user-data callbacks.
*/
alias DestroyFunc = void delegate();

/**
    A virtual method for the #hb_draw_funcs_t to perform a "close-path" draw
  operation.

  ## Parameters
  $(LIST
    * $(B dfuncs)       draw functions object
    * $(B drawData)       The data accompanying the draw functions in [harfbuzz.global.fontDrawGlyph]
    * $(B st)       current draw state
  )
*/
alias DrawClosePathFunc = void delegate(harfbuzz.draw_funcs.DrawFuncs dfuncs, void* drawData, harfbuzz.draw_state.DrawState st);

/**
    A virtual method for the #hb_draw_funcs_t to perform a "cubic-to" draw
  operation.

  ## Parameters
  $(LIST
    * $(B dfuncs)       draw functions object
    * $(B drawData)       The data accompanying the draw functions in [harfbuzz.global.fontDrawGlyph]
    * $(B st)       current draw state
    * $(B control1X)       X component of first control point
    * $(B control1Y)       Y component of first control point
    * $(B control2X)       X component of second control point
    * $(B control2Y)       Y component of second control point
    * $(B toX)       X component of target point
    * $(B toY)       Y component of target point
  )
*/
alias DrawCubicToFunc = void delegate(harfbuzz.draw_funcs.DrawFuncs dfuncs, void* drawData, harfbuzz.draw_state.DrawState st, float control1X, float control1Y, float control2X, float control2Y, float toX, float toY);

/**
    A virtual method for the #hb_draw_funcs_t to perform a "line-to" draw
  operation.

  ## Parameters
  $(LIST
    * $(B dfuncs)       draw functions object
    * $(B drawData)       The data accompanying the draw functions in [harfbuzz.global.fontDrawGlyph]
    * $(B st)       current draw state
    * $(B toX)       X component of target point
    * $(B toY)       Y component of target point
  )
*/
alias DrawLineToFunc = void delegate(harfbuzz.draw_funcs.DrawFuncs dfuncs, void* drawData, harfbuzz.draw_state.DrawState st, float toX, float toY);

/**
    A virtual method for the #hb_draw_funcs_t to perform a "move-to" draw
  operation.

  ## Parameters
  $(LIST
    * $(B dfuncs)       draw functions object
    * $(B drawData)       The data accompanying the draw functions in [harfbuzz.global.fontDrawGlyph]
    * $(B st)       current draw state
    * $(B toX)       X component of target point
    * $(B toY)       Y component of target point
  )
*/
alias DrawMoveToFunc = void delegate(harfbuzz.draw_funcs.DrawFuncs dfuncs, void* drawData, harfbuzz.draw_state.DrawState st, float toX, float toY);

/**
    A virtual method for the #hb_draw_funcs_t to perform a "quadratic-to" draw
  operation.

  ## Parameters
  $(LIST
    * $(B dfuncs)       draw functions object
    * $(B drawData)       The data accompanying the draw functions in [harfbuzz.global.fontDrawGlyph]
    * $(B st)       current draw state
    * $(B controlX)       X component of control point
    * $(B controlY)       Y component of control point
    * $(B toX)       X component of target point
    * $(B toY)       Y component of target point
  )
*/
alias DrawQuadraticToFunc = void delegate(harfbuzz.draw_funcs.DrawFuncs dfuncs, void* drawData, harfbuzz.draw_state.DrawState st, float controlX, float controlY, float toX, float toY);

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.

  ## Parameters
  $(LIST
    * $(B font)       #hb_font_t to work upon
    * $(B fontData)       font user data pointer
    * $(B glyph)       The glyph ID to query
    * $(B drawFuncs)       The draw functions to send the shape data to
    * $(B drawData)       The data accompanying the draw functions
  )
*/
alias FontDrawGlyphFunc = void delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint glyph, harfbuzz.draw_funcs.DrawFuncs drawFuncs, void* drawData);

/**
    This method should retrieve the extents for a font.

  ## Parameters
  $(LIST
    * $(B font)       #hb_font_t to work upon
    * $(B fontData)       font user data pointer
    * $(B extents)       The font extents retrieved
  )
  Returns: 
*/
alias FontGetFontExtentsFunc = harfbuzz.types.Bool delegate(harfbuzz.font.Font font, void* fontData, out harfbuzz.types.FontExtents extents);

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  
  This method should retrieve the advance for a specified glyph. The
  method must return an #hb_position_t.

  ## Parameters
  $(LIST
    * $(B font)       #hb_font_t to work upon
    * $(B fontData)       font user data pointer
    * $(B glyph)       The glyph ID to query
  )
  Returns:     The advance of glyph within font
*/
alias FontGetGlyphAdvanceFunc = harfbuzz.types.Position delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint glyph);

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  
  This method should retrieve the (X,Y) coordinates (in font units) for a
  specified contour point in a glyph. Each coordinate must be returned as
  an #hb_position_t output parameter.

  ## Parameters
  $(LIST
    * $(B font)       #hb_font_t to work upon
    * $(B fontData)       font user data pointer
    * $(B glyph)       The glyph ID to query
    * $(B pointIndex)       The contour-point index to query
    * $(B x)       The X value retrieved for the contour point
    * $(B y)       The Y value retrieved for the contour point
  )
  Returns:     `true` if data found, `false` otherwise
*/
alias FontGetGlyphContourPointFunc = harfbuzz.types.Bool delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint glyph, uint pointIndex, out harfbuzz.types.Position x, out harfbuzz.types.Position y);

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  
  This method should retrieve the extents for a specified glyph. Extents must be
  returned in an #hb_glyph_extents output parameter.

  ## Parameters
  $(LIST
    * $(B font)       #hb_font_t to work upon
    * $(B fontData)       font user data pointer
    * $(B glyph)       The glyph ID to query
    * $(B extents)       The #hb_glyph_extents_t retrieved
  )
  Returns:     `true` if data found, `false` otherwise
*/
alias FontGetGlyphExtentsFunc = harfbuzz.types.Bool delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint glyph, out harfbuzz.types.GlyphExtents extents);

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  
  This method should retrieve the glyph ID that corresponds to a glyph-name
  string.

  ## Parameters
  $(LIST
    * $(B font)       #hb_font_t to work upon
    * $(B fontData)       font user data pointer
    * $(B name)       The name string to query
    * $(B glyph)       The glyph ID retrieved
  )
  Returns:     `true` if data found, `false` otherwise
*/
alias FontGetGlyphFromNameFunc = harfbuzz.types.Bool delegate(harfbuzz.font.Font font, void* fontData, char[] name, out harfbuzz.types.Codepoint glyph);

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  
  This method should retrieve the glyph ID for a specified Unicode code point
  font, with an optional variation selector.

  ## Parameters
  $(LIST
    * $(B font)       #hb_font_t to work upon
    * $(B fontData)       font user data pointer
    * $(B unicode)       The Unicode code point to query
    * $(B variationSelector)       The  variation-selector code point to query
    * $(B glyph)       The glyph ID retrieved
  )
  Returns:     `true` if data found, `false` otherwise
*/
alias FontGetGlyphFunc = harfbuzz.types.Bool delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint unicode, harfbuzz.types.Codepoint variationSelector, out harfbuzz.types.Codepoint glyph);

/**
    This method should retrieve the kerning-adjustment value for a glyph-pair in
  the specified font, for horizontal text segments.

  ## Parameters
  $(LIST
    * $(B font)       #hb_font_t to work upon
    * $(B fontData)       font user data pointer
    * $(B firstGlyph)       The glyph ID of the first glyph in the glyph pair
    * $(B secondGlyph)       The glyph ID of the second glyph in the glyph pair
  )
  Returns: 
*/
alias FontGetGlyphKerningFunc = harfbuzz.types.Position delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint firstGlyph, harfbuzz.types.Codepoint secondGlyph);

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  
  This method should retrieve the glyph name that corresponds to a
  glyph ID. The name should be returned in a string output parameter.

  ## Parameters
  $(LIST
    * $(B font)       #hb_font_t to work upon
    * $(B fontData)       font user data pointer
    * $(B glyph)       The glyph ID to query
    * $(B name)       Name string retrieved for the glyph ID
  )
  Returns:     `true` if data found, `false` otherwise
*/
alias FontGetGlyphNameFunc = harfbuzz.types.Bool delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint glyph, ref char[] name);

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  
  This method should retrieve the (X,Y) coordinates (in font units) of the
  origin for a glyph. Each coordinate must be returned in an #hb_position_t
  output parameter.

  ## Parameters
  $(LIST
    * $(B font)       #hb_font_t to work upon
    * $(B fontData)       font user data pointer
    * $(B glyph)       The glyph ID to query
    * $(B x)       The X coordinate of the origin
    * $(B y)       The Y coordinate of the origin
  )
  Returns:     `true` if data found, `false` otherwise
*/
alias FontGetGlyphOriginFunc = harfbuzz.types.Bool delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint glyph, out harfbuzz.types.Position x, out harfbuzz.types.Position y);

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.

  ## Parameters
  $(LIST
    * $(B font)       #hb_font_t to work upon
    * $(B fontData)       font user data pointer
    * $(B glyph)       The glyph ID to query
    * $(B drawFuncs)       The draw functions to send the shape data to
    * $(B drawData)       The data accompanying the draw functions
  )

  Deprecated:     Use #hb_font_draw_glyph_func_t instead
*/
alias FontGetGlyphShapeFunc = void delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint glyph, harfbuzz.draw_funcs.DrawFuncs drawFuncs, void* drawData);

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  
  This method should retrieve the nominal glyph ID for a specified Unicode code
  point. Glyph IDs must be returned in a #hb_codepoint_t output parameter.

  ## Parameters
  $(LIST
    * $(B font)       #hb_font_t to work upon
    * $(B fontData)       font user data pointer
    * $(B unicode)       The Unicode code point to query
    * $(B glyph)       The glyph ID retrieved
  )
  Returns:     `true` if data found, `false` otherwise
*/
alias FontGetNominalGlyphFunc = harfbuzz.types.Bool delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint unicode, out harfbuzz.types.Codepoint glyph);

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
  
  This method should retrieve the glyph ID for a specified Unicode code point
  followed by a specified Variation Selector code point. Glyph IDs must be
  returned in a #hb_codepoint_t output parameter.

  ## Parameters
  $(LIST
    * $(B font)       #hb_font_t to work upon
    * $(B fontData)       font user data pointer
    * $(B unicode)       The Unicode code point to query
    * $(B variationSelector)       The  variation-selector code point to query
    * $(B glyph)       The glyph ID retrieved
  )
  Returns:     `true` if data found, `false` otherwise
*/
alias FontGetVariationGlyphFunc = harfbuzz.types.Bool delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint unicode, harfbuzz.types.Codepoint variationSelector, out harfbuzz.types.Codepoint glyph);

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.

  ## Parameters
  $(LIST
    * $(B font)       #hb_font_t to work upon
    * $(B fontData)       font user data pointer
    * $(B glyph)       The glyph ID to query
    * $(B paintFuncs)       The paint functions to use
    * $(B paintData)       The data accompanying the paint functions
    * $(B paletteIndex)       The color palette to use
    * $(B foreground)       The foreground color
  )
*/
alias FontPaintGlyphFunc = void delegate(harfbuzz.font.Font font, void* fontData, harfbuzz.types.Codepoint glyph, harfbuzz.paint_funcs.PaintFuncs paintFuncs, void* paintData, uint paletteIndex, harfbuzz.types.Color foreground);

/**
    A virtual method for the #hb_paint_funcs_t to paint a
  color everywhere within the current clip.

  ## Parameters
  $(LIST
    * $(B funcs)       paint functions object
    * $(B paintData)       The data accompanying the paint functions in [harfbuzz.global.fontPaintGlyph]
    * $(B isForeground)       whether the color is the foreground
    * $(B color)       The color to use, unpremultiplied
  )
*/
alias PaintColorFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.types.Bool isForeground, harfbuzz.types.Color color);

/**
    A virtual method for the #hb_paint_funcs_t to render a color glyph by glyph index.

  ## Parameters
  $(LIST
    * $(B funcs)       paint functions object
    * $(B paintData)       The data accompanying the paint functions in [harfbuzz.global.fontPaintGlyph]
    * $(B glyph)       the glyph ID
    * $(B font)       the font
  )
  Returns:     true if the glyph was painted, false otherwise.
*/
alias PaintColorGlyphFunc = harfbuzz.types.Bool delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.types.Codepoint glyph, harfbuzz.font.Font font);

/**
    A virtual method for the #hb_paint_funcs_t to fetch a color from the custom
  color palette.
  
  Custom palette colors override the colors from the fonts selected color
  palette. It is not necessary to override all palette entries; for entries
  that should be taken from the font palette, return `false`.
  
  This function might get called multiple times, but the custom palette is
  expected to remain unchanged for duration of a [harfbuzz.global.fontPaintGlyph] call.

  ## Parameters
  $(LIST
    * $(B funcs)       paint functions object
    * $(B paintData)       The data accompanying the paint functions in [harfbuzz.global.fontPaintGlyph]
    * $(B colorIndex)       the color index
    * $(B color)       fetched color
  )
  Returns:     `true` if found, `false` otherwise
*/
alias PaintCustomPaletteColorFunc = harfbuzz.types.Bool delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, uint colorIndex, out harfbuzz.types.Color color);

/**
    A virtual method for the #hb_paint_funcs_t to paint a glyph image.
  
  This method is called for glyphs with image blobs in the CBDT,
  sbix or SVG tables. The format identifies the kind of data that
  is contained in image. Possible values include #HB_PAINT_IMAGE_FORMAT_PNG,
  #HB_PAINT_IMAGE_FORMAT_SVG and #HB_PAINT_IMAGE_FORMAT_BGRA.
  
  The image dimensions and glyph extents are provided if available,
  and should be used to size and position the image.

  ## Parameters
  $(LIST
    * $(B funcs)       paint functions object
    * $(B paintData)       The data accompanying the paint functions in [harfbuzz.global.fontPaintGlyph]
    * $(B image)       the image data
    * $(B width)       width of the raster image in pixels, or 0
    * $(B height)       height of the raster image in pixels, or 0
    * $(B format)       the image format as a tag
    * $(B slant)       the synthetic slant ratio to be applied to the image during rendering
    * $(B extents)       glyph extents for desired rendering
  )
  Returns:     Whether the operation was successful.
*/
alias PaintImageFunc = harfbuzz.types.Bool delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.blob.Blob image, uint width, uint height, harfbuzz.types.Tag format, float slant, harfbuzz.types.GlyphExtents extents);

/**
    A virtual method for the #hb_paint_funcs_t to paint a linear
  gradient everywhere within the current clip.
  
  The color_line object contains information about the colors of the gradients.
  It is only valid for the duration of the callback, you cannot keep it around.
  
  The coordinates of the points are interpreted according
  to the current transform.
  
  See the OpenType spec [COLR](https://learn.microsoft.com/en-us/typography/opentype/spec/colr)
  section for details on how the points define the direction
  of the gradient, and how to interpret the color_line.

  ## Parameters
  $(LIST
    * $(B funcs)       paint functions object
    * $(B paintData)       The data accompanying the paint functions in [harfbuzz.global.fontPaintGlyph]
    * $(B colorLine)       Color information for the gradient
    * $(B x0)       X coordinate of the first point
    * $(B y0)       Y coordinate of the first point
    * $(B x1)       X coordinate of the second point
    * $(B y1)       Y coordinate of the second point
    * $(B x2)       X coordinate of the third point
    * $(B y2)       Y coordinate of the third point
  )
*/
alias PaintLinearGradientFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.color_line.ColorLine colorLine, float x0, float y0, float x1, float y1, float x2, float y2);

/**
    A virtual method for the #hb_paint_funcs_t to undo
  the effect of a prior call to the #hb_paint_funcs_push_clip_glyph_func_t
  or #hb_paint_funcs_push_clip_rectangle_func_t vfuncs.

  ## Parameters
  $(LIST
    * $(B funcs)       paint functions object
    * $(B paintData)       The data accompanying the paint functions in [harfbuzz.global.fontPaintGlyph]
  )
*/
alias PaintPopClipFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData);

/**
    A virtual method for the #hb_paint_funcs_t to undo
  the effect of a prior call to the #hb_paint_funcs_push_group_func_t
  vfunc.
  
  This call stops the redirection to the intermediate surface,
  and then composites it on the previous surface, using the
  compositing mode passed to this call.

  ## Parameters
  $(LIST
    * $(B funcs)       paint functions object
    * $(B paintData)       The data accompanying the paint functions in [harfbuzz.global.fontPaintGlyph]
    * $(B mode)       the compositing mode to use
  )
*/
alias PaintPopGroupFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.types.PaintCompositeMode mode);

/**
    A virtual method for the #hb_paint_funcs_t to undo
  the effect of a prior call to the #hb_paint_funcs_push_transform_func_t
  vfunc.

  ## Parameters
  $(LIST
    * $(B funcs)       paint functions object
    * $(B paintData)       The data accompanying the paint functions in [harfbuzz.global.fontPaintGlyph]
  )
*/
alias PaintPopTransformFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData);

/**
    A virtual method for the #hb_paint_funcs_t to clip
  subsequent paint calls to the outline of a glyph.
  
  The coordinates of the glyph outline are interpreted according
  to the current transform.
  
  This clip is applied in addition to the current clip,
  and remains in effect until a matching call to
  the #hb_paint_funcs_pop_clip_func_t vfunc.

  ## Parameters
  $(LIST
    * $(B funcs)       paint functions object
    * $(B paintData)       The data accompanying the paint functions in [harfbuzz.global.fontPaintGlyph]
    * $(B glyph)       the glyph ID
    * $(B font)       the font
  )
*/
alias PaintPushClipGlyphFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.types.Codepoint glyph, harfbuzz.font.Font font);

/**
    A virtual method for the #hb_paint_funcs_t to clip
  subsequent paint calls to a rectangle.
  
  The coordinates of the rectangle are interpreted according
  to the current transform.
  
  This clip is applied in addition to the current clip,
  and remains in effect until a matching call to
  the #hb_paint_funcs_pop_clip_func_t vfunc.

  ## Parameters
  $(LIST
    * $(B funcs)       paint functions object
    * $(B paintData)       The data accompanying the paint functions in [harfbuzz.global.fontPaintGlyph]
    * $(B xmin)       min X for the rectangle
    * $(B ymin)       min Y for the rectangle
    * $(B xmax)       max X for the rectangle
    * $(B ymax)       max Y for the rectangle
  )
*/
alias PaintPushClipRectangleFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, float xmin, float ymin, float xmax, float ymax);

/**
    A virtual method for the #hb_paint_funcs_t to use
  an intermediate surface for subsequent paint calls.
  
  The drawing will be redirected to an intermediate surface
  until a matching call to the #hb_paint_funcs_pop_group_func_t
  vfunc.

  ## Parameters
  $(LIST
    * $(B funcs)       paint functions object
    * $(B paintData)       The data accompanying the paint functions in [harfbuzz.global.fontPaintGlyph]
  )
*/
alias PaintPushGroupFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData);

/**
    A virtual method for the #hb_paint_funcs_t to apply
  a transform to subsequent paint calls.
  
  This transform is applied after the current transform,
  and remains in effect until a matching call to
  the #hb_paint_funcs_pop_transform_func_t vfunc.

  ## Parameters
  $(LIST
    * $(B funcs)       paint functions object
    * $(B paintData)       The data accompanying the paint functions in [harfbuzz.global.fontPaintGlyph]
    * $(B xx)       xx component of the transform matrix
    * $(B yx)       yx component of the transform matrix
    * $(B xy)       xy component of the transform matrix
    * $(B yy)       yy component of the transform matrix
    * $(B dx)       dx component of the transform matrix
    * $(B dy)       dy component of the transform matrix
  )
*/
alias PaintPushTransformFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, float xx, float yx, float xy, float yy, float dx, float dy);

/**
    A virtual method for the #hb_paint_funcs_t to paint a radial
  gradient everywhere within the current clip.
  
  The color_line object contains information about the colors of the gradients.
  It is only valid for the duration of the callback, you cannot keep it around.
  
  The coordinates of the points are interpreted according
  to the current transform.
  
  See the OpenType spec [COLR](https://learn.microsoft.com/en-us/typography/opentype/spec/colr)
  section for details on how the points define the direction
  of the gradient, and how to interpret the color_line.

  ## Parameters
  $(LIST
    * $(B funcs)       paint functions object
    * $(B paintData)       The data accompanying the paint functions in [harfbuzz.global.fontPaintGlyph]
    * $(B colorLine)       Color information for the gradient
    * $(B x0)       X coordinate of the first circle's center
    * $(B y0)       Y coordinate of the first circle's center
    * $(B r0)       radius of the first circle
    * $(B x1)       X coordinate of the second circle's center
    * $(B y1)       Y coordinate of the second circle's center
    * $(B r1)       radius of the second circle
  )
*/
alias PaintRadialGradientFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.color_line.ColorLine colorLine, float x0, float y0, float r0, float x1, float y1, float r1);

/**
    A virtual method for the #hb_paint_funcs_t to paint a sweep
  gradient everywhere within the current clip.
  
  The color_line object contains information about the colors of the gradients.
  It is only valid for the duration of the callback, you cannot keep it around.
  
  The coordinates of the points are interpreted according
  to the current transform.
  
  See the OpenType spec [COLR](https://learn.microsoft.com/en-us/typography/opentype/spec/colr)
  section for details on how the points define the direction
  of the gradient, and how to interpret the color_line.

  ## Parameters
  $(LIST
    * $(B funcs)       paint functions object
    * $(B paintData)       The data accompanying the paint functions in [harfbuzz.global.fontPaintGlyph]
    * $(B colorLine)       Color information for the gradient
    * $(B x0)       X coordinate of the circle's center
    * $(B y0)       Y coordinate of the circle's center
    * $(B startAngle)       the start angle, in radians
    * $(B endAngle)       the end angle, in radians
  )
*/
alias PaintSweepGradientFunc = void delegate(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.color_line.ColorLine colorLine, float x0, float y0, float startAngle, float endAngle);

/**
    Callback function for [harfbuzz.global.faceCreateForTables].

  ## Parameters
  $(LIST
    * $(B face)       an #hb_face_t to reference table for
    * $(B tag)       the tag of the table to reference
  )
  Returns:     A pointer to the tag table within face
*/
alias ReferenceTableFunc = harfbuzz.blob.Blob delegate(harfbuzz.face.Face face, harfbuzz.types.Tag tag);

/**
    A virtual method for the #hb_unicode_funcs_t structure.
  
  This method should retrieve the Canonical Combining Class (ccc)
  property for a specified Unicode code point.

  ## Parameters
  $(LIST
    * $(B ufuncs)       A Unicode-functions structure
    * $(B unicode)       The code point to query
  )
  Returns:     The #hb_unicode_combining_class_t of unicode
*/
alias UnicodeCombiningClassFunc = harfbuzz.types.UnicodeCombiningClass delegate(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.Codepoint unicode);

/**
    A virtual method for the #hb_unicode_funcs_t structure.
  
  This method should compose a sequence of two input Unicode code
  points by canonical equivalence, returning the composed code
  point in a #hb_codepoint_t output parameter (if successful).
  The method must return an #hb_bool_t indicating the success
  of the composition.

  ## Parameters
  $(LIST
    * $(B ufuncs)       A Unicode-functions structure
    * $(B a)       The first code point to compose
    * $(B b)       The second code point to compose
    * $(B ab)       The composed code point
  )
  Returns:     `true` is a,b composed, `false` otherwise
*/
alias UnicodeComposeFunc = harfbuzz.types.Bool delegate(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.Codepoint a, harfbuzz.types.Codepoint b, out harfbuzz.types.Codepoint ab);

/**
    A virtual method for the #hb_unicode_funcs_t structure.
  
  This method should decompose an input Unicode code point,
  returning the two decomposed code points in #hb_codepoint_t
  output parameters (if successful). The method must return an
  #hb_bool_t indicating the success of the composition.

  ## Parameters
  $(LIST
    * $(B ufuncs)       A Unicode-functions structure
    * $(B ab)       The code point to decompose
    * $(B a)       The first decomposed code point
    * $(B b)       The second decomposed code point
  )
  Returns:     `true` if ab decomposed, `false` otherwise
*/
alias UnicodeDecomposeFunc = harfbuzz.types.Bool delegate(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.Codepoint ab, out harfbuzz.types.Codepoint a, out harfbuzz.types.Codepoint b);

/**
    A virtual method for the #hb_unicode_funcs_t structure.

  ## Parameters
  $(LIST
    * $(B ufuncs)       A Unicode-functions structure
    * $(B unicode)       The code point to query
  )
  Returns: 
*/
alias UnicodeEastasianWidthFunc = uint delegate(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.Codepoint unicode);

/**
    A virtual method for the #hb_unicode_funcs_t structure.
  
  This method should retrieve the General Category property for
  a specified Unicode code point.

  ## Parameters
  $(LIST
    * $(B ufuncs)       A Unicode-functions structure
    * $(B unicode)       The code point to query
  )
  Returns:     The #hb_unicode_general_category_t of unicode
*/
alias UnicodeGeneralCategoryFunc = harfbuzz.types.UnicodeGeneralCategory delegate(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.Codepoint unicode);

/**
    A virtual method for the #hb_unicode_funcs_t structure.
  
  This method should retrieve the Bi-Directional Mirroring Glyph
  code point for a specified Unicode code point.
  
  <note>Note: If a code point does not have a specified
  Bi-Directional Mirroring Glyph defined, the method should
  return the original code point.</note>

  ## Parameters
  $(LIST
    * $(B ufuncs)       A Unicode-functions structure
    * $(B unicode)       The code point to query
  )
  Returns:     The #hb_codepoint_t of the Mirroring Glyph for unicode
*/
alias UnicodeMirroringFunc = harfbuzz.types.Codepoint delegate(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.Codepoint unicode);

/**
    A virtual method for the #hb_unicode_funcs_t structure.
  
  This method should retrieve the Script property for a
  specified Unicode code point.

  ## Parameters
  $(LIST
    * $(B ufuncs)       A Unicode-functions structure
    * $(B unicode)       The code point to query
  )
  Returns:     The #hb_script_t of unicode
*/
alias UnicodeScriptFunc = harfbuzz.types.Script delegate(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.Codepoint unicode);

/**
    The selectors defined for specifying AAT feature settings.
*/
enum AatLayoutFeatureSelector
{
  /**
      Initial, unset feature selector
  */
  Invalid = 65535,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ALL_TYPOGRAPHIC
  */
  AllTypeFeaturesOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ALL_TYPOGRAPHIC
  */
  AllTypeFeaturesOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  RequiredLigaturesOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  RequiredLigaturesOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  CommonLigaturesOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  CommonLigaturesOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  RareLigaturesOn = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  RareLigaturesOff = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  LogosOn = 6,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  LogosOff = 7,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  RebusPicturesOn = 8,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  RebusPicturesOff = 9,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  DiphthongLigaturesOn = 10,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  DiphthongLigaturesOff = 11,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  SquaredLigaturesOn = 12,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  SquaredLigaturesOff = 13,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  AbbrevSquaredLigaturesOn = 14,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  AbbrevSquaredLigaturesOff = 15,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  SymbolLigaturesOn = 16,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  SymbolLigaturesOff = 17,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  ContextualLigaturesOn = 18,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  ContextualLigaturesOff = 19,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  HistoricalLigaturesOn = 20,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  HistoricalLigaturesOff = 21,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  Unconnected = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  PartiallyConnected = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  Cursive = 2,

  /**
      Deprecated
  */
  UpperAndLowerCase = 0,

  /**
      Deprecated
  */
  AllCaps = 1,

  /**
      Deprecated
  */
  AllLowerCase = 2,

  /**
      Deprecated
  */
  SmallCaps = 3,

  /**
      Deprecated
  */
  InitialCaps = 4,

  /**
      Deprecated
  */
  InitialCapsAndSmallCaps = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_SUBSTITUTION
  */
  SubstituteVerticalFormsOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_SUBSTITUTION
  */
  SubstituteVerticalFormsOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LINGUISTIC_REARRANGEMENT
  */
  LinguisticRearrangementOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LINGUISTIC_REARRANGEMENT
  */
  LinguisticRearrangementOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_SPACING
  */
  MonospacedNumbers = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_SPACING
  */
  ProportionalNumbers = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_SPACING
  */
  ThirdWidthNumbers = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_SPACING
  */
  QuarterWidthNumbers = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
  */
  WordInitialSwashesOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
  */
  WordInitialSwashesOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
  */
  WordFinalSwashesOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
  */
  WordFinalSwashesOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
  */
  LineInitialSwashesOn = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
  */
  LineInitialSwashesOff = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
  */
  LineFinalSwashesOn = 6,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
  */
  LineFinalSwashesOff = 7,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
  */
  NonFinalSwashesOn = 8,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
  */
  NonFinalSwashesOff = 9,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_DIACRITICS_TYPE
  */
  ShowDiacritics = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_DIACRITICS_TYPE
  */
  HideDiacritics = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_DIACRITICS_TYPE
  */
  DecomposeDiacritics = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION
  */
  NormalPosition = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION
  */
  Superiors = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION
  */
  Inferiors = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION
  */
  Ordinals = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION
  */
  ScientificInferiors = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_FRACTIONS
  */
  NoFractions = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_FRACTIONS
  */
  VerticalFractions = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_FRACTIONS
  */
  DiagonalFractions = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_OVERLAPPING_CHARACTERS_TYPE
  */
  PreventOverlapOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_OVERLAPPING_CHARACTERS_TYPE
  */
  PreventOverlapOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  HyphensToEmDashOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  HyphensToEmDashOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  HyphenToEnDashOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  HyphenToEnDashOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  SlashedZeroOn = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  SlashedZeroOff = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  FormInterrobangOn = 6,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  FormInterrobangOff = 7,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  SmartQuotesOn = 8,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  SmartQuotesOff = 9,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  PeriodsToEllipsisOn = 10,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  PeriodsToEllipsisOff = 11,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  HyphenToMinusOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  HyphenToMinusOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  AsteriskToMultiplyOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  AsteriskToMultiplyOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  SlashToDivideOn = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  SlashToDivideOff = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  InequalityLigaturesOn = 6,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  InequalityLigaturesOff = 7,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  ExponentsOn = 8,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  ExponentsOff = 9,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  MathematicalGreekOn = 10,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  MathematicalGreekOff = 11,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
  */
  NoOrnaments = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
  */
  Dingbats = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
  */
  PiCharacters = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
  */
  Fleurons = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
  */
  DecorativeBorders = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
  */
  InternationalSymbols = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
  */
  MathSymbols = 6,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_ALTERNATIVES
  */
  NoAlternates = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE
  */
  DesignLevel1 = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE
  */
  DesignLevel2 = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE
  */
  DesignLevel3 = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE
  */
  DesignLevel4 = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE
  */
  DesignLevel5 = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS
  */
  NoStyleOptions = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS
  */
  DisplayText = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS
  */
  EngravedText = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS
  */
  IlluminatedCaps = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS
  */
  TitlingCaps = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS
  */
  TallCaps = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  TraditionalCharacters = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  SimplifiedCharacters = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  Jis1978Characters = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  Jis1983Characters = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  Jis1990Characters = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  TraditionalAltOne = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  TraditionalAltTwo = 6,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  TraditionalAltThree = 7,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  TraditionalAltFour = 8,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  TraditionalAltFive = 9,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  ExpertCharacters = 10,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  Jis2004Characters = 11,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  HojoCharacters = 12,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  Nlccharacters = 13,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  TraditionalNamesCharacters = 14,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_CASE
  */
  LowerCaseNumbers = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_CASE
  */
  UpperCaseNumbers = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
  */
  ProportionalText = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
  */
  MonospacedText = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
  */
  HalfWidthText = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
  */
  ThirdWidthText = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
  */
  QuarterWidthText = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
  */
  AltProportionalText = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
  */
  AltHalfWidthText = 6,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
  */
  NoTransliteration = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
  */
  HanjaToHangul = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
  */
  HiraganaToKatakana = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
  */
  KatakanaToHiragana = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
  */
  KanaToRomanization = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
  */
  RomanizationToHiragana = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
  */
  RomanizationToKatakana = 6,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
  */
  HanjaToHangulAltOne = 7,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
  */
  HanjaToHangulAltTwo = 8,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
  */
  HanjaToHangulAltThree = 9,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  NoAnnotation = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  BoxAnnotation = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  RoundedBoxAnnotation = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  CircleAnnotation = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  InvertedCircleAnnotation = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  ParenthesisAnnotation = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  PeriodAnnotation = 6,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  RomanNumeralAnnotation = 7,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  DiamondAnnotation = 8,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  InvertedBoxAnnotation = 9,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  InvertedRoundedBoxAnnotation = 10,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_KANA_SPACING_TYPE
  */
  FullWidthKana = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_KANA_SPACING_TYPE
  */
  ProportionalKana = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_SPACING_TYPE
  */
  FullWidthIdeographs = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_SPACING_TYPE
  */
  ProportionalIdeographs = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_SPACING_TYPE
  */
  HalfWidthIdeographs = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE
  */
  CanonicalCompositionOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE
  */
  CanonicalCompositionOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE
  */
  CompatibilityCompositionOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE
  */
  CompatibilityCompositionOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE
  */
  TranscodingCompositionOn = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE
  */
  TranscodingCompositionOff = 5,

  /**
      Deprecated; use #HB_AAT_LAYOUT_FEATURE_SELECTOR_RUBY_KANA_OFF instead
  */
  NoRubyKana = 0,

  /**
      Deprecated; use #HB_AAT_LAYOUT_FEATURE_SELECTOR_RUBY_KANA_ON instead
  */
  RubyKana = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_RUBY_KANA
  */
  RubyKanaOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_RUBY_KANA
  */
  RubyKanaOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE
  */
  NoCjkSymbolAlternatives = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE
  */
  CjkSymbolAltOne = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE
  */
  CjkSymbolAltTwo = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE
  */
  CjkSymbolAltThree = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE
  */
  CjkSymbolAltFour = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE
  */
  CjkSymbolAltFive = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE
  */
  NoIdeographicAlternatives = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE
  */
  IdeographicAltOne = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE
  */
  IdeographicAltTwo = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE
  */
  IdeographicAltThree = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE
  */
  IdeographicAltFour = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE
  */
  IdeographicAltFive = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_VERTICAL_ROMAN_PLACEMENT_TYPE
  */
  CjkVerticalRomanCentered = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_VERTICAL_ROMAN_PLACEMENT_TYPE
  */
  CjkVerticalRomanHbaseline = 1,

  /**
      Deprecated; use #HB_AAT_LAYOUT_FEATURE_SELECTOR_CJK_ITALIC_ROMAN_OFF instead
  */
  NoCjkItalicRoman = 0,

  /**
      Deprecated; use #HB_AAT_LAYOUT_FEATURE_SELECTOR_CJK_ITALIC_ROMAN_ON instead
  */
  CjkItalicRoman = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ITALIC_CJK_ROMAN
  */
  CjkItalicRomanOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ITALIC_CJK_ROMAN
  */
  CjkItalicRomanOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CASE_SENSITIVE_LAYOUT
  */
  CaseSensitiveLayoutOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CASE_SENSITIVE_LAYOUT
  */
  CaseSensitiveLayoutOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CASE_SENSITIVE_LAYOUT
  */
  CaseSensitiveSpacingOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CASE_SENSITIVE_LAYOUT
  */
  CaseSensitiveSpacingOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ALTERNATE_KANA
  */
  AlternateHorizKanaOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ALTERNATE_KANA
  */
  AlternateHorizKanaOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ALTERNATE_KANA
  */
  AlternateVertKanaOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ALTERNATE_KANA
  */
  AlternateVertKanaOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  NoStylisticAlternates = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltOneOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltOneOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltTwoOn = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltTwoOff = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltThreeOn = 6,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltThreeOff = 7,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltFourOn = 8,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltFourOff = 9,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltFiveOn = 10,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltFiveOff = 11,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltSixOn = 12,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltSixOff = 13,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltSevenOn = 14,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltSevenOff = 15,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltEightOn = 16,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltEightOff = 17,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltNineOn = 18,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltNineOff = 19,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltTenOn = 20,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltTenOff = 21,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltElevenOn = 22,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltElevenOff = 23,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltTwelveOn = 24,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltTwelveOff = 25,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltThirteenOn = 26,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltThirteenOff = 27,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltFourteenOn = 28,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltFourteenOff = 29,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltFifteenOn = 30,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltFifteenOff = 31,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltSixteenOn = 32,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltSixteenOff = 33,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltSeventeenOn = 34,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltSeventeenOff = 35,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltEighteenOn = 36,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltEighteenOff = 37,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltNineteenOn = 38,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltNineteenOff = 39,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltTwentyOn = 40,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltTwentyOff = 41,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES
  */
  ContextualAlternatesOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES
  */
  ContextualAlternatesOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES
  */
  SwashAlternatesOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES
  */
  SwashAlternatesOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES
  */
  ContextualSwashAlternatesOn = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES
  */
  ContextualSwashAlternatesOff = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LOWER_CASE
  */
  DefaultLowerCase = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LOWER_CASE
  */
  LowerCaseSmallCaps = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LOWER_CASE
  */
  LowerCasePetiteCaps = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_UPPER_CASE
  */
  DefaultUpperCase = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_UPPER_CASE
  */
  UpperCaseSmallCaps = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_UPPER_CASE
  */
  UpperCasePetiteCaps = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_ROMAN_SPACING_TYPE
  */
  HalfWidthCjkRoman = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_ROMAN_SPACING_TYPE
  */
  ProportionalCjkRoman = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_ROMAN_SPACING_TYPE
  */
  DefaultCjkRoman = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_ROMAN_SPACING_TYPE
  */
  FullWidthCjkRoman = 3,
}

/**
    The possible feature types defined for AAT shaping, from Apple [Font Feature Registry](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html).
*/
enum AatLayoutFeatureType
{
  /**
      Initial, unset feature type
  */
  Invalid = 65535,

  /**
      [All Typographic Features](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type0)
  */
  AllTypographic = 0,

  /**
      [Ligatures](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type1)
  */
  Ligatures = 1,

  /**
      [Cursive Connection](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type2)
  */
  CursiveConnection = 2,

  /**
      [Letter Case](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type3)
  */
  LetterCase = 3,

  /**
      [Vertical Substitution](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type4)
  */
  VerticalSubstitution = 4,

  /**
      [Linguistic Rearrangement](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type5)
  */
  LinguisticRearrangement = 5,

  /**
      [Number Spacing](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type6)
  */
  NumberSpacing = 6,

  /**
      [Smart Swash](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type8)
  */
  SmartSwashType = 8,

  /**
      [Diacritics](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type9)
  */
  DiacriticsType = 9,

  /**
      [Vertical Position](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type10)
  */
  VerticalPosition = 10,

  /**
      [Fractions](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type11)
  */
  Fractions = 11,

  /**
      [Overlapping Characters](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type13)
  */
  OverlappingCharactersType = 13,

  /**
      [Typographic Extras](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type14)
  */
  TypographicExtras = 14,

  /**
      [Mathematical Extras](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type15)
  */
  MathematicalExtras = 15,

  /**
      [Ornament Sets](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type16)
  */
  OrnamentSetsType = 16,

  /**
      [Character Alternatives](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type17)
  */
  CharacterAlternatives = 17,

  /**
      [Design Complexity](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type18)
  */
  DesignComplexityType = 18,

  /**
      [Style Options](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type19)
  */
  StyleOptions = 19,

  /**
      [Character Shape](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type20)
  */
  CharacterShape = 20,

  /**
      [Number Case](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type21)
  */
  NumberCase = 21,

  /**
      [Text Spacing](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type22)
  */
  TextSpacing = 22,

  /**
      [Transliteration](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type23)
  */
  Transliteration = 23,

  /**
      [Annotation](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type24)
  */
  AnnotationType = 24,

  /**
      [Kana Spacing](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type25)
  */
  KanaSpacingType = 25,

  /**
      [Ideographic Spacing](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type26)
  */
  IdeographicSpacingType = 26,

  /**
      [Unicode Decomposition](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type27)
  */
  UnicodeDecompositionType = 27,

  /**
      [Ruby Kana](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type28)
  */
  RubyKana = 28,

  /**
      [CJK Symbol Alternatives](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type29)
  */
  CjkSymbolAlternativesType = 29,

  /**
      [Ideographic Alternatives](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type30)
  */
  IdeographicAlternativesType = 30,

  /**
      [CJK Vertical Roman Placement](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type31)
  */
  CjkVerticalRomanPlacementType = 31,

  /**
      [Italic CJK Roman](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type32)
  */
  ItalicCjkRoman = 32,

  /**
      [Case Sensitive Layout](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type33)
  */
  CaseSensitiveLayout = 33,

  /**
      [Alternate Kana](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type34)
  */
  AlternateKana = 34,

  /**
      [Stylistic Alternatives](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type35)
  */
  StylisticAlternatives = 35,

  /**
      [Contextual Alternatives](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type36)
  */
  ContextualAlternatives = 36,

  /**
      [Lower Case](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type37)
  */
  LowerCase = 37,

  /**
      [Upper Case](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type38)
  */
  UpperCase = 38,

  /**
      [Language Tag](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type39)
  */
  LanguageTagType = 39,

  /**
      [CJK Roman Spacing](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type103)
  */
  CjkRomanSpacingType = 103,
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
enum BufferClusterLevel
{
  /**
      Return cluster values grouped by graphemes into
      monotone order.
  */
  MonotoneGraphemes = 0,

  /**
      Return cluster values grouped into monotone order.
  */
  MonotoneCharacters = 1,

  /**
      Don't group cluster values.
  */
  Characters = 2,

  /**
      Default cluster level,
      equal to @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES.
  */
  Default = 0,
}

/**
    The type of #hb_buffer_t contents.
*/
enum BufferContentType
{
  /**
      Initial value for new buffer.
  */
  Invalid = 0,

  /**
      The buffer contains input characters (before shaping).
  */
  Unicode = 1,

  /**
      The buffer contains output glyphs (after shaping).
  */
  Glyphs = 2,
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
enum BufferDiffFlags : uint
{
  /**
      equal buffers.
  */
  Equal = 0,

  /**
      buffers with different
        #hb_buffer_content_type_t.
  */
  ContentTypeMismatch = 1,

  /**
      buffers with differing length.
  */
  LengthMismatch = 2,

  /**
      `.notdef` glyph is present in the
        reference buffer.
  */
  NotdefPresent = 4,

  /**
      dotted circle glyph is present
        in the reference buffer.
  */
  DottedCirclePresent = 8,

  /**
      difference in #hb_glyph_info_t.codepoint
  */
  CodepointMismatch = 16,

  /**
      difference in #hb_glyph_info_t.cluster
  */
  ClusterMismatch = 32,

  /**
      difference in #hb_glyph_flags_t.
  */
  GlyphFlagsMismatch = 64,

  /**
      difference in #hb_glyph_position_t.
  */
  PositionMismatch = 128,
}

/**
    Flags for #hb_buffer_t.
*/
enum BufferFlags : uint
{
  /**
      the default buffer flag.
  */
  Default = 0,

  /**
      flag indicating that special handling of the beginning
                         of text paragraph can be applied to this buffer. Should usually
                         be set, unless you are passing to the buffer only part
                         of the text without the full context.
  */
  Bot = 1,

  /**
      flag indicating that special handling of the end of text
                         paragraph can be applied to this buffer, similar to
                         @HB_BUFFER_FLAG_BOT.
  */
  Eot = 2,

  /**
      flag indication that character with Default_Ignorable
                         Unicode property should use the corresponding glyph
                         from the font, instead of hiding them (done by
                         replacing them with the space glyph and zeroing the
                         advance width.)  This flag takes precedence over
                         @HB_BUFFER_FLAG_REMOVE_DEFAULT_IGNORABLES.
  */
  PreserveDefaultIgnorables = 4,

  /**
      flag indication that character with Default_Ignorable
                         Unicode property should be removed from glyph string
                         instead of hiding them (done by replacing them with the
                         space glyph and zeroing the advance width.)
                         @HB_BUFFER_FLAG_PRESERVE_DEFAULT_IGNORABLES takes
                         precedence over this flag. Since: 1.8.0
  */
  RemoveDefaultIgnorables = 8,

  /**
      flag indicating that a dotted circle should
                         not be inserted in the rendering of incorrect
                         character sequences (such at <0905 093E>). Since: 2.4.0
  */
  DoNotInsertDottedCircle = 16,

  /**
      flag indicating that the [harfbuzz.global.shape] call and its variants
                         should perform various verification processes on the results
                         of the shaping operation on the buffer.  If the verification
                         fails, then either a buffer message is sent, if a message
                         handler is installed on the buffer, or a message is written
                         to standard error.  In either case, the shaping result might
                         be modified to show the failed output. Since: 3.4.0
  */
  Verify = 32,

  /**
      flag indicating that the @HB_GLYPH_FLAG_UNSAFE_TO_CONCAT
                         glyph-flag should be produced by the shaper. By default
                         it will not be produced since it incurs a cost. Since: 4.0.0
  */
  ProduceUnsafeToConcat = 64,

  /**
      flag indicating that the @HB_GLYPH_FLAG_SAFE_TO_INSERT_TATWEEL
                         glyph-flag should be produced by the shaper. By default
                         it will not be produced. Since: 5.1.0
  */
  ProduceSafeToInsertTatweel = 128,

  /**
      All currently defined flags: Since: 4.4.0
  */
  Defined = 255,
}

/**
    Flags that control what glyph information are serialized in [harfbuzz.global.bufferSerializeGlyphs].
*/
enum BufferSerializeFlags : uint
{
  /**
      serialize glyph names, clusters and positions.
  */
  Default = 0,

  /**
      do not serialize glyph cluster.
  */
  NoClusters = 1,

  /**
      do not serialize glyph position information.
  */
  NoPositions = 2,

  /**
      do no serialize glyph name.
  */
  NoGlyphNames = 4,

  /**
      serialize glyph extents.
  */
  GlyphExtents = 8,

  /**
      serialize glyph flags. Since: 1.5.0
  */
  GlyphFlags = 16,

  /**
      do not serialize glyph advances,
     glyph offsets will reflect absolute glyph positions. Since: 1.8.0
  */
  NoAdvances = 32,

  /**
      All currently defined flags. Since: 4.4.0
  */
  Defined = 63,
}

/**
    The buffer serialization and de-serialization format used in
  [harfbuzz.global.bufferSerializeGlyphs] and [harfbuzz.global.bufferDeserializeGlyphs].
*/
enum BufferSerializeFormat
{
  /**
      a human-readable, plain text format.
  */
  Text = 1413830740,

  /**
      a machine-readable JSON format.
  */
  Json = 1246973774,

  /**
      invalid format.
  */
  Invalid = 0,
}

/**
    The direction of a text segment or buffer.
  
  A segment can also be tested for horizontal or vertical
  orientation (irrespective of specific direction) with
  HB_DIRECTION_IS_HORIZONTAL() or HB_DIRECTION_IS_VERTICAL().
*/
enum Direction
{
  /**
      Initial, unset direction.
  */
  Invalid = 0,

  /**
      Text is set horizontally from left to right.
  */
  Ltr = 4,

  /**
      Text is set horizontally from right to left.
  */
  Rtl = 5,

  /**
      Text is set vertically from top to bottom.
  */
  Ttb = 6,

  /**
      Text is set vertically from bottom to top.
  */
  Btt = 7,
}

/**
    Flags for #hb_glyph_info_t.
*/
enum GlyphFlags : uint
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
  UnsafeToBreak = 1,

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
  UnsafeToConcat = 2,

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
  SafeToInsertTatweel = 4,

  /**
      All the currently defined flags.
  */
  Defined = 7,
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
enum MemoryMode
{
  /**
      HarfBuzz immediately makes a copy of the data.
  */
  Duplicate = 0,

  /**
      HarfBuzz client will never modify the data,
        and HarfBuzz will never modify the data.
  */
  Readonly = 1,

  /**
      HarfBuzz client made a copy of the data solely
        for HarfBuzz, so HarfBuzz may modify the data.
  */
  Writable = 2,

  /**
      See above
  */
  ReadonlyMayMakeWritable = 3,
}

/**
    Flags that describe the properties of color palette.
*/
enum OtColorPaletteFlags : uint
{
  /**
      Default indicating that there is nothing special
      to note about a color palette.
  */
  Default = 0,

  /**
      Flag indicating that the color
      palette is appropriate to use when displaying the font on a light background such as white.
  */
  UsableWithLightBackground = 1,

  /**
      Flag indicating that the color
      palette is appropriate to use when displaying the font on a dark background such as black.
  */
  UsableWithDarkBackground = 2,
}

/**
    Baseline tags from [Baseline Tags](https://docs.microsoft.com/en-us/typography/opentype/spec/baselinetags) registry.
*/
enum OtLayoutBaselineTag
{
  /**
      The baseline used by alphabetic scripts such as Latin, Cyrillic and Greek.
    In vertical writing mode, the alphabetic baseline for characters rotated 90 degrees clockwise.
    (This would not apply to alphabetic characters that remain upright in vertical writing mode, since these
    characters are not rotated.)
  */
  Roman = 1919905134,

  /**
      The hanging baseline. In horizontal direction, this is the horizontal
    line from which syllables seem, to hang in Tibetan and other similar scripts. In vertical writing mode,
    for Tibetan (or some other similar script) characters rotated 90 degrees clockwise.
  */
  Hanging = 1751215719,

  /**
      Ideographic character face bottom or left edge,
    if the direction is horizontal or vertical, respectively.
  */
  IdeoFaceBottomOrLeft = 1768121954,

  /**
      Ideographic character face top or right edge,
    if the direction is horizontal or vertical, respectively.
  */
  IdeoFaceTopOrRight = 1768121972,

  /**
      The center of the ideographic character face. Since: 4.0.0
  */
  IdeoFaceCentral = 1231251043,

  /**
      Ideographic em-box bottom or left edge,
    if the direction is horizontal or vertical, respectively.
  */
  IdeoEmboxBottomOrLeft = 1768187247,

  /**
      Ideographic em-box top or right edge baseline,
  */
  IdeoEmboxTopOrRight = 1768191088,

  /**
      The center of the ideographic em-box. Since: 4.0.0
    if the direction is horizontal or vertical, respectively.
  */
  IdeoEmboxCentral = 1231315813,

  /**
      The baseline about which mathematical characters are centered.
    In vertical writing mode when mathematical characters rotated 90 degrees clockwise, are centered.
  */
  Math = 1835103336,
}

/**
    The GDEF classes defined for glyphs.
*/
enum OtLayoutGlyphClass
{
  /**
      Glyphs not matching the other classifications
  */
  Unclassified = 0,

  /**
      Spacing, single characters, capable of accepting marks
  */
  BaseGlyph = 1,

  /**
      Glyphs that represent ligation of multiple characters
  */
  Ligature = 2,

  /**
      Non-spacing, combining glyphs that represent marks
  */
  Mark = 3,

  /**
      Spacing glyphs that represent part of a single character
  */
  Component = 4,
}

/**
    The 'MATH' table constants, refer to
  [OpenType documentation](https://docs.microsoft.com/en-us/typography/opentype/spec/math#mathconstants-table)
  For more explanations.
*/
enum OtMathConstant
{
  /**
      scriptPercentScaleDown
  */
  ScriptPercentScaleDown = 0,

  /**
      scriptScriptPercentScaleDown
  */
  ScriptScriptPercentScaleDown = 1,

  /**
      delimitedSubFormulaMinHeight
  */
  DelimitedSubFormulaMinHeight = 2,

  /**
      displayOperatorMinHeight
  */
  DisplayOperatorMinHeight = 3,

  /**
      mathLeading
  */
  MathLeading = 4,

  /**
      axisHeight
  */
  AxisHeight = 5,

  /**
      accentBaseHeight
  */
  AccentBaseHeight = 6,

  /**
      flattenedAccentBaseHeight
  */
  FlattenedAccentBaseHeight = 7,

  /**
      subscriptShiftDown
  */
  SubscriptShiftDown = 8,

  /**
      subscriptTopMax
  */
  SubscriptTopMax = 9,

  /**
      subscriptBaselineDropMin
  */
  SubscriptBaselineDropMin = 10,

  /**
      superscriptShiftUp
  */
  SuperscriptShiftUp = 11,

  /**
      superscriptShiftUpCramped
  */
  SuperscriptShiftUpCramped = 12,

  /**
      superscriptBottomMin
  */
  SuperscriptBottomMin = 13,

  /**
      superscriptBaselineDropMax
  */
  SuperscriptBaselineDropMax = 14,

  /**
      subSuperscriptGapMin
  */
  SubSuperscriptGapMin = 15,

  /**
      superscriptBottomMaxWithSubscript
  */
  SuperscriptBottomMaxWithSubscript = 16,

  /**
      spaceAfterScript
  */
  SpaceAfterScript = 17,

  /**
      upperLimitGapMin
  */
  UpperLimitGapMin = 18,

  /**
      upperLimitBaselineRiseMin
  */
  UpperLimitBaselineRiseMin = 19,

  /**
      lowerLimitGapMin
  */
  LowerLimitGapMin = 20,

  /**
      lowerLimitBaselineDropMin
  */
  LowerLimitBaselineDropMin = 21,

  /**
      stackTopShiftUp
  */
  StackTopShiftUp = 22,

  /**
      stackTopDisplayStyleShiftUp
  */
  StackTopDisplayStyleShiftUp = 23,

  /**
      stackBottomShiftDown
  */
  StackBottomShiftDown = 24,

  /**
      stackBottomDisplayStyleShiftDown
  */
  StackBottomDisplayStyleShiftDown = 25,

  /**
      stackGapMin
  */
  StackGapMin = 26,

  /**
      stackDisplayStyleGapMin
  */
  StackDisplayStyleGapMin = 27,

  /**
      stretchStackTopShiftUp
  */
  StretchStackTopShiftUp = 28,

  /**
      stretchStackBottomShiftDown
  */
  StretchStackBottomShiftDown = 29,

  /**
      stretchStackGapAboveMin
  */
  StretchStackGapAboveMin = 30,

  /**
      stretchStackGapBelowMin
  */
  StretchStackGapBelowMin = 31,

  /**
      fractionNumeratorShiftUp
  */
  FractionNumeratorShiftUp = 32,

  /**
      fractionNumeratorDisplayStyleShiftUp
  */
  FractionNumeratorDisplayStyleShiftUp = 33,

  /**
      fractionDenominatorShiftDown
  */
  FractionDenominatorShiftDown = 34,

  /**
      fractionDenominatorDisplayStyleShiftDown
  */
  FractionDenominatorDisplayStyleShiftDown = 35,

  /**
      fractionNumeratorGapMin
  */
  FractionNumeratorGapMin = 36,

  /**
      fractionNumDisplayStyleGapMin
  */
  FractionNumDisplayStyleGapMin = 37,

  /**
      fractionRuleThickness
  */
  FractionRuleThickness = 38,

  /**
      fractionDenominatorGapMin
  */
  FractionDenominatorGapMin = 39,

  /**
      fractionDenomDisplayStyleGapMin
  */
  FractionDenomDisplayStyleGapMin = 40,

  /**
      skewedFractionHorizontalGap
  */
  SkewedFractionHorizontalGap = 41,

  /**
      skewedFractionVerticalGap
  */
  SkewedFractionVerticalGap = 42,

  /**
      overbarVerticalGap
  */
  OverbarVerticalGap = 43,

  /**
      overbarRuleThickness
  */
  OverbarRuleThickness = 44,

  /**
      overbarExtraAscender
  */
  OverbarExtraAscender = 45,

  /**
      underbarVerticalGap
  */
  UnderbarVerticalGap = 46,

  /**
      underbarRuleThickness
  */
  UnderbarRuleThickness = 47,

  /**
      underbarExtraDescender
  */
  UnderbarExtraDescender = 48,

  /**
      radicalVerticalGap
  */
  RadicalVerticalGap = 49,

  /**
      radicalDisplayStyleVerticalGap
  */
  RadicalDisplayStyleVerticalGap = 50,

  /**
      radicalRuleThickness
  */
  RadicalRuleThickness = 51,

  /**
      radicalExtraAscender
  */
  RadicalExtraAscender = 52,

  /**
      radicalKernBeforeDegree
  */
  RadicalKernBeforeDegree = 53,

  /**
      radicalKernAfterDegree
  */
  RadicalKernAfterDegree = 54,

  /**
      radicalDegreeBottomRaisePercent
  */
  RadicalDegreeBottomRaisePercent = 55,
}

/**
    Flags for math glyph parts.
*/
enum OtMathGlyphPartFlags : uint
{
  /**
      This is an extender glyph part that
    can be repeated to reach the desired length.
  */
  Extender = 1,
}

/**
    The math kerning-table types defined for the four corners
  of a glyph.
*/
enum OtMathKern
{
  /**
      The top right corner of the glyph.
  */
  TopRight = 0,

  /**
      The top left corner of the glyph.
  */
  TopLeft = 1,

  /**
      The bottom right corner of the glyph.
  */
  BottomRight = 2,

  /**
      The bottom left corner of the glyph.
  */
  BottomLeft = 3,
}

/**
    Known metadata tags from https://docs.microsoft.com/en-us/typography/opentype/spec/meta
*/
enum OtMetaTag
{
  /**
      Design languages. Text, using only
    Basic Latin (ASCII) characters. Indicates languages and/or scripts
    for the user audiences that the font was primarily designed for.
  */
  DesignLanguages = 1684827751,

  /**
      Supported languages. Text, using
    only Basic Latin (ASCII) characters. Indicates languages and/or scripts
    that the font is declared to be capable of supporting.
  */
  SupportedLanguages = 1936485991,
}

/**
    Metric tags corresponding to [MVAR Value
  Tags](https://docs.microsoft.com/en-us/typography/opentype/spec/mvar#value-tags)
*/
enum OtMetricsTag
{
  /**
      horizontal ascender.
  */
  HorizontalAscender = 1751216995,

  /**
      horizontal descender.
  */
  HorizontalDescender = 1751413603,

  /**
      horizontal line gap.
  */
  HorizontalLineGap = 1751934832,

  /**
      horizontal clipping ascent.
  */
  HorizontalClippingAscent = 1751346273,

  /**
      horizontal clipping descent.
  */
  HorizontalClippingDescent = 1751346276,

  /**
      vertical ascender.
  */
  VerticalAscender = 1986098019,

  /**
      vertical descender.
  */
  VerticalDescender = 1986294627,

  /**
      vertical line gap.
  */
  VerticalLineGap = 1986815856,

  /**
      horizontal caret rise.
  */
  HorizontalCaretRise = 1751347827,

  /**
      horizontal caret run.
  */
  HorizontalCaretRun = 1751347822,

  /**
      horizontal caret offset.
  */
  HorizontalCaretOffset = 1751347046,

  /**
      vertical caret rise.
  */
  VerticalCaretRise = 1986228851,

  /**
      vertical caret run.
  */
  VerticalCaretRun = 1986228846,

  /**
      vertical caret offset.
  */
  VerticalCaretOffset = 1986228070,

  /**
      x height.
  */
  XHeight = 2020108148,

  /**
      cap height.
  */
  CapHeight = 1668311156,

  /**
      subscript em x size.
  */
  SubscriptEmXSize = 1935833203,

  /**
      subscript em y size.
  */
  SubscriptEmYSize = 1935833459,

  /**
      subscript em x offset.
  */
  SubscriptEmXOffset = 1935833199,

  /**
      subscript em y offset.
  */
  SubscriptEmYOffset = 1935833455,

  /**
      superscript em x size.
  */
  SuperscriptEmXSize = 1936750707,

  /**
      superscript em y size.
  */
  SuperscriptEmYSize = 1936750963,

  /**
      superscript em x offset.
  */
  SuperscriptEmXOffset = 1936750703,

  /**
      superscript em y offset.
  */
  SuperscriptEmYOffset = 1936750959,

  /**
      strikeout size.
  */
  StrikeoutSize = 1937011315,

  /**
      strikeout offset.
  */
  StrikeoutOffset = 1937011311,

  /**
      underline size.
  */
  UnderlineSize = 1970168947,

  /**
      underline offset.
  */
  UnderlineOffset = 1970168943,
}

/**
    An enum type representing the pre-defined name IDs.
  
  For more information on these fields, see the
  [OpenType spec](https://docs.microsoft.com/en-us/typography/opentype/spec/name#name-ids).
*/
enum OtNameIdPredefined
{
  /**
      Copyright notice
  */
  Copyright = 0,

  /**
      Font Family name
  */
  FontFamily = 1,

  /**
      Font Subfamily name
  */
  FontSubfamily = 2,

  /**
      Unique font identifier
  */
  UniqueId = 3,

  /**
      Full font name that reflects
    all family and relevant subfamily descriptors
  */
  FullName = 4,

  /**
      Version string
  */
  VersionString = 5,

  /**
      PostScript name for the font
  */
  PostscriptName = 6,

  /**
      Trademark
  */
  Trademark = 7,

  /**
      Manufacturer Name
  */
  Manufacturer = 8,

  /**
      Designer
  */
  Designer = 9,

  /**
      Description
  */
  Description = 10,

  /**
      URL of font vendor
  */
  VendorUrl = 11,

  /**
      URL of typeface designer
  */
  DesignerUrl = 12,

  /**
      License Description
  */
  License = 13,

  /**
      URL where additional licensing
    information can be found
  */
  LicenseUrl = 14,

  /**
      Typographic Family name
  */
  TypographicFamily = 16,

  /**
      Typographic Subfamily name
  */
  TypographicSubfamily = 17,

  /**
      Compatible Full Name for MacOS
  */
  MacFullName = 18,

  /**
      Sample text
  */
  SampleText = 19,

  /**
      PostScript CID findfont name
  */
  CidFindfontName = 20,

  /**
      WWS Family Name
  */
  WwsFamily = 21,

  /**
      WWS Subfamily Name
  */
  WwsSubfamily = 22,

  /**
      Light Background Palette
  */
  LightBackground = 23,

  /**
      Dark Background Palette
  */
  DarkBackground = 24,

  /**
      Variations PostScript Name Prefix
  */
  VariationsPsPrefix = 25,

  /**
      Value to represent a nonexistent name ID.
  */
  Invalid = 65535,
}

/**
    Flags for #hb_ot_var_axis_info_t.
*/
enum OtVarAxisFlags : uint
{
  /**
      The axis should not be exposed directly in user interfaces.
  */
  Hidden = 1,
}

/**
    The values of this enumeration describe the compositing modes
  that can be used when combining temporary redirected drawing
  with the backdrop.
  
  See the OpenType spec [COLR](https://learn.microsoft.com/en-us/typography/opentype/spec/colr)
  section for details.
*/
enum PaintCompositeMode
{
  /**
      clear destination layer (bounded)
  */
  Clear = 0,

  /**
      replace destination layer (bounded)
  */
  Src = 1,

  /**
      ignore the source
  */
  Dest = 2,

  /**
      draw source layer on top of destination layer
    (bounded)
  */
  SrcOver = 3,

  /**
      draw destination on top of source
  */
  DestOver = 4,

  /**
      draw source where there was destination content
    (unbounded)
  */
  SrcIn = 5,

  /**
      leave destination only where there was
    source content (unbounded)
  */
  DestIn = 6,

  /**
      draw source where there was no destination
    content (unbounded)
  */
  SrcOut = 7,

  /**
      leave destination only where there was no
    source content
  */
  DestOut = 8,

  /**
      draw source on top of destination content and
    only there
  */
  SrcAtop = 9,

  /**
      leave destination on top of source content
    and only there (unbounded)
  */
  DestAtop = 10,

  /**
      source and destination are shown where there is only
    one of them
  */
  Xor = 11,

  /**
      source and destination layers are accumulated
  */
  Plus = 12,

  /**
      source and destination are complemented and
    multiplied. This causes the result to be at least as light as the lighter
    inputs.
  */
  Screen = 13,

  /**
      multiplies or screens, depending on the
    lightness of the destination color.
  */
  Overlay = 14,

  /**
      replaces the destination with the source if it
    is darker, otherwise keeps the source.
  */
  Darken = 15,

  /**
      replaces the destination with the source if it
    is lighter, otherwise keeps the source.
  */
  Lighten = 16,

  /**
      brightens the destination color to reflect
    the source color.
  */
  ColorDodge = 17,

  /**
      darkens the destination color to reflect
    the source color.
  */
  ColorBurn = 18,

  /**
      Multiplies or screens, dependent on source
    color.
  */
  HardLight = 19,

  /**
      Darkens or lightens, dependent on source
    color.
  */
  SoftLight = 20,

  /**
      Takes the difference of the source and
    destination color.
  */
  Difference = 21,

  /**
      Produces an effect similar to difference, but
    with lower contrast.
  */
  Exclusion = 22,

  /**
      source and destination layers are multiplied.
    This causes the result to be at least as dark as the darker inputs.
  */
  Multiply = 23,

  /**
      Creates a color with the hue of the source
    and the saturation and luminosity of the target.
  */
  HslHue = 24,

  /**
      Creates a color with the saturation
    of the source and the hue and luminosity of the target. Painting with
    this mode onto a gray area produces no change.
  */
  HslSaturation = 25,

  /**
      Creates a color with the hue and saturation
    of the source and the luminosity of the target. This preserves the gray
    levels of the target and is useful for coloring monochrome images or
    tinting color images.
  */
  HslColor = 26,

  /**
      Creates a color with the luminosity of
    the source and the hue and saturation of the target. This produces an
    inverse effect to @HB_PAINT_COMPOSITE_MODE_HSL_COLOR.
  */
  HslLuminosity = 27,
}

/**
    The values of this enumeration determine how color values
  outside the minimum and maximum defined offset on a #hb_color_line_t
  are determined.
  
  See the OpenType spec [COLR](https://learn.microsoft.com/en-us/typography/opentype/spec/colr)
  section for details.
*/
enum PaintExtend
{
  /**
      Outside the defined interval,
      the color of the closest color stop is used.
  */
  Pad = 0,

  /**
      The color line is repeated over
      repeated multiples of the defined interval
  */
  Repeat = 1,

  /**
      The color line is repeated over
         repeated intervals, as for the repeat mode.
         However, in each repeated interval, the ordering of
         color stops is the reverse of the adjacent interval.
  */
  Reflect = 2,
}

/**
    Data type for scripts. Each #hb_script_t's value is an #hb_tag_t corresponding
  to the four-letter values defined by [ISO 15924](https://unicode.org/iso15924/).
  
  See also the Script (sc) property of the Unicode Character Database.
*/
enum Script
{
  /**
      `Zyyy`
  */
  Common = 1517910393,

  /**
      `Zinh`
  */
  Inherited = 1516858984,

  /**
      `Zzzz`
  */
  Unknown = 1517976186,

  /**
      `Arab`
  */
  Arabic = 1098015074,

  /**
      `Armn`
  */
  Armenian = 1098018158,

  /**
      `Beng`
  */
  Bengali = 1113943655,

  /**
      `Cyrl`
  */
  Cyrillic = 1132032620,

  /**
      `Deva`
  */
  Devanagari = 1147500129,

  /**
      `Geor`
  */
  Georgian = 1197830002,

  /**
      `Grek`
  */
  Greek = 1198679403,

  /**
      `Gujr`
  */
  Gujarati = 1198877298,

  /**
      `Guru`
  */
  Gurmukhi = 1198879349,

  /**
      `Hang`
  */
  Hangul = 1214344807,

  /**
      `Hani`
  */
  Han = 1214344809,

  /**
      `Hebr`
  */
  Hebrew = 1214603890,

  /**
      `Hira`
  */
  Hiragana = 1214870113,

  /**
      `Knda`
  */
  Kannada = 1265525857,

  /**
      `Kana`
  */
  Katakana = 1264676449,

  /**
      `Laoo`
  */
  Lao = 1281453935,

  /**
      `Latn`
  */
  Latin = 1281455214,

  /**
      `Mlym`
  */
  Malayalam = 1298954605,

  /**
      `Orya`
  */
  Oriya = 1332902241,

  /**
      `Taml`
  */
  Tamil = 1415671148,

  /**
      `Telu`
  */
  Telugu = 1415933045,

  /**
      `Thai`
  */
  Thai = 1416126825,

  /**
      `Tibt`
  */
  Tibetan = 1416192628,

  /**
      `Bopo`
  */
  Bopomofo = 1114599535,

  /**
      `Brai`
  */
  Braille = 1114792297,

  /**
      `Cans`
  */
  CanadianSyllabics = 1130458739,

  /**
      `Cher`
  */
  Cherokee = 1130915186,

  /**
      `Ethi`
  */
  Ethiopic = 1165256809,

  /**
      `Khmr`
  */
  Khmer = 1265134962,

  /**
      `Mong`
  */
  Mongolian = 1299148391,

  /**
      `Mymr`
  */
  Myanmar = 1299803506,

  /**
      `Ogam`
  */
  Ogham = 1332175213,

  /**
      `Runr`
  */
  Runic = 1383427698,

  /**
      `Sinh`
  */
  Sinhala = 1399418472,

  /**
      `Syrc`
  */
  Syriac = 1400468067,

  /**
      `Thaa`
  */
  Thaana = 1416126817,

  /**
      `Yiii`
  */
  Yi = 1500080489,

  /**
      `Dsrt`
  */
  Deseret = 1148416628,

  /**
      `Goth`
  */
  Gothic = 1198486632,

  /**
      `Ital`
  */
  OldItalic = 1232363884,

  /**
      `Buhd`
  */
  Buhid = 1114990692,

  /**
      `Hano`
  */
  Hanunoo = 1214344815,

  /**
      `Tglg`
  */
  Tagalog = 1416064103,

  /**
      `Tagb`
  */
  Tagbanwa = 1415669602,

  /**
      `Cprt`
  */
  Cypriot = 1131442804,

  /**
      `Limb`
  */
  Limbu = 1281977698,

  /**
      `Linb`
  */
  LinearB = 1281977954,

  /**
      `Osma`
  */
  Osmanya = 1332964705,

  /**
      `Shaw`
  */
  Shavian = 1399349623,

  /**
      `Tale`
  */
  TaiLe = 1415670885,

  /**
      `Ugar`
  */
  Ugaritic = 1432838514,

  /**
      `Bugi`
  */
  Buginese = 1114990441,

  /**
      `Copt`
  */
  Coptic = 1131376756,

  /**
      `Glag`
  */
  Glagolitic = 1198285159,

  /**
      `Khar`
  */
  Kharoshthi = 1265131890,

  /**
      `Talu`
  */
  NewTaiLue = 1415670901,

  /**
      `Xpeo`
  */
  OldPersian = 1483761007,

  /**
      `Sylo`
  */
  SylotiNagri = 1400466543,

  /**
      `Tfng`
  */
  Tifinagh = 1415999079,

  /**
      `Bali`
  */
  Balinese = 1113681001,

  /**
      `Xsux`
  */
  Cuneiform = 1483961720,

  /**
      `Nkoo`
  */
  Nko = 1315663727,

  /**
      `Phag`
  */
  PhagsPa = 1349017959,

  /**
      `Phnx`
  */
  Phoenician = 1349021304,

  /**
      `Cari`
  */
  Carian = 1130459753,

  /**
      `Cham`
  */
  Cham = 1130914157,

  /**
      `Kali`
  */
  KayahLi = 1264675945,

  /**
      `Lepc`
  */
  Lepcha = 1281716323,

  /**
      `Lyci`
  */
  Lycian = 1283023721,

  /**
      `Lydi`
  */
  Lydian = 1283023977,

  /**
      `Olck`
  */
  OlChiki = 1332503403,

  /**
      `Rjng`
  */
  Rejang = 1382706791,

  /**
      `Saur`
  */
  Saurashtra = 1398895986,

  /**
      `Sund`
  */
  Sundanese = 1400204900,

  /**
      `Vaii`
  */
  Vai = 1449224553,

  /**
      `Avst`
  */
  Avestan = 1098281844,

  /**
      `Bamu`
  */
  Bamum = 1113681269,

  /**
      `Egyp`
  */
  EgyptianHieroglyphs = 1164409200,

  /**
      `Armi`
  */
  ImperialAramaic = 1098018153,

  /**
      `Phli`
  */
  InscriptionalPahlavi = 1349020777,

  /**
      `Prti`
  */
  InscriptionalParthian = 1349678185,

  /**
      `Java`
  */
  Javanese = 1247901281,

  /**
      `Kthi`
  */
  Kaithi = 1265920105,

  /**
      `Lisu`
  */
  Lisu = 1281979253,

  /**
      `Mtei`
  */
  MeeteiMayek = 1299473769,

  /**
      `Sarb`
  */
  OldSouthArabian = 1398895202,

  /**
      `Orkh`
  */
  OldTurkic = 1332898664,

  /**
      `Samr`
  */
  Samaritan = 1398893938,

  /**
      `Lana`
  */
  TaiTham = 1281453665,

  /**
      `Tavt`
  */
  TaiViet = 1415673460,

  /**
      `Batk`
  */
  Batak = 1113683051,

  /**
      `Brah`
  */
  Brahmi = 1114792296,

  /**
      `Mand`
  */
  Mandaic = 1298230884,

  /**
      `Cakm`
  */
  Chakma = 1130457965,

  /**
      `Merc`
  */
  MeroiticCursive = 1298494051,

  /**
      `Mero`
  */
  MeroiticHieroglyphs = 1298494063,

  /**
      `Plrd`
  */
  Miao = 1349284452,

  /**
      `Shrd`
  */
  Sharada = 1399353956,

  /**
      `Sora`
  */
  SoraSompeng = 1399812705,

  /**
      `Takr`
  */
  Takri = 1415670642,

  /**
      `Bass`, Since: 0.9.30
  */
  BassaVah = 1113682803,

  /**
      `Aghb`, Since: 0.9.30
  */
  CaucasianAlbanian = 1097295970,

  /**
      `Dupl`, Since: 0.9.30
  */
  Duployan = 1148547180,

  /**
      `Elba`, Since: 0.9.30
  */
  Elbasan = 1164730977,

  /**
      `Gran`, Since: 0.9.30
  */
  Grantha = 1198678382,

  /**
      `Khoj`, Since: 0.9.30
  */
  Khojki = 1265135466,

  /**
      `Sind`, Since: 0.9.30
  */
  Khudawadi = 1399418468,

  /**
      `Lina`, Since: 0.9.30
  */
  LinearA = 1281977953,

  /**
      `Mahj`, Since: 0.9.30
  */
  Mahajani = 1298229354,

  /**
      `Mani`, Since: 0.9.30
  */
  Manichaean = 1298230889,

  /**
      `Mend`, Since: 0.9.30
  */
  MendeKikakui = 1298493028,

  /**
      `Modi`, Since: 0.9.30
  */
  Modi = 1299145833,

  /**
      `Mroo`, Since: 0.9.30
  */
  Mro = 1299345263,

  /**
      `Nbat`, Since: 0.9.30
  */
  Nabataean = 1315070324,

  /**
      `Narb`, Since: 0.9.30
  */
  OldNorthArabian = 1315009122,

  /**
      `Perm`, Since: 0.9.30
  */
  OldPermic = 1348825709,

  /**
      `Hmng`, Since: 0.9.30
  */
  PahawhHmong = 1215131239,

  /**
      `Palm`, Since: 0.9.30
  */
  Palmyrene = 1348562029,

  /**
      `Pauc`, Since: 0.9.30
  */
  PauCinHau = 1348564323,

  /**
      `Phlp`, Since: 0.9.30
  */
  PsalterPahlavi = 1349020784,

  /**
      `Sidd`, Since: 0.9.30
  */
  Siddham = 1399415908,

  /**
      `Tirh`, Since: 0.9.30
  */
  Tirhuta = 1416196712,

  /**
      `Wara`, Since: 0.9.30
  */
  WarangCiti = 1466004065,

  /**
      `Ahom`, Since: 0.9.30
  */
  Ahom = 1097363309,

  /**
      `Hluw`, Since: 0.9.30
  */
  AnatolianHieroglyphs = 1215067511,

  /**
      `Hatr`, Since: 0.9.30
  */
  Hatran = 1214346354,

  /**
      `Mult`, Since: 0.9.30
  */
  Multani = 1299541108,

  /**
      `Hung`, Since: 0.9.30
  */
  OldHungarian = 1215655527,

  /**
      `Sgnw`, Since: 0.9.30
  */
  Signwriting = 1399287415,

  /**
      `Adlm`, Since: 1.3.0
  */
  Adlam = 1097100397,

  /**
      `Bhks`, Since: 1.3.0
  */
  Bhaiksuki = 1114139507,

  /**
      `Marc`, Since: 1.3.0
  */
  Marchen = 1298231907,

  /**
      `Osge`, Since: 1.3.0
  */
  Osage = 1332963173,

  /**
      `Tang`, Since: 1.3.0
  */
  Tangut = 1415671399,

  /**
      `Newa`, Since: 1.3.0
  */
  Newa = 1315272545,

  /**
      `Gonm`, Since: 1.6.0
  */
  MasaramGondi = 1198485101,

  /**
      `Nshu`, Since: 1.6.0
  */
  Nushu = 1316186229,

  /**
      `Soyo`, Since: 1.6.0
  */
  Soyombo = 1399814511,

  /**
      `Zanb`, Since: 1.6.0
  */
  ZanabazarSquare = 1516334690,

  /**
      `Dogr`, Since: 1.8.0
  */
  Dogra = 1148151666,

  /**
      `Gong`, Since: 1.8.0
  */
  GunjalaGondi = 1198485095,

  /**
      `Rohg`, Since: 1.8.0
  */
  HanifiRohingya = 1383032935,

  /**
      `Maka`, Since: 1.8.0
  */
  Makasar = 1298230113,

  /**
      `Medf`, Since: 1.8.0
  */
  Medefaidrin = 1298490470,

  /**
      `Sogo`, Since: 1.8.0
  */
  OldSogdian = 1399809903,

  /**
      `Sogd`, Since: 1.8.0
  */
  Sogdian = 1399809892,

  /**
      `Elym`, Since: 2.4.0
  */
  Elymaic = 1164736877,

  /**
      `Nand`, Since: 2.4.0
  */
  Nandinagari = 1315008100,

  /**
      `Hmnp`, Since: 2.4.0
  */
  NyiakengPuachueHmong = 1215131248,

  /**
      `Wcho`, Since: 2.4.0
  */
  Wancho = 1466132591,

  /**
      `Chrs`, Since: 2.6.7
  */
  Chorasmian = 1130918515,

  /**
      `Diak`, Since: 2.6.7
  */
  DivesAkuru = 1147756907,

  /**
      `Kits`, Since: 2.6.7
  */
  KhitanSmallScript = 1265202291,

  /**
      `Yezi`, Since: 2.6.7
  */
  Yezidi = 1499822697,

  /**
      `Cpmn`, Since: 3.0.0
  */
  CyproMinoan = 1131441518,

  /**
      `Ougr`, Since: 3.0.0
  */
  OldUyghur = 1333094258,

  /**
      `Tnsa`, Since: 3.0.0
  */
  Tangsa = 1416524641,

  /**
      `Toto`, Since: 3.0.0
  */
  Toto = 1416590447,

  /**
      `Vith`, Since: 3.0.0
  */
  Vithkuqi = 1449751656,

  /**
      `Zmth`, Since: 3.4.0
  */
  Math = 1517122664,

  /**
      `Kawi`, Since: 5.2.0
  */
  Kawi = 1264678761,

  /**
      `Nagm`, Since: 5.2.0
  */
  NagMundari = 1315006317,

  /**
      No script set
  */
  Invalid = 0,
}

/**
    Defined by [OpenType Design-Variation Axis Tag Registry](https://docs.microsoft.com/en-us/typography/opentype/spec/dvaraxisreg).
*/
enum StyleTag
{
  /**
      Used to vary between non-italic and italic.
    A value of 0 can be interpreted as "Roman" (non-italic); a value of 1 can
    be interpreted as (fully) italic.
  */
  Italic = 1769234796,

  /**
      Used to vary design to suit different text sizes.
    Non-zero. Values can be interpreted as text size, in points.
  */
  OpticalSize = 1869640570,

  /**
      Used to vary between upright and slanted text. Values
    must be greater than -90 and less than +90. Values can be interpreted as
    the angle, in counter-clockwise degrees, of oblique slant from whatever the
    designer considers to be upright for that font design. Typical right-leaning
    Italic fonts have a negative slant angle (typically around -12)
  */
  SlantAngle = 1936486004,

  /**
      same as @HB_STYLE_TAG_SLANT_ANGLE expression as ratio.
    Typical right-leaning Italic fonts have a positive slant ratio (typically around 0.2)
  */
  SlantRatio = 1399615092,

  /**
      Used to vary width of text from narrower to wider.
    Non-zero. Values can be interpreted as a percentage of whatever the font
    designer considers “normal width” for that font design.
  */
  Width = 2003072104,

  /**
      Used to vary stroke thicknesses or other design details
    to give variation from lighter to blacker. Values can be interpreted in direct
    comparison to values for usWeightClass in the OS/2 table,
    or the CSS font-weight property.
  */
  Weight = 2003265652,
}

/**
    Data type for the Canonical_Combining_Class (ccc) property
  from the Unicode Character Database.
  
  <note>Note: newer versions of Unicode may add new values.
  Client programs should be ready to handle any value in the 0..254 range
  being returned from [harfbuzz.global.unicodeCombiningClass].</note>
*/
enum UnicodeCombiningClass
{
  /**
      Spacing and enclosing marks; also many vowel and consonant signs, even if nonspacing
  */
  NotReordered = 0,

  /**
      Marks which overlay a base letter or symbol
  */
  Overlay = 1,

  /**
      Diacritic nukta marks in Brahmi-derived scripts
  */
  Nukta = 7,

  /**
      Hiragana/Katakana voicing marks
  */
  KanaVoicing = 8,

  /**
      Viramas
  */
  Virama = 9,

  /**
      [Hebrew]
  */
  Ccc10 = 10,

  /**
      [Hebrew]
  */
  Ccc11 = 11,

  /**
      [Hebrew]
  */
  Ccc12 = 12,

  /**
      [Hebrew]
  */
  Ccc13 = 13,

  /**
      [Hebrew]
  */
  Ccc14 = 14,

  /**
      [Hebrew]
  */
  Ccc15 = 15,

  /**
      [Hebrew]
  */
  Ccc16 = 16,

  /**
      [Hebrew]
  */
  Ccc17 = 17,

  /**
      [Hebrew]
  */
  Ccc18 = 18,

  /**
      [Hebrew]
  */
  Ccc19 = 19,

  /**
      [Hebrew]
  */
  Ccc20 = 20,

  /**
      [Hebrew]
  */
  Ccc21 = 21,

  /**
      [Hebrew]
  */
  Ccc22 = 22,

  /**
      [Hebrew]
  */
  Ccc23 = 23,

  /**
      [Hebrew]
  */
  Ccc24 = 24,

  /**
      [Hebrew]
  */
  Ccc25 = 25,

  /**
      [Hebrew]
  */
  Ccc26 = 26,

  /**
      [Arabic]
  */
  Ccc27 = 27,

  /**
      [Arabic]
  */
  Ccc28 = 28,

  /**
      [Arabic]
  */
  Ccc29 = 29,

  /**
      [Arabic]
  */
  Ccc30 = 30,

  /**
      [Arabic]
  */
  Ccc31 = 31,

  /**
      [Arabic]
  */
  Ccc32 = 32,

  /**
      [Arabic]
  */
  Ccc33 = 33,

  /**
      [Arabic]
  */
  Ccc34 = 34,

  /**
      [Arabic]
  */
  Ccc35 = 35,

  /**
      [Syriac]
  */
  Ccc36 = 36,

  /**
      [Telugu]
  */
  Ccc84 = 84,

  /**
      [Telugu]
  */
  Ccc91 = 91,

  /**
      [Thai]
  */
  Ccc103 = 103,

  /**
      [Thai]
  */
  Ccc107 = 107,

  /**
      [Lao]
  */
  Ccc118 = 118,

  /**
      [Lao]
  */
  Ccc122 = 122,

  /**
      [Tibetan]
  */
  Ccc129 = 129,

  /**
      [Tibetan]
  */
  Ccc130 = 130,

  /**
      [Tibetan] Since: 7.2.0
  */
  Ccc132 = 132,

  /**
      Marks attached at the bottom left
  */
  AttachedBelowLeft = 200,

  /**
      Marks attached directly below
  */
  AttachedBelow = 202,

  /**
      Marks attached directly above
  */
  AttachedAbove = 214,

  /**
      Marks attached at the top right
  */
  AttachedAboveRight = 216,

  /**
      Distinct marks at the bottom left
  */
  BelowLeft = 218,

  /**
      Distinct marks directly below
  */
  Below = 220,

  /**
      Distinct marks at the bottom right
  */
  BelowRight = 222,

  /**
      Distinct marks to the left
  */
  Left = 224,

  /**
      Distinct marks to the right
  */
  Right = 226,

  /**
      Distinct marks at the top left
  */
  AboveLeft = 228,

  /**
      Distinct marks directly above
  */
  Above = 230,

  /**
      Distinct marks at the top right
  */
  AboveRight = 232,

  /**
      Distinct marks subtending two bases
  */
  DoubleBelow = 233,

  /**
      Distinct marks extending above two bases
  */
  DoubleAbove = 234,

  /**
      Greek iota subscript only
  */
  IotaSubscript = 240,

  /**
      Invalid combining class
  */
  Invalid = 255,
}

/**
    Data type for the "General_Category" (gc) property from
  the Unicode Character Database.
*/
enum UnicodeGeneralCategory
{
  /**
      [Cc]
  */
  Control = 0,

  /**
      [Cf]
  */
  Format = 1,

  /**
      [Cn]
  */
  Unassigned = 2,

  /**
      [Co]
  */
  PrivateUse = 3,

  /**
      [Cs]
  */
  Surrogate = 4,

  /**
      [Ll]
  */
  LowercaseLetter = 5,

  /**
      [Lm]
  */
  ModifierLetter = 6,

  /**
      [Lo]
  */
  OtherLetter = 7,

  /**
      [Lt]
  */
  TitlecaseLetter = 8,

  /**
      [Lu]
  */
  UppercaseLetter = 9,

  /**
      [Mc]
  */
  SpacingMark = 10,

  /**
      [Me]
  */
  EnclosingMark = 11,

  /**
      [Mn]
  */
  NonSpacingMark = 12,

  /**
      [Nd]
  */
  DecimalNumber = 13,

  /**
      [Nl]
  */
  LetterNumber = 14,

  /**
      [No]
  */
  OtherNumber = 15,

  /**
      [Pc]
  */
  ConnectPunctuation = 16,

  /**
      [Pd]
  */
  DashPunctuation = 17,

  /**
      [Pe]
  */
  ClosePunctuation = 18,

  /**
      [Pf]
  */
  FinalPunctuation = 19,

  /**
      [Pi]
  */
  InitialPunctuation = 20,

  /**
      [Po]
  */
  OtherPunctuation = 21,

  /**
      [Ps]
  */
  OpenPunctuation = 22,

  /**
      [Sc]
  */
  CurrencySymbol = 23,

  /**
      [Sk]
  */
  ModifierSymbol = 24,

  /**
      [Sm]
  */
  MathSymbol = 25,

  /**
      [So]
  */
  OtherSymbol = 26,

  /**
      [Zl]
  */
  LineSeparator = 27,

  /**
      [Zp]
  */
  ParagraphSeparator = 28,

  /**
      [Zs]
  */
  SpaceSeparator = 29,
}

/**
    Used when getting or setting AAT feature selectors. Indicates that
  there is no selector index corresponding to the selector of interest.
*/
enum AAT_LAYOUT_NO_SELECTOR_INDEX = 65535;

/**
    The default code point for replacing invalid characters in a given encoding.
  Set to U+FFFD REPLACEMENT CHARACTER.
*/
enum BUFFER_REPLACEMENT_CODEPOINT_DEFAULT = 65533;

/**
    Unused #hb_codepoint_t value.
*/
enum CODEPOINT_INVALID = 4294967295;

/**
    Special setting for #hb_feature_t.start to apply the feature from the start
  of the buffer.
*/
enum FEATURE_GLOBAL_START = 0;

/**
    Constant signifying that a font does not have any
  named-instance index set.  This is the default of
  a font.
*/
enum FONT_NO_VAR_NAMED_INSTANCE = 4294967295;

/**
    An unset #hb_language_t.
*/
enum LANGUAGE_INVALID = 0;

/**
    Special value for language index indicating default or unsupported language.
*/
enum OT_LAYOUT_DEFAULT_LANGUAGE_INDEX = 65535;

/**
    Special value for feature index indicating unsupported feature.
*/
enum OT_LAYOUT_NO_FEATURE_INDEX = 65535;

/**
    Special value for script index indicating unsupported script.
*/
enum OT_LAYOUT_NO_SCRIPT_INDEX = 65535;

/**
    Special value for variations index indicating unsupported variation.
*/
enum OT_LAYOUT_NO_VARIATIONS_INDEX = 4294967295;

/**
    Maximum number of OpenType tags that can correspond to a give #hb_language_t.
*/
enum OT_MAX_TAGS_PER_LANGUAGE = 3;

/**
    Maximum number of OpenType tags that can correspond to a give #hb_script_t.
*/
enum OT_MAX_TAGS_PER_SCRIPT = 3;

/**
    Do not use.
*/
enum OT_VAR_NO_AXIS_INDEX = 4294967295;

/**
    [Tibetan]
*/
enum UNICODE_COMBINING_CLASS_CCC133 = 133;

/**
    Maximum valid Unicode code point.
*/
enum UNICODE_MAX = 1114111;

/**
    See Unicode 6.1 for details on the maximum decomposition length.
*/
enum UNICODE_MAX_DECOMPOSITION_LEN = 19;

/** */
enum VERSION_MAJOR = 8;

/** */
enum VERSION_MICRO = 0;

/** */
enum VERSION_MINOR = 3;

/** */
enum VERSION_STRING = "8.3.0";
