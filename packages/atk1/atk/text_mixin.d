module atk.text_mixin;

public import atk.text_iface_proxy;
public import atk.c.functions;
public import atk.c.types;
public import atk.text_range;
public import atk.types;
public import gid.gid;
public import gobject.dclosure;

/**
 * The ATK interface implemented by components with text content.
 * #AtkText should be implemented by #AtkObjects on behalf of widgets
 * that have text content which is either attributed or otherwise
 * non-trivial.  #AtkObjects whose text content is simple,
 * unattributed, and very brief may expose that content via
 * #atk_object_get_name instead; however if the text is editable,
 * multi-line, typically longer than three or four words, attributed,
 * selectable, or if the object already uses the 'name' ATK property
 * for other information, the #AtkText interface should be used to
 * expose the text content.  In the case of editable text content,
 * #AtkEditableText $(LPAREN)a subtype of the #AtkText interface$(RPAREN) should be
 * implemented instead.
 * #AtkText provides not only traversal facilities and change
 * notification for text content, but also caret tracking and glyph
 * bounding box calculations.  Note that the text strings are exposed
 * as UTF-8, and are therefore potentially multi-byte, and
 * caret-to-byte offset mapping makes no assumptions about the
 * character length; also bounding box glyph-to-offset mapping may be
 * complex for languages which use ligatures.
 */
