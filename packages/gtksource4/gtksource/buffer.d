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
import gtksource.undo_manager;

/** */
class Buffer : gtk.text_buffer.TextBuffer
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
      Creates a new source buffer.
    Params:
      table =       a #GtkTextTagTable, or null to create a new one.
    Returns:     a new source buffer.
  */
  this(gtk.text_tag_table.TextTagTable table = null)
  {
    GtkSourceBuffer* _cretval;
    _cretval = gtk_source_buffer_new(table ? cast(GtkTextTagTable*)table.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new source buffer using the highlighting patterns in
    language.  This is equivalent to creating a new source buffer with
    a new tag table and then calling [gtksource.buffer.Buffer.setLanguage].
    Params:
      language =       a #GtkSourceLanguage.
    Returns:     a new source buffer which will highlight text
      according to the highlighting patterns in language.
  */
  static gtksource.buffer.Buffer newWithLanguage(gtksource.language.Language language)
  {
    GtkSourceBuffer* _cretval;
    _cretval = gtk_source_buffer_new_with_language(language ? cast(GtkSourceLanguage*)language.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtksource.buffer.Buffer)(cast(GtkSourceBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Moves iter to the position of the previous #GtkSourceMark of the given
    category. Returns true if iter was moved. If category is NULL, the
    previous source mark can be of any category.
    Params:
      iter =       an iterator.
      category =       category to search for, or null
    Returns:     whether iter was moved.
  */
  bool backwardIterToSourceMark(gtk.text_iter.TextIter iter, string category = null)
  {
    bool _retval;
    const(char)* _category = category.toCString(No.Alloc);
    _retval = gtk_source_buffer_backward_iter_to_source_mark(cast(GtkSourceBuffer*)cPtr, iter ? cast(GtkTextIter*)iter.cPtr(No.Dup) : null, _category);
    return _retval;
  }

  /**
      Marks the beginning of a not undoable action on the buffer,
    disabling the undo manager.  Typically you would call this function
    before initially setting the contents of the buffer (e.g. when
    loading a file in a text editor).
    
    You may nest [gtksource.buffer.Buffer.beginNotUndoableAction] /
    [gtksource.buffer.Buffer.endNotUndoableAction] blocks.
  */
  void beginNotUndoableAction()
  {
    gtk_source_buffer_begin_not_undoable_action(cast(GtkSourceBuffer*)cPtr);
  }

  /**
      Determines whether a source buffer can redo the last action
    (i.e. if the last operation was an undo).
    Returns:     true if a redo is possible.
  */
  bool canRedo()
  {
    bool _retval;
    _retval = gtk_source_buffer_can_redo(cast(GtkSourceBuffer*)cPtr);
    return _retval;
  }

  /**
      Determines whether a source buffer can undo the last action.
    Returns:     true if it's possible to undo the last action.
  */
  bool canUndo()
  {
    bool _retval;
    _retval = gtk_source_buffer_can_undo(cast(GtkSourceBuffer*)cPtr);
    return _retval;
  }

  /**
      Changes the case of the text between the specified iterators.
    Params:
      caseType =       how to change the case.
      start =       a #GtkTextIter.
      end =       a #GtkTextIter.
  */
  void changeCase(gtksource.types.ChangeCaseType caseType, gtk.text_iter.TextIter start, gtk.text_iter.TextIter end)
  {
    gtk_source_buffer_change_case(cast(GtkSourceBuffer*)cPtr, caseType, start ? cast(GtkTextIter*)start.cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end.cPtr(No.Dup) : null);
  }

  /**
      Creates a source mark in the buffer of category category.  A source mark is
    a #GtkTextMark but organised into categories. Depending on the category
    a pixbuf can be specified that will be displayed along the line of the mark.
    
    Like a #GtkTextMark, a #GtkSourceMark can be anonymous if the
    passed name is null.  Also, the buffer owns the marks so you
    shouldn't unreference it.
    
    Marks always have left gravity and are moved to the beginning of
    the line when the user deletes the line they were in.
    
    Typical uses for a source mark are bookmarks, breakpoints, current
    executing instruction indication in a source file, etc..
    Params:
      name =       the name of the mark, or null.
      category =       a string defining the mark category.
      where =       location to place the mark.
    Returns:     a new #GtkSourceMark, owned by the buffer.
  */
  gtksource.mark.Mark createSourceMark(string name, string category, gtk.text_iter.TextIter where)
  {
    GtkSourceMark* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _category = category.toCString(No.Alloc);
    _cretval = gtk_source_buffer_create_source_mark(cast(GtkSourceBuffer*)cPtr, _name, _category, where ? cast(const(GtkTextIter)*)where.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtksource.mark.Mark)(cast(GtkSourceMark*)_cretval, No.Take);
    return _retval;
  }

  /**
      Marks the end of a not undoable action on the buffer.  When the
    last not undoable block is closed through the call to this
    function, the list of undo actions is cleared and the undo manager
    is re-enabled.
  */
  void endNotUndoableAction()
  {
    gtk_source_buffer_end_not_undoable_action(cast(GtkSourceBuffer*)cPtr);
  }

  /**
      Forces buffer to analyze and highlight the given area synchronously.
    
    <note>
      <para>
        This is a potentially slow operation and should be used only
        when you need to make sure that some text not currently
        visible is highlighted, for instance before printing.
      </para>
    </note>
    Params:
      start =       start of the area to highlight.
      end =       end of the area to highlight.
  */
  void ensureHighlight(gtk.text_iter.TextIter start, gtk.text_iter.TextIter end)
  {
    gtk_source_buffer_ensure_highlight(cast(GtkSourceBuffer*)cPtr, start ? cast(const(GtkTextIter)*)start.cPtr(No.Dup) : null, end ? cast(const(GtkTextIter)*)end.cPtr(No.Dup) : null);
  }

  /**
      Moves iter to the position of the next #GtkSourceMark of the given
    category. Returns true if iter was moved. If category is NULL, the
    next source mark can be of any category.
    Params:
      iter =       an iterator.
      category =       category to search for, or null
    Returns:     whether iter was moved.
  */
  bool forwardIterToSourceMark(gtk.text_iter.TextIter iter, string category = null)
  {
    bool _retval;
    const(char)* _category = category.toCString(No.Alloc);
    _retval = gtk_source_buffer_forward_iter_to_source_mark(cast(GtkSourceBuffer*)cPtr, iter ? cast(GtkTextIter*)iter.cPtr(No.Dup) : null, _category);
    return _retval;
  }

  /**
      Get all defined context classes at iter.
    
    See the #GtkSourceBuffer description for the list of default context classes.
    Params:
      iter =       a #GtkTextIter.
    Returns:     a new null
      terminated array of context class names.
      Use [glib.global.strfreev] to free the array if it is no longer needed.
  */
  string[] getContextClassesAtIter(gtk.text_iter.TextIter iter)
  {
    char** _cretval;
    _cretval = gtk_source_buffer_get_context_classes_at_iter(cast(GtkSourceBuffer*)cPtr, iter ? cast(const(GtkTextIter)*)iter.cPtr(No.Dup) : null);
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
      Determines whether bracket match highlighting is activated for the
    source buffer.
    Returns:     true if the source buffer will highlight matching
      brackets.
  */
  bool getHighlightMatchingBrackets()
  {
    bool _retval;
    _retval = gtk_source_buffer_get_highlight_matching_brackets(cast(GtkSourceBuffer*)cPtr);
    return _retval;
  }

  /**
      Determines whether syntax highlighting is activated in the source
    buffer.
    Returns:     true if syntax highlighting is enabled, false otherwise.
  */
  bool getHighlightSyntax()
  {
    bool _retval;
    _retval = gtk_source_buffer_get_highlight_syntax(cast(GtkSourceBuffer*)cPtr);
    return _retval;
  }

  /** */
  bool getImplicitTrailingNewline()
  {
    bool _retval;
    _retval = gtk_source_buffer_get_implicit_trailing_newline(cast(GtkSourceBuffer*)cPtr);
    return _retval;
  }

  /**
      Returns the #GtkSourceLanguage associated with the buffer,
    see [gtksource.buffer.Buffer.setLanguage].  The returned object should not be
    unreferenced by the user.
    Returns:     the #GtkSourceLanguage associated
      with the buffer, or null.
  */
  gtksource.language.Language getLanguage()
  {
    GtkSourceLanguage* _cretval;
    _cretval = gtk_source_buffer_get_language(cast(GtkSourceBuffer*)cPtr);
    auto _retval = ObjectG.getDObject!(gtksource.language.Language)(cast(GtkSourceLanguage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Determines the number of undo levels the buffer will track for buffer edits.
    Returns:     the maximum number of possible undo levels or -1 if no limit is set.
  */
  int getMaxUndoLevels()
  {
    int _retval;
    _retval = gtk_source_buffer_get_max_undo_levels(cast(GtkSourceBuffer*)cPtr);
    return _retval;
  }

  /**
      Returns the list of marks of the given category at iter. If category
    is null it returns all marks at iter.
    Params:
      iter =       an iterator.
      category =       category to search for, or null
    Returns:     a newly allocated #GSList.
  */
  gtksource.mark.Mark[] getSourceMarksAtIter(gtk.text_iter.TextIter iter, string category = null)
  {
    GSList* _cretval;
    const(char)* _category = category.toCString(No.Alloc);
    _cretval = gtk_source_buffer_get_source_marks_at_iter(cast(GtkSourceBuffer*)cPtr, iter ? cast(GtkTextIter*)iter.cPtr(No.Dup) : null, _category);
    auto _retval = gSListToD!(gtksource.mark.Mark, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Returns the list of marks of the given category at line.
    If category is null, all marks at line are returned.
    Params:
      line =       a line number.
      category =       category to search for, or null
    Returns:     a newly allocated #GSList.
  */
  gtksource.mark.Mark[] getSourceMarksAtLine(int line, string category = null)
  {
    GSList* _cretval;
    const(char)* _category = category.toCString(No.Alloc);
    _cretval = gtk_source_buffer_get_source_marks_at_line(cast(GtkSourceBuffer*)cPtr, line, _category);
    auto _retval = gSListToD!(gtksource.mark.Mark, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Returns the #GtkSourceStyleScheme associated with the buffer,
    see [gtksource.buffer.Buffer.setStyleScheme].
    The returned object should not be unreferenced by the user.
    Returns:     the #GtkSourceStyleScheme
      associated with the buffer, or null.
  */
  gtksource.style_scheme.StyleScheme getStyleScheme()
  {
    GtkSourceStyleScheme* _cretval;
    _cretval = gtk_source_buffer_get_style_scheme(cast(GtkSourceBuffer*)cPtr);
    auto _retval = ObjectG.getDObject!(gtksource.style_scheme.StyleScheme)(cast(GtkSourceStyleScheme*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the #GtkSourceUndoManager associated with the buffer,
    see [gtksource.buffer.Buffer.setUndoManager].  The returned object should not be
    unreferenced by the user.
    Returns:     the #GtkSourceUndoManager associated
      with the buffer, or null.
  */
  gtksource.undo_manager.UndoManager getUndoManager()
  {
    GtkSourceUndoManager* _cretval;
    _cretval = gtk_source_buffer_get_undo_manager(cast(GtkSourceBuffer*)cPtr);
    auto _retval = ObjectG.getDObject!(gtksource.undo_manager.UndoManager)(cast(GtkSourceUndoManager*)_cretval, No.Take);
    return _retval;
  }

  /**
      Moves backward to the next toggle (on or off) of the context class. If no
    matching context class toggles are found, returns false, otherwise true.
    Does not return toggles located at iter, only toggles after iter. Sets
    iter to the location of the toggle, or to the end of the buffer if no
    toggle is found.
    
    See the #GtkSourceBuffer description for the list of default context classes.
    Params:
      iter =       a #GtkTextIter.
      contextClass =       the context class.
    Returns:     whether we found a context class toggle before iter
  */
  bool iterBackwardToContextClassToggle(gtk.text_iter.TextIter iter, string contextClass)
  {
    bool _retval;
    const(char)* _contextClass = contextClass.toCString(No.Alloc);
    _retval = gtk_source_buffer_iter_backward_to_context_class_toggle(cast(GtkSourceBuffer*)cPtr, iter ? cast(GtkTextIter*)iter.cPtr(No.Dup) : null, _contextClass);
    return _retval;
  }

  /**
      Moves forward to the next toggle (on or off) of the context class. If no
    matching context class toggles are found, returns false, otherwise true.
    Does not return toggles located at iter, only toggles after iter. Sets
    iter to the location of the toggle, or to the end of the buffer if no
    toggle is found.
    
    See the #GtkSourceBuffer description for the list of default context classes.
    Params:
      iter =       a #GtkTextIter.
      contextClass =       the context class.
    Returns:     whether we found a context class toggle after iter
  */
  bool iterForwardToContextClassToggle(gtk.text_iter.TextIter iter, string contextClass)
  {
    bool _retval;
    const(char)* _contextClass = contextClass.toCString(No.Alloc);
    _retval = gtk_source_buffer_iter_forward_to_context_class_toggle(cast(GtkSourceBuffer*)cPtr, iter ? cast(GtkTextIter*)iter.cPtr(No.Dup) : null, _contextClass);
    return _retval;
  }

  /**
      Check if the class context_class is set on iter.
    
    See the #GtkSourceBuffer description for the list of default context classes.
    Params:
      iter =       a #GtkTextIter.
      contextClass =       class to search for.
    Returns:     whether iter has the context class.
  */
  bool iterHasContextClass(gtk.text_iter.TextIter iter, string contextClass)
  {
    bool _retval;
    const(char)* _contextClass = contextClass.toCString(No.Alloc);
    _retval = gtk_source_buffer_iter_has_context_class(cast(GtkSourceBuffer*)cPtr, iter ? cast(const(GtkTextIter)*)iter.cPtr(No.Dup) : null, _contextClass);
    return _retval;
  }

  /**
      Joins the lines of text between the specified iterators.
    Params:
      start =       a #GtkTextIter.
      end =       a #GtkTextIter.
  */
  void joinLines(gtk.text_iter.TextIter start, gtk.text_iter.TextIter end)
  {
    gtk_source_buffer_join_lines(cast(GtkSourceBuffer*)cPtr, start ? cast(GtkTextIter*)start.cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end.cPtr(No.Dup) : null);
  }

  /**
      Redoes the last undo operation.  Use [gtksource.buffer.Buffer.canRedo]
    to check whether a call to this function will have any effect.
    
    This function emits the #GtkSourceBuffer::redo signal.
  */
  void redo()
  {
    gtk_source_buffer_redo(cast(GtkSourceBuffer*)cPtr);
  }

  /**
      Remove all marks of category between start and end from the buffer.
    If category is NULL, all marks in the range will be removed.
    Params:
      start =       a #GtkTextIter.
      end =       a #GtkTextIter.
      category =       category to search for, or null.
  */
  void removeSourceMarks(gtk.text_iter.TextIter start, gtk.text_iter.TextIter end, string category = null)
  {
    const(char)* _category = category.toCString(No.Alloc);
    gtk_source_buffer_remove_source_marks(cast(GtkSourceBuffer*)cPtr, start ? cast(const(GtkTextIter)*)start.cPtr(No.Dup) : null, end ? cast(const(GtkTextIter)*)end.cPtr(No.Dup) : null, _category);
  }

  /**
      Controls the bracket match highlighting function in the buffer.  If
    activated, when you position your cursor over a bracket character
    (a parenthesis, a square bracket, etc.) the matching opening or
    closing bracket character will be highlighted.
    Params:
      highlight =       true if you want matching brackets highlighted.
  */
  void setHighlightMatchingBrackets(bool highlight)
  {
    gtk_source_buffer_set_highlight_matching_brackets(cast(GtkSourceBuffer*)cPtr, highlight);
  }

  /**
      Controls whether syntax is highlighted in the buffer.
    
    If highlight is true, the text will be highlighted according to the syntax
    patterns specified in the #GtkSourceLanguage set with
    [gtksource.buffer.Buffer.setLanguage].
    
    If highlight is false, syntax highlighting is disabled and all the
    #GtkTextTag objects that have been added by the syntax highlighting engine
    are removed from the buffer.
    Params:
      highlight =       true to enable syntax highlighting, false to disable it.
  */
  void setHighlightSyntax(bool highlight)
  {
    gtk_source_buffer_set_highlight_syntax(cast(GtkSourceBuffer*)cPtr, highlight);
  }

  /**
      Sets whether the buffer has an implicit trailing newline.
    
    If an explicit trailing newline is present in a #GtkTextBuffer, #GtkTextView
    shows it as an empty line. This is generally not what the user expects.
    
    If implicit_trailing_newline is true (the default value):
     $(LIST
        * when a #GtkSourceFileLoader loads the content of a file into the buffer,
          the trailing newline (if present in the file) is not inserted into the
          buffer.
        * when a #GtkSourceFileSaver saves the content of the buffer into a file, a
          trailing newline is added to the file.
     )
       
    On the other hand, if implicit_trailing_newline is false, the file's
    content is not modified when loaded into the buffer, and the buffer's
    content is not modified when saved into a file.
    Params:
      implicitTrailingNewline =       the new value.
  */
  void setImplicitTrailingNewline(bool implicitTrailingNewline)
  {
    gtk_source_buffer_set_implicit_trailing_newline(cast(GtkSourceBuffer*)cPtr, implicitTrailingNewline);
  }

  /**
      Associates a #GtkSourceLanguage with the buffer.
    
    Note that a #GtkSourceLanguage affects not only the syntax highlighting, but
    also the [context classes][context-classes]. If you want to disable just the
    syntax highlighting, see [gtksource.buffer.Buffer.setHighlightSyntax].
    
    The buffer holds a reference to language.
    Params:
      language =       a #GtkSourceLanguage to set, or null.
  */
  void setLanguage(gtksource.language.Language language = null)
  {
    gtk_source_buffer_set_language(cast(GtkSourceBuffer*)cPtr, language ? cast(GtkSourceLanguage*)language.cPtr(No.Dup) : null);
  }

  /**
      Sets the number of undo levels for user actions the buffer will
    track.  If the number of user actions exceeds the limit set by this
    function, older actions will be discarded.
    
    If max_undo_levels is -1, the undo/redo is unlimited.
    
    If max_undo_levels is 0, the undo/redo is disabled.
    Params:
      maxUndoLevels =       the desired maximum number of undo levels.
  */
  void setMaxUndoLevels(int maxUndoLevels)
  {
    gtk_source_buffer_set_max_undo_levels(cast(GtkSourceBuffer*)cPtr, maxUndoLevels);
  }

  /**
      Sets a #GtkSourceStyleScheme to be used by the buffer and the view.
    
    Note that a #GtkSourceStyleScheme affects not only the syntax highlighting,
    but also other #GtkSourceView features such as highlighting the current line,
    matching brackets, the line numbers, etc.
    
    Instead of setting a null scheme, it is better to disable syntax
    highlighting with [gtksource.buffer.Buffer.setHighlightSyntax], and setting the
    #GtkSourceStyleScheme with the "classic" or "tango" ID, because those two
    style schemes follow more closely the GTK+ theme (for example for the
    background color).
    
    The buffer holds a reference to scheme.
    Params:
      scheme =       a #GtkSourceStyleScheme or null.
  */
  void setStyleScheme(gtksource.style_scheme.StyleScheme scheme = null)
  {
    gtk_source_buffer_set_style_scheme(cast(GtkSourceBuffer*)cPtr, scheme ? cast(GtkSourceStyleScheme*)scheme.cPtr(No.Dup) : null);
  }

  /**
      Set the buffer undo manager. If manager is null the default undo manager
    will be set.
    Params:
      manager =       A #GtkSourceUndoManager or null.
  */
  void setUndoManager(gtksource.undo_manager.UndoManager manager = null)
  {
    gtk_source_buffer_set_undo_manager(cast(GtkSourceBuffer*)cPtr, manager ? cast(GtkSourceUndoManager*)(cast(ObjectG)manager).cPtr(No.Dup) : null);
  }

  /**
      Sort the lines of text between the specified iterators.
    Params:
      start =       a #GtkTextIter.
      end =       a #GtkTextIter.
      flags =       #GtkSourceSortFlags specifying how the sort should behave
      column =       sort considering the text starting at the given column
  */
  void sortLines(gtk.text_iter.TextIter start, gtk.text_iter.TextIter end, gtksource.types.SortFlags flags, int column)
  {
    gtk_source_buffer_sort_lines(cast(GtkSourceBuffer*)cPtr, start ? cast(GtkTextIter*)start.cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end.cPtr(No.Dup) : null, flags, column);
  }

  /**
      Undoes the last user action which modified the buffer.  Use
    [gtksource.buffer.Buffer.canUndo] to check whether a call to this
    function will have any effect.
    
    This function emits the #GtkSourceBuffer::undo signal.
  */
  void undo()
  {
    gtk_source_buffer_undo(cast(GtkSourceBuffer*)cPtr);
  }

  /**
      iter is set to a valid iterator pointing to the matching bracket
    if state is [gtksource.types.BracketMatchType.Found]. Otherwise iter is
    meaningless.
    
    The signal is emitted only when the state changes, typically when
    the cursor moves.
    
    A use-case for this signal is to show messages in a #GtkStatusbar.
  
    ## Parameters
    $(LIST
      * $(B iter)       if found, the location of the matching bracket.
      * $(B state)       state of bracket matching.
      * $(B buffer) the instance the signal is connected to
    )
  */
  alias BracketMatchedCallbackDlg = void delegate(gtk.text_iter.TextIter iter, gtksource.types.BracketMatchType state, gtksource.buffer.Buffer buffer);

  /** ditto */
  alias BracketMatchedCallbackFunc = void function(gtk.text_iter.TextIter iter, gtksource.types.BracketMatchType state, gtksource.buffer.Buffer buffer);

  /**
    Connect to BracketMatched signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectBracketMatched(T)(T callback, Flag!"After" after = No.After)
  if (is(T : BracketMatchedCallbackDlg) || is(T : BracketMatchedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto buffer = getVal!(gtksource.buffer.Buffer)(_paramVals);
      auto iter = getVal!(gtk.text_iter.TextIter)(&_paramVals[1]);
      auto state = getVal!(gtksource.types.BracketMatchType)(&_paramVals[2]);
      _dClosure.dlg(iter, state, buffer);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("bracket-matched", closure, after);
  }

  /**
      The ::highlight-updated signal is emitted when the syntax
    highlighting and [context classes][context-classes] are updated in a
    certain region of the buffer.
  
    ## Parameters
    $(LIST
      * $(B start)       the start of the updated region
      * $(B end)       the end of the updated region
      * $(B buffer) the instance the signal is connected to
    )
  */
  alias HighlightUpdatedCallbackDlg = void delegate(gtk.text_iter.TextIter start, gtk.text_iter.TextIter end, gtksource.buffer.Buffer buffer);

  /** ditto */
  alias HighlightUpdatedCallbackFunc = void function(gtk.text_iter.TextIter start, gtk.text_iter.TextIter end, gtksource.buffer.Buffer buffer);

  /**
    Connect to HighlightUpdated signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectHighlightUpdated(T)(T callback, Flag!"After" after = No.After)
  if (is(T : HighlightUpdatedCallbackDlg) || is(T : HighlightUpdatedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto buffer = getVal!(gtksource.buffer.Buffer)(_paramVals);
      auto start = getVal!(gtk.text_iter.TextIter)(&_paramVals[1]);
      auto end = getVal!(gtk.text_iter.TextIter)(&_paramVals[2]);
      _dClosure.dlg(start, end, buffer);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("highlight-updated", closure, after);
  }

  /**
      The ::redo signal is emitted to redo the last undo operation.
  
    ## Parameters
    $(LIST
      * $(B buffer) the instance the signal is connected to
    )
  */
  alias RedoCallbackDlg = void delegate(gtksource.buffer.Buffer buffer);

  /** ditto */
  alias RedoCallbackFunc = void function(gtksource.buffer.Buffer buffer);

  /**
    Connect to Redo signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectRedo(T)(T callback, Flag!"After" after = No.After)
  if (is(T : RedoCallbackDlg) || is(T : RedoCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto buffer = getVal!(gtksource.buffer.Buffer)(_paramVals);
      _dClosure.dlg(buffer);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("redo", closure, after);
  }

  /**
      The ::source-mark-updated signal is emitted each time
    a mark is added to, moved or removed from the buffer.
  
    ## Parameters
    $(LIST
      * $(B mark)       the #GtkSourceMark
      * $(B buffer) the instance the signal is connected to
    )
  */
  alias SourceMarkUpdatedCallbackDlg = void delegate(gtk.text_mark.TextMark mark, gtksource.buffer.Buffer buffer);

  /** ditto */
  alias SourceMarkUpdatedCallbackFunc = void function(gtk.text_mark.TextMark mark, gtksource.buffer.Buffer buffer);

  /**
    Connect to SourceMarkUpdated signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectSourceMarkUpdated(T)(T callback, Flag!"After" after = No.After)
  if (is(T : SourceMarkUpdatedCallbackDlg) || is(T : SourceMarkUpdatedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto buffer = getVal!(gtksource.buffer.Buffer)(_paramVals);
      auto mark = getVal!(gtk.text_mark.TextMark)(&_paramVals[1]);
      _dClosure.dlg(mark, buffer);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("source-mark-updated", closure, after);
  }

  /**
      The ::undo signal is emitted to undo the last user action which
    modified the buffer.
  
    ## Parameters
    $(LIST
      * $(B buffer) the instance the signal is connected to
    )
  */
  alias UndoCallbackDlg = void delegate(gtksource.buffer.Buffer buffer);

  /** ditto */
  alias UndoCallbackFunc = void function(gtksource.buffer.Buffer buffer);

  /**
    Connect to Undo signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectUndo(T)(T callback, Flag!"After" after = No.After)
  if (is(T : UndoCallbackDlg) || is(T : UndoCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto buffer = getVal!(gtksource.buffer.Buffer)(_paramVals);
      _dClosure.dlg(buffer);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("undo", closure, after);
  }
}
