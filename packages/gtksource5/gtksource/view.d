module gtksource.view;

import gdk.types;
import gid.global;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.accessible_text;
import gtk.accessible_text_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.scrollable;
import gtk.scrollable_mixin;
import gtk.text_iter;
import gtk.text_view;
import gtk.types;
import gtk.widget;
import gtksource.buffer;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.completion;
import gtksource.gutter;
import gtksource.hover;
import gtksource.indenter;
import gtksource.indenter_mixin;
import gtksource.mark_attributes;
import gtksource.snippet;
import gtksource.space_drawer;
import gtksource.types;

/**
 * Subclass of [gtk.text_view.TextView].
 * `GtkSourceView` is the main class of the GtkSourceView library.
 * Use a class@Buffer to display text with a `GtkSourceView`.
 * This class provides:
 * - Show the line numbers;
 * - Show a right margin;
 * - Highlight the current line;
 * - Indentation settings;
 * - Configuration for the Home and End keyboard keys;
 * - Configure and show line marks;
 * - And a few other things.
 * An easy way to test all these features is to use the test-widget mini-program
 * provided in the GtkSourceView repository, in the tests/ directory.
 * # GtkSourceView as GtkBuildable
 * The GtkSourceView implementation of the [gtk.buildable.Buildable] interface exposes the
 * property@View:completion object with the internal-child "completion".
 * An example of a UI definition fragment with GtkSourceView:
 * ```xml
 * <object class\="GtkSourceView" id\="source_view">
 * <property name\="tab-width">4</property>
 * <property name\="auto-indent">True</property>
 * <child internal-child\="completion">
 * <object class\="GtkSourceCompletion">
 * <property name\="select-on-show">False</property>
 * </object>
 * </child>
 * </object>
 * ```
 * # Changing the Font
 * Gtk CSS provides the best way to change the font for a `GtkSourceView` in a
 * manner that allows for components like class@Map to scale the desired
 * font.
 * ```c
 * GtkCssProvider *provider \= gtk_css_provider_new $(LPAREN)$(RPAREN);
 * gtk_css_provider_load_from_data $(LPAREN)provider,
 * "textview { font-family: Monospace; font-size: 8pt; }",
 * -1,
 * NULL$(RPAREN);
 * gtk_style_context_add_provider $(LPAREN)gtk_widget_get_style_context $(LPAREN)view$(RPAREN),
 * GTK_STYLE_PROVIDER $(LPAREN)provider$(RPAREN),
 * GTK_STYLE_PROVIDER_PRIORITY_APPLICATION$(RPAREN);
 * g_object_unref $(LPAREN)provider$(RPAREN);
 * ```
 * If you need to adjust the font or size of font within a portion of the
 * document only, you should use a [gtk.text_tag.TextTag] with the [gtk.text_tag.TextTag.utf8] or
 * [gtk.text_tag.TextTag.gdouble] set so that the font size may be scaled relative to
 * the default font set in CSS.
 */