template TextT()
{

  /**
   * Adds a selection bounded by the specified offsets.
   * Params:
   *   startOffset = the starting character offset of the selected region
   *   endOffset = the offset of the first character after the selected region.
   * Returns: %TRUE if successful, %FALSE otherwise
   */
  override bool addSelection(int startOffset, int endOffset)
  {
    bool _retval;
    _retval = atk_text_add_selection(cast(AtkText*)cPtr, startOffset, endOffset);
    return _retval;
  }

  /**
   * Get the ranges of text in the specified bounding box.
   * Params:
   *   rect = An AtkTextRectangle giving the dimensions of the bounding box.
   *   coordType = Specify whether coordinates are relative to the screen or widget window.
   *   xClipType = Specify the horizontal clip type.
   *   yClipType = Specify the vertical clip type.
   * Returns: Array of AtkTextRange. The last
   *   element of the array returned by this function will be NULL.
   */
  override atk.text_range.TextRange[] getBoundedRanges(atk.types.TextRectangle rect, atk.types.CoordType coordType, atk.types.TextClipType xClipType, atk.types.TextClipType yClipType)
  {
    AtkTextRange** _cretval;
    _cretval = atk_text_get_bounded_ranges(cast(AtkText*)cPtr, &rect, coordType, xClipType, yClipType);
    atk.text_range.TextRange[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new atk.text_range.TextRange[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = new atk.text_range.TextRange(cast(void*)_cretval[i], Yes.Take);
    }
    return _retval;
  }

  /**
   * Gets the offset of the position of the caret $(LPAREN)cursor$(RPAREN).
   * Returns: the character offset of the position of the caret or -1 if
   *   the caret is not located inside the element or in the case of
   *   any other failure.
   */
  override int getCaretOffset()
  {
    int _retval;
    _retval = atk_text_get_caret_offset(cast(AtkText*)cPtr);
    return _retval;
  }

  /**
   * Gets the specified text.
   * Params:
   *   offset = a character offset within text
   * Returns: the character at offset or 0 in the case of failure.
   */
  override dchar getCharacterAtOffset(int offset)
  {
    dchar _retval;
    _retval = atk_text_get_character_at_offset(cast(AtkText*)cPtr, offset);
    return _retval;
  }

  /**
   * Gets the character count.
   * Returns: the number of characters or -1 in case of failure.
   */
  override int getCharacterCount()
  {
    int _retval;
    _retval = atk_text_get_character_count(cast(AtkText*)cPtr);
    return _retval;
  }

  /**
   * If the extent can not be obtained $(LPAREN)e.g. missing support$(RPAREN), all of x, y, width,
   * height are set to -1.
   * Get the bounding box containing the glyph representing the character at
   * a particular text offset.
   * Params:
   *   offset = The offset of the text character for which bounding information is required.
   *   x = Pointer for the x coordinate of the bounding box
   *   y = Pointer for the y coordinate of the bounding box
   *   width = Pointer for the width of the bounding box
   *   height = Pointer for the height of the bounding box
   *   coords = specify whether coordinates are relative to the screen or widget window
   */
  override void getCharacterExtents(int offset, out int x, out int y, out int width, out int height, atk.types.CoordType coords)
  {
    atk_text_get_character_extents(cast(AtkText*)cPtr, offset, cast(int*)&x, cast(int*)&y, cast(int*)&width, cast(int*)&height, coords);
  }

  /**
   * Gets the number of selected regions.
   * Returns: The number of selected regions, or -1 in the case of failure.
   */
  override int getNSelections()
  {
    int _retval;
    _retval = atk_text_get_n_selections(cast(AtkText*)cPtr);
    return _retval;
  }

  /**
   * Gets the offset of the character located at coordinates x and y. x and y
   * are interpreted as being relative to the screen or this widget's window
   * depending on coords.
   * Params:
   *   x = screen x-position of character
   *   y = screen y-position of character
   *   coords = specify whether coordinates are relative to the screen or
   *     widget window
   * Returns: the offset to the character which is located at  the specified
   *   x and y coordinates of -1 in case of failure.
   */
  override int getOffsetAtPoint(int x, int y, atk.types.CoordType coords)
  {
    int _retval;
    _retval = atk_text_get_offset_at_point(cast(AtkText*)cPtr, x, y, coords);
    return _retval;
  }

  /**
   * Get the bounding box for text within the specified range.
   * If the extents can not be obtained $(LPAREN)e.g. or missing support$(RPAREN), the rectangle
   * fields are set to -1.
   * Params:
   *   startOffset = The offset of the first text character for which boundary
   *     information is required.
   *   endOffset = The offset of the text character after the last character
   *     for which boundary information is required.
   *   coordType = Specify whether coordinates are relative to the screen or widget window.
   *   rect = A pointer to a AtkTextRectangle which is filled in by this function.
   */
  override void getRangeExtents(int startOffset, int endOffset, atk.types.CoordType coordType, out atk.types.TextRectangle rect)
  {
    atk_text_get_range_extents(cast(AtkText*)cPtr, startOffset, endOffset, coordType, &rect);
  }

  /**
   * Gets the text from the specified selection.
   * Params:
   *   selectionNum = The selection number.  The selected regions are
   *     assigned numbers that correspond to how far the region is from the
   *     start of the text.  The selected region closest to the beginning
   *     of the text region is assigned the number 0, etc.  Note that adding,
   *     moving or deleting a selected region can change the numbering.
   *   startOffset = passes back the starting character offset of the selected region
   *   endOffset = passes back the ending character offset $(LPAREN)offset immediately past$(RPAREN)
   *     of the selected region
   * Returns: a newly allocated string containing the selected text. Use [glib.global.gfree]
   *   to free the returned string.
   */
  override string getSelection(int selectionNum, out int startOffset, out int endOffset)
  {
    char* _cretval;
    _cretval = atk_text_get_selection(cast(AtkText*)cPtr, selectionNum, cast(int*)&startOffset, cast(int*)&endOffset);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Gets a portion of the text exposed through an #AtkText according to a given offset
   * and a specific granularity, along with the start and end offsets defining the
   * boundaries of such a portion of text.
   * If granularity is ATK_TEXT_GRANULARITY_CHAR the character at the
   * offset is returned.
   * If granularity is ATK_TEXT_GRANULARITY_WORD the returned string
   * is from the word start at or before the offset to the word start after
   * the offset.
   * The returned string will contain the word at the offset if the offset
   * is inside a word and will contain the word before the offset if the
   * offset is not inside a word.
   * If granularity is ATK_TEXT_GRANULARITY_SENTENCE the returned string
   * is from the sentence start at or before the offset to the sentence
   * start after the offset.
   * The returned string will contain the sentence at the offset if the offset
   * is inside a sentence and will contain the sentence before the offset
   * if the offset is not inside a sentence.
   * If granularity is ATK_TEXT_GRANULARITY_LINE the returned string
   * is from the line start at or before the offset to the line
   * start after the offset.
   * If granularity is ATK_TEXT_GRANULARITY_PARAGRAPH the returned string
   * is from the start of the paragraph at or before the offset to the start
   * of the following paragraph after the offset.
   * Params:
   *   offset = position
   *   granularity = An #AtkTextGranularity
   *   startOffset = the starting character offset of the returned string, or -1
   *     in the case of error $(LPAREN)e.g. invalid offset, not implemented$(RPAREN)
   *   endOffset = the offset of the first character after the returned string,
   *     or -1 in the case of error $(LPAREN)e.g. invalid offset, not implemented$(RPAREN)
   * Returns: a newly allocated string containing the text at
   *   the offset bounded by the specified granularity. Use [glib.global.gfree]
   *   to free the returned string.  Returns %NULL if the offset is invalid
   *   or no implementation is available.
   */
  override string getStringAtOffset(int offset, atk.types.TextGranularity granularity, out int startOffset, out int endOffset)
  {
    char* _cretval;
    _cretval = atk_text_get_string_at_offset(cast(AtkText*)cPtr, offset, granularity, cast(int*)&startOffset, cast(int*)&endOffset);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Gets the specified text.
   * Params:
   *   startOffset = a starting character offset within text
   *   endOffset = an ending character offset within text, or -1 for the end of the string.
   * Returns: a newly allocated string containing the text from start_offset up
   *   to, but not including end_offset. Use [glib.global.gfree] to free the returned
   *   string.
   */
  override string getText(int startOffset, int endOffset)
  {
    char* _cretval;
    _cretval = atk_text_get_text(cast(AtkText*)cPtr, startOffset, endOffset);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Gets the specified text.
   * Params:
   *   offset = position
   *   boundaryType = An #AtkTextBoundary
   *   startOffset = the starting character offset of the returned string
   *   endOffset = the offset of the first character after the
   *     returned substring
   * Returns: a newly allocated string containing the text after offset bounded
   *   by the specified boundary_type. Use [glib.global.gfree] to free the returned
   *   string.

   * Deprecated: Please use [atk.text.Text.getStringAtOffset] instead.
   */
  override string getTextAfterOffset(int offset, atk.types.TextBoundary boundaryType, out int startOffset, out int endOffset)
  {
    char* _cretval;
    _cretval = atk_text_get_text_after_offset(cast(AtkText*)cPtr, offset, boundaryType, cast(int*)&startOffset, cast(int*)&endOffset);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Gets the specified text.
   * If the boundary_type if ATK_TEXT_BOUNDARY_CHAR the character at the
   * offset is returned.
   * If the boundary_type is ATK_TEXT_BOUNDARY_WORD_START the returned string
   * is from the word start at or before the offset to the word start after
   * the offset.
   * The returned string will contain the word at the offset if the offset
   * is inside a word and will contain the word before the offset if the
   * offset is not inside a word.
   * If the boundary type is ATK_TEXT_BOUNDARY_SENTENCE_START the returned
   * string is from the sentence start at or before the offset to the sentence
   * start after the offset.
   * The returned string will contain the sentence at the offset if the offset
   * is inside a sentence and will contain the sentence before the offset
   * if the offset is not inside a sentence.
   * If the boundary type is ATK_TEXT_BOUNDARY_LINE_START the returned
   * string is from the line start at or before the offset to the line
   * start after the offset.
   * Params:
   *   offset = position
   *   boundaryType = An #AtkTextBoundary
   *   startOffset = the starting character offset of the returned string
   *   endOffset = the offset of the first character after the
   *     returned substring
   * Returns: a newly allocated string containing the text at offset bounded
   *   by the specified boundary_type. Use [glib.global.gfree] to free the returned
   *   string.

   * Deprecated: This method is deprecated since ATK version
   *   2.9.4. Please use [atk.text.Text.getStringAtOffset] instead.
   */
  override string getTextAtOffset(int offset, atk.types.TextBoundary boundaryType, out int startOffset, out int endOffset)
  {
    char* _cretval;
    _cretval = atk_text_get_text_at_offset(cast(AtkText*)cPtr, offset, boundaryType, cast(int*)&startOffset, cast(int*)&endOffset);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Gets the specified text.
   * Params:
   *   offset = position
   *   boundaryType = An #AtkTextBoundary
   *   startOffset = the starting character offset of the returned string
   *   endOffset = the offset of the first character after the
   *     returned substring
   * Returns: a newly allocated string containing the text before offset bounded
   *   by the specified boundary_type. Use [glib.global.gfree] to free the returned
   *   string.

   * Deprecated: Please use [atk.text.Text.getStringAtOffset] instead.
   */
  override string getTextBeforeOffset(int offset, atk.types.TextBoundary boundaryType, out int startOffset, out int endOffset)
  {
    char* _cretval;
    _cretval = atk_text_get_text_before_offset(cast(AtkText*)cPtr, offset, boundaryType, cast(int*)&startOffset, cast(int*)&endOffset);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Removes the specified selection.
   * Params:
   *   selectionNum = The selection number.  The selected regions are
   *     assigned numbers that correspond to how far the region is from the
   *     start of the text.  The selected region closest to the beginning
   *     of the text region is assigned the number 0, etc.  Note that adding,
   *     moving or deleting a selected region can change the numbering.
   * Returns: %TRUE if successful, %FALSE otherwise
   */
  override bool textRemoveSelection(int selectionNum)
  {
    bool _retval;
    _retval = atk_text_remove_selection(cast(AtkText*)cPtr, selectionNum);
    return _retval;
  }

  /**
   * Makes a substring of text visible on the screen by scrolling all necessary parents.
   * Params:
   *   startOffset = start offset in the text
   *   endOffset = end offset in the text, or -1 for the end of the text.
   *   type = specify where the object should be made visible.
   * Returns: whether scrolling was successful.
   */
  override bool scrollSubstringTo(int startOffset, int endOffset, atk.types.ScrollType type)
  {
    bool _retval;
    _retval = atk_text_scroll_substring_to(cast(AtkText*)cPtr, startOffset, endOffset, type);
    return _retval;
  }

  /**
   * Move the top-left of a substring of text to a given position of the screen
   * by scrolling all necessary parents.
   * Params:
   *   startOffset = start offset in the text
   *   endOffset = end offset in the text, or -1 for the end of the text.
   *   coords = specify whether coordinates are relative to the screen or to the
   *     parent object.
   *   x = x-position where to scroll to
   *   y = y-position where to scroll to
   * Returns: whether scrolling was successful.
   */
  override bool scrollSubstringToPoint(int startOffset, int endOffset, atk.types.CoordType coords, int x, int y)
  {
    bool _retval;
    _retval = atk_text_scroll_substring_to_point(cast(AtkText*)cPtr, startOffset, endOffset, coords, x, y);
    return _retval;
  }

  /**
   * Sets the caret $(LPAREN)cursor$(RPAREN) position to the specified offset.
   * In the case of rich-text content, this method should either grab focus
   * or move the sequential focus navigation starting point $(LPAREN)if the application
   * supports this concept$(RPAREN) as if the user had clicked on the new caret position.
   * Typically, this means that the target of this operation is the node containing
   * the new caret position or one of its ancestors. In other words, after this
   * method is called, if the user advances focus, it should move to the first
   * focusable node following the new caret position.
   * Calling this method should also scroll the application viewport in a way
   * that matches the behavior of the application's typical caret motion or tab
   * navigation as closely as possible. This also means that if the application's
   * caret motion or focus navigation does not trigger a scroll operation, this
   * method should not trigger one either. If the application does not have a caret
   * motion or focus navigation operation, this method should try to scroll the new
   * caret position into view while minimizing unnecessary scroll motion.
   * Params:
   *   offset = the character offset of the new caret position
   * Returns: %TRUE if successful, %FALSE otherwise.
   */
  override bool setCaretOffset(int offset)
  {
    bool _retval;
    _retval = atk_text_set_caret_offset(cast(AtkText*)cPtr, offset);
    return _retval;
  }

  /**
   * Changes the start and end offset of the specified selection.
   * Params:
   *   selectionNum = The selection number.  The selected regions are
   *     assigned numbers that correspond to how far the region is from the
   *     start of the text.  The selected region closest to the beginning
   *     of the text region is assigned the number 0, etc.  Note that adding,
   *     moving or deleting a selected region can change the numbering.
   *   startOffset = the new starting character offset of the selection
   *   endOffset = the new end position of $(LPAREN)e.g. offset immediately past$(RPAREN)
   *     the selection
   * Returns: %TRUE if successful, %FALSE otherwise
   */
  override bool setSelection(int selectionNum, int startOffset, int endOffset)
  {
    bool _retval;
    _retval = atk_text_set_selection(cast(AtkText*)cPtr, selectionNum, startOffset, endOffset);
    return _retval;
  }

  /**
   * The "text-attributes-changed" signal is emitted when the text
   * attributes of the text of an object which implements AtkText
   * changes.
   *   text = the instance the signal is connected to
   */
  alias TextAttributesChangedCallbackDlg = void delegate(atk.text.Text text);
  alias TextAttributesChangedCallbackFunc = void function(atk.text.Text text);

  /**
   * Connect to TextAttributesChanged signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectTextAttributesChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : TextAttributesChangedCallbackDlg) || is(T : TextAttributesChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto text = getVal!(atk.text.Text)(_paramVals);
      _dClosure.dlg(text);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("text-attributes-changed", closure, after);
  }

  /**
   * The "text-caret-moved" signal is emitted when the caret
   * position of the text of an object which implements AtkText
   * changes.
   * Params
   *   arg1 = The new position of the text caret.
   *   text = the instance the signal is connected to
   */
  alias TextCaretMovedCallbackDlg = void delegate(int arg1, atk.text.Text text);
  alias TextCaretMovedCallbackFunc = void function(int arg1, atk.text.Text text);

  /**
   * Connect to TextCaretMoved signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectTextCaretMoved(T)(T callback, Flag!"After" after = No.After)
  if (is(T : TextCaretMovedCallbackDlg) || is(T : TextCaretMovedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto text = getVal!(atk.text.Text)(_paramVals);
      auto arg1 = getVal!(int)(&_paramVals[1]);
      _dClosure.dlg(arg1, text);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("text-caret-moved", closure, after);
  }

  /**
   * The "text-changed" signal is emitted when the text of the
   * object which implements the AtkText interface changes, This
   * signal will have a detail which is either "insert" or
   * "delete" which identifies whether the text change was an
   * insertion or a deletion.
   * Params
   *   arg1 = The position $(LPAREN)character offset$(RPAREN) of the insertion or deletion.
   *   arg2 = The length $(LPAREN)in characters$(RPAREN) of text inserted or deleted.
   *   text = the instance the signal is connected to

   * Deprecated: Use #AtkObject::text-insert or
   *   #AtkObject::text-remove instead.
   */
  alias TextChangedCallbackDlg = void delegate(int arg1, int arg2, atk.text.Text text);
  alias TextChangedCallbackFunc = void function(int arg1, int arg2, atk.text.Text text);

  /**
   * Connect to TextChanged signal.
   * Params:
   *   detail = Signal detail or null (default)
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectTextChanged(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (is(T : TextChangedCallbackDlg) || is(T : TextChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto text = getVal!(atk.text.Text)(_paramVals);
      auto arg1 = getVal!(int)(&_paramVals[1]);
      auto arg2 = getVal!(int)(&_paramVals[2]);
      _dClosure.dlg(arg1, arg2, text);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("text-changed"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }

  /**
   * The "text-insert" signal is emitted when a new text is
   * inserted. If the signal was not triggered by the user
   * $(LPAREN)e.g. typing or pasting text$(RPAREN), the "system" detail should be
   * included.
   * Params
   *   arg1 = The position $(LPAREN)character offset$(RPAREN) of the insertion.
   *   arg2 = The length $(LPAREN)in characters$(RPAREN) of text inserted.
   *   arg3 = The new text inserted
   *   text = the instance the signal is connected to
   */
  alias TextInsertCallbackDlg = void delegate(int arg1, int arg2, string arg3, atk.text.Text text);
  alias TextInsertCallbackFunc = void function(int arg1, int arg2, string arg3, atk.text.Text text);

  /**
   * Connect to TextInsert signal.
   * Params:
   *   detail = Signal detail or null (default)
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectTextInsert(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (is(T : TextInsertCallbackDlg) || is(T : TextInsertCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto text = getVal!(atk.text.Text)(_paramVals);
      auto arg1 = getVal!(int)(&_paramVals[1]);
      auto arg2 = getVal!(int)(&_paramVals[2]);
      auto arg3 = getVal!(string)(&_paramVals[3]);
      _dClosure.dlg(arg1, arg2, arg3, text);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("text-insert"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }

  /**
   * The "text-remove" signal is emitted when a new text is
   * removed. If the signal was not triggered by the user
   * $(LPAREN)e.g. typing or pasting text$(RPAREN), the "system" detail should be
   * included.
   * Params
   *   arg1 = The position $(LPAREN)character offset$(RPAREN) of the removal.
   *   arg2 = The length $(LPAREN)in characters$(RPAREN) of text removed.
   *   arg3 = The old text removed
   *   text = the instance the signal is connected to
   */
  alias TextRemoveCallbackDlg = void delegate(int arg1, int arg2, string arg3, atk.text.Text text);
  alias TextRemoveCallbackFunc = void function(int arg1, int arg2, string arg3, atk.text.Text text);

  /**
   * Connect to TextRemove signal.
   * Params:
   *   detail = Signal detail or null (default)
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectTextRemove(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (is(T : TextRemoveCallbackDlg) || is(T : TextRemoveCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto text = getVal!(atk.text.Text)(_paramVals);
      auto arg1 = getVal!(int)(&_paramVals[1]);
      auto arg2 = getVal!(int)(&_paramVals[2]);
      auto arg3 = getVal!(string)(&_paramVals[3]);
      _dClosure.dlg(arg1, arg2, arg3, text);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("text-remove"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }

  /**
   * The "text-selection-changed" signal is emitted when the
   * selected text of an object which implements AtkText changes.
   *   text = the instance the signal is connected to
   */
  alias TextSelectionChangedCallbackDlg = void delegate(atk.text.Text text);
  alias TextSelectionChangedCallbackFunc = void function(atk.text.Text text);

  /**
   * Connect to TextSelectionChanged signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectTextSelectionChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : TextSelectionChangedCallbackDlg) || is(T : TextSelectionChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto text = getVal!(atk.text.Text)(_paramVals);
      _dClosure.dlg(text);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("text-selection-changed", closure, after);
  }
}
