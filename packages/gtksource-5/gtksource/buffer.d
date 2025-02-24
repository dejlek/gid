module gtksource.buffer;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.text_buffer;
import gtk.text_iter;
import gtk.text_mark;
import gtk.text_tag_table;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.language;
import gtksource.mark;
import gtksource.style_scheme;
import gtksource.types;

/**
 * Subclass of [Gtk.TextBuffer].
 * A `GtkSourceBuffer` object is the model for class@View widgets.
 * It extends the [Gtk.TextBuffer] class by adding features useful to display
 * and edit source code such as syntax highlighting and bracket matching.
 * To create a `GtkSourceBuffer` use [GtkSource.Buffer.new_] or
 * [GtkSource.Buffer.newWithLanguage]. The second form is just a convenience
 * function which allows you to initially set a class@Language. You can also
 * directly create a class@View and get its class@Buffer with
 * [Gtk.TextView.getBuffer].
 * The highlighting is enabled by default, but you can disable it with
 * [GtkSource.Buffer.setHighlightSyntax].
 * # Context Classes:
 * It is possible to retrieve some information from the syntax highlighting
 * engine. The default context classes that are applied to regions of a
 * `GtkSourceBuffer`:
 * - **comment**: the region delimits a comment;
 * - **no-spell-check**: the region should not be spell checked;
 * - **path**: the region delimits a path to a file;
 * - **string**: the region delimits a string.
 * Custom language definition files can create their own context classes,
 * since the functions like [GtkSource.Buffer.iterHasContextClass] take
 * a string parameter as the context class.
 * `GtkSourceBuffer` provides an API to access the context classes:
 * [GtkSource.Buffer.iterHasContextClass],
 * [GtkSource.Buffer.getContextClassesAtIter],
 * [GtkSource.Buffer.iterForwardToContextClassToggle] and
 * [GtkSource.Buffer.iterBackwardToContextClassToggle].
 * And the signal@GtkSource.Buffer::highlight-updated signal permits to be notified
 * when a context class region changes.
 * Each context class has also an associated [Gtk.TextTag] with the name
 * `gtksourceview:context-classes:<name>`. For example to
 * retrieve the [Gtk.TextTag] for the string context class, one can write:
 * ```c
 * GtkTextTagTable *tag_table;
 * GtkTextTag *tag;
 * tag_table \= gtk_text_buffer_get_tag_table $(LPAREN)buffer$(RPAREN);
 * tag \= gtk_text_tag_table_lookup $(LPAREN)tag_table, "gtksourceview:context-classes:string"$(RPAREN);
 * ```
 * The tag must be used for read-only purposes.
 * Accessing a context class via the associated [Gtk.TextTag] is less
 * convenient than the `GtkSourceBuffer` API, because:
 * - The tag doesn't always exist, you need to listen to the
 * signal@Gtk.TextTagTable::tag-added and signal@Gtk.TextTagTable::tag-removed signals.
 * - Instead of the signal@GtkSource.Buffer::highlight-updated signal, you can listen
 * to the signal@Gtk.TextBuffer::apply-tag and signal@Gtk.TextBuffer::remove-tag signals.
 * A possible use-case for accessing a context class via the associated
 * [Gtk.TextTag] is to read the region but without adding a hard dependency on the
 * GtkSourceView library $(LPAREN)for example for a spell-checking library that wants to
 * read the no-spell-check region$(RPAREN).
 */