class View : TextView
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
   * Creates a new `GtkSourceView`.
   * By default, an empty classBuffer will be lazily created and can be
   * retrieved with [gtk.text_view.TextView.getBuffer].
   * If you want to specify your own buffer, either override the
   * vfuncGtk.TextView.create_buffer factory method, or use
   * [gtksource.view.View.newWithBuffer].
   * Returns: a new #GtkSourceView.
   */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_source_view_new();
    this(_cretval, No.Take);
  }

  /**
   * Creates a new #GtkSourceView widget displaying the buffer buffer.
   * One buffer can be shared among many widgets.
   * Params:
   *   buffer = a #GtkSourceBuffer.
   * Returns: a new #GtkSourceView.
   */
  static View newWithBuffer(Buffer buffer)
  {
    GtkWidget* _cretval;
    _cretval = gtk_source_view_new_with_buffer(buffer ? cast(GtkSourceBuffer*)buffer.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!View(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns whether auto-indentation of text is enabled.
   * Returns: %TRUE if auto indentation is enabled.
   */
  bool getAutoIndent()
  {
    bool _retval;
    _retval = gtk_source_view_get_auto_indent(cast(GtkSourceView*)cPtr);
    return _retval;
  }

  /**
   * Returns the #GtkSourceBackgroundPatternType specifying if and how
   * the background pattern should be displayed for this view.
   * Returns: the #GtkSourceBackgroundPatternType.
   */
  BackgroundPatternType getBackgroundPattern()
  {
    GtkSourceBackgroundPatternType _cretval;
    _cretval = gtk_source_view_get_background_pattern(cast(GtkSourceView*)cPtr);
    BackgroundPatternType _retval = cast(BackgroundPatternType)_cretval;
    return _retval;
  }

  /**
   * Gets the classCompletion associated with view.
   * The returned object is guaranteed to be the same for the lifetime of view.
   * Each `GtkSourceView` object has a different classCompletion.
   * Returns: the #GtkSourceCompletion associated with view.
   */
  Completion getCompletion()
  {
    GtkSourceCompletion* _cretval;
    _cretval = gtk_source_view_get_completion(cast(GtkSourceView*)cPtr);
    auto _retval = ObjectG.getDObject!Completion(cast(GtkSourceCompletion*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the propertyView:enable-snippets property.
   * If %TRUE, matching snippets found in the classSnippetManager
   * may be expanded when the user presses Tab after a word in the classView.
   * Returns: %TRUE if enabled
   */
  bool getEnableSnippets()
  {
    bool _retval;
    _retval = gtk_source_view_get_enable_snippets(cast(GtkSourceView*)cPtr);
    return _retval;
  }

  /**
   * Returns the classGutter object associated with window_type for view.
   * Only %GTK_TEXT_WINDOW_LEFT and %GTK_TEXT_WINDOW_RIGHT are supported,
   * respectively corresponding to the left and right gutter. The line numbers
   * and mark category icons are rendered in the left gutter.
   * Params:
   *   windowType = the gutter window type.
   * Returns: the #GtkSourceGutter.
   */
  override Gutter getGutter(TextWindowType windowType)
  {
    GtkSourceGutter* _cretval;
    _cretval = gtk_source_view_get_gutter(cast(GtkSourceView*)cPtr, windowType);
    auto _retval = ObjectG.getDObject!Gutter(cast(GtkSourceGutter*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns whether the current line is highlighted.
   * Returns: %TRUE if the current line is highlighted.
   */
  bool getHighlightCurrentLine()
  {
    bool _retval;
    _retval = gtk_source_view_get_highlight_current_line(cast(GtkSourceView*)cPtr);
    return _retval;
  }

  /**
   * Gets the classHover associated with view.
   * The returned object is guaranteed to be the same for the lifetime of view.
   * Each classView object has a different classHover.
   * Returns: a #GtkSourceHover associated with view.
   */
  Hover getHover()
  {
    GtkSourceHover* _cretval;
    _cretval = gtk_source_view_get_hover(cast(GtkSourceView*)cPtr);
    auto _retval = ObjectG.getDObject!Hover(cast(GtkSourceHover*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns whether when the tab key is pressed the current selection
   * should get indented instead of replaced with the `\t` character.
   * Returns: %TRUE if the selection is indented when tab is pressed.
   */
  bool getIndentOnTab()
  {
    bool _retval;
    _retval = gtk_source_view_get_indent_on_tab(cast(GtkSourceView*)cPtr);
    return _retval;
  }

  /**
   * Returns the number of spaces to use for each step of indent.
   * See [gtksource.view.View.setIndentWidth] for details.
   * Returns: indent width.
   */
  int getIndentWidth()
  {
    int _retval;
    _retval = gtk_source_view_get_indent_width(cast(GtkSourceView*)cPtr);
    return _retval;
  }

  /**
   * Gets the propertyView:indenter property.
   * Returns: a #GtkSourceIndenter or %NULL
   */
  Indenter getIndenter()
  {
    GtkSourceIndenter* _cretval;
    _cretval = gtk_source_view_get_indenter(cast(GtkSourceView*)cPtr);
    auto _retval = ObjectG.getDObject!Indenter(cast(GtkSourceIndenter*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns whether when inserting a tabulator character it should
   * be replaced by a group of space characters.
   * Returns: %TRUE if spaces are inserted instead of tabs.
   */
  bool getInsertSpacesInsteadOfTabs()
  {
    bool _retval;
    _retval = gtk_source_view_get_insert_spaces_instead_of_tabs(cast(GtkSourceView*)cPtr);
    return _retval;
  }

  /**
   * Gets attributes and priority for the category.
   * Params:
   *   category = the category.
   *   priority = place where priority of the category will be stored.
   * Returns: #GtkSourceMarkAttributes for the category.
   *   The object belongs to view, so it must not be unreffed.
   */
  MarkAttributes getMarkAttributes(string category, out int priority)
  {
    GtkSourceMarkAttributes* _cretval;
    const(char)* _category = category.toCString(No.Alloc);
    _cretval = gtk_source_view_get_mark_attributes(cast(GtkSourceView*)cPtr, _category, cast(int*)&priority);
    auto _retval = ObjectG.getDObject!MarkAttributes(cast(GtkSourceMarkAttributes*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the position of the right margin in the given view.
   * Returns: the position of the right margin.
   */
  uint getRightMarginPosition()
  {
    uint _retval;
    _retval = gtk_source_view_get_right_margin_position(cast(GtkSourceView*)cPtr);
    return _retval;
  }

  /**
   * Returns whether line marks are displayed beside the text.
   * Returns: %TRUE if the line marks are displayed.
   */
  bool getShowLineMarks()
  {
    bool _retval;
    _retval = gtk_source_view_get_show_line_marks(cast(GtkSourceView*)cPtr);
    return _retval;
  }

  /**
   * Returns whether line numbers are displayed beside the text.
   * Returns: %TRUE if the line numbers are displayed.
   */
  bool getShowLineNumbers()
  {
    bool _retval;
    _retval = gtk_source_view_get_show_line_numbers(cast(GtkSourceView*)cPtr);
    return _retval;
  }

  /**
   * Returns whether a right margin is displayed.
   * Returns: %TRUE if the right margin is shown.
   */
  bool getShowRightMargin()
  {
    bool _retval;
    _retval = gtk_source_view_get_show_right_margin(cast(GtkSourceView*)cPtr);
    return _retval;
  }

  /**
   * Returns %TRUE if pressing the Backspace key will try to delete spaces
   * up to the previous tab stop.
   * Returns: %TRUE if smart Backspace handling is enabled.
   */
  bool getSmartBackspace()
  {
    bool _retval;
    _retval = gtk_source_view_get_smart_backspace(cast(GtkSourceView*)cPtr);
    return _retval;
  }

  /**
   * Returns a enumSmartHomeEndType end value specifying
   * how the cursor will move when HOME and END keys are pressed.
   * Returns: a #GtkSourceSmartHomeEndType value.
   */
  SmartHomeEndType getSmartHomeEnd()
  {
    GtkSourceSmartHomeEndType _cretval;
    _cretval = gtk_source_view_get_smart_home_end(cast(GtkSourceView*)cPtr);
    SmartHomeEndType _retval = cast(SmartHomeEndType)_cretval;
    return _retval;
  }

  /**
   * Gets the classSpaceDrawer associated with view.
   * The returned object is guaranteed to be the same for the lifetime of view.
   * Each classView object has a different classSpaceDrawer.
   * Returns: the #GtkSourceSpaceDrawer associated with view.
   */
  SpaceDrawer getSpaceDrawer()
  {
    GtkSourceSpaceDrawer* _cretval;
    _cretval = gtk_source_view_get_space_drawer(cast(GtkSourceView*)cPtr);
    auto _retval = ObjectG.getDObject!SpaceDrawer(cast(GtkSourceSpaceDrawer*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns the width of tabulation in characters.
   * Returns: width of tab.
   */
  uint getTabWidth()
  {
    uint _retval;
    _retval = gtk_source_view_get_tab_width(cast(GtkSourceView*)cPtr);
    return _retval;
  }

  /**
   * Determines the visual column at iter taking into consideration the
   * propertyView:tab-width of view.
   * Params:
   *   iter = a position in view.
   * Returns: the visual column at iter.
   */
  uint getVisualColumn(TextIter iter)
  {
    uint _retval;
    _retval = gtk_source_view_get_visual_column(cast(GtkSourceView*)cPtr, iter ? cast(GtkTextIter*)iter.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
   * Inserts one indentation level at the beginning of the specified lines. The
   * empty lines are not indented.
   * Params:
   *   start = #GtkTextIter of the first line to indent
   *   end = #GtkTextIter of the last line to indent
   */
  void indentLines(TextIter start, TextIter end)
  {
    gtk_source_view_indent_lines(cast(GtkSourceView*)cPtr, start ? cast(GtkTextIter*)start.cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end.cPtr(No.Dup) : null);
  }

  /**
   * Inserts a new snippet at location
   * If another snippet was already active, it will be paused and the new
   * snippet will become active. Once the focus positions of snippet have
   * been exhausted, editing will return to the previous snippet.
   * Params:
   *   snippet = a #GtkSourceSnippet
   *   location = a #GtkTextIter or %NULL for the cursor position
   */
  void pushSnippet(Snippet snippet, TextIter location)
  {
    gtk_source_view_push_snippet(cast(GtkSourceView*)cPtr, snippet ? cast(GtkSourceSnippet*)snippet.cPtr(No.Dup) : null, location ? cast(GtkTextIter*)location.cPtr(No.Dup) : null);
  }

  /**
   * If %TRUE auto-indentation of text is enabled.
   * When Enter is pressed to create a new line, the auto-indentation inserts the
   * same indentation as the previous line. This is **not** a
   * "smart indentation" where an indentation level is added or removed depending
   * on the context.
   * Params:
   *   enable = whether to enable auto indentation.
   */
  void setAutoIndent(bool enable)
  {
    gtk_source_view_set_auto_indent(cast(GtkSourceView*)cPtr, enable);
  }

  /**
   * Set if and how the background pattern should be displayed.
   * Params:
   *   backgroundPattern = the #GtkSourceBackgroundPatternType.
   */
  void setBackgroundPattern(BackgroundPatternType backgroundPattern)
  {
    gtk_source_view_set_background_pattern(cast(GtkSourceView*)cPtr, backgroundPattern);
  }

  /**
   * Sets the propertyView:enable-snippets property.
   * If enable_snippets is %TRUE, matching snippets found in the
   * classSnippetManager may be expanded when the user presses
   * Tab after a word in the classView.
   * Params:
   *   enableSnippets = if snippets should be enabled
   */
  void setEnableSnippets(bool enableSnippets)
  {
    gtk_source_view_set_enable_snippets(cast(GtkSourceView*)cPtr, enableSnippets);
  }

  /**
   * If highlight is %TRUE the current line will be highlighted.
   * Params:
   *   highlight = whether to highlight the current line.
   */
  void setHighlightCurrentLine(bool highlight)
  {
    gtk_source_view_set_highlight_current_line(cast(GtkSourceView*)cPtr, highlight);
  }

  /**
   * If %TRUE, when the tab key is pressed when several lines are selected, the
   * selected lines are indented of one level instead of being replaced with a `\t`
   * character. Shift+Tab unindents the selection.
   * If the first or last line is not selected completely, it is also indented or
   * unindented.
   * When the selection doesn't span several lines, the tab key always replaces
   * the selection with a normal `\t` character.
   * Params:
   *   enable = whether to indent a block when tab is pressed.
   */
  void setIndentOnTab(bool enable)
  {
    gtk_source_view_set_indent_on_tab(cast(GtkSourceView*)cPtr, enable);
  }

  /**
   * Sets the number of spaces to use for each step of indent when the tab key is
   * pressed.
   * If width is -1, the value of the propertyView:tab-width property
   * will be used.
   * The propertyView:indent-width interacts with the
   * propertyView:insert-spaces-instead-of-tabs property and
   * propertyView:tab-width. An example will be clearer:
   * If the propertyView:indent-width is 4 and propertyView:tab-width is 8 and
   * propertyView:insert-spaces-instead-of-tabs is %FALSE, then pressing the tab
   * key at the beginning of a line will insert 4 spaces. So far so good. Pressing
   * the tab key a second time will remove the 4 spaces and insert a `\t` character
   * instead $(LPAREN)since propertyView:tab-width is 8$(RPAREN). On the other hand, if
   * propertyView:insert-spaces-instead-of-tabs is %TRUE, the second tab key
   * pressed will insert 4 more spaces for a total of 8 spaces in the
   * [gtk.text_buffer.TextBuffer].
   * The test-widget program $(LPAREN)available in the GtkSourceView repository$(RPAREN) may be
   * useful to better understand the indentation settings $(LPAREN)enable the space
   * drawing!$(RPAREN).
   * Params:
   *   width = indent width in characters.
   */
  void setIndentWidth(int width)
  {
    gtk_source_view_set_indent_width(cast(GtkSourceView*)cPtr, width);
  }

  /**
   * Sets the indenter for view to indenter.
   * Note that the indenter will not be used unless #GtkSourceView:auto-indent
   * has been set to %TRUE.
   * Params:
   *   indenter = a #GtkSourceIndenter or %NULL
   */
  void setIndenter(Indenter indenter)
  {
    gtk_source_view_set_indenter(cast(GtkSourceView*)cPtr, indenter ? cast(GtkSourceIndenter*)(cast(ObjectG)indenter).cPtr(No.Dup) : null);
  }

  /**
   * If %TRUE a tab key pressed is replaced by a group of space characters.
   * Of course it is still possible to insert a real `\t` programmatically with the
   * [gtk.text_buffer.TextBuffer] API.
   * Params:
   *   enable = whether to insert spaces instead of tabs.
   */
  void setInsertSpacesInsteadOfTabs(bool enable)
  {
    gtk_source_view_set_insert_spaces_instead_of_tabs(cast(GtkSourceView*)cPtr, enable);
  }

  /**
   * Sets attributes and priority for the category.
   * Params:
   *   category = the category.
   *   attributes = mark attributes.
   *   priority = priority of the category.
   */
  void setMarkAttributes(string category, MarkAttributes attributes, int priority)
  {
    const(char)* _category = category.toCString(No.Alloc);
    gtk_source_view_set_mark_attributes(cast(GtkSourceView*)cPtr, _category, attributes ? cast(GtkSourceMarkAttributes*)attributes.cPtr(No.Dup) : null, priority);
  }

  /**
   * Sets the position of the right margin in the given view.
   * Params:
   *   pos = the width in characters where to position the right margin.
   */
  void setRightMarginPosition(uint pos)
  {
    gtk_source_view_set_right_margin_position(cast(GtkSourceView*)cPtr, pos);
  }

  /**
   * If %TRUE line marks will be displayed beside the text.
   * Params:
   *   show = whether line marks should be displayed.
   */
  void setShowLineMarks(bool show)
  {
    gtk_source_view_set_show_line_marks(cast(GtkSourceView*)cPtr, show);
  }

  /**
   * If %TRUE line numbers will be displayed beside the text.
   * Params:
   *   show = whether line numbers should be displayed.
   */
  void setShowLineNumbers(bool show)
  {
    gtk_source_view_set_show_line_numbers(cast(GtkSourceView*)cPtr, show);
  }

  /**
   * If %TRUE a right margin is displayed.
   * Params:
   *   show = whether to show a right margin.
   */
  void setShowRightMargin(bool show)
  {
    gtk_source_view_set_show_right_margin(cast(GtkSourceView*)cPtr, show);
  }

  /**
   * When set to %TRUE, pressing the Backspace key will try to delete spaces
   * up to the previous tab stop.
   * Params:
   *   smartBackspace = whether to enable smart Backspace handling.
   */
  void setSmartBackspace(bool smartBackspace)
  {
    gtk_source_view_set_smart_backspace(cast(GtkSourceView*)cPtr, smartBackspace);
  }

  /**
   * Set the desired movement of the cursor when HOME and END keys
   * are pressed.
   * Params:
   *   smartHomeEnd = the desired behavior among #GtkSourceSmartHomeEndType.
   */
  void setSmartHomeEnd(SmartHomeEndType smartHomeEnd)
  {
    gtk_source_view_set_smart_home_end(cast(GtkSourceView*)cPtr, smartHomeEnd);
  }

  /**
   * Sets the width of tabulation in characters.
   * The #GtkTextBuffer still contains `\t` characters,
   * but they can take a different visual width in a classView widget.
   * Params:
   *   width = width of tab in characters.
   */
  void setTabWidth(uint width)
  {
    gtk_source_view_set_tab_width(cast(GtkSourceView*)cPtr, width);
  }

  /**
   * Removes one indentation level at the beginning of the
   * specified lines.
   * Params:
   *   start = #GtkTextIter of the first line to indent
   *   end = #GtkTextIter of the last line to indent
   */
  void unindentLines(TextIter start, TextIter end)
  {
    gtk_source_view_unindent_lines(cast(GtkSourceView*)cPtr, start ? cast(GtkTextIter*)start.cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end.cPtr(No.Dup) : null);
  }

  /**
   * Keybinding signal to change case of the text at the current cursor position.
   * Params
   *   caseType = the case to use
   *   view = the instance the signal is connected to
   */
  alias ChangeCaseCallbackDlg = void delegate(ChangeCaseType caseType, View view);
  alias ChangeCaseCallbackFunc = void function(ChangeCaseType caseType, View view);

  /**
   * Connect to ChangeCase signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectChangeCase(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ChangeCaseCallbackDlg) || is(T : ChangeCaseCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto view = getVal!View(_paramVals);
      auto caseType = getVal!ChangeCaseType(&_paramVals[1]);
      _dClosure.dlg(caseType, view);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("change-case", closure, after);
  }

  /**
   * Keybinding signal to edit a number at the current cursor position.
   * Params
   *   count = the number to add to the number at the current position
   *   view = the instance the signal is connected to
   */
  alias ChangeNumberCallbackDlg = void delegate(int count, View view);
  alias ChangeNumberCallbackFunc = void function(int count, View view);

  /**
   * Connect to ChangeNumber signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectChangeNumber(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ChangeNumberCallbackDlg) || is(T : ChangeNumberCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto view = getVal!View(_paramVals);
      auto count = getVal!int(&_paramVals[1]);
      _dClosure.dlg(count, view);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("change-number", closure, after);
  }

  /**
   * Keybinding signal to join the lines currently selected.
   *   view = the instance the signal is connected to
   */
  alias JoinLinesCallbackDlg = void delegate(View view);
  alias JoinLinesCallbackFunc = void function(View view);

  /**
   * Connect to JoinLines signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectJoinLines(T)(T callback, Flag!"After" after = No.After)
  if (is(T : JoinLinesCallbackDlg) || is(T : JoinLinesCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto view = getVal!View(_paramVals);
      _dClosure.dlg(view);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("join-lines", closure, after);
  }

  /**
   * Emitted when a line mark has been activated $(LPAREN)for instance when there
   * was a button press in the line marks gutter$(RPAREN).
   * You can use iter to determine on which line the activation took place.
   * Params
   *   iter = a #GtkTextIter
   *   button = the button that was pressed
   *   state = the modifier state, if any
   *   nPresses = the number of presses
   *   view = the instance the signal is connected to
   */
  alias LineMarkActivatedCallbackDlg = void delegate(TextIter iter, uint button, ModifierType state, int nPresses, View view);
  alias LineMarkActivatedCallbackFunc = void function(TextIter iter, uint button, ModifierType state, int nPresses, View view);

  /**
   * Connect to LineMarkActivated signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectLineMarkActivated(T)(T callback, Flag!"After" after = No.After)
  if (is(T : LineMarkActivatedCallbackDlg) || is(T : LineMarkActivatedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto view = getVal!View(_paramVals);
      auto iter = getVal!TextIter(&_paramVals[1]);
      auto button = getVal!uint(&_paramVals[2]);
      auto state = getVal!ModifierType(&_paramVals[3]);
      auto nPresses = getVal!int(&_paramVals[4]);
      _dClosure.dlg(iter, button, state, nPresses, view);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("line-mark-activated", closure, after);
  }

  /**
   * The signal is a keybinding which gets emitted when the user initiates moving a line.
   * The default binding key is Alt+Up/Down arrow. And moves the currently selected lines,
   * or the current line up or down by one line.
   * Params
   *   down = %TRUE to move down, %FALSE to move up.
   *   view = the instance the signal is connected to
   */
  alias MoveLinesCallbackDlg = void delegate(bool down, View view);
  alias MoveLinesCallbackFunc = void function(bool down, View view);

  /**
   * Connect to MoveLines signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectMoveLines(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MoveLinesCallbackDlg) || is(T : MoveLinesCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto view = getVal!View(_paramVals);
      auto down = getVal!bool(&_paramVals[1]);
      _dClosure.dlg(down, view);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-lines", closure, after);
  }

  /**
   * Keybinding signal to move the cursor to the matching bracket.
   * Params
   *   extendSelection = %TRUE if the move should extend the selection
   *   view = the instance the signal is connected to
   */
  alias MoveToMatchingBracketCallbackDlg = void delegate(bool extendSelection, View view);
  alias MoveToMatchingBracketCallbackFunc = void function(bool extendSelection, View view);

  /**
   * Connect to MoveToMatchingBracket signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectMoveToMatchingBracket(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MoveToMatchingBracketCallbackDlg) || is(T : MoveToMatchingBracketCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto view = getVal!View(_paramVals);
      auto extendSelection = getVal!bool(&_paramVals[1]);
      _dClosure.dlg(extendSelection, view);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-to-matching-bracket", closure, after);
  }

  /**
   * The signal is a keybinding which gets emitted when the user initiates moving a word.
   * The default binding key is Alt+Left/Right Arrow and moves the current selection, or the current
   * word by one word.
   * Params
   *   count = the number of words to move over
   *   view = the instance the signal is connected to
   */
  alias MoveWordsCallbackDlg = void delegate(int count, View view);
  alias MoveWordsCallbackFunc = void function(int count, View view);

  /**
   * Connect to MoveWords signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectMoveWords(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MoveWordsCallbackDlg) || is(T : MoveWordsCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto view = getVal!View(_paramVals);
      auto count = getVal!int(&_paramVals[1]);
      _dClosure.dlg(count, view);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-words", closure, after);
  }

  /**
   * The signal is a key binding signal which gets
   * emitted when the user requests a completion, by pressing
   * <keycombo><keycap>Control</keycap><keycap>space</keycap></keycombo>.
   * This will create a classCompletionContext with the activation
   * type as %GTK_SOURCE_COMPLETION_ACTIVATION_USER_REQUESTED.
   * Applications should not connect to it, but may emit it with
   * funcGObject.signal_emit_by_name if they need to activate the completion by
   * another means, for example with another key binding or a menu entry.
   *   view = the instance the signal is connected to
   */
  alias ShowCompletionCallbackDlg = void delegate(View view);
  alias ShowCompletionCallbackFunc = void function(View view);

  /**
   * Connect to ShowCompletion signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectShowCompletion(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ShowCompletionCallbackDlg) || is(T : ShowCompletionCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto view = getVal!View(_paramVals);
      _dClosure.dlg(view);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("show-completion", closure, after);
  }

  /**
   * Emitted when a the cursor was moved according to the smart home end setting.
   * The signal is emitted after the cursor is moved, but
   * during the signalGtk.TextView::move-cursor action. This can be used to find
   * out whether the cursor was moved by a normal home/end or by a smart
   * home/end.
   * Params
   *   iter = a #GtkTextIter
   *   count = the count
   *   view = the instance the signal is connected to
   */
  alias SmartHomeEndCallbackDlg = void delegate(TextIter iter, int count, View view);
  alias SmartHomeEndCallbackFunc = void function(TextIter iter, int count, View view);

  /**
   * Connect to SmartHomeEnd signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectSmartHomeEnd(T)(T callback, Flag!"After" after = No.After)
  if (is(T : SmartHomeEndCallbackDlg) || is(T : SmartHomeEndCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto view = getVal!View(_paramVals);
      auto iter = getVal!TextIter(&_paramVals[1]);
      auto count = getVal!int(&_paramVals[2]);
      _dClosure.dlg(iter, count, view);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("smart-home-end", closure, after);
  }
}
