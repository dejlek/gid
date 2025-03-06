module vte.terminal;

import cairo.font_options;
import gdk.cursor;
import gdk.rectangle;
import gdk.rgba;
import gid.gid;
import gio.cancellable;
import gio.menu_model;
import gio.output_stream;
import glib.error;
import glib.types;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.scrollable;
import gtk.scrollable_mixin;
import gtk.widget;
import pango.font_description;
import vte.c.functions;
import vte.c.types;
import vte.event_context;
import vte.pty;
import vte.regex;
import vte.types;

/** */
class Terminal : gtk.widget.Widget, gtk.scrollable.Scrollable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())vte_terminal_get_type != &gidSymbolNotFound ? vte_terminal_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin ScrollableT!();

  /**
      Creates a new terminal widget.
    Returns:     a new #VteTerminal object
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = vte_terminal_new();
    this(_cretval, No.Take);
  }

  /**
      Returns a nonempty string: the target of the explicit hyperlink (printed using the OSC 8
    escape sequence) at the position (x, y), or null.
    
    Proper use of the escape sequence should result in URI-encoded URIs with a proper scheme
    like "http://", "https://", "file://", "mailto:" etc. This is, however, not enforced by VTE.
    The caller must tolerate the returned string potentially not being a valid URI.
    Params:
      x = 
      y = 
    Returns:     a newly allocated string containing the target of the hyperlink,
       or null
  */
  string checkHyperlinkAt(double x, double y)
  {
    char* _cretval;
    _cretval = vte_terminal_check_hyperlink_at(cast(VteTerminal*)cPtr, x, y);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Checks if the text in and around the position (x, y) matches any of the
    regular expressions previously set using vte_terminal_match_add().  If a
    match exists, the text string is returned and if tag is not null, the number
    associated with the matched regular expression will be stored in tag.
    
    If more than one regular expression has been set with
    vte_terminal_match_add(), then expressions are checked in the order in
    which they were added.
    Params:
      x = 
      y = 
      tag =       a location to store the tag, or null
    Returns:     a newly allocated string which matches one of the previously
        set regular expressions, or null if there is no match
  */
  string checkMatchAt(double x, double y, out int tag)
  {
    char* _cretval;
    _cretval = vte_terminal_check_match_at(cast(VteTerminal*)cPtr, x, y, cast(int*)&tag);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Like [vte.terminal.Terminal.checkRegexSimpleAt], but returns an array of strings,
    containing the matching text (or null if no match) corresponding to each of the
    regexes in regexes.
    
    You must free each string and the array; but note that this is *not* a null-terminated
    string array, and so you must *not* use [glib.global.strfreev] on it.
    Params:
      x = 
      y = 
      regexes =       an array of #VteRegex
      matchFlags =       PCRE2 match flags, or 0
    Returns:     a newly allocated array of strings,
        or null if none of the regexes matched
  */
  string[] checkRegexSimpleAt(double x, double y, vte.regex.Regex[] regexes, uint matchFlags)
  {
    char** _cretval;
    size_t _cretlength;
    size_t _nRegexes;
    if (regexes)
      _nRegexes = cast(size_t)regexes.length;

    VteRegex*[] _tmpregexes;
    foreach (obj; regexes)
      _tmpregexes ~= cast(VteRegex*)obj.cPtr;
    VteRegex** _regexes = _tmpregexes.ptr;
    _cretval = vte_terminal_check_regex_array_at(cast(VteTerminal*)cPtr, x, y, _regexes, _nRegexes, matchFlags, &_cretlength);
    string[] _retval;

    if (_cretval)
    {
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
    }
    return _retval;
  }

  /**
      Places the selected text in the terminal in the #GDK_SELECTION_CLIPBOARD
    selection.
  
    Deprecated:     Use [vte.terminal.Terminal.copyClipboardFormat] with [vte.types.Format.Text]
        instead.
  */
  void copyClipboard()
  {
    vte_terminal_copy_clipboard(cast(VteTerminal*)cPtr);
  }

  /**
      Places the selected text in the terminal in the #GDK_SELECTION_CLIPBOARD
    selection in the form specified by format.
    
    For all formats, the selection data (see #GtkSelectionData) will include the
    text targets (see [gtk.target_list.TargetList.addTextTargets] and
    gtk_selection_data_targets_includes_text()). For [vte.types.Format.Html],
    the selection will also include the "text/html" target, which when requested,
    returns the HTML data in UTF-16 with a U+FEFF BYTE ORDER MARK character at
    the start.
    Params:
      format =       a #VteFormat
  */
  void copyClipboardFormat(vte.types.Format format)
  {
    vte_terminal_copy_clipboard_format(cast(VteTerminal*)cPtr, format);
  }

  /**
      Places the selected text in the terminal in the #GDK_SELECTION_PRIMARY
    selection.
  */
  void copyPrimary()
  {
    vte_terminal_copy_primary(cast(VteTerminal*)cPtr);
  }

  /**
      Interprets data as if it were data received from a child process.
    Params:
      data =       a string in the terminal's current encoding
  */
  void feed(ubyte[] data = null)
  {
    ptrdiff_t _length;
    if (data)
      _length = cast(ptrdiff_t)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    vte_terminal_feed(cast(VteTerminal*)cPtr, _data, _length);
  }

  /**
      Sends a block of UTF-8 text to the child as if it were entered by the user
    at the keyboard.
    Params:
      text =       data to send to the child
  */
  void feedChild(ubyte[] text = null)
  {
    ptrdiff_t _length;
    if (text)
      _length = cast(ptrdiff_t)text.length;

    auto _text = cast(const(ubyte)*)text.ptr;
    vte_terminal_feed_child(cast(VteTerminal*)cPtr, _text, _length);
  }

  /**
      Sends a block of binary data to the child.
    Params:
      data =       data to send to the child
  
    Deprecated:     Don't send binary data. Use [vte.terminal.Terminal.feedChild] instead to send
        UTF-8 text
  */
  void feedChildBinary(ubyte[] data = null)
  {
    size_t _length;
    if (data)
      _length = cast(size_t)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    vte_terminal_feed_child_binary(cast(VteTerminal*)cPtr, _data, _length);
  }

  /**
      Checks whether or not the terminal will attempt to draw bold text,
    by using a bold font variant.
    Returns:     true if bolding is enabled, false if not
  
    Deprecated:     There's probably no reason for this feature to exist.
  */
  bool getAllowBold()
  {
    bool _retval;
    _retval = vte_terminal_get_allow_bold(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /**
      Checks whether or not hyperlinks (OSC 8 escape sequence) are allowed.
    Returns:     true if hyperlinks are enabled, false if not
  */
  bool getAllowHyperlink()
  {
    bool _retval;
    _retval = vte_terminal_get_allow_hyperlink(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /**
      Checks whether or not the terminal will beep when the child outputs the
    "bl" sequence.
    Returns:     true if audible bell is enabled, false if not
  */
  bool getAudibleBell()
  {
    bool _retval;
    _retval = vte_terminal_get_audible_bell(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /**
      Checks whether the SGR 1 attribute also switches to the bright counterpart
    of the first 8 palette colors, in addition to making them bold (legacy behavior)
    or if SGR 1 only enables bold and leaves the color intact.
    Returns:     true if bold also enables bright, false if not
  */
  bool getBoldIsBright()
  {
    bool _retval;
    _retval = vte_terminal_get_bold_is_bright(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /** */
  double getCellHeightScale()
  {
    double _retval;
    _retval = vte_terminal_get_cell_height_scale(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /** */
  double getCellWidthScale()
  {
    double _retval;
    _retval = vte_terminal_get_cell_width_scale(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /** */
  glong getCharHeight()
  {
    glong _retval;
    _retval = vte_terminal_get_char_height(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /** */
  glong getCharWidth()
  {
    glong _retval;
    _retval = vte_terminal_get_char_width(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /**
      Returns whether ambiguous-width characters are narrow or wide.
    (Note that when using a non-UTF-8 encoding set via [vte.terminal.Terminal.setEncoding],
    the width of ambiguous-width characters is fixed and determined by the encoding
    itself.)
    Returns:     1 if ambiguous-width characters are narrow, or 2 if they are wide
  */
  int getCjkAmbiguousWidth()
  {
    int _retval;
    _retval = vte_terminal_get_cjk_ambiguous_width(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /**
      Returns the background colour, as used by terminal when
    drawing the background, which may be different from
    the color set by [vte.terminal.Terminal.setColorBackground].
    
    Note: you must only call this function while handling the
    GtkWidget::draw signal.
    
    This function is rarely useful. One use for it is if you disable
    drawing the background (see [vte.terminal.Terminal.setClearBackground])
    and then need to draw the background yourself.
    Params:
      color =       a location to store a #GdkRGBA color
  */
  void getColorBackgroundForDraw(out gdk.rgba.RGBA color)
  {
    GdkRGBA _color;
    vte_terminal_get_color_background_for_draw(cast(VteTerminal*)cPtr, &_color);
    color = new gdk.rgba.RGBA(cast(void*)&_color, No.Take);
  }

  /** */
  glong getColumnCount()
  {
    glong _retval;
    _retval = vte_terminal_get_column_count(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /** */
  gtk.widget.Widget getContextMenu()
  {
    GtkWidget* _cretval;
    _cretval = vte_terminal_get_context_menu(cast(VteTerminal*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /** */
  gio.menu_model.MenuModel getContextMenuModel()
  {
    GMenuModel* _cretval;
    _cretval = vte_terminal_get_context_menu_model(cast(VteTerminal*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /** */
  string getCurrentDirectoryUri()
  {
    const(char)* _cretval;
    _cretval = vte_terminal_get_current_directory_uri(cast(VteTerminal*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  string getCurrentFileUri()
  {
    const(char)* _cretval;
    _cretval = vte_terminal_get_current_file_uri(cast(VteTerminal*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the currently set cursor blink mode.
    Returns:     cursor blink mode.
  */
  vte.types.CursorBlinkMode getCursorBlinkMode()
  {
    VteCursorBlinkMode _cretval;
    _cretval = vte_terminal_get_cursor_blink_mode(cast(VteTerminal*)cPtr);
    vte.types.CursorBlinkMode _retval = cast(vte.types.CursorBlinkMode)_cretval;
    return _retval;
  }

  /**
      Reads the location of the insertion cursor and returns it.  The row
    coordinate is absolute.
    
    This method is unaware of BiDi. The returned column is logical column.
    Params:
      column =       a location to store the column, or null
      row =       a location to store the row, or null
  */
  void getCursorPosition(out glong column, out glong row)
  {
    vte_terminal_get_cursor_position(cast(VteTerminal*)cPtr, cast(glong*)&column, cast(glong*)&row);
  }

  /**
      Returns the currently set cursor shape.
    Returns:     cursor shape.
  */
  vte.types.CursorShape getCursorShape()
  {
    VteCursorShape _cretval;
    _cretval = vte_terminal_get_cursor_shape(cast(VteTerminal*)cPtr);
    vte.types.CursorShape _retval = cast(vte.types.CursorShape)_cretval;
    return _retval;
  }

  /**
      Checks whether the terminal performs bidirectional text rendering.
    Returns:     true if BiDi is enabled, false if not
  */
  bool getEnableBidi()
  {
    bool _retval;
    _retval = vte_terminal_get_enable_bidi(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /** */
  bool getEnableFallbackScrolling()
  {
    bool _retval;
    _retval = vte_terminal_get_enable_fallback_scrolling(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /**
      Checks whether the terminal shapes Arabic text.
    Returns:     true if Arabic shaping is enabled, false if not
  */
  bool getEnableShaping()
  {
    bool _retval;
    _retval = vte_terminal_get_enable_shaping(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /** */
  bool getEnableSixel()
  {
    bool _retval;
    _retval = vte_terminal_get_enable_sixel(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /**
      Determines the name of the encoding in which the terminal expects data to be
    encoded, or null if UTF-8 is in use.
    Returns:     the current encoding for the terminal
  
    Deprecated:     Support for non-UTF-8 is deprecated.
  */
  string getEncoding()
  {
    const(char)* _cretval;
    _cretval = vte_terminal_get_encoding(cast(VteTerminal*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Queries the terminal for information about the fonts which will be
    used to draw text in the terminal.  The actual font takes the font scale
    into account, this is not reflected in the return value, the unscaled
    font is returned.
    Returns:     a #PangoFontDescription describing the font the
      terminal uses to render text at the default font scale of 1.0.
  */
  pango.font_description.FontDescription getFont()
  {
    const(PangoFontDescription)* _cretval;
    _cretval = vte_terminal_get_font(cast(VteTerminal*)cPtr);
    auto _retval = _cretval ? new pango.font_description.FontDescription(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  override cairo.font_options.FontOptions getFontOptions()
  {
    const(cairo_font_options_t)* _cretval;
    _cretval = vte_terminal_get_font_options(cast(VteTerminal*)cPtr);
    auto _retval = _cretval ? new cairo.font_options.FontOptions(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  double getFontScale()
  {
    double _retval;
    _retval = vte_terminal_get_font_scale(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /**
      Checks if the terminal currently contains selected text.  Note that this
    is different from determining if the terminal is the owner of any
    #GtkClipboard items.
    Returns:     true if part of the text in the terminal is selected.
  */
  bool getHasSelection()
  {
    bool _retval;
    _retval = vte_terminal_get_has_selection(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /** */
  string getIconTitle()
  {
    const(char)* _cretval;
    _cretval = vte_terminal_get_icon_title(cast(VteTerminal*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns whether the terminal allow user input.
    Returns: 
  */
  bool getInputEnabled()
  {
    bool _retval;
    _retval = vte_terminal_get_input_enabled(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /**
      Determines the value of the terminal's mouse autohide setting.  When
    autohiding is enabled, the mouse cursor will be hidden when the user presses
    a key and shown when the user moves the mouse.  This setting can be changed
    using [vte.terminal.Terminal.setMouseAutohide].
    Returns:     true if autohiding is enabled, false if not
  */
  bool getMouseAutohide()
  {
    bool _retval;
    _retval = vte_terminal_get_mouse_autohide(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /**
      Returns the #VtePty of terminal.
    Returns:     a #VtePty, or null
  */
  vte.pty.Pty getPty()
  {
    VtePty* _cretval;
    _cretval = vte_terminal_get_pty(cast(VteTerminal*)cPtr);
    auto _retval = ObjectG.getDObject!(vte.pty.Pty)(cast(VtePty*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks whether or not the terminal will rewrap its contents upon resize.
    Returns:     true if rewrapping is enabled, false if not
  */
  bool getRewrapOnResize()
  {
    bool _retval;
    _retval = vte_terminal_get_rewrap_on_resize(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /** */
  glong getRowCount()
  {
    glong _retval;
    _retval = vte_terminal_get_row_count(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /** */
  bool getScrollOnInsert()
  {
    bool _retval;
    _retval = vte_terminal_get_scroll_on_insert(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /** */
  bool getScrollOnKeystroke()
  {
    bool _retval;
    _retval = vte_terminal_get_scroll_on_keystroke(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /** */
  bool getScrollOnOutput()
  {
    bool _retval;
    _retval = vte_terminal_get_scroll_on_output(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /** */
  bool getScrollUnitIsPixels()
  {
    bool _retval;
    _retval = vte_terminal_get_scroll_unit_is_pixels(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /** */
  glong getScrollbackLines()
  {
    glong _retval;
    _retval = vte_terminal_get_scrollback_lines(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /**
      Checks whether or not the terminal will allow blinking text.
    Returns:     the blinking setting
  */
  vte.types.TextBlinkMode getTextBlinkMode()
  {
    VteTextBlinkMode _cretval;
    _cretval = vte_terminal_get_text_blink_mode(cast(VteTerminal*)cPtr);
    vte.types.TextBlinkMode _retval = cast(vte.types.TextBlinkMode)_cretval;
    return _retval;
  }

  /**
      Returns text from the visible part of the terminal in the specified format.
    
    This method is unaware of BiDi. The columns returned in attributes are
    logical columns.
    Params:
      format =       the #VteFormat to use
    Returns:     a newly allocated text string, or null.
  */
  string getTextFormat(vte.types.Format format)
  {
    char* _cretval;
    _cretval = vte_terminal_get_text_format(cast(VteTerminal*)cPtr, format);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns the specified range of text in the specified format.
    Params:
      format =       the #VteFormat to use
      startRow =       the first row of the range
      startCol =       the first column of the range
      endRow =       the last row of the range
      endCol =       the last column of the range
      length =       a pointer to a #gsize to store the string length
    Returns:     a newly allocated string, or null.
  */
  string getTextRangeFormat(vte.types.Format format, glong startRow, glong startCol, glong endRow, glong endCol, out size_t length)
  {
    char* _cretval;
    _cretval = vte_terminal_get_text_range_format(cast(VteTerminal*)cPtr, format, startRow, startCol, endRow, endCol, cast(size_t*)&length);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the currently selected text in the format specified by format.
    Since 0.72, this function also supports [vte.types.Format.Html] format.
    Params:
      format =       the #VteFormat to use
    Returns:     a newly allocated string containing the selected text, or null if there is no selection or the format is not supported
  */
  string getTextSelected(vte.types.Format format)
  {
    char* _cretval;
    _cretval = vte_terminal_get_text_selected(cast(VteTerminal*)cPtr, format);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the currently selected text in the format specified by format.
    Params:
      format =       the #VteFormat to use
      length =       a pointer to a #gsize to store the string length
    Returns:     a newly allocated string containing the selected text, or null if there is no selection or the format is not supported
  */
  string getTextSelectedFull(vte.types.Format format, out size_t length)
  {
    char* _cretval;
    _cretval = vte_terminal_get_text_selected_full(cast(VteTerminal*)cPtr, format, cast(size_t*)&length);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  string getWindowTitle()
  {
    const(char)* _cretval;
    _cretval = vte_terminal_get_window_title(cast(VteTerminal*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the set of characters which will be considered parts of a word
    when doing word-wise selection, in addition to the default which only
    considers alphanumeric characters part of a word.
    
    If null, a built-in set is used.
    Returns:     a string, or null
  */
  string getWordCharExceptions()
  {
    const(char)* _cretval;
    _cretval = vte_terminal_get_word_char_exceptions(cast(VteTerminal*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /** */
  vte.types.Align getXalign()
  {
    VteAlign _cretval;
    _cretval = vte_terminal_get_xalign(cast(VteTerminal*)cPtr);
    vte.types.Align _retval = cast(vte.types.Align)_cretval;
    return _retval;
  }

  /** */
  bool getXfill()
  {
    bool _retval;
    _retval = vte_terminal_get_xfill(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /** */
  vte.types.Align getYalign()
  {
    VteAlign _cretval;
    _cretval = vte_terminal_get_yalign(cast(VteTerminal*)cPtr);
    vte.types.Align _retval = cast(vte.types.Align)_cretval;
    return _retval;
  }

  /** */
  bool getYfill()
  {
    bool _retval;
    _retval = vte_terminal_get_yfill(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /**
      Adds the regular expression regex to the list of matching expressions.  When the
    user moves the mouse cursor over a section of displayed text which matches
    this expression, the text will be highlighted.
    
    Note that regex should have been created using the <literal>PCRE2_MULTILINE</literal>
    flag.
    Params:
      regex =       a #VteRegex
      flags =       PCRE2 match flags, or 0
    Returns:     an integer associated with this expression
  */
  int matchAddRegex(vte.regex.Regex regex, uint flags)
  {
    int _retval;
    _retval = vte_terminal_match_add_regex(cast(VteTerminal*)cPtr, regex ? cast(VteRegex*)regex.cPtr(No.Dup) : null, flags);
    return _retval;
  }

  /**
      Checks if the text in and around the specified position matches any of the
    regular expressions previously set using vte_terminal_match_add().  If a
    match exists, the text string is returned and if tag is not null, the number
    associated with the matched regular expression will be stored in tag.
    
    If more than one regular expression has been set with
    vte_terminal_match_add(), then expressions are checked in the order in
    which they were added.
    Params:
      column =       the text column
      row =       the text row
      tag =       a location to store the tag, or null
    Returns:     a newly allocated string which matches one of the previously
        set regular expressions
  
    Deprecated:     Use [vte.terminal.Terminal.matchCheckEvent] instead.
  */
  string matchCheck(glong column, glong row, out int tag)
  {
    char* _cretval;
    _cretval = vte_terminal_match_check(cast(VteTerminal*)cPtr, column, row, cast(int*)&tag);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Removes the regular expression which is associated with the given tag from
    the list of expressions which the terminal will highlight when the user
    moves the mouse cursor over matching text.
    Params:
      tag =       the tag of the regex to remove
  */
  void matchRemove(int tag)
  {
    vte_terminal_match_remove(cast(VteTerminal*)cPtr, tag);
  }

  /**
      Clears the list of regular expressions the terminal uses to highlight text
    when the user moves the mouse cursor.
  */
  void matchRemoveAll()
  {
    vte_terminal_match_remove_all(cast(VteTerminal*)cPtr);
  }

  /**
      Sets which cursor the terminal will use if the pointer is over the pattern
    specified by tag.  The terminal keeps a reference to cursor.
    Params:
      tag =       the tag of the regex which should use the specified cursor
      cursor =       the #GdkCursor which the terminal should use when the pattern is
          highlighted, or null to use the standard cursor
  
    Deprecated:     Use [vte.terminal.Terminal.matchSetCursorName] instead.
  */
  void matchSetCursor(int tag, gdk.cursor.Cursor cursor = null)
  {
    vte_terminal_match_set_cursor(cast(VteTerminal*)cPtr, tag, cursor ? cast(GdkCursor*)cursor.cPtr(No.Dup) : null);
  }

  /**
      Sets which cursor the terminal will use if the pointer is over the pattern
    specified by tag.
    Params:
      tag =       the tag of the regex which should use the specified cursor
      cursorName =       the name of the cursor
  */
  void matchSetCursorName(int tag, string cursorName)
  {
    const(char)* _cursorName = cursorName.toCString(No.Alloc);
    vte_terminal_match_set_cursor_name(cast(VteTerminal*)cPtr, tag, _cursorName);
  }

  /**
      Sends the contents of the #GDK_SELECTION_CLIPBOARD selection to the
    terminal's child. It's called on paste menu item, or when
    user presses Shift+Insert.
  */
  void pasteClipboard()
  {
    vte_terminal_paste_clipboard(cast(VteTerminal*)cPtr);
  }

  /**
      Sends the contents of the #GDK_SELECTION_PRIMARY selection to the terminal's
    child. The terminal will call also paste the
    #GDK_SELECTION_PRIMARY selection when the user clicks with the the second
    mouse button.
  */
  void pastePrimary()
  {
    vte_terminal_paste_primary(cast(VteTerminal*)cPtr);
  }

  /**
      Sends text to the terminal's child as if retrived from the clipboard,
    this differs from [vte.terminal.Terminal.feedChild] in that it may process
    text before passing it to the child (e.g. apply bracketed mode)
    Params:
      text =       a string to paste
  */
  void pasteText(string text)
  {
    const(char)* _text = text.toCString(No.Alloc);
    vte_terminal_paste_text(cast(VteTerminal*)cPtr, _text);
  }

  /**
      Creates a new #VtePty, sets the emulation property
    from #VteTerminal:emulation, and sets the size using
    terminal's size.
    
    See vte_pty_new() for more information.
    Params:
      flags =       flags from #VtePtyFlags
      cancellable =       a #GCancellable, or null
    Returns:     a new #VtePty
  */
  vte.pty.Pty ptyNewSync(vte.types.PtyFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    VtePty* _cretval;
    GError *_err;
    _cretval = vte_terminal_pty_new_sync(cast(VteTerminal*)cPtr, flags, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(vte.pty.Pty)(cast(VtePty*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Resets as much of the terminal's internal state as possible, discarding any
    unprocessed input data, resetting character attributes, cursor state,
    national character set state, status line, terminal modes (insert/delete),
    selection state, and encoding.
    Params:
      clearTabstops =       whether to reset tabstops
      clearHistory =       whether to empty the terminal's scrollback buffer
  */
  void reset(bool clearTabstops, bool clearHistory)
  {
    vte_terminal_reset(cast(VteTerminal*)cPtr, clearTabstops, clearHistory);
  }

  /**
      Searches the next string matching the search regex set with
    [vte.terminal.Terminal.searchSetRegex].
    Returns:     true if a match was found
  */
  bool searchFindNext()
  {
    bool _retval;
    _retval = vte_terminal_search_find_next(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /**
      Searches the previous string matching the search regex set with
    [vte.terminal.Terminal.searchSetRegex].
    Returns:     true if a match was found
  */
  bool searchFindPrevious()
  {
    bool _retval;
    _retval = vte_terminal_search_find_previous(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /** */
  vte.regex.Regex searchGetRegex()
  {
    VteRegex* _cretval;
    _cretval = vte_terminal_search_get_regex(cast(VteTerminal*)cPtr);
    auto _retval = _cretval ? new vte.regex.Regex(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  bool searchGetWrapAround()
  {
    bool _retval;
    _retval = vte_terminal_search_get_wrap_around(cast(VteTerminal*)cPtr);
    return _retval;
  }

  /**
      Sets the regex to search for. Unsets the search regex when passed null.
    
    Note that regex should have been created using the
    <literal>PCRE2_MULTILINE</literal> flag.
    Params:
      regex =       a #VteRegex, or null
      flags =       PCRE2 match flags, or 0
  */
  void searchSetRegex(vte.regex.Regex regex, uint flags)
  {
    vte_terminal_search_set_regex(cast(VteTerminal*)cPtr, regex ? cast(VteRegex*)regex.cPtr(No.Dup) : null, flags);
  }

  /**
      Sets whether search should wrap around to the beginning of the
    terminal content when reaching its end.
    Params:
      wrapAround =       whether search should wrap
  */
  void searchSetWrapAround(bool wrapAround)
  {
    vte_terminal_search_set_wrap_around(cast(VteTerminal*)cPtr, wrapAround);
  }

  /**
      Selects all text within the terminal (not including the scrollback buffer).
  */
  void selectAll()
  {
    vte_terminal_select_all(cast(VteTerminal*)cPtr);
  }

  /**
      Controls whether or not the terminal will attempt to draw bold text,
    by using a bold font variant.
    Params:
      allowBold =       true if the terminal should attempt to draw bold text
  
    Deprecated:     There's probably no reason for this feature to exist.
  */
  void setAllowBold(bool allowBold)
  {
    vte_terminal_set_allow_bold(cast(VteTerminal*)cPtr, allowBold);
  }

  /**
      Controls whether or not hyperlinks (OSC 8 escape sequence) are allowed.
    Params:
      allowHyperlink =       true if the terminal should allow hyperlinks
  */
  void setAllowHyperlink(bool allowHyperlink)
  {
    vte_terminal_set_allow_hyperlink(cast(VteTerminal*)cPtr, allowHyperlink);
  }

  /**
      Controls whether or not the terminal will beep when the child outputs the
    "bl" sequence.
    Params:
      isAudible =       true if the terminal should beep
  */
  void setAudibleBell(bool isAudible)
  {
    vte_terminal_set_audible_bell(cast(VteTerminal*)cPtr, isAudible);
  }

  /**
      Modifies the terminal's backspace key binding, which controls what
    string or control sequence the terminal sends to its child when the user
    presses the backspace key.
    Params:
      binding =       a #VteEraseBinding for the backspace key
  */
  void setBackspaceBinding(vte.types.EraseBinding binding)
  {
    vte_terminal_set_backspace_binding(cast(VteTerminal*)cPtr, binding);
  }

  /**
      Sets whether the SGR 1 attribute also switches to the bright counterpart
    of the first 8 palette colors, in addition to making them bold (legacy behavior)
    or if SGR 1 only enables bold and leaves the color intact.
    Params:
      boldIsBright =       true if bold should also enable bright
  */
  void setBoldIsBright(bool boldIsBright)
  {
    vte_terminal_set_bold_is_bright(cast(VteTerminal*)cPtr, boldIsBright);
  }

  /**
      Sets the terminal's cell height scale to scale.
    
    This can be used to increase the line spacing. (The font's height is not affected.)
    Valid values go from 1.0 (default) to 2.0 ("double spacing").
    Params:
      scale =       the cell height scale
  */
  void setCellHeightScale(double scale)
  {
    vte_terminal_set_cell_height_scale(cast(VteTerminal*)cPtr, scale);
  }

  /**
      Sets the terminal's cell width scale to scale.
    
    This can be used to increase the letter spacing. (The font's width is not affected.)
    Valid values go from 1.0 (default) to 2.0.
    Params:
      scale =       the cell width scale
  */
  void setCellWidthScale(double scale)
  {
    vte_terminal_set_cell_width_scale(cast(VteTerminal*)cPtr, scale);
  }

  /**
      This setting controls whether ambiguous-width characters are narrow or wide.
    (Note that when using a non-UTF-8 encoding set via [vte.terminal.Terminal.setEncoding],
    the width of ambiguous-width characters is fixed and determined by the encoding
    itself.)
    Params:
      width =       either 1 (narrow) or 2 (wide)
  */
  void setCjkAmbiguousWidth(int width)
  {
    vte_terminal_set_cjk_ambiguous_width(cast(VteTerminal*)cPtr, width);
  }

  /**
      Sets whether to paint the background with the background colour.
    The default is true.
    
    This function is rarely useful. One use for it is to add a background
    image to the terminal.
    Params:
      setting =       whether to clear the background
  */
  void setClearBackground(bool setting)
  {
    vte_terminal_set_clear_background(cast(VteTerminal*)cPtr, setting);
  }

  /**
      Sets the background color for text which does not have a specific background
    color assigned.  Only has effect when no background image is set and when
    the terminal is not transparent.
    Params:
      background =       the new background color
  */
  void setColorBackground(gdk.rgba.RGBA background)
  {
    vte_terminal_set_color_background(cast(VteTerminal*)cPtr, background ? cast(const(GdkRGBA)*)background.cPtr(No.Dup) : null);
  }

  /**
      Sets the color used to draw bold text in the default foreground color.
    If bold is null then the default color is used.
    Params:
      bold =       the new bold color or null
  */
  void setColorBold(gdk.rgba.RGBA bold = null)
  {
    vte_terminal_set_color_bold(cast(VteTerminal*)cPtr, bold ? cast(const(GdkRGBA)*)bold.cPtr(No.Dup) : null);
  }

  /**
      Sets the background color for text which is under the cursor.  If null, text
    under the cursor will be drawn with foreground and background colors
    reversed.
    Params:
      cursorBackground =       the new color to use for the text cursor, or null
  */
  void setColorCursor(gdk.rgba.RGBA cursorBackground = null)
  {
    vte_terminal_set_color_cursor(cast(VteTerminal*)cPtr, cursorBackground ? cast(const(GdkRGBA)*)cursorBackground.cPtr(No.Dup) : null);
  }

  /**
      Sets the foreground color for text which is under the cursor.  If null, text
    under the cursor will be drawn with foreground and background colors
    reversed.
    Params:
      cursorForeground =       the new color to use for the text cursor, or null
  */
  void setColorCursorForeground(gdk.rgba.RGBA cursorForeground = null)
  {
    vte_terminal_set_color_cursor_foreground(cast(VteTerminal*)cPtr, cursorForeground ? cast(const(GdkRGBA)*)cursorForeground.cPtr(No.Dup) : null);
  }

  /**
      Sets the foreground color used to draw normal text.
    Params:
      foreground =       the new foreground color
  */
  void setColorForeground(gdk.rgba.RGBA foreground)
  {
    vte_terminal_set_color_foreground(cast(VteTerminal*)cPtr, foreground ? cast(const(GdkRGBA)*)foreground.cPtr(No.Dup) : null);
  }

  /**
      Sets the background color for text which is highlighted.  If null,
    it is unset.  If neither highlight background nor highlight foreground are set,
    highlighted text (which is usually highlighted because it is selected) will
    be drawn with foreground and background colors reversed.
    Params:
      highlightBackground =       the new color to use for highlighted text, or null
  */
  void setColorHighlight(gdk.rgba.RGBA highlightBackground = null)
  {
    vte_terminal_set_color_highlight(cast(VteTerminal*)cPtr, highlightBackground ? cast(const(GdkRGBA)*)highlightBackground.cPtr(No.Dup) : null);
  }

  /**
      Sets the foreground color for text which is highlighted.  If null,
    it is unset.  If neither highlight background nor highlight foreground are set,
    highlighted text (which is usually highlighted because it is selected) will
    be drawn with foreground and background colors reversed.
    Params:
      highlightForeground =       the new color to use for highlighted text, or null
  */
  void setColorHighlightForeground(gdk.rgba.RGBA highlightForeground = null)
  {
    vte_terminal_set_color_highlight_foreground(cast(VteTerminal*)cPtr, highlightForeground ? cast(const(GdkRGBA)*)highlightForeground.cPtr(No.Dup) : null);
  }

  /**
      palette specifies the new values for the 256 palette colors: 8 standard colors,
    their 8 bright counterparts, 6x6x6 color cube, and 24 grayscale colors.
    Omitted entries will default to a hardcoded value.
    
    palette_size must be 0, 8, 16, 232 or 256.
    
    If foreground is null and palette_size is greater than 0, the new foreground
    color is taken from palette[7].  If background is null and palette_size is
    greater than 0, the new background color is taken from palette[0].
    Params:
      foreground =       the new foreground color, or null
      background =       the new background color, or null
      palette =       the color palette
  */
  void setColors(gdk.rgba.RGBA foreground = null, gdk.rgba.RGBA background = null, gdk.rgba.RGBA[] palette = null)
  {
    size_t _paletteSize;
    if (palette)
      _paletteSize = cast(size_t)palette.length;

    GdkRGBA[] _tmppalette;
    foreach (obj; palette)
      _tmppalette ~= *cast(GdkRGBA*)obj.cPtr;
    const(GdkRGBA)* _palette = _tmppalette.ptr;
    vte_terminal_set_colors(cast(VteTerminal*)cPtr, foreground ? cast(const(GdkRGBA)*)foreground.cPtr(No.Dup) : null, background ? cast(const(GdkRGBA)*)background.cPtr(No.Dup) : null, _palette, _paletteSize);
  }

  /**
      Sets menu as the context menu in terminal.
    Use null to unset the current menu.
    
    Note that a menu model set with [vte.terminal.Terminal.setContextMenuModel]
    takes precedence over a menu set using this function.
    Params:
      menu =       a menu
  */
  void setContextMenu(gtk.widget.Widget menu = null)
  {
    vte_terminal_set_context_menu(cast(VteTerminal*)cPtr, menu ? cast(GtkWidget*)menu.cPtr(No.Dup) : null);
  }

  /**
      Sets model as the context menu model in terminal.
    Use null to unset the current menu model.
    Params:
      model =       a #GMenuModel
  */
  void setContextMenuModel(gio.menu_model.MenuModel model = null)
  {
    vte_terminal_set_context_menu_model(cast(VteTerminal*)cPtr, model ? cast(GMenuModel*)model.cPtr(No.Dup) : null);
  }

  /**
      Sets whether or not the cursor will blink. Using [vte.types.CursorBlinkMode.System]
    will use the #GtkSettings::gtk-cursor-blink setting.
    Params:
      mode =       the #VteCursorBlinkMode to use
  */
  void setCursorBlinkMode(vte.types.CursorBlinkMode mode)
  {
    vte_terminal_set_cursor_blink_mode(cast(VteTerminal*)cPtr, mode);
  }

  /**
      Sets the shape of the cursor drawn.
    Params:
      shape =       the #VteCursorShape to use
  */
  void setCursorShape(vte.types.CursorShape shape)
  {
    vte_terminal_set_cursor_shape(cast(VteTerminal*)cPtr, shape);
  }

  /**
      Reset the terminal palette to reasonable compiled-in default color.
  */
  void setDefaultColors()
  {
    vte_terminal_set_default_colors(cast(VteTerminal*)cPtr);
  }

  /**
      Modifies the terminal's delete key binding, which controls what
    string or control sequence the terminal sends to its child when the user
    presses the delete key.
    Params:
      binding =       a #VteEraseBinding for the delete key
  */
  void setDeleteBinding(vte.types.EraseBinding binding)
  {
    vte_terminal_set_delete_binding(cast(VteTerminal*)cPtr, binding);
  }

  /**
      Controls whether or not the terminal will perform bidirectional text rendering.
    Params:
      enableBidi =       true to enable BiDi support
  */
  void setEnableBidi(bool enableBidi)
  {
    vte_terminal_set_enable_bidi(cast(VteTerminal*)cPtr, enableBidi);
  }

  /**
      Controls whether the terminal uses scroll events to scroll the history
    if the event was not otherwise consumed by it.
    
    This function is rarely useful, except when the terminal is added to a
    #GtkScrolledWindow, to perform kinetic scrolling (while vte itself does
    not, yet, implement kinetic scrolling by itself).
    Params:
      enable =       whether to enable fallback scrolling
  */
  void setEnableFallbackScrolling(bool enable)
  {
    vte_terminal_set_enable_fallback_scrolling(cast(VteTerminal*)cPtr, enable);
  }

  /**
      Controls whether or not the terminal will shape Arabic text.
    Params:
      enableShaping =       true to enable Arabic shaping
  */
  void setEnableShaping(bool enableShaping)
  {
    vte_terminal_set_enable_shaping(cast(VteTerminal*)cPtr, enableShaping);
  }

  /**
      Set whether to enable SIXEL images.
    Params:
      enabled =       whether to enable SIXEL images
  */
  void setEnableSixel(bool enabled)
  {
    vte_terminal_set_enable_sixel(cast(VteTerminal*)cPtr, enabled);
  }

  /**
      Changes the encoding the terminal will expect data from the child to
    be encoded with.  For certain terminal types, applications executing in the
    terminal can change the encoding. If codeset is null, it uses "UTF-8".
    
    Note: Support for non-UTF-8 is deprecated and may get removed altogether.
    Instead of this function, you should use a wrapper like luit(1) when
    spawning the child process.
    Params:
      codeset =       target charset, or null to use UTF-8
    Returns:     true if the encoding could be changed to the specified one,
       or false with error set to `G_CONVERT_ERROR_NO_CONVERSION`.
  
    Deprecated:     Support for non-UTF-8 is deprecated.
  */
  bool setEncoding(string codeset = null)
  {
    bool _retval;
    const(char)* _codeset = codeset.toCString(No.Alloc);
    GError *_err;
    _retval = vte_terminal_set_encoding(cast(VteTerminal*)cPtr, _codeset, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
      Sets the font used for rendering all text displayed by the terminal,
    overriding any fonts set using [gtk.widget.Widget.modifyFont].  The terminal
    will immediately attempt to load the desired font, retrieve its
    metrics, and attempt to resize itself to keep the same number of rows
    and columns.  The font scale is applied to the specified font.
    Params:
      fontDesc =       a #PangoFontDescription for the desired font, or null
  */
  void setFont(pango.font_description.FontDescription fontDesc = null)
  {
    vte_terminal_set_font(cast(VteTerminal*)cPtr, fontDesc ? cast(const(PangoFontDescription)*)fontDesc.cPtr(No.Dup) : null);
  }

  /**
      Sets the terminal's font options to options.
    
    Note that on GTK4, the terminal by default uses font options
    with [cairo.types.HintMetrics.On] set; to override that, use this
    function to set a #cairo_font_options_t that has
    [cairo.types.HintMetrics.Off] set.
    Params:
      fontOptions =       the font options, or null
  */
  override void setFontOptions(cairo.font_options.FontOptions fontOptions = null)
  {
    vte_terminal_set_font_options(cast(VteTerminal*)cPtr, fontOptions ? cast(const(cairo_font_options_t)*)fontOptions.cPtr(No.Dup) : null);
  }

  /**
      Sets the terminal's font scale to scale.
    Params:
      scale =       the font scale
  */
  void setFontScale(double scale)
  {
    vte_terminal_set_font_scale(cast(VteTerminal*)cPtr, scale);
  }

  /**
      Enables or disables user input. When user input is disabled,
    the terminal's child will not receive any key press, or mouse button
    press or motion events sent to it.
    Params:
      enabled =       whether to enable user input
  */
  void setInputEnabled(bool enabled)
  {
    vte_terminal_set_input_enabled(cast(VteTerminal*)cPtr, enabled);
  }

  /**
      Changes the value of the terminal's mouse autohide setting.  When autohiding
    is enabled, the mouse cursor will be hidden when the user presses a key and
    shown when the user moves the mouse.  This setting can be read using
    [vte.terminal.Terminal.getMouseAutohide].
    Params:
      setting =       whether the mouse pointer should autohide
  */
  void setMouseAutohide(bool setting)
  {
    vte_terminal_set_mouse_autohide(cast(VteTerminal*)cPtr, setting);
  }

  /**
      Sets pty as the PTY to use in terminal.
    Use null to unset the PTY.
    Params:
      pty =       a #VtePty, or null
  */
  void setPty(vte.pty.Pty pty = null)
  {
    vte_terminal_set_pty(cast(VteTerminal*)cPtr, pty ? cast(VtePty*)pty.cPtr(No.Dup) : null);
  }

  /**
      Controls whether or not the terminal will rewrap its contents, including
    the scrollback history, whenever the terminal's width changes.
    Params:
      rewrap =       true if the terminal should rewrap on resize
  */
  void setRewrapOnResize(bool rewrap)
  {
    vte_terminal_set_rewrap_on_resize(cast(VteTerminal*)cPtr, rewrap);
  }

  /**
      Controls whether or not the terminal will forcibly scroll to the bottom of
    the viewable history when text is inserted, e.g. by a paste.
    Params:
      scroll =       whether the terminal should scroll on insert
  */
  void setScrollOnInsert(bool scroll)
  {
    vte_terminal_set_scroll_on_insert(cast(VteTerminal*)cPtr, scroll);
  }

  /**
      Controls whether or not the terminal will forcibly scroll to the bottom of
    the viewable history when the user presses a key.  Modifier keys do not
    trigger this behavior.
    Params:
      scroll =       whether the terminal should scroll on keystrokes
  */
  void setScrollOnKeystroke(bool scroll)
  {
    vte_terminal_set_scroll_on_keystroke(cast(VteTerminal*)cPtr, scroll);
  }

  /**
      Controls whether or not the terminal will forcibly scroll to the bottom of
    the viewable history when the new data is received from the child.
    Params:
      scroll =       whether the terminal should scroll on output
  */
  void setScrollOnOutput(bool scroll)
  {
    vte_terminal_set_scroll_on_output(cast(VteTerminal*)cPtr, scroll);
  }

  /**
      Controls whether the terminal's scroll unit is lines or pixels.
    
    This function is rarely useful, except when the terminal is added to a
    #GtkScrolledWindow.
    Params:
      enable =       whether to use pixels as scroll unit
  */
  void setScrollUnitIsPixels(bool enable)
  {
    vte_terminal_set_scroll_unit_is_pixels(cast(VteTerminal*)cPtr, enable);
  }

  /**
      Sets the length of the scrollback buffer used by the terminal.  The size of
    the scrollback buffer will be set to the larger of this value and the number
    of visible rows the widget can display, so 0 can safely be used to disable
    scrollback.
    
    A negative value means "infinite scrollback".
    
    Using a large scrollback buffer (roughly 1M+ lines) may lead to performance
    degradation or exhaustion of system resources, and is therefore not recommended.
    
    Note that this setting only affects the normal screen buffer.
    No scrollback is allowed on the alternate screen buffer.
    Params:
      lines =       the length of the history buffer
  */
  void setScrollbackLines(glong lines)
  {
    vte_terminal_set_scrollback_lines(cast(VteTerminal*)cPtr, lines);
  }

  /**
      Attempts to change the terminal's size in terms of rows and columns.  If
    the attempt succeeds, the widget will resize itself to the proper size.
    Params:
      columns =       the desired number of columns
      rows =       the desired number of rows
  */
  void setSize(glong columns, glong rows)
  {
    vte_terminal_set_size(cast(VteTerminal*)cPtr, columns, rows);
  }

  /**
      Controls whether or not the terminal will allow blinking text.
    Params:
      textBlinkMode =       the #VteTextBlinkMode to use
  */
  void setTextBlinkMode(vte.types.TextBlinkMode textBlinkMode)
  {
    vte_terminal_set_text_blink_mode(cast(VteTerminal*)cPtr, textBlinkMode);
  }

  /**
      With this function you can provide a set of characters which will
    be considered parts of a word when doing word-wise selection, in
    addition to the default which only considers alphanumeric characters
    part of a word.
    
    The characters in exceptions must be non-alphanumeric, each character
    must occur only once, and if exceptions contains the character
    U+002D HYPHEN-MINUS, it must be at the start of the string.
    
    Use null to reset the set of exception characters to the default.
    Params:
      exceptions =       a string of ASCII punctuation characters, or null
  */
  void setWordCharExceptions(string exceptions)
  {
    const(char)* _exceptions = exceptions.toCString(No.Alloc);
    vte_terminal_set_word_char_exceptions(cast(VteTerminal*)cPtr, _exceptions);
  }

  /**
      Sets the horizontal alignment of terminal within its allocation.
    
    Note: `VTE_ALIGN_START_FILL` is not supported, and will be treated
      like [vte.types.Align.Start].
    Params:
      align_ =       alignment value from #VteAlign
  */
  void setXalign(vte.types.Align align_)
  {
    vte_terminal_set_xalign(cast(VteTerminal*)cPtr, align_);
  }

  /**
      Sets the horizontal fillment of terminal within its allocation.
    
    Note: `VTE_FILL_START_FILL` is not supported, and will be treated
      like `VTE_FILL_START`.
    Params:
      fill =       fillment value from #VteFill
  */
  void setXfill(bool fill)
  {
    vte_terminal_set_xfill(cast(VteTerminal*)cPtr, fill);
  }

  /**
      Sets the vertical alignment of terminal within its allocation.
    Params:
      align_ =       alignment value from #VteAlign
  */
  void setYalign(vte.types.Align align_)
  {
    vte_terminal_set_yalign(cast(VteTerminal*)cPtr, align_);
  }

  /**
      Sets the vertical fillment of terminal within its allocation.
    Note that yfill is only supported with yalign set to
    [vte.types.Align.Start], and is ignored for all other yalign values.
    Params:
      fill =       fillment value from #VteFill
  */
  void setYfill(bool fill)
  {
    vte_terminal_set_yfill(cast(VteTerminal*)cPtr, fill);
  }

  /**
      A convenience function that wraps creating the #VtePty and spawning
    the child process on it. Like [vte.terminal.Terminal.spawnWithFdsAsync],
    except that this function does not allow passing file descriptors to
    the child process. See [vte.terminal.Terminal.spawnWithFdsAsync] for more
    information.
    Params:
      ptyFlags =       flags from #VtePtyFlags
      workingDirectory =       the name of a directory the command should start
          in, or null to use the current working directory
      argv =       child's argument vector
      envv =       a list of environment
          variables to be added to the environment before starting the process, or null
      spawnFlags =       flags from #GSpawnFlags
      childSetup =       an extra child setup function to run in the child just before exec(), or null
      timeout =       a timeout value in ms, -1 for the default timeout, or G_MAXINT to wait indefinitely
      cancellable =       a #GCancellable, or null
      callback =       a #VteTerminalSpawnAsyncCallback, or null
  */
  void spawnAsync(vte.types.PtyFlags ptyFlags, string workingDirectory, string[] argv, string[] envv, glib.types.SpawnFlags spawnFlags, glib.types.SpawnChildSetupFunc childSetup, int timeout, gio.cancellable.Cancellable cancellable = null, vte.types.TerminalSpawnAsyncCallback callback = null)
  {
    extern(C) void _childSetupCallback(void* data)
    {
      auto _dlg = cast(glib.types.SpawnChildSetupFunc*)data;

      (*_dlg)();
    }
    auto _childSetupCB = childSetup ? &_childSetupCallback : null;

    extern(C) void _callbackCallback(VteTerminal* terminal, GPid pid, GError* error, void* userData)
    {
      ptrThawGC(userData);
      auto _dlg = cast(vte.types.TerminalSpawnAsyncCallback*)userData;

      (*_dlg)(ObjectG.getDObject!(vte.terminal.Terminal)(cast(void*)terminal, No.Take), pid, error ? new glib.error.ErrorG(cast(void*)error, No.Take) : null);
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _workingDirectory = workingDirectory.toCString(No.Alloc);
    char*[] _tmpargv;
    foreach (s; argv)
      _tmpargv ~= s.toCString(No.Alloc);
    _tmpargv ~= null;
    char** _argv = _tmpargv.ptr;

    char*[] _tmpenvv;
    foreach (s; envv)
      _tmpenvv ~= s.toCString(No.Alloc);
    _tmpenvv ~= null;
    char** _envv = _tmpenvv.ptr;

    auto _childSetup = childSetup ? freezeDelegate(cast(void*)&childSetup) : null;
    GDestroyNotify _childSetupDestroyCB = childSetup ? &thawDelegate : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    vte_terminal_spawn_async(cast(VteTerminal*)cPtr, ptyFlags, _workingDirectory, _argv, _envv, spawnFlags, _childSetupCB, _childSetup, _childSetupDestroyCB, timeout, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Starts the specified command under a newly-allocated controlling
    pseudo-terminal.  The argv and envv lists should be null-terminated.
    The "TERM" environment variable is automatically set to a default value,
    but can be overridden from envv.
    pty_flags controls logging the session to the specified system log files.
    
    Note that `G_SPAWN_DO_NOT_REAP_CHILD` will always be added to spawn_flags.
    
    Note also that `G_SPAWN_STDOUT_TO_DEV_NULL`, `G_SPAWN_STDERR_TO_DEV_NULL`,
    and `G_SPAWN_CHILD_INHERITS_STDIN` are not supported in spawn_flags, since
    stdin, stdout and stderr of the child process will always be connected to
    the PTY.
    
    Note that all open file descriptors will be closed in the child. If you want
    to keep some file descriptor open for use in the child process, you need to
    use a child setup function that unsets the FD_CLOEXEC flag on that file
    descriptor.
    
    See vte_pty_new(), [glib.global.spawnAsync] and [vte.terminal.Terminal.watchChild] for more information.
    
    Beginning with 0.52, sets PWD to working_directory in order to preserve symlink components.
    The caller should also make sure that symlinks were preserved while constructing the value of working_directory,
    e.g. by using [vte.terminal.Terminal.getCurrentDirectoryUri], [glib.global.getCurrentDir] or get_current_dir_name().
    Params:
      ptyFlags =       flags from #VtePtyFlags
      workingDirectory =       the name of a directory the command should start
          in, or null to use the current working directory
      argv =       child's argument vector
      envv =       a list of environment
          variables to be added to the environment before starting the process, or null
      spawnFlags =       flags from #GSpawnFlags
      childSetup =       an extra child setup function to run in the child just before exec(), or null
      childPid =       a location to store the child PID, or null
      cancellable =       a #GCancellable, or null
    Returns:     true on success, or false on error with error filled in
  
    Deprecated:     Use [vte.terminal.Terminal.spawnAsync] instead.
  */
  bool spawnSync(vte.types.PtyFlags ptyFlags, string workingDirectory, string[] argv, string[] envv, glib.types.SpawnFlags spawnFlags, glib.types.SpawnChildSetupFunc childSetup, out glib.types.Pid childPid, gio.cancellable.Cancellable cancellable = null)
  {
    extern(C) void _childSetupCallback(void* data)
    {
      auto _dlg = cast(glib.types.SpawnChildSetupFunc*)data;

      (*_dlg)();
    }
    auto _childSetupCB = childSetup ? &_childSetupCallback : null;

    bool _retval;
    const(char)* _workingDirectory = workingDirectory.toCString(No.Alloc);
    char*[] _tmpargv;
    foreach (s; argv)
      _tmpargv ~= s.toCString(No.Alloc);
    _tmpargv ~= null;
    char** _argv = _tmpargv.ptr;

    char*[] _tmpenvv;
    foreach (s; envv)
      _tmpenvv ~= s.toCString(No.Alloc);
    _tmpenvv ~= null;
    char** _envv = _tmpenvv.ptr;

    auto _childSetup = childSetup ? cast(void*)&(childSetup) : null;
    GError *_err;
    _retval = vte_terminal_spawn_sync(cast(VteTerminal*)cPtr, ptyFlags, _workingDirectory, _argv, _envv, spawnFlags, _childSetupCB, _childSetup, cast(GPid*)&childPid, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
      A convenience function that wraps creating the #VtePty and spawning
    the child process on it. See [vte.pty.Pty.newSync], [vte.pty.Pty.spawnWithFdsAsync],
    and [vte.pty.Pty.spawnFinish] for more information.
    
    When the operation is finished successfully, callback will be called
    with the child #GPid, and a null #GError. The child PID will already be
    watched via [vte.terminal.Terminal.watchChild].
    
    When the operation fails, callback will be called with a -1 #GPid,
    and a non-null #GError containing the error information.
    
    Note that `G_SPAWN_STDOUT_TO_DEV_NULL`, `G_SPAWN_STDERR_TO_DEV_NULL`,
    and `G_SPAWN_CHILD_INHERITS_STDIN` are not supported in spawn_flags, since
    stdin, stdout and stderr of the child process will always be connected to
    the PTY.
    
    If fds is not null, the child process will map the file descriptors from
    fds according to map_fds; n_map_fds must be less or equal to n_fds.
    This function will take ownership of the file descriptors in fds;
    you must not use or close them after this call.
    
    Note that all  open file descriptors apart from those mapped as above
    will be closed in the child. (If you want to keep some other file descriptor
    open for use in the child process, you need to use a child setup function
    that unsets the FD_CLOEXEC flag on that file descriptor manually.)
    
    Beginning with 0.60, and on linux only, and unless `VTE_SPAWN_NO_SYSTEMD_SCOPE` is
    passed in spawn_flags, the newly created child process will be moved to its own
    systemd user scope; and if `VTE_SPAWN_REQUIRE_SYSTEMD_SCOPE` is passed, and creation
    of the systemd user scope fails, the whole spawn will fail.
    You can override the options used for the systemd user scope by
    providing a systemd override file for 'vte-spawn-.scope' unit. See man:systemd.unit(5)
    for further information.
    
    Note that if terminal has been destroyed before the operation is called,
    callback will be called with a null terminal; you must not do anything
    in the callback besides freeing any resources associated with user_data,
    but taking care not to access the now-destroyed #VteTerminal. Note that
    in this case, if spawning was successful, the child process will be aborted
    automatically.
    
    Beginning with 0.52, sets PWD to working_directory in order to preserve symlink components.
    The caller should also make sure that symlinks were preserved while constructing the value of working_directory,
    e.g. by using [vte.terminal.Terminal.getCurrentDirectoryUri], [glib.global.getCurrentDir] or get_current_dir_name().
    Params:
      ptyFlags =       flags from #VtePtyFlags
      workingDirectory =       the name of a directory the command should start
          in, or null to use the current working directory
      argv =       child's argument vector
      envv =       a list of environment
          variables to be added to the environment before starting the process, or null
      fds =       an array of file descriptors, or null
      mapFds =       an array of integers, or null
      spawnFlags =       flags from #GSpawnFlags
      childSetup =       an extra child setup function to run in the child just before exec(), or null
      timeout =       a timeout value in ms, -1 for the default timeout, or G_MAXINT to wait indefinitely
      cancellable =       a #GCancellable, or null
      callback =       a #VteTerminalSpawnAsyncCallback, or null
  */
  void spawnWithFdsAsync(vte.types.PtyFlags ptyFlags, string workingDirectory, string[] argv, string[] envv, int[] fds, int[] mapFds, glib.types.SpawnFlags spawnFlags, glib.types.SpawnChildSetupFunc childSetup, int timeout, gio.cancellable.Cancellable cancellable = null, vte.types.TerminalSpawnAsyncCallback callback = null)
  {
    extern(C) void _childSetupCallback(void* data)
    {
      auto _dlg = cast(glib.types.SpawnChildSetupFunc*)data;

      (*_dlg)();
    }
    auto _childSetupCB = childSetup ? &_childSetupCallback : null;

    extern(C) void _callbackCallback(VteTerminal* terminal, GPid pid, GError* error, void* userData)
    {
      ptrThawGC(userData);
      auto _dlg = cast(vte.types.TerminalSpawnAsyncCallback*)userData;

      (*_dlg)(ObjectG.getDObject!(vte.terminal.Terminal)(cast(void*)terminal, No.Take), pid, error ? new glib.error.ErrorG(cast(void*)error, No.Take) : null);
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _workingDirectory = workingDirectory.toCString(No.Alloc);
    const(char)*[] _tmpargv;
    foreach (s; argv)
      _tmpargv ~= s.toCString(No.Alloc);
    _tmpargv ~= null;
    const(char*)* _argv = _tmpargv.ptr;

    const(char)*[] _tmpenvv;
    foreach (s; envv)
      _tmpenvv ~= s.toCString(No.Alloc);
    _tmpenvv ~= null;
    const(char*)* _envv = _tmpenvv.ptr;

    int _nFds;
    if (fds)
      _nFds = cast(int)fds.length;

    auto _fds = cast(const(int)*)fds.ptr;
    int _nMapFds;
    if (mapFds)
      _nMapFds = cast(int)mapFds.length;

    auto _mapFds = cast(const(int)*)mapFds.ptr;
    auto _childSetup = childSetup ? freezeDelegate(cast(void*)&childSetup) : null;
    GDestroyNotify _childSetupDestroyCB = childSetup ? &thawDelegate : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    vte_terminal_spawn_with_fds_async(cast(VteTerminal*)cPtr, ptyFlags, _workingDirectory, _argv, _envv, _fds, _nFds, _mapFds, _nMapFds, spawnFlags, _childSetupCB, _childSetup, _childSetupDestroyCB, timeout, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Clears the current selection.
  */
  void unselectAll()
  {
    vte_terminal_unselect_all(cast(VteTerminal*)cPtr);
  }

  /**
      Watches child_pid. When the process exists, the #VteTerminal::child-exited
    signal will be called with the child's exit status.
    
    Prior to calling this function, a #VtePty must have been set in terminal
    using [vte.terminal.Terminal.setPty].
    When the child exits, the terminal's #VtePty will be set to null.
    
    Note: [glib.global.childWatchAdd] or [glib.global.childWatchAddFull] must not have
    been called for child_pid, nor a #GSource for it been created with
    [glib.global.childWatchSourceNew].
    
    Note: when using the [glib.global.spawnAsync] family of functions,
    the `G_SPAWN_DO_NOT_REAP_CHILD` flag MUST have been passed.
    Params:
      childPid =       a #GPid
  */
  void watchChild(glib.types.Pid childPid)
  {
    vte_terminal_watch_child(cast(VteTerminal*)cPtr, childPid);
  }

  /**
      Write contents of the current contents of terminal (including any
    scrollback history) to stream according to flags.
    
    If cancellable is not null, then the operation can be cancelled by triggering
    the cancellable object from another thread. If the operation was cancelled,
    the error [gio.types.IOErrorEnum.Cancelled] will be returned in error.
    
    This is a synchronous operation and will make the widget (and input
    processing) during the write operation, which may take a long time
    depending on scrollback history and stream availability for writing.
    Params:
      stream =       a #GOutputStream to write to
      flags =       a set of #VteWriteFlags
      cancellable =       a #GCancellable object, or null
    Returns:     true on success, false if there was an error
  */
  bool writeContentsSync(gio.output_stream.OutputStream stream, vte.types.WriteFlags flags, gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = vte_terminal_write_contents_sync(cast(VteTerminal*)cPtr, stream ? cast(GOutputStream*)stream.cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
      This signal is emitted when the a child sends a bell request to the
    terminal.
  
    ## Parameters
    $(LIST
      * $(B terminal) the instance the signal is connected to
    )
  */
  alias BellCallbackDlg = void delegate(vte.terminal.Terminal terminal);

  /** ditto */
  alias BellCallbackFunc = void function(vte.terminal.Terminal terminal);

  /**
    Connect to Bell signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectBell(T)(T callback, Flag!"After" after = No.After)
  if (is(T : BellCallbackDlg) || is(T : BellCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!(vte.terminal.Terminal)(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("bell", closure, after);
  }

  /**
      Emitted whenever the cell size changes, e.g. due to a change in
    font, font-scale or cell-width/height-scale.
    
    Note that this signal should rather be called "cell-size-changed".
  
    ## Parameters
    $(LIST
      * $(B width)       the new character cell width
      * $(B height)       the new character cell height
      * $(B terminal) the instance the signal is connected to
    )
  */
  alias CharSizeChangedCallbackDlg = void delegate(uint width, uint height, vte.terminal.Terminal terminal);

  /** ditto */
  alias CharSizeChangedCallbackFunc = void function(uint width, uint height, vte.terminal.Terminal terminal);

  /**
    Connect to CharSizeChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectCharSizeChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : CharSizeChangedCallbackDlg) || is(T : CharSizeChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!(vte.terminal.Terminal)(_paramVals);
      auto width = getVal!(uint)(&_paramVals[1]);
      auto height = getVal!(uint)(&_paramVals[2]);
      _dClosure.dlg(width, height, terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("char-size-changed", closure, after);
  }

  /**
      This signal is emitted when the terminal detects that a child
    watched using [vte.terminal.Terminal.watchChild] has exited.
  
    ## Parameters
    $(LIST
      * $(B status)       the child's exit status
      * $(B terminal) the instance the signal is connected to
    )
  */
  alias ChildExitedCallbackDlg = void delegate(int status, vte.terminal.Terminal terminal);

  /** ditto */
  alias ChildExitedCallbackFunc = void function(int status, vte.terminal.Terminal terminal);

  /**
    Connect to ChildExited signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectChildExited(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ChildExitedCallbackDlg) || is(T : ChildExitedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!(vte.terminal.Terminal)(_paramVals);
      auto status = getVal!(int)(&_paramVals[1]);
      _dClosure.dlg(status, terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("child-exited", closure, after);
  }

  /**
      Emitted whenever the terminal receives input from the user and
    prepares to send it to the child process.
  
    ## Parameters
    $(LIST
      * $(B text)       a string of text
      * $(B size)       the length of that string of text
      * $(B terminal) the instance the signal is connected to
    )
  */
  alias CommitCallbackDlg = void delegate(string text, uint size, vte.terminal.Terminal terminal);

  /** ditto */
  alias CommitCallbackFunc = void function(string text, uint size, vte.terminal.Terminal terminal);

  /**
    Connect to Commit signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectCommit(T)(T callback, Flag!"After" after = No.After)
  if (is(T : CommitCallbackDlg) || is(T : CommitCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!(vte.terminal.Terminal)(_paramVals);
      auto text = getVal!(string)(&_paramVals[1]);
      auto size = getVal!(uint)(&_paramVals[2]);
      _dClosure.dlg(text, size, terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("commit", closure, after);
  }

  /**
      Emitted whenever the visible appearance of the terminal has changed.
    Used primarily by #VteTerminalAccessible.
  
    ## Parameters
    $(LIST
      * $(B terminal) the instance the signal is connected to
    )
  */
  alias ContentsChangedCallbackDlg = void delegate(vte.terminal.Terminal terminal);

  /** ditto */
  alias ContentsChangedCallbackFunc = void function(vte.terminal.Terminal terminal);

  /**
    Connect to ContentsChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectContentsChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ContentsChangedCallbackDlg) || is(T : ContentsChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!(vte.terminal.Terminal)(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("contents-changed", closure, after);
  }

  /**
      Emitted whenever [vte.terminal.Terminal.copyClipboard] is called.
  
    ## Parameters
    $(LIST
      * $(B terminal) the instance the signal is connected to
    )
  */
  alias CopyClipboardCallbackDlg = void delegate(vte.terminal.Terminal terminal);

  /** ditto */
  alias CopyClipboardCallbackFunc = void function(vte.terminal.Terminal terminal);

  /**
    Connect to CopyClipboard signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectCopyClipboard(T)(T callback, Flag!"After" after = No.After)
  if (is(T : CopyClipboardCallbackDlg) || is(T : CopyClipboardCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!(vte.terminal.Terminal)(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("copy-clipboard", closure, after);
  }

  /**
      Emitted when the current directory URI is modified.
  
    ## Parameters
    $(LIST
      * $(B terminal) the instance the signal is connected to
    )
  */
  alias CurrentDirectoryUriChangedCallbackDlg = void delegate(vte.terminal.Terminal terminal);

  /** ditto */
  alias CurrentDirectoryUriChangedCallbackFunc = void function(vte.terminal.Terminal terminal);

  /**
    Connect to CurrentDirectoryUriChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectCurrentDirectoryUriChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : CurrentDirectoryUriChangedCallbackDlg) || is(T : CurrentDirectoryUriChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!(vte.terminal.Terminal)(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("current-directory-uri-changed", closure, after);
  }

  /**
      Emitted when the current file URI is modified.
  
    ## Parameters
    $(LIST
      * $(B terminal) the instance the signal is connected to
    )
  */
  alias CurrentFileUriChangedCallbackDlg = void delegate(vte.terminal.Terminal terminal);

  /** ditto */
  alias CurrentFileUriChangedCallbackFunc = void function(vte.terminal.Terminal terminal);

  /**
    Connect to CurrentFileUriChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectCurrentFileUriChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : CurrentFileUriChangedCallbackDlg) || is(T : CurrentFileUriChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!(vte.terminal.Terminal)(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("current-file-uri-changed", closure, after);
  }

  /**
      Emitted whenever the cursor moves to a new character cell.  Used
    primarily by #VteTerminalAccessible.
  
    ## Parameters
    $(LIST
      * $(B terminal) the instance the signal is connected to
    )
  */
  alias CursorMovedCallbackDlg = void delegate(vte.terminal.Terminal terminal);

  /** ditto */
  alias CursorMovedCallbackFunc = void function(vte.terminal.Terminal terminal);

  /**
    Connect to CursorMoved signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectCursorMoved(T)(T callback, Flag!"After" after = No.After)
  if (is(T : CursorMovedCallbackDlg) || is(T : CursorMovedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!(vte.terminal.Terminal)(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cursor-moved", closure, after);
  }

  /**
      Emitted when the user hits the '-' key while holding the Control key.
  
    ## Parameters
    $(LIST
      * $(B terminal) the instance the signal is connected to
    )
  */
  alias DecreaseFontSizeCallbackDlg = void delegate(vte.terminal.Terminal terminal);

  /** ditto */
  alias DecreaseFontSizeCallbackFunc = void function(vte.terminal.Terminal terminal);

  /**
    Connect to DecreaseFontSize signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectDecreaseFontSize(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DecreaseFontSizeCallbackDlg) || is(T : DecreaseFontSizeCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!(vte.terminal.Terminal)(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("decrease-font-size", closure, after);
  }

  /**
      Never emitted.
  
    ## Parameters
    $(LIST
      * $(B terminal) the instance the signal is connected to
    )
  */
  alias DeiconifyWindowCallbackDlg = void delegate(vte.terminal.Terminal terminal);

  /** ditto */
  alias DeiconifyWindowCallbackFunc = void function(vte.terminal.Terminal terminal);

  /**
    Connect to DeiconifyWindow signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectDeiconifyWindow(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DeiconifyWindowCallbackDlg) || is(T : DeiconifyWindowCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!(vte.terminal.Terminal)(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("deiconify-window", closure, after);
  }

  /**
      Emitted whenever the terminal's current encoding has changed.
    
    Note: support for non-UTF-8 is deprecated.
  
    ## Parameters
    $(LIST
      * $(B terminal) the instance the signal is connected to
    )
  */
  alias EncodingChangedCallbackDlg = void delegate(vte.terminal.Terminal terminal);

  /** ditto */
  alias EncodingChangedCallbackFunc = void function(vte.terminal.Terminal terminal);

  /**
    Connect to EncodingChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectEncodingChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : EncodingChangedCallbackDlg) || is(T : EncodingChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!(vte.terminal.Terminal)(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("encoding-changed", closure, after);
  }

  /**
      Emitted when the terminal receives an end-of-file from a child which
    is running in the terminal.  This signal is frequently (but not
    always) emitted with a #VteTerminal::child-exited signal.
  
    ## Parameters
    $(LIST
      * $(B terminal) the instance the signal is connected to
    )
  */
  alias EofCallbackDlg = void delegate(vte.terminal.Terminal terminal);

  /** ditto */
  alias EofCallbackFunc = void function(vte.terminal.Terminal terminal);

  /**
    Connect to Eof signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectEof(T)(T callback, Flag!"After" after = No.After)
  if (is(T : EofCallbackDlg) || is(T : EofCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!(vte.terminal.Terminal)(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("eof", closure, after);
  }

  /**
      Emitted when the hovered hyperlink changes.
    
    uri and bbox are owned by VTE, must not be modified, and might
    change after the signal handlers returns.
    
    The signal is not re-emitted when the bounding box changes for the
    same hyperlink. This might change in a future VTE version without notice.
  
    ## Parameters
    $(LIST
      * $(B uri)       the nonempty target URI under the mouse, or NULL
      * $(B bbox)       the bounding box of the hyperlink anchor text, or NULL
      * $(B terminal) the instance the signal is connected to
    )
  */
  alias HyperlinkHoverUriChangedCallbackDlg = void delegate(string uri, gdk.rectangle.Rectangle bbox, vte.terminal.Terminal terminal);

  /** ditto */
  alias HyperlinkHoverUriChangedCallbackFunc = void function(string uri, gdk.rectangle.Rectangle bbox, vte.terminal.Terminal terminal);

  /**
    Connect to HyperlinkHoverUriChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectHyperlinkHoverUriChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : HyperlinkHoverUriChangedCallbackDlg) || is(T : HyperlinkHoverUriChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!(vte.terminal.Terminal)(_paramVals);
      auto uri = getVal!(string)(&_paramVals[1]);
      auto bbox = getVal!(gdk.rectangle.Rectangle)(&_paramVals[2]);
      _dClosure.dlg(uri, bbox, terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("hyperlink-hover-uri-changed", closure, after);
  }

  /** */
  alias IconTitleChangedCallbackDlg = void delegate(vte.terminal.Terminal terminal);

  /** ditto */
  alias IconTitleChangedCallbackFunc = void function(vte.terminal.Terminal terminal);

  /**
    Connect to IconTitleChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectIconTitleChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : IconTitleChangedCallbackDlg) || is(T : IconTitleChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!(vte.terminal.Terminal)(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("icon-title-changed", closure, after);
  }

  /**
      Never emitted.
  
    ## Parameters
    $(LIST
      * $(B terminal) the instance the signal is connected to
    )
  */
  alias IconifyWindowCallbackDlg = void delegate(vte.terminal.Terminal terminal);

  /** ditto */
  alias IconifyWindowCallbackFunc = void function(vte.terminal.Terminal terminal);

  /**
    Connect to IconifyWindow signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectIconifyWindow(T)(T callback, Flag!"After" after = No.After)
  if (is(T : IconifyWindowCallbackDlg) || is(T : IconifyWindowCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!(vte.terminal.Terminal)(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("iconify-window", closure, after);
  }

  /**
      Emitted when the user hits the '+' key while holding the Control key.
  
    ## Parameters
    $(LIST
      * $(B terminal) the instance the signal is connected to
    )
  */
  alias IncreaseFontSizeCallbackDlg = void delegate(vte.terminal.Terminal terminal);

  /** ditto */
  alias IncreaseFontSizeCallbackFunc = void function(vte.terminal.Terminal terminal);

  /**
    Connect to IncreaseFontSize signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectIncreaseFontSize(T)(T callback, Flag!"After" after = No.After)
  if (is(T : IncreaseFontSizeCallbackDlg) || is(T : IncreaseFontSizeCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!(vte.terminal.Terminal)(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("increase-font-size", closure, after);
  }

  /**
      Never emitted.
  
    ## Parameters
    $(LIST
      * $(B terminal) the instance the signal is connected to
    )
  */
  alias LowerWindowCallbackDlg = void delegate(vte.terminal.Terminal terminal);

  /** ditto */
  alias LowerWindowCallbackFunc = void function(vte.terminal.Terminal terminal);

  /**
    Connect to LowerWindow signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectLowerWindow(T)(T callback, Flag!"After" after = No.After)
  if (is(T : LowerWindowCallbackDlg) || is(T : LowerWindowCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!(vte.terminal.Terminal)(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("lower-window", closure, after);
  }

  /**
      Never emitted.
  
    ## Parameters
    $(LIST
      * $(B terminal) the instance the signal is connected to
    )
  */
  alias MaximizeWindowCallbackDlg = void delegate(vte.terminal.Terminal terminal);

  /** ditto */
  alias MaximizeWindowCallbackFunc = void function(vte.terminal.Terminal terminal);

  /**
    Connect to MaximizeWindow signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectMaximizeWindow(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MaximizeWindowCallbackDlg) || is(T : MaximizeWindowCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!(vte.terminal.Terminal)(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("maximize-window", closure, after);
  }

  /**
      Never emitted.
  
    ## Parameters
    $(LIST
      * $(B x)       the terminal's desired location, X coordinate
      * $(B y)       the terminal's desired location, Y coordinate
      * $(B terminal) the instance the signal is connected to
    )
  */
  alias MoveWindowCallbackDlg = void delegate(uint x, uint y, vte.terminal.Terminal terminal);

  /** ditto */
  alias MoveWindowCallbackFunc = void function(uint x, uint y, vte.terminal.Terminal terminal);

  /**
    Connect to MoveWindow signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectMoveWindow(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MoveWindowCallbackDlg) || is(T : MoveWindowCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!(vte.terminal.Terminal)(_paramVals);
      auto x = getVal!(uint)(&_paramVals[1]);
      auto y = getVal!(uint)(&_paramVals[2]);
      _dClosure.dlg(x, y, terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-window", closure, after);
  }

  /**
      Emitted whenever [vte.terminal.Terminal.pasteClipboard] is called.
  
    ## Parameters
    $(LIST
      * $(B terminal) the instance the signal is connected to
    )
  */
  alias PasteClipboardCallbackDlg = void delegate(vte.terminal.Terminal terminal);

  /** ditto */
  alias PasteClipboardCallbackFunc = void function(vte.terminal.Terminal terminal);

  /**
    Connect to PasteClipboard signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectPasteClipboard(T)(T callback, Flag!"After" after = No.After)
  if (is(T : PasteClipboardCallbackDlg) || is(T : PasteClipboardCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!(vte.terminal.Terminal)(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("paste-clipboard", closure, after);
  }

  /**
      Never emitted.
  
    ## Parameters
    $(LIST
      * $(B terminal) the instance the signal is connected to
    )
  */
  alias RaiseWindowCallbackDlg = void delegate(vte.terminal.Terminal terminal);

  /** ditto */
  alias RaiseWindowCallbackFunc = void function(vte.terminal.Terminal terminal);

  /**
    Connect to RaiseWindow signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectRaiseWindow(T)(T callback, Flag!"After" after = No.After)
  if (is(T : RaiseWindowCallbackDlg) || is(T : RaiseWindowCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!(vte.terminal.Terminal)(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("raise-window", closure, after);
  }

  /**
      Never emitted.
  
    ## Parameters
    $(LIST
      * $(B terminal) the instance the signal is connected to
    )
  */
  alias RefreshWindowCallbackDlg = void delegate(vte.terminal.Terminal terminal);

  /** ditto */
  alias RefreshWindowCallbackFunc = void function(vte.terminal.Terminal terminal);

  /**
    Connect to RefreshWindow signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectRefreshWindow(T)(T callback, Flag!"After" after = No.After)
  if (is(T : RefreshWindowCallbackDlg) || is(T : RefreshWindowCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!(vte.terminal.Terminal)(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("refresh-window", closure, after);
  }

  /**
      Emitted at the child application's request.
  
    ## Parameters
    $(LIST
      * $(B width)       the desired number of columns
      * $(B height)       the desired number of rows
      * $(B terminal) the instance the signal is connected to
    )
  */
  alias ResizeWindowCallbackDlg = void delegate(uint width, uint height, vte.terminal.Terminal terminal);

  /** ditto */
  alias ResizeWindowCallbackFunc = void function(uint width, uint height, vte.terminal.Terminal terminal);

  /**
    Connect to ResizeWindow signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectResizeWindow(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ResizeWindowCallbackDlg) || is(T : ResizeWindowCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!(vte.terminal.Terminal)(_paramVals);
      auto width = getVal!(uint)(&_paramVals[1]);
      auto height = getVal!(uint)(&_paramVals[2]);
      _dClosure.dlg(width, height, terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("resize-window", closure, after);
  }

  /**
      Never emitted.
  
    ## Parameters
    $(LIST
      * $(B terminal) the instance the signal is connected to
    )
  */
  alias RestoreWindowCallbackDlg = void delegate(vte.terminal.Terminal terminal);

  /** ditto */
  alias RestoreWindowCallbackFunc = void function(vte.terminal.Terminal terminal);

  /**
    Connect to RestoreWindow signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectRestoreWindow(T)(T callback, Flag!"After" after = No.After)
  if (is(T : RestoreWindowCallbackDlg) || is(T : RestoreWindowCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!(vte.terminal.Terminal)(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("restore-window", closure, after);
  }

  /**
      Emitted whenever the contents of terminal's selection changes.
  
    ## Parameters
    $(LIST
      * $(B terminal) the instance the signal is connected to
    )
  */
  alias SelectionChangedCallbackDlg = void delegate(vte.terminal.Terminal terminal);

  /** ditto */
  alias SelectionChangedCallbackFunc = void function(vte.terminal.Terminal terminal);

  /**
    Connect to SelectionChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectSelectionChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : SelectionChangedCallbackDlg) || is(T : SelectionChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!(vte.terminal.Terminal)(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("selection-changed", closure, after);
  }

  /**
      Emitted with non-null context before terminal shows a context menu.
    The handler may set either a menu model using
    [vte.terminal.Terminal.setContextMenuModel], or a menu using
    [vte.terminal.Terminal.setContextMenu], which will then be used as context
    menu.
    If neither a menu model nor a menu are set, a context menu
    will not be shown.
    
    Note that context is only valid during the signal emission; you may
    not retain it to call methods on it afterwards.
    
    Also emitted with null context after the context menu has been dismissed.
  
    ## Parameters
    $(LIST
      * $(B context)       the context
      * $(B terminal) the instance the signal is connected to
    )
  */
  alias SetupContextMenuCallbackDlg = void delegate(vte.event_context.EventContext context, vte.terminal.Terminal terminal);

  /** ditto */
  alias SetupContextMenuCallbackFunc = void function(vte.event_context.EventContext context, vte.terminal.Terminal terminal);

  /**
    Connect to SetupContextMenu signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectSetupContextMenu(T)(T callback, Flag!"After" after = No.After)
  if (is(T : SetupContextMenuCallbackDlg) || is(T : SetupContextMenuCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!(vte.terminal.Terminal)(_paramVals);
      auto context = getVal!(vte.event_context.EventContext)(&_paramVals[1]);
      _dClosure.dlg(context, terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("setup-context-menu", closure, after);
  }

  /**
      Emitted when the #VteTerminal:window-title property is modified.
  
    ## Parameters
    $(LIST
      * $(B terminal) the instance the signal is connected to
    )
  */
  alias WindowTitleChangedCallbackDlg = void delegate(vte.terminal.Terminal terminal);

  /** ditto */
  alias WindowTitleChangedCallbackFunc = void function(vte.terminal.Terminal terminal);

  /**
    Connect to WindowTitleChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectWindowTitleChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : WindowTitleChangedCallbackDlg) || is(T : WindowTitleChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto terminal = getVal!(vte.terminal.Terminal)(_paramVals);
      _dClosure.dlg(terminal);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("window-title-changed", closure, after);
  }
}
