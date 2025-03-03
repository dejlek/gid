module gtk.text_view;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gdk.event_key;
import gdk.rectangle;
import gdk.window;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.adjustment;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.container;
import gtk.scrollable;
import gtk.scrollable_mixin;
import gtk.text_attributes;
import gtk.text_buffer;
import gtk.text_child_anchor;
import gtk.text_iter;
import gtk.text_mark;
import gtk.types;
import gtk.widget;
import pango.tab_array;

/**
 * You may wish to begin by reading the
 * [text widget conceptual overview](TextWidget.html)
 * which gives an overview of all the objects and data
 * types related to the text widget and how they work together.
 * # CSS nodes
 * |[<!-- language\="plain" -->
 * textview.view
 * ├── border.top
 * ├── border.left
 * ├── text
 * │   ╰── [selection]
 * ├── border.right
 * ├── border.bottom
 * ╰── [window.popup]
 * ]|
 * GtkTextView has a main css node with name textview and style class .view,
 * and subnodes for each of the border windows, and the main text area,
 * with names border and text, respectively. The border nodes each get
 * one of the style classes .left, .right, .top or .bottom.
 * A node representing the selection will appear below the text node.
 * If a context menu is opened, the window node will appear as a subnode
 * of the main node.
 */
class TextView : gtk.container.Container, gtk.scrollable.Scrollable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_text_view_get_type != &gidSymbolNotFound ? gtk_text_view_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin ScrollableT!();

  /**
   * Creates a new #GtkTextView. If you don’t call [gtk.text_view.TextView.setBuffer]
   * before using the text view, an empty default buffer will be created
   * for you. Get the buffer with [gtk.text_view.TextView.getBuffer]. If you want
   * to specify your own buffer, consider [gtk.text_view.TextView.newWithBuffer].
   * Returns: a new #GtkTextView
   */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_text_view_new();
    this(_cretval, No.Take);
  }

  /**
   * Creates a new #GtkTextView widget displaying the buffer
   * buffer. One buffer can be shared among many widgets.
   * buffer may be %NULL to create a default buffer, in which case
   * this function is equivalent to [gtk.text_view.TextView.new_]. The
   * text view adds its own reference count to the buffer; it does not
   * take over an existing reference.
   * Params:
   *   buffer = a #GtkTextBuffer
   * Returns: a new #GtkTextView.
   */
  static gtk.text_view.TextView newWithBuffer(gtk.text_buffer.TextBuffer buffer)
  {
    GtkWidget* _cretval;
    _cretval = gtk_text_view_new_with_buffer(buffer ? cast(GtkTextBuffer*)buffer.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gtk.text_view.TextView)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Adds a child widget in the text buffer, at the given anchor.
   * Params:
   *   child = a #GtkWidget
   *   anchor = a #GtkTextChildAnchor in the #GtkTextBuffer for text_view
   */
  void addChildAtAnchor(gtk.widget.Widget child, gtk.text_child_anchor.TextChildAnchor anchor)
  {
    gtk_text_view_add_child_at_anchor(cast(GtkTextView*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, anchor ? cast(GtkTextChildAnchor*)anchor.cPtr(No.Dup) : null);
  }

  /**
   * Adds a child at fixed coordinates in one of the text widget's
   * windows.
   * The window must have nonzero size $(LPAREN)see
   * [gtk.text_view.TextView.setBorderWindowSize]$(RPAREN). Note that the child
   * coordinates are given relative to scrolling. When
   * placing a child in #GTK_TEXT_WINDOW_WIDGET, scrolling is
   * irrelevant, the child floats above all scrollable areas. But when
   * placing a child in one of the scrollable windows $(LPAREN)border windows or
   * text window$(RPAREN) it will move with the scrolling as needed.
   * Params:
   *   child = a #GtkWidget
   *   whichWindow = which window the child should appear in
   *   xpos = X position of child in window coordinates
   *   ypos = Y position of child in window coordinates
   */
  void addChildInWindow(gtk.widget.Widget child, gtk.types.TextWindowType whichWindow, int xpos, int ypos)
  {
    gtk_text_view_add_child_in_window(cast(GtkTextView*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, whichWindow, xpos, ypos);
  }

  /**
   * Moves the given iter backward by one display $(LPAREN)wrapped$(RPAREN) line.
   * A display line is different from a paragraph. Paragraphs are
   * separated by newlines or other paragraph separator characters.
   * Display lines are created by line-wrapping a paragraph. If
   * wrapping is turned off, display lines and paragraphs will be the
   * same. Display lines are divided differently for each view, since
   * they depend on the view’s width; paragraphs are the same in all
   * views, since they depend on the contents of the #GtkTextBuffer.
   * Params:
   *   iter = a #GtkTextIter
   * Returns: %TRUE if iter was moved and is not on the end iterator
   */
  bool backwardDisplayLine(gtk.text_iter.TextIter iter)
  {
    bool _retval;
    _retval = gtk_text_view_backward_display_line(cast(GtkTextView*)cPtr, iter ? cast(GtkTextIter*)iter.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
   * Moves the given iter backward to the next display line start.
   * A display line is different from a paragraph. Paragraphs are
   * separated by newlines or other paragraph separator characters.
   * Display lines are created by line-wrapping a paragraph. If
   * wrapping is turned off, display lines and paragraphs will be the
   * same. Display lines are divided differently for each view, since
   * they depend on the view’s width; paragraphs are the same in all
   * views, since they depend on the contents of the #GtkTextBuffer.
   * Params:
   *   iter = a #GtkTextIter
   * Returns: %TRUE if iter was moved and is not on the end iterator
   */
  bool backwardDisplayLineStart(gtk.text_iter.TextIter iter)
  {
    bool _retval;
    _retval = gtk_text_view_backward_display_line_start(cast(GtkTextView*)cPtr, iter ? cast(GtkTextIter*)iter.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
   * Converts coordinate $(LPAREN)buffer_x, buffer_y$(RPAREN) to coordinates for the window
   * win, and stores the result in $(LPAREN)window_x, window_y$(RPAREN).
   * Note that you can’t convert coordinates for a nonexisting window $(LPAREN)see
   * [gtk.text_view.TextView.setBorderWindowSize]$(RPAREN).
   * Params:
   *   win = a #GtkTextWindowType, except %GTK_TEXT_WINDOW_PRIVATE
   *   bufferX = buffer x coordinate
   *   bufferY = buffer y coordinate
   *   windowX = window x coordinate return location or %NULL
   *   windowY = window y coordinate return location or %NULL
   */
  void bufferToWindowCoords(gtk.types.TextWindowType win, int bufferX, int bufferY, out int windowX, out int windowY)
  {
    gtk_text_view_buffer_to_window_coords(cast(GtkTextView*)cPtr, win, bufferX, bufferY, cast(int*)&windowX, cast(int*)&windowY);
  }

  /**
   * Moves the given iter forward by one display $(LPAREN)wrapped$(RPAREN) line.
   * A display line is different from a paragraph. Paragraphs are
   * separated by newlines or other paragraph separator characters.
   * Display lines are created by line-wrapping a paragraph. If
   * wrapping is turned off, display lines and paragraphs will be the
   * same. Display lines are divided differently for each view, since
   * they depend on the view’s width; paragraphs are the same in all
   * views, since they depend on the contents of the #GtkTextBuffer.
   * Params:
   *   iter = a #GtkTextIter
   * Returns: %TRUE if iter was moved and is not on the end iterator
   */
  bool forwardDisplayLine(gtk.text_iter.TextIter iter)
  {
    bool _retval;
    _retval = gtk_text_view_forward_display_line(cast(GtkTextView*)cPtr, iter ? cast(GtkTextIter*)iter.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
   * Moves the given iter forward to the next display line end.
   * A display line is different from a paragraph. Paragraphs are
   * separated by newlines or other paragraph separator characters.
   * Display lines are created by line-wrapping a paragraph. If
   * wrapping is turned off, display lines and paragraphs will be the
   * same. Display lines are divided differently for each view, since
   * they depend on the view’s width; paragraphs are the same in all
   * views, since they depend on the contents of the #GtkTextBuffer.
   * Params:
   *   iter = a #GtkTextIter
   * Returns: %TRUE if iter was moved and is not on the end iterator
   */
  bool forwardDisplayLineEnd(gtk.text_iter.TextIter iter)
  {
    bool _retval;
    _retval = gtk_text_view_forward_display_line_end(cast(GtkTextView*)cPtr, iter ? cast(GtkTextIter*)iter.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
   * Returns whether pressing the Tab key inserts a tab characters.
   * [gtk.text_view.TextView.setAcceptsTab].
   * Returns: %TRUE if pressing the Tab key inserts a tab character,
   *   %FALSE if pressing the Tab key moves the keyboard focus.
   */
  bool getAcceptsTab()
  {
    bool _retval;
    _retval = gtk_text_view_get_accepts_tab(cast(GtkTextView*)cPtr);
    return _retval;
  }

  /**
   * Gets the width of the specified border window. See
   * [gtk.text_view.TextView.setBorderWindowSize].
   * Params:
   *   type = window to return size from
   * Returns: width of window
   */
  int getBorderWindowSize(gtk.types.TextWindowType type)
  {
    int _retval;
    _retval = gtk_text_view_get_border_window_size(cast(GtkTextView*)cPtr, type);
    return _retval;
  }

  /**
   * Gets the bottom margin for text in the text_view.
   * Returns: bottom margin in pixels
   */
  int getBottomMargin()
  {
    int _retval;
    _retval = gtk_text_view_get_bottom_margin(cast(GtkTextView*)cPtr);
    return _retval;
  }

  /**
   * Returns the #GtkTextBuffer being displayed by this text view.
   * The reference count on the buffer is not incremented; the caller
   * of this function won’t own a new reference.
   * Returns: a #GtkTextBuffer
   */
  gtk.text_buffer.TextBuffer getBuffer()
  {
    GtkTextBuffer* _cretval;
    _cretval = gtk_text_view_get_buffer(cast(GtkTextView*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.text_buffer.TextBuffer)(cast(GtkTextBuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Given an iter within a text layout, determine the positions of the
   * strong and weak cursors if the insertion point is at that
   * iterator. The position of each cursor is stored as a zero-width
   * rectangle. The strong cursor location is the location where
   * characters of the directionality equal to the base direction of the
   * paragraph are inserted.  The weak cursor location is the location
   * where characters of the directionality opposite to the base
   * direction of the paragraph are inserted.
   * If iter is %NULL, the actual cursor position is used.
   * Note that if iter happens to be the actual cursor position, and
   * there is currently an IM preedit sequence being entered, the
   * returned locations will be adjusted to account for the preedit
   * cursor’s offset within the preedit sequence.
   * The rectangle position is in buffer coordinates; use
   * [gtk.text_view.TextView.bufferToWindowCoords] to convert these
   * coordinates to coordinates for one of the windows in the text view.
   * Params:
   *   iter = a #GtkTextIter
   *   strong = location to store the strong
   *     cursor position $(LPAREN)may be %NULL$(RPAREN)
   *   weak = location to store the weak
   *     cursor position $(LPAREN)may be %NULL$(RPAREN)
   */
  void getCursorLocations(gtk.text_iter.TextIter iter, out gdk.rectangle.Rectangle strong, out gdk.rectangle.Rectangle weak)
  {
    GdkRectangle _strong;
    GdkRectangle _weak;
    gtk_text_view_get_cursor_locations(cast(GtkTextView*)cPtr, iter ? cast(const(GtkTextIter)*)iter.cPtr(No.Dup) : null, &_strong, &_weak);
    strong = new gdk.rectangle.Rectangle(cast(void*)&_strong, No.Take);
    weak = new gdk.rectangle.Rectangle(cast(void*)&_weak, No.Take);
  }

  /**
   * Find out whether the cursor should be displayed.
   * Returns: whether the insertion mark is visible
   */
  bool getCursorVisible()
  {
    bool _retval;
    _retval = gtk_text_view_get_cursor_visible(cast(GtkTextView*)cPtr);
    return _retval;
  }

  /**
   * Obtains a copy of the default text attributes. These are the
   * attributes used for text unless a tag overrides them.
   * You’d typically pass the default attributes in to
   * [gtk.text_iter.TextIter.getAttributes] in order to get the
   * attributes in effect at a given text position.
   * The return value is a copy owned by the caller of this function,
   * and should be freed with [gtk.text_attributes.TextAttributes.unref].
   * Returns: a new #GtkTextAttributes
   */
  gtk.text_attributes.TextAttributes getDefaultAttributes()
  {
    GtkTextAttributes* _cretval;
    _cretval = gtk_text_view_get_default_attributes(cast(GtkTextView*)cPtr);
    auto _retval = _cretval ? new gtk.text_attributes.TextAttributes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Returns the default editability of the #GtkTextView. Tags in the
   * buffer may override this setting for some ranges of text.
   * Returns: whether text is editable by default
   */
  bool getEditable()
  {
    bool _retval;
    _retval = gtk_text_view_get_editable(cast(GtkTextView*)cPtr);
    return _retval;
  }

  /**
   * Gets the horizontal-scrolling #GtkAdjustment.
   * Returns: pointer to the horizontal #GtkAdjustment

   * Deprecated: Use [gtk.scrollable.Scrollable.getHadjustment]
   */
  gtk.adjustment.Adjustment getHadjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_text_view_get_hadjustment(cast(GtkTextView*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the default indentation of paragraphs in text_view.
   * Tags in the view’s buffer may override the default.
   * The indentation may be negative.
   * Returns: number of pixels of indentation
   */
  int getIndent()
  {
    int _retval;
    _retval = gtk_text_view_get_indent(cast(GtkTextView*)cPtr);
    return _retval;
  }

  /**
   * Gets the value of the #GtkTextView:input-hints property.
   * Returns:
   */
  gtk.types.InputHints getInputHints()
  {
    GtkInputHints _cretval;
    _cretval = gtk_text_view_get_input_hints(cast(GtkTextView*)cPtr);
    gtk.types.InputHints _retval = cast(gtk.types.InputHints)_cretval;
    return _retval;
  }

  /**
   * Gets the value of the #GtkTextView:input-purpose property.
   * Returns:
   */
  gtk.types.InputPurpose getInputPurpose()
  {
    GtkInputPurpose _cretval;
    _cretval = gtk_text_view_get_input_purpose(cast(GtkTextView*)cPtr);
    gtk.types.InputPurpose _retval = cast(gtk.types.InputPurpose)_cretval;
    return _retval;
  }

  /**
   * Retrieves the iterator at buffer coordinates x and y. Buffer
   * coordinates are coordinates for the entire buffer, not just the
   * currently-displayed portion.  If you have coordinates from an
   * event, you have to convert those to buffer coordinates with
   * [gtk.text_view.TextView.windowToBufferCoords].
   * Params:
   *   iter = a #GtkTextIter
   *   x = x position, in buffer coordinates
   *   y = y position, in buffer coordinates
   * Returns: %TRUE if the position is over text
   */
  bool getIterAtLocation(out gtk.text_iter.TextIter iter, int x, int y)
  {
    bool _retval;
    GtkTextIter _iter;
    _retval = gtk_text_view_get_iter_at_location(cast(GtkTextView*)cPtr, &_iter, x, y);
    iter = new gtk.text_iter.TextIter(cast(void*)&_iter, No.Take);
    return _retval;
  }

  /**
   * Retrieves the iterator pointing to the character at buffer
   * coordinates x and y. Buffer coordinates are coordinates for
   * the entire buffer, not just the currently-displayed portion.
   * If you have coordinates from an event, you have to convert
   * those to buffer coordinates with
   * [gtk.text_view.TextView.windowToBufferCoords].
   * Note that this is different from [gtk.text_view.TextView.getIterAtLocation],
   * which returns cursor locations, i.e. positions between
   * characters.
   * Params:
   *   iter = a #GtkTextIter
   *   trailing = if non-%NULL, location to store an integer indicating where
   *     in the grapheme the user clicked. It will either be
   *     zero, or the number of characters in the grapheme.
   *     0 represents the trailing edge of the grapheme.
   *   x = x position, in buffer coordinates
   *   y = y position, in buffer coordinates
   * Returns: %TRUE if the position is over text
   */
  bool getIterAtPosition(out gtk.text_iter.TextIter iter, out int trailing, int x, int y)
  {
    bool _retval;
    GtkTextIter _iter;
    _retval = gtk_text_view_get_iter_at_position(cast(GtkTextView*)cPtr, &_iter, cast(int*)&trailing, x, y);
    iter = new gtk.text_iter.TextIter(cast(void*)&_iter, No.Take);
    return _retval;
  }

  /**
   * Gets a rectangle which roughly contains the character at iter.
   * The rectangle position is in buffer coordinates; use
   * [gtk.text_view.TextView.bufferToWindowCoords] to convert these
   * coordinates to coordinates for one of the windows in the text view.
   * Params:
   *   iter = a #GtkTextIter
   *   location = bounds of the character at iter
   */
  void getIterLocation(gtk.text_iter.TextIter iter, out gdk.rectangle.Rectangle location)
  {
    GdkRectangle _location;
    gtk_text_view_get_iter_location(cast(GtkTextView*)cPtr, iter ? cast(const(GtkTextIter)*)iter.cPtr(No.Dup) : null, &_location);
    location = new gdk.rectangle.Rectangle(cast(void*)&_location, No.Take);
  }

  /**
   * Gets the default justification of paragraphs in text_view.
   * Tags in the buffer may override the default.
   * Returns: default justification
   */
  gtk.types.Justification getJustification()
  {
    GtkJustification _cretval;
    _cretval = gtk_text_view_get_justification(cast(GtkTextView*)cPtr);
    gtk.types.Justification _retval = cast(gtk.types.Justification)_cretval;
    return _retval;
  }

  /**
   * Gets the default left margin size of paragraphs in the text_view.
   * Tags in the buffer may override the default.
   * Returns: left margin in pixels
   */
  int getLeftMargin()
  {
    int _retval;
    _retval = gtk_text_view_get_left_margin(cast(GtkTextView*)cPtr);
    return _retval;
  }

  /**
   * Gets the #GtkTextIter at the start of the line containing
   * the coordinate y. y is in buffer coordinates, convert from
   * window coordinates with [gtk.text_view.TextView.windowToBufferCoords].
   * If non-%NULL, line_top will be filled with the coordinate of the top
   * edge of the line.
   * Params:
   *   targetIter = a #GtkTextIter
   *   y = a y coordinate
   *   lineTop = return location for top coordinate of the line
   */
  void getLineAtY(out gtk.text_iter.TextIter targetIter, int y, out int lineTop)
  {
    GtkTextIter _targetIter;
    gtk_text_view_get_line_at_y(cast(GtkTextView*)cPtr, &_targetIter, y, cast(int*)&lineTop);
    targetIter = new gtk.text_iter.TextIter(cast(void*)&_targetIter, No.Take);
  }

  /**
   * Gets the y coordinate of the top of the line containing iter,
   * and the height of the line. The coordinate is a buffer coordinate;
   * convert to window coordinates with [gtk.text_view.TextView.bufferToWindowCoords].
   * Params:
   *   iter = a #GtkTextIter
   *   y = return location for a y coordinate
   *   height = return location for a height
   */
  void getLineYrange(gtk.text_iter.TextIter iter, out int y, out int height)
  {
    gtk_text_view_get_line_yrange(cast(GtkTextView*)cPtr, iter ? cast(const(GtkTextIter)*)iter.cPtr(No.Dup) : null, cast(int*)&y, cast(int*)&height);
  }

  /**
   * Gets the value of the #GtkTextView:monospace property.
   * Returns: %TRUE if monospace fonts are desired
   */
  bool getMonospace()
  {
    bool _retval;
    _retval = gtk_text_view_get_monospace(cast(GtkTextView*)cPtr);
    return _retval;
  }

  /**
   * Returns whether the #GtkTextView is in overwrite mode or not.
   * Returns: whether text_view is in overwrite mode or not.
   */
  bool getOverwrite()
  {
    bool _retval;
    _retval = gtk_text_view_get_overwrite(cast(GtkTextView*)cPtr);
    return _retval;
  }

  /**
   * Gets the default number of pixels to put above paragraphs.
   * Adding this function with [gtk.text_view.TextView.getPixelsBelowLines]
   * is equal to the line space between each paragraph.
   * Returns: default number of pixels above paragraphs
   */
  int getPixelsAboveLines()
  {
    int _retval;
    _retval = gtk_text_view_get_pixels_above_lines(cast(GtkTextView*)cPtr);
    return _retval;
  }

  /**
   * Gets the value set by [gtk.text_view.TextView.setPixelsBelowLines].
   * The line space is the sum of the value returned by this function and the
   * value returned by [gtk.text_view.TextView.getPixelsAboveLines].
   * Returns: default number of blank pixels below paragraphs
   */
  int getPixelsBelowLines()
  {
    int _retval;
    _retval = gtk_text_view_get_pixels_below_lines(cast(GtkTextView*)cPtr);
    return _retval;
  }

  /**
   * Gets the value set by [gtk.text_view.TextView.setPixelsInsideWrap].
   * Returns: default number of pixels of blank space between wrapped lines
   */
  int getPixelsInsideWrap()
  {
    int _retval;
    _retval = gtk_text_view_get_pixels_inside_wrap(cast(GtkTextView*)cPtr);
    return _retval;
  }

  /**
   * Gets the default right margin for text in text_view. Tags
   * in the buffer may override the default.
   * Returns: right margin in pixels
   */
  int getRightMargin()
  {
    int _retval;
    _retval = gtk_text_view_get_right_margin(cast(GtkTextView*)cPtr);
    return _retval;
  }

  /**
   * Gets the default tabs for text_view. Tags in the buffer may
   * override the defaults. The returned array will be %NULL if
   * “standard” $(LPAREN)8-space$(RPAREN) tabs are used. Free the return value
   * with [pango.tab_array.TabArray.free].
   * Returns: copy of default tab array, or %NULL if
   *   “standard" tabs are used; must be freed with [pango.tab_array.TabArray.free].
   */
  pango.tab_array.TabArray getTabs()
  {
    PangoTabArray* _cretval;
    _cretval = gtk_text_view_get_tabs(cast(GtkTextView*)cPtr);
    auto _retval = _cretval ? new pango.tab_array.TabArray(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Gets the top margin for text in the text_view.
   * Returns: top margin in pixels
   */
  int getTopMargin()
  {
    int _retval;
    _retval = gtk_text_view_get_top_margin(cast(GtkTextView*)cPtr);
    return _retval;
  }

  /**
   * Gets the vertical-scrolling #GtkAdjustment.
   * Returns: pointer to the vertical #GtkAdjustment

   * Deprecated: Use [gtk.scrollable.Scrollable.getVadjustment]
   */
  gtk.adjustment.Adjustment getVadjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_text_view_get_vadjustment(cast(GtkTextView*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Fills visible_rect with the currently-visible
   * region of the buffer, in buffer coordinates. Convert to window coordinates
   * with [gtk.text_view.TextView.bufferToWindowCoords].
   * Params:
   *   visibleRect = rectangle to fill
   */
  void getVisibleRect(out gdk.rectangle.Rectangle visibleRect)
  {
    GdkRectangle _visibleRect;
    gtk_text_view_get_visible_rect(cast(GtkTextView*)cPtr, &_visibleRect);
    visibleRect = new gdk.rectangle.Rectangle(cast(void*)&_visibleRect, No.Take);
  }

  alias getWindow = gtk.widget.Widget.getWindow;

  /**
   * Retrieves the #GdkWindow corresponding to an area of the text view;
   * possible windows include the overall widget window, child windows
   * on the left, right, top, bottom, and the window that displays the
   * text buffer. Windows are %NULL and nonexistent if their width or
   * height is 0, and are nonexistent before the widget has been
   * realized.
   * Params:
   *   win = window to get
   * Returns: a #GdkWindow, or %NULL
   */
  gdk.window.Window getWindow(gtk.types.TextWindowType win)
  {
    GdkWindow* _cretval;
    _cretval = gtk_text_view_get_window(cast(GtkTextView*)cPtr, win);
    auto _retval = ObjectG.getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Usually used to find out which window an event corresponds to.
   * If you connect to an event signal on text_view, this function
   * should be called on `event->window` to see which window it was.
   * Params:
   *   window = a window type
   * Returns: the window type.
   */
  gtk.types.TextWindowType getWindowType(gdk.window.Window window)
  {
    GtkTextWindowType _cretval;
    _cretval = gtk_text_view_get_window_type(cast(GtkTextView*)cPtr, window ? cast(GdkWindow*)window.cPtr(No.Dup) : null);
    gtk.types.TextWindowType _retval = cast(gtk.types.TextWindowType)_cretval;
    return _retval;
  }

  /**
   * Gets the line wrapping for the view.
   * Returns: the line wrap setting
   */
  gtk.types.WrapMode getWrapMode()
  {
    GtkWrapMode _cretval;
    _cretval = gtk_text_view_get_wrap_mode(cast(GtkTextView*)cPtr);
    gtk.types.WrapMode _retval = cast(gtk.types.WrapMode)_cretval;
    return _retval;
  }

  /**
   * Allow the #GtkTextView input method to internally handle key press
   * and release events. If this function returns %TRUE, then no further
   * processing should be done for this key event. See
   * [gtk.imcontext.IMContext.filterKeypress].
   * Note that you are expected to call this function from your handler
   * when overriding key event handling. This is needed in the case when
   * you need to insert your own key handling between the input method
   * and the default key event handling of the #GtkTextView.
   * |[<!-- language\="C" -->
   * static gboolean
   * gtk_foo_bar_key_press_event $(LPAREN)GtkWidget   *widget,
   * GdkEventKey *event$(RPAREN)
   * {
   * guint keyval;
   * gdk_event_get_keyval $(LPAREN)$(LPAREN)GdkEvent*$(RPAREN)event, &keyval$(RPAREN);
   * if $(LPAREN)keyval \=\= GDK_KEY_Return || keyval \=\= GDK_KEY_KP_Enter$(RPAREN)
   * {
   * if $(LPAREN)gtk_text_view_im_context_filter_keypress $(LPAREN)GTK_TEXT_VIEW $(LPAREN)widget$(RPAREN), event$(RPAREN)$(RPAREN)
   * return TRUE;
   * }
   * // Do some stuff
   * return GTK_WIDGET_CLASS $(LPAREN)gtk_foo_bar_parent_class$(RPAREN)->key_press_event $(LPAREN)widget, event$(RPAREN);
   * }
   * ]|
   * Params:
   *   event = the key event
   * Returns: %TRUE if the input method handled the key event.
   */
  bool imContextFilterKeypress(gdk.event_key.EventKey event)
  {
    bool _retval;
    _retval = gtk_text_view_im_context_filter_keypress(cast(GtkTextView*)cPtr, event ? cast(GdkEventKey*)event.cPtr : null);
    return _retval;
  }

  /**
   * Updates the position of a child, as for [gtk.text_view.TextView.addChildInWindow].
   * Params:
   *   child = child widget already added to the text view
   *   xpos = new X position in window coordinates
   *   ypos = new Y position in window coordinates
   */
  void moveChild(gtk.widget.Widget child, int xpos, int ypos)
  {
    gtk_text_view_move_child(cast(GtkTextView*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, xpos, ypos);
  }

  /**
   * Moves a mark within the buffer so that it's
   * located within the currently-visible text area.
   * Params:
   *   mark = a #GtkTextMark
   * Returns: %TRUE if the mark moved $(LPAREN)wasn’t already onscreen$(RPAREN)
   */
  bool moveMarkOnscreen(gtk.text_mark.TextMark mark)
  {
    bool _retval;
    _retval = gtk_text_view_move_mark_onscreen(cast(GtkTextView*)cPtr, mark ? cast(GtkTextMark*)mark.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
   * Move the iterator a given number of characters visually, treating
   * it as the strong cursor position. If count is positive, then the
   * new strong cursor position will be count positions to the right of
   * the old cursor position. If count is negative then the new strong
   * cursor position will be count positions to the left of the old
   * cursor position.
   * In the presence of bi-directional text, the correspondence
   * between logical and visual order will depend on the direction
   * of the current run, and there may be jumps when the cursor
   * is moved off of the end of a run.
   * Params:
   *   iter = a #GtkTextIter
   *   count = number of characters to move $(LPAREN)negative moves left,
   *     positive moves right$(RPAREN)
   * Returns: %TRUE if iter moved and is not on the end iterator
   */
  bool moveVisually(gtk.text_iter.TextIter iter, int count)
  {
    bool _retval;
    _retval = gtk_text_view_move_visually(cast(GtkTextView*)cPtr, iter ? cast(GtkTextIter*)iter.cPtr(No.Dup) : null, count);
    return _retval;
  }

  /**
   * Moves the cursor to the currently visible region of the
   * buffer, it it isn’t there already.
   * Returns: %TRUE if the cursor had to be moved.
   */
  bool placeCursorOnscreen()
  {
    bool _retval;
    _retval = gtk_text_view_place_cursor_onscreen(cast(GtkTextView*)cPtr);
    return _retval;
  }

  /**
   * Ensures that the cursor is shown $(LPAREN)i.e. not in an 'off' blink
   * interval$(RPAREN) and resets the time that it will stay blinking $(LPAREN)or
   * visible, in case blinking is disabled$(RPAREN).
   * This function should be called in response to user input
   * $(LPAREN)e.g. from derived classes that override the textview's
   * #GtkWidget::key-press-event handler$(RPAREN).
   */
  void resetCursorBlink()
  {
    gtk_text_view_reset_cursor_blink(cast(GtkTextView*)cPtr);
  }

  /**
   * Reset the input method context of the text view if needed.
   * This can be necessary in the case where modifying the buffer
   * would confuse on-going input method behavior.
   */
  void resetImContext()
  {
    gtk_text_view_reset_im_context(cast(GtkTextView*)cPtr);
  }

  /**
   * Scrolls text_view the minimum distance such that mark is contained
   * within the visible area of the widget.
   * Params:
   *   mark = a mark in the buffer for text_view
   */
  void scrollMarkOnscreen(gtk.text_mark.TextMark mark)
  {
    gtk_text_view_scroll_mark_onscreen(cast(GtkTextView*)cPtr, mark ? cast(GtkTextMark*)mark.cPtr(No.Dup) : null);
  }

  /**
   * Scrolls text_view so that iter is on the screen in the position
   * indicated by xalign and yalign. An alignment of 0.0 indicates
   * left or top, 1.0 indicates right or bottom, 0.5 means center.
   * If use_align is %FALSE, the text scrolls the minimal distance to
   * get the mark onscreen, possibly not scrolling at all. The effective
   * screen for purposes of this function is reduced by a margin of size
   * within_margin.
   * Note that this function uses the currently-computed height of the
   * lines in the text buffer. Line heights are computed in an idle
   * handler; so this function may not have the desired effect if it’s
   * called before the height computations. To avoid oddness, consider
   * using [gtk.text_view.TextView.scrollToMark] which saves a point to be
   * scrolled to after line validation.
   * Params:
   *   iter = a #GtkTextIter
   *   withinMargin = margin as a [0.0,0.5$(RPAREN) fraction of screen size
   *   useAlign = whether to use alignment arguments $(LPAREN)if %FALSE,
   *     just get the mark onscreen$(RPAREN)
   *   xalign = horizontal alignment of mark within visible area
   *   yalign = vertical alignment of mark within visible area
   * Returns: %TRUE if scrolling occurred
   */
  bool scrollToIter(gtk.text_iter.TextIter iter, double withinMargin, bool useAlign, double xalign, double yalign)
  {
    bool _retval;
    _retval = gtk_text_view_scroll_to_iter(cast(GtkTextView*)cPtr, iter ? cast(GtkTextIter*)iter.cPtr(No.Dup) : null, withinMargin, useAlign, xalign, yalign);
    return _retval;
  }

  /**
   * Scrolls text_view so that mark is on the screen in the position
   * indicated by xalign and yalign. An alignment of 0.0 indicates
   * left or top, 1.0 indicates right or bottom, 0.5 means center.
   * If use_align is %FALSE, the text scrolls the minimal distance to
   * get the mark onscreen, possibly not scrolling at all. The effective
   * screen for purposes of this function is reduced by a margin of size
   * within_margin.
   * Params:
   *   mark = a #GtkTextMark
   *   withinMargin = margin as a [0.0,0.5$(RPAREN) fraction of screen size
   *   useAlign = whether to use alignment arguments $(LPAREN)if %FALSE, just
   *     get the mark onscreen$(RPAREN)
   *   xalign = horizontal alignment of mark within visible area
   *   yalign = vertical alignment of mark within visible area
   */
  void scrollToMark(gtk.text_mark.TextMark mark, double withinMargin, bool useAlign, double xalign, double yalign)
  {
    gtk_text_view_scroll_to_mark(cast(GtkTextView*)cPtr, mark ? cast(GtkTextMark*)mark.cPtr(No.Dup) : null, withinMargin, useAlign, xalign, yalign);
  }

  /**
   * Sets the behavior of the text widget when the Tab key is pressed.
   * If accepts_tab is %TRUE, a tab character is inserted. If accepts_tab
   * is %FALSE the keyboard focus is moved to the next widget in the focus
   * chain.
   * Params:
   *   acceptsTab = %TRUE if pressing the Tab key should insert a tab
   *     character, %FALSE, if pressing the Tab key should move the
   *     keyboard focus.
   */
  void setAcceptsTab(bool acceptsTab)
  {
    gtk_text_view_set_accepts_tab(cast(GtkTextView*)cPtr, acceptsTab);
  }

  /**
   * Sets the width of %GTK_TEXT_WINDOW_LEFT or %GTK_TEXT_WINDOW_RIGHT,
   * or the height of %GTK_TEXT_WINDOW_TOP or %GTK_TEXT_WINDOW_BOTTOM.
   * Automatically destroys the corresponding window if the size is set
   * to 0, and creates the window if the size is set to non-zero.  This
   * function can only be used for the “border windows”, and it won’t
   * work with %GTK_TEXT_WINDOW_WIDGET, %GTK_TEXT_WINDOW_TEXT, or
   * %GTK_TEXT_WINDOW_PRIVATE.
   * Params:
   *   type = window to affect
   *   size = width or height of the window
   */
  void setBorderWindowSize(gtk.types.TextWindowType type, int size)
  {
    gtk_text_view_set_border_window_size(cast(GtkTextView*)cPtr, type, size);
  }

  /**
   * Sets the bottom margin for text in text_view.
   * Note that this function is confusingly named.
   * In CSS terms, the value set here is padding.
   * Params:
   *   bottomMargin = bottom margin in pixels
   */
  void setBottomMargin(int bottomMargin)
  {
    gtk_text_view_set_bottom_margin(cast(GtkTextView*)cPtr, bottomMargin);
  }

  /**
   * Sets buffer as the buffer being displayed by text_view. The previous
   * buffer displayed by the text view is unreferenced, and a reference is
   * added to buffer. If you owned a reference to buffer before passing it
   * to this function, you must remove that reference yourself; #GtkTextView
   * will not “adopt” it.
   * Params:
   *   buffer = a #GtkTextBuffer
   */
  void setBuffer(gtk.text_buffer.TextBuffer buffer = null)
  {
    gtk_text_view_set_buffer(cast(GtkTextView*)cPtr, buffer ? cast(GtkTextBuffer*)buffer.cPtr(No.Dup) : null);
  }

  /**
   * Toggles whether the insertion point should be displayed. A buffer with
   * no editable text probably shouldn’t have a visible cursor, so you may
   * want to turn the cursor off.
   * Note that this property may be overridden by the
   * #GtkSettings:gtk-keynave-use-caret settings.
   * Params:
   *   setting = whether to show the insertion cursor
   */
  void setCursorVisible(bool setting)
  {
    gtk_text_view_set_cursor_visible(cast(GtkTextView*)cPtr, setting);
  }

  /**
   * Sets the default editability of the #GtkTextView. You can override
   * this default setting with tags in the buffer, using the “editable”
   * attribute of tags.
   * Params:
   *   setting = whether it’s editable
   */
  void setEditable(bool setting)
  {
    gtk_text_view_set_editable(cast(GtkTextView*)cPtr, setting);
  }

  /**
   * Sets the default indentation for paragraphs in text_view.
   * Tags in the buffer may override the default.
   * Params:
   *   indent = indentation in pixels
   */
  void setIndent(int indent)
  {
    gtk_text_view_set_indent(cast(GtkTextView*)cPtr, indent);
  }

  /**
   * Sets the #GtkTextView:input-hints property, which
   * allows input methods to fine-tune their behaviour.
   * Params:
   *   hints = the hints
   */
  void setInputHints(gtk.types.InputHints hints)
  {
    gtk_text_view_set_input_hints(cast(GtkTextView*)cPtr, hints);
  }

  /**
   * Sets the #GtkTextView:input-purpose property which
   * can be used by on-screen keyboards and other input
   * methods to adjust their behaviour.
   * Params:
   *   purpose = the purpose
   */
  void setInputPurpose(gtk.types.InputPurpose purpose)
  {
    gtk_text_view_set_input_purpose(cast(GtkTextView*)cPtr, purpose);
  }

  /**
   * Sets the default justification of text in text_view.
   * Tags in the view’s buffer may override the default.
   * Params:
   *   justification = justification
   */
  void setJustification(gtk.types.Justification justification)
  {
    gtk_text_view_set_justification(cast(GtkTextView*)cPtr, justification);
  }

  /**
   * Sets the default left margin for text in text_view.
   * Tags in the buffer may override the default.
   * Note that this function is confusingly named.
   * In CSS terms, the value set here is padding.
   * Params:
   *   leftMargin = left margin in pixels
   */
  void setLeftMargin(int leftMargin)
  {
    gtk_text_view_set_left_margin(cast(GtkTextView*)cPtr, leftMargin);
  }

  /**
   * Sets the #GtkTextView:monospace property, which
   * indicates that the text view should use monospace
   * fonts.
   * Params:
   *   monospace = %TRUE to request monospace styling
   */
  void setMonospace(bool monospace)
  {
    gtk_text_view_set_monospace(cast(GtkTextView*)cPtr, monospace);
  }

  /**
   * Changes the #GtkTextView overwrite mode.
   * Params:
   *   overwrite = %TRUE to turn on overwrite mode, %FALSE to turn it off
   */
  void setOverwrite(bool overwrite)
  {
    gtk_text_view_set_overwrite(cast(GtkTextView*)cPtr, overwrite);
  }

  /**
   * Sets the default number of blank pixels above paragraphs in text_view.
   * Tags in the buffer for text_view may override the defaults.
   * Params:
   *   pixelsAboveLines = pixels above paragraphs
   */
  void setPixelsAboveLines(int pixelsAboveLines)
  {
    gtk_text_view_set_pixels_above_lines(cast(GtkTextView*)cPtr, pixelsAboveLines);
  }

  /**
   * Sets the default number of pixels of blank space
   * to put below paragraphs in text_view. May be overridden
   * by tags applied to text_view’s buffer.
   * Params:
   *   pixelsBelowLines = pixels below paragraphs
   */
  void setPixelsBelowLines(int pixelsBelowLines)
  {
    gtk_text_view_set_pixels_below_lines(cast(GtkTextView*)cPtr, pixelsBelowLines);
  }

  /**
   * Sets the default number of pixels of blank space to leave between
   * display/wrapped lines within a paragraph. May be overridden by
   * tags in text_view’s buffer.
   * Params:
   *   pixelsInsideWrap = default number of pixels between wrapped lines
   */
  void setPixelsInsideWrap(int pixelsInsideWrap)
  {
    gtk_text_view_set_pixels_inside_wrap(cast(GtkTextView*)cPtr, pixelsInsideWrap);
  }

  /**
   * Sets the default right margin for text in the text view.
   * Tags in the buffer may override the default.
   * Note that this function is confusingly named.
   * In CSS terms, the value set here is padding.
   * Params:
   *   rightMargin = right margin in pixels
   */
  void setRightMargin(int rightMargin)
  {
    gtk_text_view_set_right_margin(cast(GtkTextView*)cPtr, rightMargin);
  }

  /**
   * Sets the default tab stops for paragraphs in text_view.
   * Tags in the buffer may override the default.
   * Params:
   *   tabs = tabs as a #PangoTabArray
   */
  void setTabs(pango.tab_array.TabArray tabs)
  {
    gtk_text_view_set_tabs(cast(GtkTextView*)cPtr, tabs ? cast(PangoTabArray*)tabs.cPtr(No.Dup) : null);
  }

  /**
   * Sets the top margin for text in text_view.
   * Note that this function is confusingly named.
   * In CSS terms, the value set here is padding.
   * Params:
   *   topMargin = top margin in pixels
   */
  void setTopMargin(int topMargin)
  {
    gtk_text_view_set_top_margin(cast(GtkTextView*)cPtr, topMargin);
  }

  /**
   * Sets the line wrapping for the view.
   * Params:
   *   wrapMode = a #GtkWrapMode
   */
  void setWrapMode(gtk.types.WrapMode wrapMode)
  {
    gtk_text_view_set_wrap_mode(cast(GtkTextView*)cPtr, wrapMode);
  }

  /**
   * Determines whether iter is at the start of a display line.
   * See [gtk.text_view.TextView.forwardDisplayLine] for an explanation of
   * display lines vs. paragraphs.
   * Params:
   *   iter = a #GtkTextIter
   * Returns: %TRUE if iter begins a wrapped line
   */
  bool startsDisplayLine(gtk.text_iter.TextIter iter)
  {
    bool _retval;
    _retval = gtk_text_view_starts_display_line(cast(GtkTextView*)cPtr, iter ? cast(const(GtkTextIter)*)iter.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
   * Converts coordinates on the window identified by win to buffer
   * coordinates, storing the result in $(LPAREN)buffer_x,buffer_y$(RPAREN).
   * Note that you can’t convert coordinates for a nonexisting window $(LPAREN)see
   * [gtk.text_view.TextView.setBorderWindowSize]$(RPAREN).
   * Params:
   *   win = a #GtkTextWindowType except %GTK_TEXT_WINDOW_PRIVATE
   *   windowX = window x coordinate
   *   windowY = window y coordinate
   *   bufferX = buffer x coordinate return location or %NULL
   *   bufferY = buffer y coordinate return location or %NULL
   */
  void windowToBufferCoords(gtk.types.TextWindowType win, int windowX, int windowY, out int bufferX, out int bufferY)
  {
    gtk_text_view_window_to_buffer_coords(cast(GtkTextView*)cPtr, win, windowX, windowY, cast(int*)&bufferX, cast(int*)&bufferY);
  }

  /**
   * The ::backspace signal is a
   * [keybinding signal][GtkBindingSignal]
   * which gets emitted when the user asks for it.
   * The default bindings for this signal are
   * Backspace and Shift-Backspace.
   *   textView = the instance the signal is connected to
   */
  alias BackspaceCallbackDlg = void delegate(gtk.text_view.TextView textView);
  alias BackspaceCallbackFunc = void function(gtk.text_view.TextView textView);

  /**
   * Connect to Backspace signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectBackspace(T)(T callback, Flag!"After" after = No.After)
  if (is(T : BackspaceCallbackDlg) || is(T : BackspaceCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto textView = getVal!(gtk.text_view.TextView)(_paramVals);
      _dClosure.dlg(textView);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("backspace", closure, after);
  }

  /**
   * The ::copy-clipboard signal is a
   * [keybinding signal][GtkBindingSignal]
   * which gets emitted to copy the selection to the clipboard.
   * The default bindings for this signal are
   * Ctrl-c and Ctrl-Insert.
   *   textView = the instance the signal is connected to
   */
  alias CopyClipboardCallbackDlg = void delegate(gtk.text_view.TextView textView);
  alias CopyClipboardCallbackFunc = void function(gtk.text_view.TextView textView);

  /**
   * Connect to CopyClipboard signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectCopyClipboard(T)(T callback, Flag!"After" after = No.After)
  if (is(T : CopyClipboardCallbackDlg) || is(T : CopyClipboardCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto textView = getVal!(gtk.text_view.TextView)(_paramVals);
      _dClosure.dlg(textView);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("copy-clipboard", closure, after);
  }

  /**
   * The ::cut-clipboard signal is a
   * [keybinding signal][GtkBindingSignal]
   * which gets emitted to cut the selection to the clipboard.
   * The default bindings for this signal are
   * Ctrl-x and Shift-Delete.
   *   textView = the instance the signal is connected to
   */
  alias CutClipboardCallbackDlg = void delegate(gtk.text_view.TextView textView);
  alias CutClipboardCallbackFunc = void function(gtk.text_view.TextView textView);

  /**
   * Connect to CutClipboard signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectCutClipboard(T)(T callback, Flag!"After" after = No.After)
  if (is(T : CutClipboardCallbackDlg) || is(T : CutClipboardCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto textView = getVal!(gtk.text_view.TextView)(_paramVals);
      _dClosure.dlg(textView);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cut-clipboard", closure, after);
  }

  /**
   * The ::delete-from-cursor signal is a
   * [keybinding signal][GtkBindingSignal]
   * which gets emitted when the user initiates a text deletion.
   * If the type is %GTK_DELETE_CHARS, GTK+ deletes the selection
   * if there is one, otherwise it deletes the requested number
   * of characters.
   * The default bindings for this signal are
   * Delete for deleting a character, Ctrl-Delete for
   * deleting a word and Ctrl-Backspace for deleting a word
   * backwords.
   * Params
   *   type = the granularity of the deletion, as a #GtkDeleteType
   *   count = the number of type units to delete
   *   textView = the instance the signal is connected to
   */
  alias DeleteFromCursorCallbackDlg = void delegate(gtk.types.DeleteType type, int count, gtk.text_view.TextView textView);
  alias DeleteFromCursorCallbackFunc = void function(gtk.types.DeleteType type, int count, gtk.text_view.TextView textView);

  /**
   * Connect to DeleteFromCursor signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectDeleteFromCursor(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DeleteFromCursorCallbackDlg) || is(T : DeleteFromCursorCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto textView = getVal!(gtk.text_view.TextView)(_paramVals);
      auto type = getVal!(gtk.types.DeleteType)(&_paramVals[1]);
      auto count = getVal!(int)(&_paramVals[2]);
      _dClosure.dlg(type, count, textView);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("delete-from-cursor", closure, after);
  }

  /**
   * The ::extend-selection signal is emitted when the selection needs to be
   * extended at location.
   * Params
   *   granularity = the granularity type
   *   location = the location where to extend the selection
   *   start = where the selection should start
   *   end = where the selection should end
   *   textView = the instance the signal is connected to
   * Returns: %GDK_EVENT_STOP to stop other handlers from being invoked for the
   *   event. %GDK_EVENT_PROPAGATE to propagate the event further.
   */
  alias ExtendSelectionCallbackDlg = bool delegate(gtk.types.TextExtendSelection granularity, gtk.text_iter.TextIter location, gtk.text_iter.TextIter start, gtk.text_iter.TextIter end, gtk.text_view.TextView textView);
  alias ExtendSelectionCallbackFunc = bool function(gtk.types.TextExtendSelection granularity, gtk.text_iter.TextIter location, gtk.text_iter.TextIter start, gtk.text_iter.TextIter end, gtk.text_view.TextView textView);

  /**
   * Connect to ExtendSelection signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectExtendSelection(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ExtendSelectionCallbackDlg) || is(T : ExtendSelectionCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto textView = getVal!(gtk.text_view.TextView)(_paramVals);
      auto granularity = getVal!(gtk.types.TextExtendSelection)(&_paramVals[1]);
      auto location = getVal!(gtk.text_iter.TextIter)(&_paramVals[2]);
      auto start = getVal!(gtk.text_iter.TextIter)(&_paramVals[3]);
      auto end = getVal!(gtk.text_iter.TextIter)(&_paramVals[4]);
      _retval = _dClosure.dlg(granularity, location, start, end, textView);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("extend-selection", closure, after);
  }

  /**
   * The ::insert-at-cursor signal is a
   * [keybinding signal][GtkBindingSignal]
   * which gets emitted when the user initiates the insertion of a
   * fixed string at the cursor.
   * This signal has no default bindings.
   * Params
   *   string_ = the string to insert
   *   textView = the instance the signal is connected to
   */
  alias InsertAtCursorCallbackDlg = void delegate(string string_, gtk.text_view.TextView textView);
  alias InsertAtCursorCallbackFunc = void function(string string_, gtk.text_view.TextView textView);

  /**
   * Connect to InsertAtCursor signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectInsertAtCursor(T)(T callback, Flag!"After" after = No.After)
  if (is(T : InsertAtCursorCallbackDlg) || is(T : InsertAtCursorCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto textView = getVal!(gtk.text_view.TextView)(_paramVals);
      auto string_ = getVal!(string)(&_paramVals[1]);
      _dClosure.dlg(string_, textView);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("insert-at-cursor", closure, after);
  }

  /**
   * The ::insert-emoji signal is a
   * [keybinding signal][GtkBindingSignal]
   * which gets emitted to present the Emoji chooser for the text_view.
   * The default bindings for this signal are Ctrl-. and Ctrl-;
   *   textView = the instance the signal is connected to
   */
  alias InsertEmojiCallbackDlg = void delegate(gtk.text_view.TextView textView);
  alias InsertEmojiCallbackFunc = void function(gtk.text_view.TextView textView);

  /**
   * Connect to InsertEmoji signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectInsertEmoji(T)(T callback, Flag!"After" after = No.After)
  if (is(T : InsertEmojiCallbackDlg) || is(T : InsertEmojiCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto textView = getVal!(gtk.text_view.TextView)(_paramVals);
      _dClosure.dlg(textView);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("insert-emoji", closure, after);
  }

  /**
   * The ::move-cursor signal is a
   * [keybinding signal][GtkBindingSignal]
   * which gets emitted when the user initiates a cursor movement.
   * If the cursor is not visible in text_view, this signal causes
   * the viewport to be moved instead.
   * Applications should not connect to it, but may emit it with
   * [gobject.global.signalEmitByName] if they need to control the cursor
   * programmatically.
   * The default bindings for this signal come in two variants,
   * the variant with the Shift modifier extends the selection,
   * the variant without the Shift modifer does not.
   * There are too many key combinations to list them all here.
   * - Arrow keys move by individual characters/lines
   * - Ctrl-arrow key combinations move by words/paragraphs
   * - Home/End keys move to the ends of the buffer
   * - PageUp/PageDown keys move vertically by pages
   * - Ctrl-PageUp/PageDown keys move horizontally by pages
   * Params
   *   step = the granularity of the move, as a #GtkMovementStep
   *   count = the number of step units to move
   *   extendSelection = %TRUE if the move should extend the selection
   *   textView = the instance the signal is connected to
   */
  alias MoveCursorCallbackDlg = void delegate(gtk.types.MovementStep step, int count, bool extendSelection, gtk.text_view.TextView textView);
  alias MoveCursorCallbackFunc = void function(gtk.types.MovementStep step, int count, bool extendSelection, gtk.text_view.TextView textView);

  /**
   * Connect to MoveCursor signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectMoveCursor(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MoveCursorCallbackDlg) || is(T : MoveCursorCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto textView = getVal!(gtk.text_view.TextView)(_paramVals);
      auto step = getVal!(gtk.types.MovementStep)(&_paramVals[1]);
      auto count = getVal!(int)(&_paramVals[2]);
      auto extendSelection = getVal!(bool)(&_paramVals[3]);
      _dClosure.dlg(step, count, extendSelection, textView);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-cursor", closure, after);
  }

  /**
   * The ::move-viewport signal is a
   * [keybinding signal][GtkBindingSignal]
   * which can be bound to key combinations to allow the user
   * to move the viewport, i.e. change what part of the text view
   * is visible in a containing scrolled window.
   * There are no default bindings for this signal.
   * Params
   *   step = the granularity of the movement, as a #GtkScrollStep
   *   count = the number of step units to move
   *   textView = the instance the signal is connected to
   */
  alias MoveViewportCallbackDlg = void delegate(gtk.types.ScrollStep step, int count, gtk.text_view.TextView textView);
  alias MoveViewportCallbackFunc = void function(gtk.types.ScrollStep step, int count, gtk.text_view.TextView textView);

  /**
   * Connect to MoveViewport signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectMoveViewport(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MoveViewportCallbackDlg) || is(T : MoveViewportCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto textView = getVal!(gtk.text_view.TextView)(_paramVals);
      auto step = getVal!(gtk.types.ScrollStep)(&_paramVals[1]);
      auto count = getVal!(int)(&_paramVals[2]);
      _dClosure.dlg(step, count, textView);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-viewport", closure, after);
  }

  /**
   * The ::paste-clipboard signal is a
   * [keybinding signal][GtkBindingSignal]
   * which gets emitted to paste the contents of the clipboard
   * into the text view.
   * The default bindings for this signal are
   * Ctrl-v and Shift-Insert.
   *   textView = the instance the signal is connected to
   */
  alias PasteClipboardCallbackDlg = void delegate(gtk.text_view.TextView textView);
  alias PasteClipboardCallbackFunc = void function(gtk.text_view.TextView textView);

  /**
   * Connect to PasteClipboard signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectPasteClipboard(T)(T callback, Flag!"After" after = No.After)
  if (is(T : PasteClipboardCallbackDlg) || is(T : PasteClipboardCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto textView = getVal!(gtk.text_view.TextView)(_paramVals);
      _dClosure.dlg(textView);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("paste-clipboard", closure, after);
  }

  /**
   * The ::populate-popup signal gets emitted before showing the
   * context menu of the text view.
   * If you need to add items to the context menu, connect
   * to this signal and append your items to the popup, which
   * will be a #GtkMenu in this case.
   * If #GtkTextView:populate-all is %TRUE, this signal will
   * also be emitted to populate touch popups. In this case,
   * popup will be a different container, e.g. a #GtkToolbar.
   * The signal handler should not make assumptions about the
   * type of widget, but check whether popup is a #GtkMenu
   * or #GtkToolbar or another kind of container.
   * Params
   *   popup = the container that is being populated
   *   textView = the instance the signal is connected to
   */
  alias PopulatePopupCallbackDlg = void delegate(gtk.widget.Widget popup, gtk.text_view.TextView textView);
  alias PopulatePopupCallbackFunc = void function(gtk.widget.Widget popup, gtk.text_view.TextView textView);

  /**
   * Connect to PopulatePopup signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectPopulatePopup(T)(T callback, Flag!"After" after = No.After)
  if (is(T : PopulatePopupCallbackDlg) || is(T : PopulatePopupCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto textView = getVal!(gtk.text_view.TextView)(_paramVals);
      auto popup = getVal!(gtk.widget.Widget)(&_paramVals[1]);
      _dClosure.dlg(popup, textView);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("populate-popup", closure, after);
  }

  /**
   * If an input method is used, the typed text will not immediately
   * be committed to the buffer. So if you are interested in the text,
   * connect to this signal.
   * This signal is only emitted if the text at the given position
   * is actually editable.
   * Params
   *   preedit = the current preedit string
   *   textView = the instance the signal is connected to
   */
  alias PreeditChangedCallbackDlg = void delegate(string preedit, gtk.text_view.TextView textView);
  alias PreeditChangedCallbackFunc = void function(string preedit, gtk.text_view.TextView textView);

  /**
   * Connect to PreeditChanged signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectPreeditChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : PreeditChangedCallbackDlg) || is(T : PreeditChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto textView = getVal!(gtk.text_view.TextView)(_paramVals);
      auto preedit = getVal!(string)(&_paramVals[1]);
      _dClosure.dlg(preedit, textView);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("preedit-changed", closure, after);
  }

  /**
   * The ::select-all signal is a
   * [keybinding signal][GtkBindingSignal]
   * which gets emitted to select or unselect the complete
   * contents of the text view.
   * The default bindings for this signal are Ctrl-a and Ctrl-/
   * for selecting and Shift-Ctrl-a and Ctrl-\ for unselecting.
   * Params
   *   select = %TRUE to select, %FALSE to unselect
   *   textView = the instance the signal is connected to
   */
  alias SelectAllCallbackDlg = void delegate(bool select, gtk.text_view.TextView textView);
  alias SelectAllCallbackFunc = void function(bool select, gtk.text_view.TextView textView);

  /**
   * Connect to SelectAll signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectSelectAll(T)(T callback, Flag!"After" after = No.After)
  if (is(T : SelectAllCallbackDlg) || is(T : SelectAllCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto textView = getVal!(gtk.text_view.TextView)(_paramVals);
      auto select = getVal!(bool)(&_paramVals[1]);
      _dClosure.dlg(select, textView);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("select-all", closure, after);
  }

  /**
   * The ::set-anchor signal is a
   * [keybinding signal][GtkBindingSignal]
   * which gets emitted when the user initiates setting the "anchor"
   * mark. The "anchor" mark gets placed at the same position as the
   * "insert" mark.
   * This signal has no default bindings.
   *   textView = the instance the signal is connected to
   */
  alias SetAnchorCallbackDlg = void delegate(gtk.text_view.TextView textView);
  alias SetAnchorCallbackFunc = void function(gtk.text_view.TextView textView);

  /**
   * Connect to SetAnchor signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectSetAnchor(T)(T callback, Flag!"After" after = No.After)
  if (is(T : SetAnchorCallbackDlg) || is(T : SetAnchorCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto textView = getVal!(gtk.text_view.TextView)(_paramVals);
      _dClosure.dlg(textView);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("set-anchor", closure, after);
  }

  /**
   * The ::toggle-cursor-visible signal is a
   * [keybinding signal][GtkBindingSignal]
   * which gets emitted to toggle the #GtkTextView:cursor-visible
   * property.
   * The default binding for this signal is F7.
   *   textView = the instance the signal is connected to
   */
  alias ToggleCursorVisibleCallbackDlg = void delegate(gtk.text_view.TextView textView);
  alias ToggleCursorVisibleCallbackFunc = void function(gtk.text_view.TextView textView);

  /**
   * Connect to ToggleCursorVisible signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectToggleCursorVisible(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ToggleCursorVisibleCallbackDlg) || is(T : ToggleCursorVisibleCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto textView = getVal!(gtk.text_view.TextView)(_paramVals);
      _dClosure.dlg(textView);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggle-cursor-visible", closure, after);
  }

  /**
   * The ::toggle-overwrite signal is a
   * [keybinding signal][GtkBindingSignal]
   * which gets emitted to toggle the overwrite mode of the text view.
   * The default bindings for this signal is Insert.
   *   textView = the instance the signal is connected to
   */
  alias ToggleOverwriteCallbackDlg = void delegate(gtk.text_view.TextView textView);
  alias ToggleOverwriteCallbackFunc = void function(gtk.text_view.TextView textView);

  /**
   * Connect to ToggleOverwrite signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectToggleOverwrite(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ToggleOverwriteCallbackDlg) || is(T : ToggleOverwriteCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto textView = getVal!(gtk.text_view.TextView)(_paramVals);
      _dClosure.dlg(textView);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggle-overwrite", closure, after);
  }
}
