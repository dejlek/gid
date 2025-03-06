module gtksource.view;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gdk.event;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.scrollable;
import gtk.scrollable_mixin;
import gtk.text_iter;
import gtk.text_view;
import gtk.types;
import gtksource.buffer;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.completion;
import gtksource.gutter;
import gtksource.mark_attributes;
import gtksource.space_drawer;
import gtksource.types;

/** */
class View : gtk.text_view.TextView
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_view_get_type != &gidSymbolNotFound ? gtk_source_view_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
      Creates a new #GtkSourceView.
    
    By default, an empty #GtkSourceBuffer will be lazily created and can be
    retrieved with [gtk.text_view.TextView.getBuffer].
    
    If you want to specify your own buffer, either override the
    #GtkTextViewClass create_buffer factory method, or use
    [gtksource.view.View.newWithBuffer].
    Returns:     a new #GtkSourceView.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_source_view_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new #GtkSourceView widget displaying the buffer
    buffer. One buffer can be shared among many widgets.
    Params:
      buffer =       a #GtkSourceBuffer.
    Returns:     a new #GtkSourceView.
  */
  static gtksource.view.View newWithBuffer(gtksource.buffer.Buffer buffer)
  {
    GtkWidget* _cretval;
    _cretval = gtk_source_view_new_with_buffer(buffer ? cast(GtkSourceBuffer*)buffer.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtksource.view.View)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether auto-indentation of text is enabled.
    Returns:     true if auto indentation is enabled.
  */
  bool getAutoIndent()
  {
    bool _retval;
    _retval = gtk_source_view_get_auto_indent(cast(GtkSourceView*)cPtr);
    return _retval;
  }

  /**
      Returns the #GtkSourceBackgroundPatternType specifying if and how
    the background pattern should be displayed for this view.
    Returns:     the #GtkSourceBackgroundPatternType.
  */
  gtksource.types.BackgroundPatternType getBackgroundPattern()
  {
    GtkSourceBackgroundPatternType _cretval;
    _cretval = gtk_source_view_get_background_pattern(cast(GtkSourceView*)cPtr);
    gtksource.types.BackgroundPatternType _retval = cast(gtksource.types.BackgroundPatternType)_cretval;
    return _retval;
  }

  /**
      Gets the #GtkSourceCompletion associated with view. The returned object is
    guaranteed to be the same for the lifetime of view. Each #GtkSourceView
    object has a different #GtkSourceCompletion.
    Returns:     the #GtkSourceCompletion associated with view.
  */
  gtksource.completion.Completion getCompletion()
  {
    GtkSourceCompletion* _cretval;
    _cretval = gtk_source_view_get_completion(cast(GtkSourceView*)cPtr);
    auto _retval = ObjectG.getDObject!(gtksource.completion.Completion)(cast(GtkSourceCompletion*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the #GtkSourceGutter object associated with window_type for view.
    Only GTK_TEXT_WINDOW_LEFT and GTK_TEXT_WINDOW_RIGHT are supported,
    respectively corresponding to the left and right gutter. The line numbers
    and mark category icons are rendered in the left gutter.
    Params:
      windowType =       the gutter window type.
    Returns:     the #GtkSourceGutter.
  */
  gtksource.gutter.Gutter getGutter(gtk.types.TextWindowType windowType)
  {
    GtkSourceGutter* _cretval;
    _cretval = gtk_source_view_get_gutter(cast(GtkSourceView*)cPtr, windowType);
    auto _retval = ObjectG.getDObject!(gtksource.gutter.Gutter)(cast(GtkSourceGutter*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the current line is highlighted.
    Returns:     true if the current line is highlighted.
  */
  bool getHighlightCurrentLine()
  {
    bool _retval;
    _retval = gtk_source_view_get_highlight_current_line(cast(GtkSourceView*)cPtr);
    return _retval;
  }

  /**
      Returns whether when the tab key is pressed the current selection
    should get indented instead of replaced with the \t character.
    Returns:     true if the selection is indented when tab is pressed.
  */
  bool getIndentOnTab()
  {
    bool _retval;
    _retval = gtk_source_view_get_indent_on_tab(cast(GtkSourceView*)cPtr);
    return _retval;
  }

  /**
      Returns the number of spaces to use for each step of indent.
    See [gtksource.view.View.setIndentWidth] for details.
    Returns:     indent width.
  */
  int getIndentWidth()
  {
    int _retval;
    _retval = gtk_source_view_get_indent_width(cast(GtkSourceView*)cPtr);
    return _retval;
  }

  /**
      Returns whether when inserting a tabulator character it should
    be replaced by a group of space characters.
    Returns:     true if spaces are inserted instead of tabs.
  */
  bool getInsertSpacesInsteadOfTabs()
  {
    bool _retval;
    _retval = gtk_source_view_get_insert_spaces_instead_of_tabs(cast(GtkSourceView*)cPtr);
    return _retval;
  }

  /**
      Gets the position of the right margin in the given view.
    Returns:     the position of the right margin.
  */
  uint getRightMarginPosition()
  {
    uint _retval;
    _retval = gtk_source_view_get_right_margin_position(cast(GtkSourceView*)cPtr);
    return _retval;
  }

  /**
      Returns whether line marks are displayed beside the text.
    Returns:     true if the line marks are displayed.
  */
  bool getShowLineMarks()
  {
    bool _retval;
    _retval = gtk_source_view_get_show_line_marks(cast(GtkSourceView*)cPtr);
    return _retval;
  }

  /**
      Returns whether line numbers are displayed beside the text.
    Returns:     true if the line numbers are displayed.
  */
  bool getShowLineNumbers()
  {
    bool _retval;
    _retval = gtk_source_view_get_show_line_numbers(cast(GtkSourceView*)cPtr);
    return _retval;
  }

  /**
      Returns whether a right margin is displayed.
    Returns:     true if the right margin is shown.
  */
  bool getShowRightMargin()
  {
    bool _retval;
    _retval = gtk_source_view_get_show_right_margin(cast(GtkSourceView*)cPtr);
    return _retval;
  }

  /**
      Returns true if pressing the Backspace key will try to delete spaces
    up to the previous tab stop.
    Returns:     true if smart Backspace handling is enabled.
  */
  bool getSmartBackspace()
  {
    bool _retval;
    _retval = gtk_source_view_get_smart_backspace(cast(GtkSourceView*)cPtr);
    return _retval;
  }

  /**
      Returns a #GtkSourceSmartHomeEndType end value specifying
    how the cursor will move when HOME and END keys are pressed.
    Returns:     a #GtkSourceSmartHomeEndType value.
  */
  gtksource.types.SmartHomeEndType getSmartHomeEnd()
  {
    GtkSourceSmartHomeEndType _cretval;
    _cretval = gtk_source_view_get_smart_home_end(cast(GtkSourceView*)cPtr);
    gtksource.types.SmartHomeEndType _retval = cast(gtksource.types.SmartHomeEndType)_cretval;
    return _retval;
  }

  /**
      Gets the #GtkSourceSpaceDrawer associated with view. The returned object is
    guaranteed to be the same for the lifetime of view. Each #GtkSourceView
    object has a different #GtkSourceSpaceDrawer.
    Returns:     the #GtkSourceSpaceDrawer associated with view.
  */
  gtksource.space_drawer.SpaceDrawer getSpaceDrawer()
  {
    GtkSourceSpaceDrawer* _cretval;
    _cretval = gtk_source_view_get_space_drawer(cast(GtkSourceView*)cPtr);
    auto _retval = ObjectG.getDObject!(gtksource.space_drawer.SpaceDrawer)(cast(GtkSourceSpaceDrawer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the width of tabulation in characters.
    Returns:     width of tab.
  */
  uint getTabWidth()
  {
    uint _retval;
    _retval = gtk_source_view_get_tab_width(cast(GtkSourceView*)cPtr);
    return _retval;
  }

  /**
      Determines the visual column at iter taking into consideration the
    #GtkSourceView:tab-width of view.
    Params:
      iter =       a position in view.
    Returns:     the visual column at iter.
  */
  uint getVisualColumn(gtk.text_iter.TextIter iter)
  {
    uint _retval;
    _retval = gtk_source_view_get_visual_column(cast(GtkSourceView*)cPtr, iter ? cast(const(GtkTextIter)*)iter.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Inserts one indentation level at the beginning of the specified lines. The
    empty lines are not indented.
    Params:
      start =       #GtkTextIter of the first line to indent
      end =       #GtkTextIter of the last line to indent
  */
  void indentLines(gtk.text_iter.TextIter start, gtk.text_iter.TextIter end)
  {
    gtk_source_view_indent_lines(cast(GtkSourceView*)cPtr, start ? cast(GtkTextIter*)start.cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end.cPtr(No.Dup) : null);
  }

  /**
      If true auto-indentation of text is enabled.
    
    When Enter is pressed to create a new line, the auto-indentation inserts the
    same indentation as the previous line. This is <emphasis>not</emphasis> a
    "smart indentation" where an indentation level is added or removed depending
    on the context.
    Params:
      enable =       whether to enable auto indentation.
  */
  void setAutoIndent(bool enable)
  {
    gtk_source_view_set_auto_indent(cast(GtkSourceView*)cPtr, enable);
  }

  /**
      Set if and how the background pattern should be displayed.
    Params:
      backgroundPattern =       the #GtkSourceBackgroundPatternType.
  */
  void setBackgroundPattern(gtksource.types.BackgroundPatternType backgroundPattern)
  {
    gtk_source_view_set_background_pattern(cast(GtkSourceView*)cPtr, backgroundPattern);
  }

  /**
      If highlight is true the current line will be highlighted.
    Params:
      highlight =       whether to highlight the current line.
  */
  void setHighlightCurrentLine(bool highlight)
  {
    gtk_source_view_set_highlight_current_line(cast(GtkSourceView*)cPtr, highlight);
  }

  /**
      If true, when the tab key is pressed when several lines are selected, the
    selected lines are indented of one level instead of being replaced with a \t
    character. Shift+Tab unindents the selection.
    
    If the first or last line is not selected completely, it is also indented or
    unindented.
    
    When the selection doesn't span several lines, the tab key always replaces
    the selection with a normal \t character.
    Params:
      enable =       whether to indent a block when tab is pressed.
  */
  void setIndentOnTab(bool enable)
  {
    gtk_source_view_set_indent_on_tab(cast(GtkSourceView*)cPtr, enable);
  }

  /**
      Sets the number of spaces to use for each step of indent when the tab key is
    pressed. If width is -1, the value of the #GtkSourceView:tab-width property
    will be used.
    
    The #GtkSourceView:indent-width interacts with the
    #GtkSourceView:insert-spaces-instead-of-tabs property and
    #GtkSourceView:tab-width. An example will be clearer: if the
    #GtkSourceView:indent-width is 4 and
    #GtkSourceView:tab-width is 8 and
    #GtkSourceView:insert-spaces-instead-of-tabs is false, then pressing the tab
    key at the beginning of a line will insert 4 spaces. So far so good. Pressing
    the tab key a second time will remove the 4 spaces and insert a \t character
    instead (since #GtkSourceView:tab-width is 8). On the other hand, if
    #GtkSourceView:insert-spaces-instead-of-tabs is true, the second tab key
    pressed will insert 4 more spaces for a total of 8 spaces in the
    #GtkTextBuffer.
    
    The test-widget program (available in the GtkSourceView repository) may be
    useful to better understand the indentation settings (enable the space
    drawing!).
    Params:
      width =       indent width in characters.
  */
  void setIndentWidth(int width)
  {
    gtk_source_view_set_indent_width(cast(GtkSourceView*)cPtr, width);
  }

  /**
      If true a tab key pressed is replaced by a group of space characters. Of
    course it is still possible to insert a real \t programmatically with the
    #GtkTextBuffer API.
    Params:
      enable =       whether to insert spaces instead of tabs.
  */
  void setInsertSpacesInsteadOfTabs(bool enable)
  {
    gtk_source_view_set_insert_spaces_instead_of_tabs(cast(GtkSourceView*)cPtr, enable);
  }

  /**
      Sets attributes and priority for the category.
    Params:
      category =       the category.
      attributes =       mark attributes.
      priority =       priority of the category.
  */
  void setMarkAttributes(string category, gtksource.mark_attributes.MarkAttributes attributes, int priority)
  {
    const(char)* _category = category.toCString(No.Alloc);
    gtk_source_view_set_mark_attributes(cast(GtkSourceView*)cPtr, _category, attributes ? cast(GtkSourceMarkAttributes*)attributes.cPtr(No.Dup) : null, priority);
  }

  /**
      Sets the position of the right margin in the given view.
    Params:
      pos =       the width in characters where to position the right margin.
  */
  void setRightMarginPosition(uint pos)
  {
    gtk_source_view_set_right_margin_position(cast(GtkSourceView*)cPtr, pos);
  }

  /**
      If true line marks will be displayed beside the text.
    Params:
      show =       whether line marks should be displayed.
  */
  void setShowLineMarks(bool show)
  {
    gtk_source_view_set_show_line_marks(cast(GtkSourceView*)cPtr, show);
  }

  /**
      If true line numbers will be displayed beside the text.
    Params:
      show =       whether line numbers should be displayed.
  */
  void setShowLineNumbers(bool show)
  {
    gtk_source_view_set_show_line_numbers(cast(GtkSourceView*)cPtr, show);
  }

  /**
      If true a right margin is displayed.
    Params:
      show =       whether to show a right margin.
  */
  void setShowRightMargin(bool show)
  {
    gtk_source_view_set_show_right_margin(cast(GtkSourceView*)cPtr, show);
  }

  /**
      When set to true, pressing the Backspace key will try to delete spaces
    up to the previous tab stop.
    Params:
      smartBackspace =       whether to enable smart Backspace handling.
  */
  void setSmartBackspace(bool smartBackspace)
  {
    gtk_source_view_set_smart_backspace(cast(GtkSourceView*)cPtr, smartBackspace);
  }

  /**
      Set the desired movement of the cursor when HOME and END keys
    are pressed.
    Params:
      smartHomeEnd =       the desired behavior among #GtkSourceSmartHomeEndType.
  */
  void setSmartHomeEnd(gtksource.types.SmartHomeEndType smartHomeEnd)
  {
    gtk_source_view_set_smart_home_end(cast(GtkSourceView*)cPtr, smartHomeEnd);
  }

  /**
      Sets the width of tabulation in characters. The #GtkTextBuffer still contains
    \t characters, but they can take a different visual width in a #GtkSourceView
    widget.
    Params:
      width =       width of tab in characters.
  */
  void setTabWidth(uint width)
  {
    gtk_source_view_set_tab_width(cast(GtkSourceView*)cPtr, width);
  }

  /**
      Removes one indentation level at the beginning of the
    specified lines.
    Params:
      start =       #GtkTextIter of the first line to indent
      end =       #GtkTextIter of the last line to indent
  */
  void unindentLines(gtk.text_iter.TextIter start, gtk.text_iter.TextIter end)
  {
    gtk_source_view_unindent_lines(cast(GtkSourceView*)cPtr, start ? cast(GtkTextIter*)start.cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end.cPtr(No.Dup) : null);
  }

  /**
      Keybinding signal to change case of the text at the current cursor position.
  
    ## Parameters
    $(LIST
      * $(B caseType)       the case to use
      * $(B view) the instance the signal is connected to
    )
  */
  alias ChangeCaseCallbackDlg = void delegate(gtksource.types.ChangeCaseType caseType, gtksource.view.View view);

  /** ditto */
  alias ChangeCaseCallbackFunc = void function(gtksource.types.ChangeCaseType caseType, gtksource.view.View view);

  /**
    Connect to ChangeCase signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectChangeCase(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ChangeCaseCallbackDlg) || is(T : ChangeCaseCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto view = getVal!(gtksource.view.View)(_paramVals);
      auto caseType = getVal!(gtksource.types.ChangeCaseType)(&_paramVals[1]);
      _dClosure.dlg(caseType, view);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("change-case", closure, after);
  }

  /**
      Keybinding signal to edit a number at the current cursor position.
  
    ## Parameters
    $(LIST
      * $(B count)       the number to add to the number at the current position
      * $(B view) the instance the signal is connected to
    )
  */
  alias ChangeNumberCallbackDlg = void delegate(int count, gtksource.view.View view);

  /** ditto */
  alias ChangeNumberCallbackFunc = void function(int count, gtksource.view.View view);

  /**
    Connect to ChangeNumber signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectChangeNumber(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ChangeNumberCallbackDlg) || is(T : ChangeNumberCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto view = getVal!(gtksource.view.View)(_paramVals);
      auto count = getVal!(int)(&_paramVals[1]);
      _dClosure.dlg(count, view);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("change-number", closure, after);
  }

  /**
      Keybinding signal to join the lines currently selected.
  
    ## Parameters
    $(LIST
      * $(B view) the instance the signal is connected to
    )
  */
  alias JoinLinesCallbackDlg = void delegate(gtksource.view.View view);

  /** ditto */
  alias JoinLinesCallbackFunc = void function(gtksource.view.View view);

  /**
    Connect to JoinLines signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectJoinLines(T)(T callback, Flag!"After" after = No.After)
  if (is(T : JoinLinesCallbackDlg) || is(T : JoinLinesCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto view = getVal!(gtksource.view.View)(_paramVals);
      _dClosure.dlg(view);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("join-lines", closure, after);
  }

  /**
      Emitted when a line mark has been activated (for instance when there
    was a button press in the line marks gutter). You can use iter to
    determine on which line the activation took place.
  
    ## Parameters
    $(LIST
      * $(B iter)       a #GtkTextIter
      * $(B event)       the #GdkEvent that activated the event
      * $(B view) the instance the signal is connected to
    )
  */
  alias LineMarkActivatedCallbackDlg = void delegate(gtk.text_iter.TextIter iter, gdk.event.Event event, gtksource.view.View view);

  /** ditto */
  alias LineMarkActivatedCallbackFunc = void function(gtk.text_iter.TextIter iter, gdk.event.Event event, gtksource.view.View view);

  /**
    Connect to LineMarkActivated signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectLineMarkActivated(T)(T callback, Flag!"After" after = No.After)
  if (is(T : LineMarkActivatedCallbackDlg) || is(T : LineMarkActivatedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto view = getVal!(gtksource.view.View)(_paramVals);
      auto iter = getVal!(gtk.text_iter.TextIter)(&_paramVals[1]);
      auto event = getVal!(gdk.event.Event)(&_paramVals[2]);
      _dClosure.dlg(iter, event, view);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("line-mark-activated", closure, after);
  }

  /**
      The ::move-lines signal is a keybinding which gets emitted
    when the user initiates moving a line. The default binding key
    is Alt+Up/Down arrow. And moves the currently selected lines,
    or the current line up or down by one line.
  
    ## Parameters
    $(LIST
      * $(B down)       true to move down, false to move up.
      * $(B view) the instance the signal is connected to
    )
  */
  alias MoveLinesCallbackDlg = void delegate(bool down, gtksource.view.View view);

  /** ditto */
  alias MoveLinesCallbackFunc = void function(bool down, gtksource.view.View view);

  /**
    Connect to MoveLines signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectMoveLines(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MoveLinesCallbackDlg) || is(T : MoveLinesCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto view = getVal!(gtksource.view.View)(_paramVals);
      auto down = getVal!(bool)(&_paramVals[1]);
      _dClosure.dlg(down, view);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-lines", closure, after);
  }

  /**
      Keybinding signal to move the cursor to the matching bracket.
  
    ## Parameters
    $(LIST
      * $(B extendSelection)       true if the move should extend the selection
      * $(B view) the instance the signal is connected to
    )
  */
  alias MoveToMatchingBracketCallbackDlg = void delegate(bool extendSelection, gtksource.view.View view);

  /** ditto */
  alias MoveToMatchingBracketCallbackFunc = void function(bool extendSelection, gtksource.view.View view);

  /**
    Connect to MoveToMatchingBracket signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectMoveToMatchingBracket(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MoveToMatchingBracketCallbackDlg) || is(T : MoveToMatchingBracketCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto view = getVal!(gtksource.view.View)(_paramVals);
      auto extendSelection = getVal!(bool)(&_paramVals[1]);
      _dClosure.dlg(extendSelection, view);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-to-matching-bracket", closure, after);
  }

  /**
      The ::move-words signal is a keybinding which gets emitted
    when the user initiates moving a word. The default binding key
    is Alt+Left/Right Arrow and moves the current selection, or the current
    word by one word.
  
    ## Parameters
    $(LIST
      * $(B count)       the number of words to move over
      * $(B view) the instance the signal is connected to
    )
  */
  alias MoveWordsCallbackDlg = void delegate(int count, gtksource.view.View view);

  /** ditto */
  alias MoveWordsCallbackFunc = void function(int count, gtksource.view.View view);

  /**
    Connect to MoveWords signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectMoveWords(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MoveWordsCallbackDlg) || is(T : MoveWordsCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto view = getVal!(gtksource.view.View)(_paramVals);
      auto count = getVal!(int)(&_paramVals[1]);
      _dClosure.dlg(count, view);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-words", closure, after);
  }

  /** */
  alias RedoCallbackDlg = void delegate(gtksource.view.View view);

  /** ditto */
  alias RedoCallbackFunc = void function(gtksource.view.View view);

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
      auto view = getVal!(gtksource.view.View)(_paramVals);
      _dClosure.dlg(view);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("redo", closure, after);
  }

  /**
      The ::show-completion signal is a key binding signal which gets
    emitted when the user requests a completion, by pressing
    <keycombo><keycap>Control</keycap><keycap>space</keycap></keycombo>.
    
    This will create a #GtkSourceCompletionContext with the activation
    type as [gtksource.types.CompletionActivation.UserRequested].
    
    Applications should not connect to it, but may emit it with
    [gobject.global.signalEmitByName] if they need to activate the completion by
    another means, for example with another key binding or a menu entry.
  
    ## Parameters
    $(LIST
      * $(B view) the instance the signal is connected to
    )
  */
  alias ShowCompletionCallbackDlg = void delegate(gtksource.view.View view);

  /** ditto */
  alias ShowCompletionCallbackFunc = void function(gtksource.view.View view);

  /**
    Connect to ShowCompletion signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectShowCompletion(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ShowCompletionCallbackDlg) || is(T : ShowCompletionCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto view = getVal!(gtksource.view.View)(_paramVals);
      _dClosure.dlg(view);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("show-completion", closure, after);
  }

  /**
      Emitted when a the cursor was moved according to the smart home
    end setting. The signal is emitted after the cursor is moved, but
    during the GtkTextView::move-cursor action. This can be used to find
    out whether the cursor was moved by a normal home/end or by a smart
    home/end.
  
    ## Parameters
    $(LIST
      * $(B iter)       a #GtkTextIter
      * $(B count)       the count
      * $(B view) the instance the signal is connected to
    )
  */
  alias SmartHomeEndCallbackDlg = void delegate(gtk.text_iter.TextIter iter, int count, gtksource.view.View view);

  /** ditto */
  alias SmartHomeEndCallbackFunc = void function(gtk.text_iter.TextIter iter, int count, gtksource.view.View view);

  /**
    Connect to SmartHomeEnd signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectSmartHomeEnd(T)(T callback, Flag!"After" after = No.After)
  if (is(T : SmartHomeEndCallbackDlg) || is(T : SmartHomeEndCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto view = getVal!(gtksource.view.View)(_paramVals);
      auto iter = getVal!(gtk.text_iter.TextIter)(&_paramVals[1]);
      auto count = getVal!(int)(&_paramVals[2]);
      _dClosure.dlg(iter, count, view);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("smart-home-end", closure, after);
  }

  /** */
  alias UndoCallbackDlg = void delegate(gtksource.view.View view);

  /** ditto */
  alias UndoCallbackFunc = void function(gtksource.view.View view);

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
      auto view = getVal!(gtksource.view.View)(_paramVals);
      _dClosure.dlg(view);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("undo", closure, after);
  }
}