class Buffer : TextBuffer
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_buffer_get_type != &gidSymbolNotFound ? gtk_source_buffer_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new source buffer.
   * Params:
   *   table = a #GtkTextTagTable, or %NULL to create a new one.
   * Returns: a new source buffer.
   */
  this(TextTagTable table)
  {
    GtkSourceBuffer* _cretval;
    _cretval = gtk_source_buffer_new(table ? cast(GtkTextTagTable*)table.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Creates a new source buffer using the highlighting patterns in `language`.
   * This is equivalent to creating a new source buffer with
   * a new tag table and then calling [GtkSource.Buffer.setLanguage].
   * Params:
   *   language = a #GtkSourceLanguage.
   * Returns: a new source buffer which will highlight text
   *   according to the highlighting patterns in `language`.
   */
  static Buffer newWithLanguage(Language language)
  {
    GtkSourceBuffer* _cretval;
    _cretval = gtk_source_buffer_new_with_language(language ? cast(GtkSourceLanguage*)language.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!Buffer(cast(GtkSourceBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Moves `iter` to the position of the previous classMark of the given
   * category.
   * Returns %TRUE if `iter` was moved. If `category` is NULL, the
   * previous source mark can be of any category.
   * Params:
   *   iter = an iterator.
   *   category = category to search for, or %NULL
   * Returns: whether `iter` was moved.
   */
  bool backwardIterToSourceMark(TextIter iter, string category)
  {
    bool _retval;
    const(char)* _category = category.toCString(No.Alloc);
    _retval = gtk_source_buffer_backward_iter_to_source_mark(cast(GtkSourceBuffer*)cPtr, iter ? cast(GtkTextIter*)iter.cPtr(No.Dup) : null, _category);
    return _retval;
  }

  /**
   * Changes the case of the text between the specified iterators.
   * Since 5.4, this function will update the position of `start` and
   * `end` to surround the modified text.
   * Params:
   *   caseType = how to change the case.
   *   start = a #GtkTextIter.
   *   end = a #GtkTextIter.
   */
  void changeCase(ChangeCaseType caseType, TextIter start, TextIter end)
  {
    gtk_source_buffer_change_case(cast(GtkSourceBuffer*)cPtr, caseType, start ? cast(GtkTextIter*)start.cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end.cPtr(No.Dup) : null);
  }

  /**
   * Creates a source mark in the `buffer` of category `category`.
   * A source mark is a [Gtk.TextMark] but organized into categories.
   * Depending on the category a pixbuf can be specified that will be displayed
   * along the line of the mark.
   * Like a [Gtk.TextMark], a classMark can be anonymous if the
   * passed `name` is %NULL.  Also, the buffer owns the marks so you
   * shouldn't unreference it.
   * Marks always have left gravity and are moved to the beginning of
   * the line when the user deletes the line they were in.
   * Typical uses for a source mark are bookmarks, breakpoints, current
   * executing instruction indication in a source file, etc..
   * Params:
   *   name = the name of the mark, or %NULL.
   *   category = a string defining the mark category.
   *   where = location to place the mark.
   * Returns: a new classMark, owned by the buffer.
   */
  Mark createSourceMark(string name, string category, TextIter where)
  {
    GtkSourceMark* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _category = category.toCString(No.Alloc);
    _cretval = gtk_source_buffer_create_source_mark(cast(GtkSourceBuffer*)cPtr, _name, _category, where ? cast(GtkTextIter*)where.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!Mark(cast(GtkSourceMark*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Forces buffer to analyze and highlight the given area synchronously.
   * **Note**:
   * This is a potentially slow operation and should be used only
   * when you need to make sure that some text not currently
   * visible is highlighted, for instance before printing.
   * Params:
   *   start = start of the area to highlight.
   *   end = end of the area to highlight.
   */
  void ensureHighlight(TextIter start, TextIter end)
  {
    gtk_source_buffer_ensure_highlight(cast(GtkSourceBuffer*)cPtr, start ? cast(GtkTextIter*)start.cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end.cPtr(No.Dup) : null);
  }

  /**
   * Moves `iter` to the position of the next classMark of the given
   * `category`.
   * Returns %TRUE if `iter` was moved. If `category` is NULL, the
   * next source mark can be of any category.
   * Params:
   *   iter = an iterator.
   *   category = category to search for, or %NULL
   * Returns: whether `iter` was moved.
   */
  bool forwardIterToSourceMark(TextIter iter, string category)
  {
    bool _retval;
    const(char)* _category = category.toCString(No.Alloc);
    _retval = gtk_source_buffer_forward_iter_to_source_mark(cast(GtkSourceBuffer*)cPtr, iter ? cast(GtkTextIter*)iter.cPtr(No.Dup) : null, _category);
    return _retval;
  }

  /**
   * Get all defined context classes at iter.
   * See the classBuffer description for the list of default context classes.
   * Params:
   *   iter = a #GtkTextIter.
   * Returns: a new %NULL
   *   terminated array of context class names.
   *   Use [GLib.Global.strfreev] to free the array if it is no longer needed.
   */
  string[] getContextClassesAtIter(TextIter iter)
  {
    char** _cretval;
    _cretval = gtk_source_buffer_get_context_classes_at_iter(cast(GtkSourceBuffer*)cPtr, iter ? cast(GtkTextIter*)iter.cPtr(No.Dup) : null);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
    }
    return _retval;
  }

  /**
   * Determines whether bracket match highlighting is activated for the
   * source buffer.
   * Returns: %TRUE if the source buffer will highlight matching
   *   brackets.
   */
  bool getHighlightMatchingBrackets()
  {
    bool _retval;
    _retval = gtk_source_buffer_get_highlight_matching_brackets(cast(GtkSourceBuffer*)cPtr);
    return _retval;
  }

  /**
   * Determines whether syntax highlighting is activated in the source
   * buffer.
   * Returns: %TRUE if syntax highlighting is enabled, %FALSE otherwise.
   */
  bool getHighlightSyntax()
  {
    bool _retval;
    _retval = gtk_source_buffer_get_highlight_syntax(cast(GtkSourceBuffer*)cPtr);
    return _retval;
  }

  bool getImplicitTrailingNewline()
  {
    bool _retval;
    _retval = gtk_source_buffer_get_implicit_trailing_newline(cast(GtkSourceBuffer*)cPtr);
    return _retval;
  }

  /**
   * Returns the classLanguage associated with the buffer,
   * see [GtkSource.Buffer.setLanguage].
   * The returned object should not be unreferenced by the user.
   * Returns: the classLanguage associated
   *   with the buffer, or %NULL.
   */
  Language getLanguage()
  {
    GtkSourceLanguage* _cretval;
    _cretval = gtk_source_buffer_get_language(cast(GtkSourceBuffer*)cPtr);
    auto _retval = ObjectG.getDObject!Language(cast(GtkSourceLanguage*)_cretval, No.Take);
    return _retval;
  }

  bool getLoading()
  {
    bool _retval;
    _retval = gtk_source_buffer_get_loading(cast(GtkSourceBuffer*)cPtr);
    return _retval;
  }

  /**
   * Returns the list of marks of the given category at iter.
   * If category is %NULL it returns all marks at iter.
   * Params:
   *   iter = an iterator.
   *   category = category to search for, or %NULL
   * Returns: a newly allocated #GSList.
   */
  Mark[] getSourceMarksAtIter(TextIter iter, string category)
  {
    GSList* _cretval;
    const(char)* _category = category.toCString(No.Alloc);
    _cretval = gtk_source_buffer_get_source_marks_at_iter(cast(GtkSourceBuffer*)cPtr, iter ? cast(GtkTextIter*)iter.cPtr(No.Dup) : null, _category);
    auto _retval = gSListToD!(Mark, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
   * Returns the list of marks of the given category at line.
   * If category is %NULL, all marks at line are returned.
   * Params:
   *   line = a line number.
   *   category = category to search for, or %NULL
   * Returns: a newly allocated #GSList.
   */
  Mark[] getSourceMarksAtLine(int line, string category)
  {
    GSList* _cretval;
    const(char)* _category = category.toCString(No.Alloc);
    _cretval = gtk_source_buffer_get_source_marks_at_line(cast(GtkSourceBuffer*)cPtr, line, _category);
    auto _retval = gSListToD!(Mark, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
   * Returns the classStyleScheme associated with the buffer,
   * see [GtkSource.Buffer.setStyleScheme].
   * The returned object should not be unreferenced by the user.
   * Returns: the classStyleScheme
   *   associated with the buffer, or %NULL.
   */
  StyleScheme getStyleScheme()
  {
    GtkSourceStyleScheme* _cretval;
    _cretval = gtk_source_buffer_get_style_scheme(cast(GtkSourceBuffer*)cPtr);
    auto _retval = ObjectG.getDObject!StyleScheme(cast(GtkSourceStyleScheme*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Moves backward to the next toggle $(LPAREN)on or off$(RPAREN) of the context class.
   * If no matching context class toggles are found, returns %FALSE, otherwise %TRUE.
   * Does not return toggles located at iter, only toggles after iter. Sets
   * iter to the location of the toggle, or to the end of the buffer if no
   * toggle is found.
   * See the classBuffer description for the list of default context classes.
   * Params:
   *   iter = a #GtkTextIter.
   *   contextClass = the context class.
   * Returns: whether we found a context class toggle before iter
   */
  bool iterBackwardToContextClassToggle(TextIter iter, string contextClass)
  {
    bool _retval;
    const(char)* _contextClass = contextClass.toCString(No.Alloc);
    _retval = gtk_source_buffer_iter_backward_to_context_class_toggle(cast(GtkSourceBuffer*)cPtr, iter ? cast(GtkTextIter*)iter.cPtr(No.Dup) : null, _contextClass);
    return _retval;
  }

  /**
   * Moves forward to the next toggle $(LPAREN)on or off$(RPAREN) of the context class.
   * If no matching context class toggles are found, returns %FALSE, otherwise %TRUE.
   * Does not return toggles located at iter, only toggles after iter. Sets
   * iter to the location of the toggle, or to the end of the buffer if no
   * toggle is found.
   * See the classBuffer description for the list of default context classes.
   * Params:
   *   iter = a #GtkTextIter.
   *   contextClass = the context class.
   * Returns: whether we found a context class toggle after iter
   */
  bool iterForwardToContextClassToggle(TextIter iter, string contextClass)
  {
    bool _retval;
    const(char)* _contextClass = contextClass.toCString(No.Alloc);
    _retval = gtk_source_buffer_iter_forward_to_context_class_toggle(cast(GtkSourceBuffer*)cPtr, iter ? cast(GtkTextIter*)iter.cPtr(No.Dup) : null, _contextClass);
    return _retval;
  }

  /**
   * Check if the class context_class is set on iter.
   * See the classBuffer description for the list of default context classes.
   * Params:
   *   iter = a #GtkTextIter.
   *   contextClass = class to search for.
   * Returns: whether iter has the context class.
   */
  bool iterHasContextClass(TextIter iter, string contextClass)
  {
    bool _retval;
    const(char)* _contextClass = contextClass.toCString(No.Alloc);
    _retval = gtk_source_buffer_iter_has_context_class(cast(GtkSourceBuffer*)cPtr, iter ? cast(GtkTextIter*)iter.cPtr(No.Dup) : null, _contextClass);
    return _retval;
  }

  /**
   * Joins the lines of text between the specified iterators.
   * Params:
   *   start = a #GtkTextIter.
   *   end = a #GtkTextIter.
   */
  void joinLines(TextIter start, TextIter end)
  {
    gtk_source_buffer_join_lines(cast(GtkSourceBuffer*)cPtr, start ? cast(GtkTextIter*)start.cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end.cPtr(No.Dup) : null);
  }

  /**
   * Remove all marks of category between start and end from the buffer.
   * If category is NULL, all marks in the range will be removed.
   * Params:
   *   start = a #GtkTextIter.
   *   end = a #GtkTextIter.
   *   category = category to search for, or %NULL.
   */
  void removeSourceMarks(TextIter start, TextIter end, string category)
  {
    const(char)* _category = category.toCString(No.Alloc);
    gtk_source_buffer_remove_source_marks(cast(GtkSourceBuffer*)cPtr, start ? cast(GtkTextIter*)start.cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end.cPtr(No.Dup) : null, _category);
  }

  /**
   * Controls the bracket match highlighting function in the buffer.
   * If activated, when you position your cursor over a bracket character
   * $(LPAREN)a parenthesis, a square bracket, etc.$(RPAREN) the matching opening or
   * closing bracket character will be highlighted.
   * Params:
   *   highlight = %TRUE if you want matching brackets highlighted.
   */
  void setHighlightMatchingBrackets(bool highlight)
  {
    gtk_source_buffer_set_highlight_matching_brackets(cast(GtkSourceBuffer*)cPtr, highlight);
  }

  /**
   * Controls whether syntax is highlighted in the buffer.
   * If highlight is %TRUE, the text will be highlighted according to the syntax
   * patterns specified in the classLanguage set with [GtkSource.Buffer.setLanguage].
   * If highlight is %FALSE, syntax highlighting is disabled and all the
   * [Gtk.TextTag] objects that have been added by the syntax highlighting engine
   * are removed from the buffer.
   * Params:
   *   highlight = %TRUE to enable syntax highlighting, %FALSE to disable it.
   */
  void setHighlightSyntax(bool highlight)
  {
    gtk_source_buffer_set_highlight_syntax(cast(GtkSourceBuffer*)cPtr, highlight);
  }

  /**
   * Sets whether the buffer has an implicit trailing newline.
   * If an explicit trailing newline is present in a [Gtk.TextBuffer], [Gtk.TextView]
   * shows it as an empty line. This is generally not what the user expects.
   * If implicit_trailing_newline is %TRUE $(LPAREN)the default value$(RPAREN):
   * - when a classFileLoader loads the content of a file into the buffer,
   * the trailing newline $(LPAREN)if present in the file$(RPAREN) is not inserted into the
   * buffer.
   * - when a classFileSaver saves the content of the buffer into a file, a
   * trailing newline is added to the file.
   * On the other hand, if implicit_trailing_newline is %FALSE, the file's
   * content is not modified when loaded into the buffer, and the buffer's
   * content is not modified when saved into a file.
   * Params:
   *   implicitTrailingNewline = the new value.
   */
  void setImplicitTrailingNewline(bool implicitTrailingNewline)
  {
    gtk_source_buffer_set_implicit_trailing_newline(cast(GtkSourceBuffer*)cPtr, implicitTrailingNewline);
  }

  /**
   * Associates a classLanguage with the buffer.
   * Note that a classLanguage affects not only the syntax highlighting, but
   * also the [context classes](./class.Buffer.html#context-classes). If you want to disable just the
   * syntax highlighting, see [GtkSource.Buffer.setHighlightSyntax].
   * The buffer holds a reference to language.
   * Params:
   *   language = a #GtkSourceLanguage to set, or %NULL.
   */
  void setLanguage(Language language)
  {
    gtk_source_buffer_set_language(cast(GtkSourceBuffer*)cPtr, language ? cast(GtkSourceLanguage*)language.cPtr(No.Dup) : null);
  }

  /**
   * Sets a classStyleScheme to be used by the buffer and the view.
   * Note that a classStyleScheme affects not only the syntax highlighting,
   * but also other classView features such as highlighting the current line,
   * matching brackets, the line numbers, etc.
   * Instead of setting a %NULL scheme, it is better to disable syntax
   * highlighting with [GtkSource.Buffer.setHighlightSyntax], and setting the
   * classStyleScheme with the "classic" or "tango" ID, because those two
   * style schemes follow more closely the GTK theme $(LPAREN)for example for the
   * background color$(RPAREN).
   * The buffer holds a reference to scheme.
   * Params:
   *   scheme = a #GtkSourceStyleScheme or %NULL.
   */
  void setStyleScheme(StyleScheme scheme)
  {
    gtk_source_buffer_set_style_scheme(cast(GtkSourceBuffer*)cPtr, scheme ? cast(GtkSourceStyleScheme*)scheme.cPtr(No.Dup) : null);
  }

  /**
   * Sort the lines of text between the specified iterators.
   * Params:
   *   start = a #GtkTextIter.
   *   end = a #GtkTextIter.
   *   flags = #GtkSourceSortFlags specifying how the sort should behave
   *   column = sort considering the text starting at the given column
   */
  void sortLines(TextIter start, TextIter end, SortFlags flags, int column)
  {
    gtk_source_buffer_sort_lines(cast(GtkSourceBuffer*)cPtr, start ? cast(GtkTextIter*)start.cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end.cPtr(No.Dup) : null, flags, column);
  }

  /**
   * iter is set to a valid iterator pointing to the matching bracket
   * if state is %GTK_SOURCE_BRACKET_MATCH_FOUND. Otherwise iter is
   * meaningless.
   * The signal is emitted only when the state changes, typically when
   * the cursor moves.
   * A use-case for this signal is to show messages in a [Gtk.Statusbar].
   * Params
   *   iter = if found, the location of the matching bracket.
   *   state = state of bracket matching.
   *   buffer = the instance the signal is connected to
   */
  alias BracketMatchedCallbackDlg = void delegate(TextIter iter, BracketMatchType state, Buffer buffer);
  alias BracketMatchedCallbackFunc = void function(TextIter iter, BracketMatchType state, Buffer buffer);

  /**
   * Connect to BracketMatched signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectBracketMatched(T)(T callback, Flag!"After" after = No.After)
  if (is(T : BracketMatchedCallbackDlg) || is(T : BracketMatchedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto buffer = getVal!Buffer(_paramVals);
      auto iter = getVal!TextIter(&_paramVals[1]);
      auto state = getVal!BracketMatchType(&_paramVals[2]);
      _dClosure.dlg(iter, state, buffer);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("bracket-matched", closure, after);
  }

  /**
   * The "cursor-moved" signal is emitted when then insertion mark has moved.
   *   buffer = the instance the signal is connected to
   */
  alias CursorMovedCallbackDlg = void delegate(Buffer buffer);
  alias CursorMovedCallbackFunc = void function(Buffer buffer);

  /**
   * Connect to CursorMoved signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectCursorMoved(T)(T callback, Flag!"After" after = No.After)
  if (is(T : CursorMovedCallbackDlg) || is(T : CursorMovedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto buffer = getVal!Buffer(_paramVals);
      _dClosure.dlg(buffer);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cursor-moved", closure, after);
  }

  /**
   * The ::highlight-updated signal is emitted when the syntax
   * highlighting and [context classes](./class.Buffer.html#context-classes) are updated in a
   * certain region of the buffer.
   * Params
   *   start = the start of the updated region
   *   end = the end of the updated region
   *   buffer = the instance the signal is connected to
   */
  alias HighlightUpdatedCallbackDlg = void delegate(TextIter start, TextIter end, Buffer buffer);
  alias HighlightUpdatedCallbackFunc = void function(TextIter start, TextIter end, Buffer buffer);

  /**
   * Connect to HighlightUpdated signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectHighlightUpdated(T)(T callback, Flag!"After" after = No.After)
  if (is(T : HighlightUpdatedCallbackDlg) || is(T : HighlightUpdatedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto buffer = getVal!Buffer(_paramVals);
      auto start = getVal!TextIter(&_paramVals[1]);
      auto end = getVal!TextIter(&_paramVals[2]);
      _dClosure.dlg(start, end, buffer);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("highlight-updated", closure, after);
  }

  /**
   * The ::source-mark-updated signal is emitted each time
   * a mark is added to, moved or removed from the buffer.
   * Params
   *   mark = the classMark
   *   buffer = the instance the signal is connected to
   */
  alias SourceMarkUpdatedCallbackDlg = void delegate(TextMark mark, Buffer buffer);
  alias SourceMarkUpdatedCallbackFunc = void function(TextMark mark, Buffer buffer);

  /**
   * Connect to SourceMarkUpdated signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectSourceMarkUpdated(T)(T callback, Flag!"After" after = No.After)
  if (is(T : SourceMarkUpdatedCallbackDlg) || is(T : SourceMarkUpdatedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto buffer = getVal!Buffer(_paramVals);
      auto mark = getVal!TextMark(&_paramVals[1]);
      _dClosure.dlg(mark, buffer);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("source-mark-updated", closure, after);
  }
}
