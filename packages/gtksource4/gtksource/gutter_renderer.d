module gtksource.gutter_renderer;

import cairo.context;
import gdk.event;
import gdk.rectangle;
import gdk.rgba;
import gid.gid;
import gobject.dclosure;
import gobject.initially_unowned;
import gobject.object;
import gtk.text_iter;
import gtk.text_view;
import gtk.tooltip;
import gtk.types;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

class GutterRenderer : gobject.initially_unowned.InitiallyUnowned
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_gutter_renderer_get_type != &gidSymbolNotFound ? gtk_source_gutter_renderer_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Emits the #GtkSourceGutterRenderer::activate signal of the renderer. This is
   * called from #GtkSourceGutter and should never have to be called manually.
   * Params:
   *   iter = a #GtkTextIter at the start of the line where the renderer is activated
   *   area = a #GdkRectangle of the cell area where the renderer is activated
   *   event = the event that triggered the activation
   */
  void activate(gtk.text_iter.TextIter iter, gdk.rectangle.Rectangle area, gdk.event.Event event)
  {
    gtk_source_gutter_renderer_activate(cast(GtkSourceGutterRenderer*)cPtr, iter ? cast(GtkTextIter*)iter.cPtr(No.Dup) : null, area ? cast(GdkRectangle*)area.cPtr(No.Dup) : null, event ? cast(GdkEvent*)event.cPtr : null);
  }

  /**
   * Called when drawing a region begins. The region to be drawn is indicated
   * by start and end. The purpose is to allow the implementation to precompute
   * some state before the draw method is called for each cell.
   * Params:
   *   cr = a #cairo_t
   *   backgroundArea = a #GdkRectangle
   *   cellArea = a #GdkRectangle
   *   start = a #GtkTextIter
   *   end = a #GtkTextIter
   */
  void begin(cairo.context.Context cr, gdk.rectangle.Rectangle backgroundArea, gdk.rectangle.Rectangle cellArea, gtk.text_iter.TextIter start, gtk.text_iter.TextIter end)
  {
    gtk_source_gutter_renderer_begin(cast(GtkSourceGutterRenderer*)cPtr, cr ? cast(cairo_t*)cr.cPtr(No.Dup) : null, backgroundArea ? cast(GdkRectangle*)backgroundArea.cPtr(No.Dup) : null, cellArea ? cast(GdkRectangle*)cellArea.cPtr(No.Dup) : null, start ? cast(GtkTextIter*)start.cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end.cPtr(No.Dup) : null);
  }

  /**
   * Main renderering method. Implementations should implement this method to draw
   * onto the cairo context. The background_area indicates the total area of the
   * cell to be drawn. The cell_area indicates the area where content can be
   * drawn $(LPAREN)text, images, etc$(RPAREN).
   * The background_area is the cell_area plus the padding on each side $(LPAREN)two
   * times the #GtkSourceGutterRenderer:xpad horizontally and two times the
   * #GtkSourceGutterRenderer:ypad vertically, so that the cell_area is centered
   * inside background_area$(RPAREN).
   * The state argument indicates the current state of the renderer and should
   * be taken into account to properly draw the different possible states
   * $(LPAREN)cursor, prelit, selected$(RPAREN) if appropriate.
   * Params:
   *   cr = the cairo render context
   *   backgroundArea = a #GdkRectangle indicating the total area to be drawn
   *   cellArea = a #GdkRectangle indicating the area to draw content
   *   start = a #GtkTextIter
   *   end = a #GtkTextIter
   *   state = a #GtkSourceGutterRendererState
   */
  void draw(cairo.context.Context cr, gdk.rectangle.Rectangle backgroundArea, gdk.rectangle.Rectangle cellArea, gtk.text_iter.TextIter start, gtk.text_iter.TextIter end, gtksource.types.GutterRendererState state)
  {
    gtk_source_gutter_renderer_draw(cast(GtkSourceGutterRenderer*)cPtr, cr ? cast(cairo_t*)cr.cPtr(No.Dup) : null, backgroundArea ? cast(GdkRectangle*)backgroundArea.cPtr(No.Dup) : null, cellArea ? cast(GdkRectangle*)cellArea.cPtr(No.Dup) : null, start ? cast(GtkTextIter*)start.cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end.cPtr(No.Dup) : null, state);
  }

  /**
   * Called when drawing a region of lines has ended.
   */
  void end()
  {
    gtk_source_gutter_renderer_end(cast(GtkSourceGutterRenderer*)cPtr);
  }

  /**
   * Get the x-alignment and y-alignment of the gutter renderer.
   * Params:
   *   xalign = return location for the x-alignment,
   *     or %NULL to ignore.
   *   yalign = return location for the y-alignment,
   *     or %NULL to ignore.
   */
  void getAlignment(out float xalign, out float yalign)
  {
    gtk_source_gutter_renderer_get_alignment(cast(GtkSourceGutterRenderer*)cPtr, cast(float*)&xalign, cast(float*)&yalign);
  }

  /**
   * Get the alignment mode. The alignment mode describes the manner in which the
   * renderer is aligned $(LPAREN)see :xalign and :yalign$(RPAREN).
   * Returns: a #GtkSourceGutterRendererAlignmentMode
   */
  gtksource.types.GutterRendererAlignmentMode getAlignmentMode()
  {
    GtkSourceGutterRendererAlignmentMode _cretval;
    _cretval = gtk_source_gutter_renderer_get_alignment_mode(cast(GtkSourceGutterRenderer*)cPtr);
    gtksource.types.GutterRendererAlignmentMode _retval = cast(gtksource.types.GutterRendererAlignmentMode)_cretval;
    return _retval;
  }

  /**
   * Get the background color of the renderer.
   * Params:
   *   color = return value for a #GdkRGBA
   * Returns: %TRUE if the background color is set, %FALSE otherwise
   */
  bool getBackground(out gdk.rgba.RGBA color)
  {
    bool _retval;
    GdkRGBA _color;
    _retval = gtk_source_gutter_renderer_get_background(cast(GtkSourceGutterRenderer*)cPtr, &_color);
    color = new gdk.rgba.RGBA(cast(void*)&_color, No.Take);
    return _retval;
  }

  /**
   * Get the x-padding and y-padding of the gutter renderer.
   * Params:
   *   xpad = return location for the x-padding,
   *     or %NULL to ignore.
   *   ypad = return location for the y-padding,
   *     or %NULL to ignore.
   */
  void getPadding(out int xpad, out int ypad)
  {
    gtk_source_gutter_renderer_get_padding(cast(GtkSourceGutterRenderer*)cPtr, cast(int*)&xpad, cast(int*)&ypad);
  }

  /**
   * Get the size of the renderer.
   * Returns: the size of the renderer.
   */
  int getSize()
  {
    int _retval;
    _retval = gtk_source_gutter_renderer_get_size(cast(GtkSourceGutterRenderer*)cPtr);
    return _retval;
  }

  /**
   * Get the view associated to the gutter renderer
   * Returns: a #GtkTextView
   */
  gtk.text_view.TextView getView()
  {
    GtkTextView* _cretval;
    _cretval = gtk_source_gutter_renderer_get_view(cast(GtkSourceGutterRenderer*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.text_view.TextView)(cast(GtkTextView*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Get whether the gutter renderer is visible.
   * Returns: %TRUE if the renderer is visible, %FALSE otherwise
   */
  bool getVisible()
  {
    bool _retval;
    _retval = gtk_source_gutter_renderer_get_visible(cast(GtkSourceGutterRenderer*)cPtr);
    return _retval;
  }

  /**
   * Get the #GtkTextWindowType associated with the gutter renderer.
   * Returns: a #GtkTextWindowType
   */
  gtk.types.TextWindowType getWindowType()
  {
    GtkTextWindowType _cretval;
    _cretval = gtk_source_gutter_renderer_get_window_type(cast(GtkSourceGutterRenderer*)cPtr);
    gtk.types.TextWindowType _retval = cast(gtk.types.TextWindowType)_cretval;
    return _retval;
  }

  /**
   * Get whether the renderer is activatable at the location in event. This is
   * called from #GtkSourceGutter to determine whether a renderer is activatable
   * using the mouse pointer.
   * Params:
   *   iter = a #GtkTextIter at the start of the line to be activated
   *   area = a #GdkRectangle of the cell area to be activated
   *   event = the event that triggered the query
   * Returns: %TRUE if the renderer can be activated, %FALSE otherwise
   */
  bool queryActivatable(gtk.text_iter.TextIter iter, gdk.rectangle.Rectangle area, gdk.event.Event event)
  {
    bool _retval;
    _retval = gtk_source_gutter_renderer_query_activatable(cast(GtkSourceGutterRenderer*)cPtr, iter ? cast(GtkTextIter*)iter.cPtr(No.Dup) : null, area ? cast(GdkRectangle*)area.cPtr(No.Dup) : null, event ? cast(GdkEvent*)event.cPtr : null);
    return _retval;
  }

  /**
   * Emit the #GtkSourceGutterRenderer::query-data signal. This function is called
   * to query for data just before rendering a cell. This is called from the
   * #GtkSourceGutter.  Implementations can override the default signal handler or
   * can connect a signal handler externally to the
   * #GtkSourceGutterRenderer::query-data signal.
   * Params:
   *   start = a #GtkTextIter.
   *   end = a #GtkTextIter.
   *   state = a #GtkSourceGutterRendererState.
   */
  void queryData(gtk.text_iter.TextIter start, gtk.text_iter.TextIter end, gtksource.types.GutterRendererState state)
  {
    gtk_source_gutter_renderer_query_data(cast(GtkSourceGutterRenderer*)cPtr, start ? cast(GtkTextIter*)start.cPtr(No.Dup) : null, end ? cast(GtkTextIter*)end.cPtr(No.Dup) : null, state);
  }

  /**
   * Emits the #GtkSourceGutterRenderer::query-tooltip signal. This function is
   * called from #GtkSourceGutter. Implementations can override the default signal
   * handler or can connect to the signal externally.
   * Params:
   *   iter = a #GtkTextIter.
   *   area = a #GdkRectangle.
   *   x = The x position of the tooltip.
   *   y = The y position of the tooltip.
   *   tooltip = a #GtkTooltip.
   * Returns: %TRUE if the tooltip has been set, %FALSE otherwise
   */
  bool queryTooltip(gtk.text_iter.TextIter iter, gdk.rectangle.Rectangle area, int x, int y, gtk.tooltip.Tooltip tooltip)
  {
    bool _retval;
    _retval = gtk_source_gutter_renderer_query_tooltip(cast(GtkSourceGutterRenderer*)cPtr, iter ? cast(GtkTextIter*)iter.cPtr(No.Dup) : null, area ? cast(GdkRectangle*)area.cPtr(No.Dup) : null, x, y, tooltip ? cast(GtkTooltip*)tooltip.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
   * Emits the #GtkSourceGutterRenderer::queue-draw signal of the renderer. Call
   * this from an implementation to inform that the renderer has changed such that
   * it needs to redraw.
   */
  void queueDraw()
  {
    gtk_source_gutter_renderer_queue_draw(cast(GtkSourceGutterRenderer*)cPtr);
  }

  /**
   * Set the alignment of the gutter renderer. Both xalign and yalign can be
   * -1, which means the values will not be changed $(LPAREN)this allows changing only
   * one of the values$(RPAREN).
   * xalign is the horizontal alignment. Set to 0 for a left alignment. 1 for a
   * right alignment. And 0.5 for centering the cells. yalign is the vertical
   * alignment. Set to 0 for a top alignment. 1 for a bottom alignment.
   * Params:
   *   xalign = the x-alignment
   *   yalign = the y-alignment
   */
  void setAlignment(float xalign, float yalign)
  {
    gtk_source_gutter_renderer_set_alignment(cast(GtkSourceGutterRenderer*)cPtr, xalign, yalign);
  }

  /**
   * Set the alignment mode. The alignment mode describes the manner in which the
   * renderer is aligned $(LPAREN)see :xalign and :yalign$(RPAREN).
   * Params:
   *   mode = a #GtkSourceGutterRendererAlignmentMode
   */
  void setAlignmentMode(gtksource.types.GutterRendererAlignmentMode mode)
  {
    gtk_source_gutter_renderer_set_alignment_mode(cast(GtkSourceGutterRenderer*)cPtr, mode);
  }

  /**
   * Set the background color of the renderer. If color is set to %NULL, the
   * renderer will not have a background color.
   * Params:
   *   color = a #GdkRGBA or %NULL
   */
  void setBackground(gdk.rgba.RGBA color)
  {
    gtk_source_gutter_renderer_set_background(cast(GtkSourceGutterRenderer*)cPtr, color ? cast(const(GdkRGBA)*)color.cPtr(No.Dup) : null);
  }

  /**
   * Set the padding of the gutter renderer. Both xpad and ypad can be
   * -1, which means the values will not be changed $(LPAREN)this allows changing only
   * one of the values$(RPAREN).
   * xpad is the left and right padding. ypad is the top and bottom padding.
   * Params:
   *   xpad = the x-padding
   *   ypad = the y-padding
   */
  void setPadding(int xpad, int ypad)
  {
    gtk_source_gutter_renderer_set_padding(cast(GtkSourceGutterRenderer*)cPtr, xpad, ypad);
  }

  /**
   * Sets the size of the renderer. A value of -1 specifies that the size
   * is to be determined dynamically.
   * Params:
   *   size = the size
   */
  void setSize(int size)
  {
    gtk_source_gutter_renderer_set_size(cast(GtkSourceGutterRenderer*)cPtr, size);
  }

  /**
   * Set whether the gutter renderer is visible.
   * Params:
   *   visible = the visibility
   */
  void setVisible(bool visible)
  {
    gtk_source_gutter_renderer_set_visible(cast(GtkSourceGutterRenderer*)cPtr, visible);
  }

  /**
   * The ::activate signal is emitted when the renderer is
   * activated.
   * Params
   *   iter = a #GtkTextIter
   *   area = a #GdkRectangle
   *   event = the event that caused the activation
   *   gutterRenderer = the instance the signal is connected to
   */
  alias ActivateCallbackDlg = void delegate(gtk.text_iter.TextIter iter, gdk.rectangle.Rectangle area, gdk.event.Event event, gtksource.gutter_renderer.GutterRenderer gutterRenderer);
  alias ActivateCallbackFunc = void function(gtk.text_iter.TextIter iter, gdk.rectangle.Rectangle area, gdk.event.Event event, gtksource.gutter_renderer.GutterRenderer gutterRenderer);

  /**
   * Connect to Activate signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ActivateCallbackDlg) || is(T : ActivateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gutterRenderer = getVal!(gtksource.gutter_renderer.GutterRenderer)(_paramVals);
      auto iter = getVal!(gtk.text_iter.TextIter)(&_paramVals[1]);
      auto area = getVal!(gdk.rectangle.Rectangle)(&_paramVals[2]);
      auto event = getVal!(gdk.event.Event)(&_paramVals[3]);
      _dClosure.dlg(iter, area, event, gutterRenderer);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }

  /**
   * The ::query-activatable signal is emitted when the renderer
   * can possibly be activated.
   * Params
   *   iter = a #GtkTextIter
   *   area = a #GdkRectangle
   *   event = the #GdkEvent that is causing the activatable query
   *   gutterRenderer = the instance the signal is connected to
   * Returns:
   */
  alias QueryActivatableCallbackDlg = bool delegate(gtk.text_iter.TextIter iter, gdk.rectangle.Rectangle area, gdk.event.Event event, gtksource.gutter_renderer.GutterRenderer gutterRenderer);
  alias QueryActivatableCallbackFunc = bool function(gtk.text_iter.TextIter iter, gdk.rectangle.Rectangle area, gdk.event.Event event, gtksource.gutter_renderer.GutterRenderer gutterRenderer);

  /**
   * Connect to QueryActivatable signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectQueryActivatable(T)(T callback, Flag!"After" after = No.After)
  if (is(T : QueryActivatableCallbackDlg) || is(T : QueryActivatableCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto gutterRenderer = getVal!(gtksource.gutter_renderer.GutterRenderer)(_paramVals);
      auto iter = getVal!(gtk.text_iter.TextIter)(&_paramVals[1]);
      auto area = getVal!(gdk.rectangle.Rectangle)(&_paramVals[2]);
      auto event = getVal!(gdk.event.Event)(&_paramVals[3]);
      _retval = _dClosure.dlg(iter, area, event, gutterRenderer);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("query-activatable", closure, after);
  }

  /**
   * The ::query-data signal is emitted when the renderer needs
   * to be filled with data just before a cell is drawn. This can
   * be used by general renderer implementations to allow render
   * data to be filled in externally.
   * Params
   *   start = a #GtkTextIter
   *   end = a #GtkTextIter
   *   state = the renderer state
   *   gutterRenderer = the instance the signal is connected to
   */
  alias QueryDataCallbackDlg = void delegate(gtk.text_iter.TextIter start, gtk.text_iter.TextIter end, gtksource.types.GutterRendererState state, gtksource.gutter_renderer.GutterRenderer gutterRenderer);
  alias QueryDataCallbackFunc = void function(gtk.text_iter.TextIter start, gtk.text_iter.TextIter end, gtksource.types.GutterRendererState state, gtksource.gutter_renderer.GutterRenderer gutterRenderer);

  /**
   * Connect to QueryData signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectQueryData(T)(T callback, Flag!"After" after = No.After)
  if (is(T : QueryDataCallbackDlg) || is(T : QueryDataCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gutterRenderer = getVal!(gtksource.gutter_renderer.GutterRenderer)(_paramVals);
      auto start = getVal!(gtk.text_iter.TextIter)(&_paramVals[1]);
      auto end = getVal!(gtk.text_iter.TextIter)(&_paramVals[2]);
      auto state = getVal!(gtksource.types.GutterRendererState)(&_paramVals[3]);
      _dClosure.dlg(start, end, state, gutterRenderer);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("query-data", closure, after);
  }

  /**
   * The ::query-tooltip signal is emitted when the renderer can
   * show a tooltip.
   * Params
   *   iter = a #GtkTextIter
   *   area = a #GdkRectangle
   *   x = the x position $(LPAREN)in window coordinates$(RPAREN)
   *   y = the y position $(LPAREN)in window coordinates$(RPAREN)
   *   tooltip = a #GtkTooltip
   *   gutterRenderer = the instance the signal is connected to
   * Returns:
   */
  alias QueryTooltipCallbackDlg = bool delegate(gtk.text_iter.TextIter iter, gdk.rectangle.Rectangle area, int x, int y, gtk.tooltip.Tooltip tooltip, gtksource.gutter_renderer.GutterRenderer gutterRenderer);
  alias QueryTooltipCallbackFunc = bool function(gtk.text_iter.TextIter iter, gdk.rectangle.Rectangle area, int x, int y, gtk.tooltip.Tooltip tooltip, gtksource.gutter_renderer.GutterRenderer gutterRenderer);

  /**
   * Connect to QueryTooltip signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectQueryTooltip(T)(T callback, Flag!"After" after = No.After)
  if (is(T : QueryTooltipCallbackDlg) || is(T : QueryTooltipCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 6, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto gutterRenderer = getVal!(gtksource.gutter_renderer.GutterRenderer)(_paramVals);
      auto iter = getVal!(gtk.text_iter.TextIter)(&_paramVals[1]);
      auto area = getVal!(gdk.rectangle.Rectangle)(&_paramVals[2]);
      auto x = getVal!(int)(&_paramVals[3]);
      auto y = getVal!(int)(&_paramVals[4]);
      auto tooltip = getVal!(gtk.tooltip.Tooltip)(&_paramVals[5]);
      _retval = _dClosure.dlg(iter, area, x, y, tooltip, gutterRenderer);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("query-tooltip", closure, after);
  }

  /**
   * The ::queue-draw signal is emitted when the renderer needs
   * to be redrawn. Use [gtksource.gutter_renderer.GutterRenderer.queueDraw]
   * to emit this signal from an implementation of the
   * #GtkSourceGutterRenderer interface.
   *   gutterRenderer = the instance the signal is connected to
   */
  alias QueueDrawCallbackDlg = void delegate(gtksource.gutter_renderer.GutterRenderer gutterRenderer);
  alias QueueDrawCallbackFunc = void function(gtksource.gutter_renderer.GutterRenderer gutterRenderer);

  /**
   * Connect to QueueDraw signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectQueueDraw(T)(T callback, Flag!"After" after = No.After)
  if (is(T : QueueDrawCallbackDlg) || is(T : QueueDrawCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gutterRenderer = getVal!(gtksource.gutter_renderer.GutterRenderer)(_paramVals);
      _dClosure.dlg(gutterRenderer);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("queue-draw", closure, after);
  }
}
