module gtksource.print_compositor;

import gid.gid;
import gobject.object;
import gtk.print_context;
import gtk.text_tag;
import gtk.types;
import gtksource.buffer;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;
import gtksource.view;

/**
 * Compose a class@Buffer for printing.
 * The `GtkSourcePrintCompositor` object is used to compose a class@Buffer
 * for printing. You can set various configuration options to customize the
 * printed output. `GtkSourcePrintCompositor` is designed to be used with the
 * high-level printing API of gtk+, i.e. [gtk.print_operation.PrintOperation].
 * The margins specified in this object are the layout margins: they define the
 * blank space bordering the printed area of the pages. They must not be
 * confused with the "print margins", i.e. the parts of the page that the
 * printer cannot print on, defined in the [gtk.page_setup.PageSetup] objects. If the
 * specified layout margins are smaller than the "print margins", the latter
 * ones are used as a fallback by the `GtkSourcePrintCompositor` object, so that
 * the printed area is not clipped.
 */
class PrintCompositor : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_print_compositor_get_type != &gidSymbolNotFound ? gtk_source_print_compositor_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new print compositor that can be used to print buffer.
   * Params:
   *   buffer = the #GtkSourceBuffer to print.
   * Returns: a new print compositor object.
   */
  this(gtksource.buffer.Buffer buffer)
  {
    GtkSourcePrintCompositor* _cretval;
    _cretval = gtk_source_print_compositor_new(buffer ? cast(GtkSourceBuffer*)buffer.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Creates a new print compositor that can be used to print the buffer
   * associated with view.
   * This constructor sets some configuration properties to make the
   * printed output match view as much as possible.  The properties set are
   * propertyPrintCompositor:tab-width, propertyPrintCompositor:highlight-syntax,
   * propertyPrintCompositor:wrap-mode, propertyPrintCompositor:body-font-name and
   * propertyPrintCompositor:print-line-numbers.
   * Params:
   *   view = a #GtkSourceView to get configuration from.
   * Returns: a new print compositor object.
   */
  static gtksource.print_compositor.PrintCompositor newFromView(gtksource.view.View view)
  {
    GtkSourcePrintCompositor* _cretval;
    _cretval = gtk_source_print_compositor_new_from_view(view ? cast(GtkSourceView*)view.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtksource.print_compositor.PrintCompositor)(cast(GtkSourcePrintCompositor*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Draw page page_nr for printing on the the Cairo context encapsuled in context.
   * This method has been designed to be called in the handler of the signalGtk.PrintOperation::draw_page signal
   * as shown in the following example:
   * ```c
   * // Signal handler for the GtkPrintOperation::draw_page signal
   * static void
   * draw_page $(LPAREN)GtkPrintOperation *operation,
   * GtkPrintContext   *context,
   * gint               page_nr,
   * gpointer           user_data$(RPAREN)
   * {
   * GtkSourcePrintCompositor *compositor;
   * compositor \= GTK_SOURCE_PRINT_COMPOSITOR $(LPAREN)user_data$(RPAREN);
   * gtk_source_print_compositor_draw_page $(LPAREN)compositor,
   * context,
   * page_nr$(RPAREN);
   * }
   * ```
   * Params:
   *   context = the #GtkPrintContext encapsulating the context information that is required when
   *     drawing the page for printing.
   *   pageNr = the number of the page to print.
   */
  void drawPage(gtk.print_context.PrintContext context, int pageNr)
  {
    gtk_source_print_compositor_draw_page(cast(GtkSourcePrintCompositor*)cPtr, context ? cast(GtkPrintContext*)context.cPtr(No.Dup) : null, pageNr);
  }

  /**
   * Returns the name of the font used to print the text body.
   * The returned string must be freed with [glib.global.gfree].
   * Returns: a new string containing the name of the font used to print the
   *   text body.
   */
  string getBodyFontName()
  {
    char* _cretval;
    _cretval = gtk_source_print_compositor_get_body_font_name(cast(GtkSourcePrintCompositor*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Gets the bottom margin in units of unit.
   * Params:
   *   unit = the unit for the return value.
   * Returns: the bottom margin.
   */
  double getBottomMargin(gtk.types.Unit unit)
  {
    double _retval;
    _retval = gtk_source_print_compositor_get_bottom_margin(cast(GtkSourcePrintCompositor*)cPtr, unit);
    return _retval;
  }

  /**
   * Gets the classBuffer associated with the compositor.
   * The returned object reference is owned by the compositor object and
   * should not be unreferenced.
   * Returns: the #GtkSourceBuffer associated with the compositor.
   */
  gtksource.buffer.Buffer getBuffer()
  {
    GtkSourceBuffer* _cretval;
    _cretval = gtk_source_print_compositor_get_buffer(cast(GtkSourcePrintCompositor*)cPtr);
    auto _retval = ObjectG.getDObject!(gtksource.buffer.Buffer)(cast(GtkSourceBuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns the name of the font used to print the page footer.
   * The returned string must be freed with [glib.global.gfree].
   * Returns: a new string containing the name of the font used to print
   *   the page footer.
   */
  string getFooterFontName()
  {
    char* _cretval;
    _cretval = gtk_source_print_compositor_get_footer_font_name(cast(GtkSourcePrintCompositor*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Returns the name of the font used to print the page header.
   * The returned string must be freed with [glib.global.gfree].
   * Returns: a new string containing the name of the font used to print
   *   the page header.
   */
  string getHeaderFontName()
  {
    char* _cretval;
    _cretval = gtk_source_print_compositor_get_header_font_name(cast(GtkSourcePrintCompositor*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Determines whether the printed text will be highlighted according to the
   * buffer rules.
   * Note that highlighting will happen only if the buffer to print has highlighting activated.
   * Returns: %TRUE if the printed output will be highlighted.
   */
  bool getHighlightSyntax()
  {
    bool _retval;
    _retval = gtk_source_print_compositor_get_highlight_syntax(cast(GtkSourcePrintCompositor*)cPtr);
    return _retval;
  }

  /**
   * Gets the left margin in units of unit.
   * Params:
   *   unit = the unit for the return value.
   * Returns: the left margin
   */
  double getLeftMargin(gtk.types.Unit unit)
  {
    double _retval;
    _retval = gtk_source_print_compositor_get_left_margin(cast(GtkSourcePrintCompositor*)cPtr, unit);
    return _retval;
  }

  /**
   * Returns the name of the font used to print line numbers on the left margin.
   * The returned string must be freed with [glib.global.gfree].
   * Returns: a new string containing the name of the font used to print
   *   line numbers on the left margin.
   */
  string getLineNumbersFontName()
  {
    char* _cretval;
    _cretval = gtk_source_print_compositor_get_line_numbers_font_name(cast(GtkSourcePrintCompositor*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Returns the number of pages in the document or <code>-1</code> if the
   * document has not been completely paginated.
   * Returns: the number of pages in the document or <code>-1</code> if the
   *   document has not been completely paginated.
   */
  int getNPages()
  {
    int _retval;
    _retval = gtk_source_print_compositor_get_n_pages(cast(GtkSourcePrintCompositor*)cPtr);
    return _retval;
  }

  /**
   * Returns the current fraction of the document pagination that has been completed.
   * Returns: a fraction from 0.0 to 1.0 inclusive.
   */
  double getPaginationProgress()
  {
    double _retval;
    _retval = gtk_source_print_compositor_get_pagination_progress(cast(GtkSourcePrintCompositor*)cPtr);
    return _retval;
  }

  /**
   * Determines if a footer is set to be printed for each page.
   * A footer will be printed if this function returns %TRUE
   * **and** some format strings have been specified
   * with [gtksource.print_compositor.PrintCompositor.setFooterFormat].
   * Returns: %TRUE if the footer is set to be printed.
   */
  bool getPrintFooter()
  {
    bool _retval;
    _retval = gtk_source_print_compositor_get_print_footer(cast(GtkSourcePrintCompositor*)cPtr);
    return _retval;
  }

  /**
   * Determines if a header is set to be printed for each page.
   * A header will be printed if this function returns %TRUE
   * **and** some format strings have been specified
   * with [gtksource.print_compositor.PrintCompositor.setHeaderFormat].
   * Returns: %TRUE if the header is set to be printed.
   */
  bool getPrintHeader()
  {
    bool _retval;
    _retval = gtk_source_print_compositor_get_print_header(cast(GtkSourcePrintCompositor*)cPtr);
    return _retval;
  }

  /**
   * Returns the interval used for line number printing.
   * If the value is 0, no line numbers will be printed. The default value is
   * 1 $(LPAREN)i.e. numbers printed in all lines$(RPAREN).
   * Returns: the interval of printed line numbers.
   */
  uint getPrintLineNumbers()
  {
    uint _retval;
    _retval = gtk_source_print_compositor_get_print_line_numbers(cast(GtkSourcePrintCompositor*)cPtr);
    return _retval;
  }

  /**
   * Gets the right margin in units of unit.
   * Params:
   *   unit = the unit for the return value.
   * Returns: the right margin.
   */
  double getRightMargin(gtk.types.Unit unit)
  {
    double _retval;
    _retval = gtk_source_print_compositor_get_right_margin(cast(GtkSourcePrintCompositor*)cPtr, unit);
    return _retval;
  }

  /**
   * Returns the width of tabulation in characters for printed text.
   * Returns: width of tab.
   */
  uint getTabWidth()
  {
    uint _retval;
    _retval = gtk_source_print_compositor_get_tab_width(cast(GtkSourcePrintCompositor*)cPtr);
    return _retval;
  }

  /**
   * Gets the top margin in units of unit.
   * Params:
   *   unit = the unit for the return value.
   * Returns: the top margin.
   */
  double getTopMargin(gtk.types.Unit unit)
  {
    double _retval;
    _retval = gtk_source_print_compositor_get_top_margin(cast(GtkSourcePrintCompositor*)cPtr, unit);
    return _retval;
  }

  /**
   * Gets the line wrapping mode for the printed text.
   * Returns: the line wrap mode.
   */
  gtk.types.WrapMode getWrapMode()
  {
    GtkWrapMode _cretval;
    _cretval = gtk_source_print_compositor_get_wrap_mode(cast(GtkSourcePrintCompositor*)cPtr);
    gtk.types.WrapMode _retval = cast(gtk.types.WrapMode)_cretval;
    return _retval;
  }

  /**
   * Specifies a tag whose style should be ignored when compositing the
   * document to the printable page.
   * Params:
   *   tag = a #GtkTextTag
   */
  void ignoreTag(gtk.text_tag.TextTag tag)
  {
    gtk_source_print_compositor_ignore_tag(cast(GtkSourcePrintCompositor*)cPtr, tag ? cast(GtkTextTag*)tag.cPtr(No.Dup) : null);
  }

  /**
   * Paginate the document associated with the compositor.
   * In order to support non-blocking pagination, document is paginated in small chunks.
   * Each time [gtksource.print_compositor.PrintCompositor.paginate] is invoked, a chunk of the document
   * is paginated. To paginate the entire document, [gtksource.print_compositor.PrintCompositor.paginate]
   * must be invoked multiple times.
   * It returns %TRUE if the document has been completely paginated, otherwise it returns %FALSE.
   * This method has been designed to be invoked in the handler of the [gtk.print_operation.PrintOperation.paginate] signal,
   * as shown in the following example:
   * ```c
   * // Signal handler for the GtkPrintOperation::paginate signal
   * static gboolean
   * paginate $(LPAREN)GtkPrintOperation *operation,
   * GtkPrintContext   *context,
   * gpointer           user_data$(RPAREN)
   * {
   * GtkSourcePrintCompositor *compositor;
   * compositor \= GTK_SOURCE_PRINT_COMPOSITOR $(LPAREN)user_data$(RPAREN);
   * if $(LPAREN)gtk_source_print_compositor_paginate $(LPAREN)compositor, context$(RPAREN)$(RPAREN)
   * {
   * gint n_pages;
   * n_pages \= gtk_source_print_compositor_get_n_pages $(LPAREN)compositor$(RPAREN);
   * gtk_print_operation_set_n_pages $(LPAREN)operation, n_pages$(RPAREN);
   * return TRUE;
   * }
   * return FALSE;
   * }
   * ```
   * If you don't need to do pagination in chunks, you can simply do it all in the
   * signalGtk.PrintOperation::begin-print handler, and set the number of pages from there, like
   * in the following example:
   * ```c
   * // Signal handler for the GtkPrintOperation::begin-print signal
   * static void
   * begin_print $(LPAREN)GtkPrintOperation *operation,
   * GtkPrintContext   *context,
   * gpointer           user_data$(RPAREN)
   * {
   * GtkSourcePrintCompositor *compositor;
   * gint n_pages;
   * compositor \= GTK_SOURCE_PRINT_COMPOSITOR $(LPAREN)user_data$(RPAREN);
   * while $(LPAREN)!gtk_source_print_compositor_paginate $(LPAREN)compositor, context$(RPAREN)$(RPAREN);
   * n_pages \= gtk_source_print_compositor_get_n_pages $(LPAREN)compositor$(RPAREN);
   * gtk_print_operation_set_n_pages $(LPAREN)operation, n_pages$(RPAREN);
   * }
   * ```
   * Params:
   *   context = the #GtkPrintContext whose parameters $(LPAREN)e.g. paper size, print margins, etc.$(RPAREN)
   *     are used by the the compositor to paginate the document.
   * Returns: %TRUE if the document has been completely paginated, %FALSE otherwise.
   */
  bool paginate(gtk.print_context.PrintContext context)
  {
    bool _retval;
    _retval = gtk_source_print_compositor_paginate(cast(GtkSourcePrintCompositor*)cPtr, context ? cast(GtkPrintContext*)context.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
   * Sets the default font for the printed text.
   * font_name should be a
   * string representation of a font description Pango can understand.
   * $(LPAREN)e.g. &quot;Monospace 10&quot;$(RPAREN). See [pango.font_description.FontDescription.fromString]
   * for a description of the format of the string representation.
   * This function cannot be called anymore after the first call to the
   * [gtksource.print_compositor.PrintCompositor.paginate] function.
   * Params:
   *   fontName = the name of the default font for the body text.
   */
  void setBodyFontName(string fontName)
  {
    const(char)* _fontName = fontName.toCString(No.Alloc);
    gtk_source_print_compositor_set_body_font_name(cast(GtkSourcePrintCompositor*)cPtr, _fontName);
  }

  /**
   * Sets the bottom margin used by compositor.
   * Params:
   *   margin = the new bottom margin in units of unit.
   *   unit = the units for margin.
   */
  void setBottomMargin(double margin, gtk.types.Unit unit)
  {
    gtk_source_print_compositor_set_bottom_margin(cast(GtkSourcePrintCompositor*)cPtr, margin, unit);
  }

  /**
   * Sets the font for printing the page footer.
   * If %NULL is supplied, the default font $(LPAREN)i.e. the one being used for the
   * text$(RPAREN) will be used instead.
   * font_name should be a
   * string representation of a font description Pango can understand.
   * $(LPAREN)e.g. &quot;Monospace 10&quot;$(RPAREN). See [pango.font_description.FontDescription.fromString]
   * for a description of the format of the string representation.
   * This function cannot be called anymore after the first call to the
   * [gtksource.print_compositor.PrintCompositor.paginate] function.
   * Params:
   *   fontName = the name of the font for the footer text, or %NULL.
   */
  void setFooterFontName(string fontName = null)
  {
    const(char)* _fontName = fontName.toCString(No.Alloc);
    gtk_source_print_compositor_set_footer_font_name(cast(GtkSourcePrintCompositor*)cPtr, _fontName);
  }

  /**
   * See [gtksource.print_compositor.PrintCompositor.setHeaderFormat] for more information
   * about the parameters.
   * Params:
   *   separator = %TRUE if you want a separator line to be printed.
   *   left = a format string to print on the left of the footer.
   *   center = a format string to print on the center of the footer.
   *   right = a format string to print on the right of the footer.
   */
  void setFooterFormat(bool separator, string left = null, string center = null, string right = null)
  {
    const(char)* _left = left.toCString(No.Alloc);
    const(char)* _center = center.toCString(No.Alloc);
    const(char)* _right = right.toCString(No.Alloc);
    gtk_source_print_compositor_set_footer_format(cast(GtkSourcePrintCompositor*)cPtr, separator, _left, _center, _right);
  }

  /**
   * Sets the font for printing the page header.
   * If %NULL is supplied, the default font $(LPAREN)i.e. the one being used for the
   * text$(RPAREN) will be used instead.
   * font_name should be a
   * string representation of a font description Pango can understand.
   * $(LPAREN)e.g. &quot;Monospace 10&quot;$(RPAREN). See [pango.font_description.FontDescription.fromString]
   * for a description of the format of the string representation.
   * This function cannot be called anymore after the first call to the
   * [gtksource.print_compositor.PrintCompositor.paginate] function.
   * Params:
   *   fontName = the name of the font for header text, or %NULL.
   */
  void setHeaderFontName(string fontName = null)
  {
    const(char)* _fontName = fontName.toCString(No.Alloc);
    gtk_source_print_compositor_set_header_font_name(cast(GtkSourcePrintCompositor*)cPtr, _fontName);
  }

  /**
   * Sets strftime like header format strings, to be printed on the
   * left, center and right of the top of each page.
   * The strings may include strftime$(LPAREN)3$(RPAREN) codes which will be expanded at print time.
   * A subset of strftime$(LPAREN)$(RPAREN) codes are accepted, see [glib.date_time.DateTime.format]
   * for more details on the accepted format specifiers.
   * Additionally the following format specifiers are accepted:
   * - #N: the page number
   * - #Q: the page count.
   * separator specifies if a solid line should be drawn to separate
   * the header from the document text.
   * If %NULL is given for any of the three arguments, that particular
   * string will not be printed.
   * For the header to be printed, in
   * addition to specifying format strings, you need to enable header
   * printing with [gtksource.print_compositor.PrintCompositor.setPrintHeader].
   * This function cannot be called anymore after the first call to the
   * [gtksource.print_compositor.PrintCompositor.paginate] function.
   * Params:
   *   separator = %TRUE if you want a separator line to be printed.
   *   left = a format string to print on the left of the header.
   *   center = a format string to print on the center of the header.
   *   right = a format string to print on the right of the header.
   */
  void setHeaderFormat(bool separator, string left = null, string center = null, string right = null)
  {
    const(char)* _left = left.toCString(No.Alloc);
    const(char)* _center = center.toCString(No.Alloc);
    const(char)* _right = right.toCString(No.Alloc);
    gtk_source_print_compositor_set_header_format(cast(GtkSourcePrintCompositor*)cPtr, separator, _left, _center, _right);
  }

  /**
   * Sets whether the printed text will be highlighted according to the
   * buffer rules.  Both color and font style are applied.
   * This function cannot be called anymore after the first call to the
   * [gtksource.print_compositor.PrintCompositor.paginate] function.
   * Params:
   *   highlight = whether syntax should be highlighted.
   */
  void setHighlightSyntax(bool highlight)
  {
    gtk_source_print_compositor_set_highlight_syntax(cast(GtkSourcePrintCompositor*)cPtr, highlight);
  }

  /**
   * Sets the left margin used by compositor.
   * Params:
   *   margin = the new left margin in units of unit.
   *   unit = the units for margin.
   */
  void setLeftMargin(double margin, gtk.types.Unit unit)
  {
    gtk_source_print_compositor_set_left_margin(cast(GtkSourcePrintCompositor*)cPtr, margin, unit);
  }

  /**
   * Sets the font for printing line numbers on the left margin.
   * If %NULL is supplied, the default font $(LPAREN)i.e. the one being used for the
   * text$(RPAREN) will be used instead.
   * font_name should be a
   * string representation of a font description Pango can understand.
   * $(LPAREN)e.g. &quot;Monospace 10&quot;$(RPAREN). See [pango.font_description.FontDescription.fromString]
   * for a description of the format of the string representation.
   * This function cannot be called anymore after the first call to the
   * [gtksource.print_compositor.PrintCompositor.paginate] function.
   * Params:
   *   fontName = the name of the font for line numbers, or %NULL.
   */
  void setLineNumbersFontName(string fontName = null)
  {
    const(char)* _fontName = fontName.toCString(No.Alloc);
    gtk_source_print_compositor_set_line_numbers_font_name(cast(GtkSourcePrintCompositor*)cPtr, _fontName);
  }

  /**
   * Sets whether you want to print a footer in each page.
   * The footer consists of three pieces of text and an optional line
   * separator, configurable with
   * [gtksource.print_compositor.PrintCompositor.setFooterFormat].
   * Note that by default the footer format is unspecified, and if it's
   * empty it will not be printed, regardless of this setting.
   * This function cannot be called anymore after the first call to the
   * [gtksource.print_compositor.PrintCompositor.paginate] function.
   * Params:
   *   print = %TRUE if you want the footer to be printed.
   */
  void setPrintFooter(bool print)
  {
    gtk_source_print_compositor_set_print_footer(cast(GtkSourcePrintCompositor*)cPtr, print);
  }

  /**
   * Sets whether you want to print a header in each page.
   * The header consists of three pieces of text and an optional line
   * separator, configurable with [gtksource.print_compositor.PrintCompositor.setHeaderFormat].
   * Note that by default the header format is unspecified, and if it's
   * empty it will not be printed, regardless of this setting.
   * This function cannot be called anymore after the first call to the
   * [gtksource.print_compositor.PrintCompositor.paginate] function.
   * Params:
   *   print = %TRUE if you want the header to be printed.
   */
  void setPrintHeader(bool print)
  {
    gtk_source_print_compositor_set_print_header(cast(GtkSourcePrintCompositor*)cPtr, print);
  }

  /**
   * Sets the interval for printed line numbers.
   * If interval is 0 no numbers will be printed. If greater than 0, a number will be
   * printed every interval lines $(LPAREN)i.e. 1 will print all line numbers$(RPAREN).
   * Maximum accepted value for interval is 100.
   * This function cannot be called anymore after the first call to the
   * [gtksource.print_compositor.PrintCompositor.paginate] function.
   * Params:
   *   interval = interval for printed line numbers.
   */
  void setPrintLineNumbers(uint interval)
  {
    gtk_source_print_compositor_set_print_line_numbers(cast(GtkSourcePrintCompositor*)cPtr, interval);
  }

  /**
   * Sets the right margin used by compositor.
   * Params:
   *   margin = the new right margin in units of unit.
   *   unit = the units for margin.
   */
  void setRightMargin(double margin, gtk.types.Unit unit)
  {
    gtk_source_print_compositor_set_right_margin(cast(GtkSourcePrintCompositor*)cPtr, margin, unit);
  }

  /**
   * Sets the width of tabulation in characters for printed text.
   * This function cannot be called anymore after the first call to the
   * [gtksource.print_compositor.PrintCompositor.paginate] function.
   * Params:
   *   width = width of tab in characters.
   */
  void setTabWidth(uint width)
  {
    gtk_source_print_compositor_set_tab_width(cast(GtkSourcePrintCompositor*)cPtr, width);
  }

  /**
   * Sets the top margin used by compositor.
   * Params:
   *   margin = the new top margin in units of unit
   *   unit = the units for margin
   */
  void setTopMargin(double margin, gtk.types.Unit unit)
  {
    gtk_source_print_compositor_set_top_margin(cast(GtkSourcePrintCompositor*)cPtr, margin, unit);
  }

  /**
   * Sets the line wrapping mode for the printed text.
   * This function cannot be called anymore after the first call to the
   * [gtksource.print_compositor.PrintCompositor.paginate] function.
   * Params:
   *   wrapMode = a #GtkWrapMode.
   */
  void setWrapMode(gtk.types.WrapMode wrapMode)
  {
    gtk_source_print_compositor_set_wrap_mode(cast(GtkSourcePrintCompositor*)cPtr, wrapMode);
  }
}
