module gtksource.gutter_renderer;

import gdk.rectangle;
import gdk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.text_iter;
import gtk.widget;
import gtksource.buffer;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;
import gtksource.view;

/**
    Gutter cell renderer.
  
  A [gtksource.gutter_renderer.GutterRenderer] represents a column in a `class@Gutter`. The
  column contains one cell for each visible line of the [gtk.text_buffer.TextBuffer]. Due to
  text wrapping, a cell can thus span multiple lines of the [gtk.text_view.TextView]. In
  this case, `enum@GutterRendererAlignmentMode` controls the alignment of
  the cell.
  
  The gutter renderer is a [gtk.widget.Widget] and is measured using the normal widget
  measurement facilities. The width of the gutter will be determined by the
  measurements of the gutter renderers.
  
  The width of a gutter renderer generally takes into account the entire text
  buffer. For instance, to display the line numbers, if the buffer contains 100
  lines, the gutter renderer will always set its width such as three digits can
  be printed, even if only the first 20 lines are shown. Another strategy is to
  take into account only the visible lines.  In this case, only two digits are
  necessary to display the line numbers of the first 20 lines. To take another
  example, the gutter renderer for `class@Mark`s doesn't need to take
  into account the text buffer to announce its width. It only depends on the
  icons size displayed in the gutter column.
  
  When the available size to render a cell is greater than the required size to
  render the cell contents, the cell contents can be aligned horizontally and
  vertically with [gtksource.gutter_renderer.GutterRenderer.setAlignmentMode].
  
  The cells rendering occurs using `vfunc@Gtk.Widget.snapshot`. Implementations
  should use `gtk_source_gutter_renderer_get_lines()` to retrieve information
  about the lines to be rendered. To help with aligning content which takes
  into account the padding and alignment of a cell, implementations may call
  [gtksource.gutter_renderer.GutterRenderer.alignCell] for a given line number with the
  width and height measurement of the content they width to render.
*/
class GutterRenderer : gtk.widget.Widget
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_gutter_renderer_get_type != &gidSymbolNotFound ? gtk_source_gutter_renderer_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  alias activate = gtk.widget.Widget.activate;

  /**
      Emits the `signalGutterRenderer::activate` signal of the renderer. This is
    called from `classGutter` and should never have to be called manually.
    Params:
      iter =       a #GtkTextIter at the start of the line where the renderer is activated
      area =       a #GdkRectangle of the cell area where the renderer is activated
      button =       the button that was pressed
      state =       a #GdkModifierType
      nPresses =       the number of button presses
  */
  void activate(gtk.text_iter.TextIter iter, gdk.rectangle.Rectangle area, uint button, gdk.types.ModifierType state, int nPresses)
  {
    gtk_source_gutter_renderer_activate(cast(GtkSourceGutterRenderer*)cPtr, iter ? cast(const(GtkTextIter)*)iter.cPtr(No.dup) : null, area ? cast(const(GdkRectangle)*)area.cPtr(No.dup) : null, button, state, nPresses);
  }

  /**
      Locates where to render content that is width x height based on
    the renderers alignment and padding.
    
    The location will be placed into x and y and is relative to the
    renderer's coordinates.
    
    It is encouraged that renderers use this function when snappshotting
    to ensure consistent placement of their contents.
    Params:
      line =       the line number for content
      width =       the width of the content to draw
      height =       the height of the content to draw
      x =       the X position to render the content
      y =       the Y position to render the content
  */
  void alignCell(uint line, float width, float height, out float x, out float y)
  {
    gtk_source_gutter_renderer_align_cell(cast(GtkSourceGutterRenderer*)cPtr, line, width, height, cast(float*)&x, cast(float*)&y);
  }

  /**
      Get the alignment mode.
    
    The alignment mode describes the manner in which the
    renderer is aligned (see `propertyGutterRenderer:xalign` and
    `propertyGutterRenderer:yalign`).
    Returns:     a #GtkSourceGutterRendererAlignmentMode
  */
  gtksource.types.GutterRendererAlignmentMode getAlignmentMode()
  {
    GtkSourceGutterRendererAlignmentMode _cretval;
    _cretval = gtk_source_gutter_renderer_get_alignment_mode(cast(GtkSourceGutterRenderer*)cPtr);
    gtksource.types.GutterRendererAlignmentMode _retval = cast(gtksource.types.GutterRendererAlignmentMode)_cretval;
    return _retval;
  }

  /**
      Gets the `classBuffer` for which the gutter renderer is drawing.
    Returns:     a #GtkTextBuffer or null
  */
  gtksource.buffer.Buffer getBuffer()
  {
    GtkSourceBuffer* _cretval;
    _cretval = gtk_source_gutter_renderer_get_buffer(cast(GtkSourceGutterRenderer*)cPtr);
    auto _retval = ObjectG.getDObject!(gtksource.buffer.Buffer)(cast(GtkSourceBuffer*)_cretval, No.take);
    return _retval;
  }

  /**
      Get the view associated to the gutter renderer
    Returns:     a #GtkSourceView
  */
  gtksource.view.View getView()
  {
    GtkSourceView* _cretval;
    _cretval = gtk_source_gutter_renderer_get_view(cast(GtkSourceGutterRenderer*)cPtr);
    auto _retval = ObjectG.getDObject!(gtksource.view.View)(cast(GtkSourceView*)_cretval, No.take);
    return _retval;
  }

  /**
      Gets the `xalign` property.
    
    This may be used to adjust where within the cell rectangle the renderer will draw.
    Returns: 
  */
  float getXalign()
  {
    float _retval;
    _retval = gtk_source_gutter_renderer_get_xalign(cast(GtkSourceGutterRenderer*)cPtr);
    return _retval;
  }

  /**
      Gets the `xpad` property.
    
    This may be used to adjust the cell rectangle that the renderer will use to draw.
    Returns: 
  */
  int getXpad()
  {
    int _retval;
    _retval = gtk_source_gutter_renderer_get_xpad(cast(GtkSourceGutterRenderer*)cPtr);
    return _retval;
  }

  /**
      Gets the `yalign` property.
    
    This may be used to adjust where within the cell rectangle the renderer will draw.
    Returns: 
  */
  float getYalign()
  {
    float _retval;
    _retval = gtk_source_gutter_renderer_get_yalign(cast(GtkSourceGutterRenderer*)cPtr);
    return _retval;
  }

  /**
      Gets the `ypad` property.
    
    This may be used to adjust the cell rectangle that the renderer will use to draw.
    Returns: 
  */
  int getYpad()
  {
    int _retval;
    _retval = gtk_source_gutter_renderer_get_ypad(cast(GtkSourceGutterRenderer*)cPtr);
    return _retval;
  }

  /**
      Get whether the renderer is activatable at the location provided. This is
    called from `classGutter` to determine whether a renderer is activatable
    using the mouse pointer.
    Params:
      iter =       a #GtkTextIter at the start of the line to be activated
      area =       a #GdkRectangle of the cell area to be activated
    Returns:     true if the renderer can be activated, false otherwise
  */
  bool queryActivatable(gtk.text_iter.TextIter iter, gdk.rectangle.Rectangle area)
  {
    bool _retval;
    _retval = gtk_source_gutter_renderer_query_activatable(cast(GtkSourceGutterRenderer*)cPtr, iter ? cast(const(GtkTextIter)*)iter.cPtr(No.dup) : null, area ? cast(const(GdkRectangle)*)area.cPtr(No.dup) : null);
    return _retval;
  }

  /**
      Set the alignment mode. The alignment mode describes the manner in which the
    renderer is aligned (see `propertyGutterRenderer:xalign` and
    `propertyGutterRenderer:yalign`).
    Params:
      mode =       a #GtkSourceGutterRendererAlignmentMode
  */
  void setAlignmentMode(gtksource.types.GutterRendererAlignmentMode mode)
  {
    gtk_source_gutter_renderer_set_alignment_mode(cast(GtkSourceGutterRenderer*)cPtr, mode);
  }

  /**
      Adjusts the `xalign` property.
    
    This may be used to adjust where within the cell rectangle the renderer will draw.
    Params:
      xalign =       the Y padding for the drawing cell
  */
  void setXalign(float xalign)
  {
    gtk_source_gutter_renderer_set_xalign(cast(GtkSourceGutterRenderer*)cPtr, xalign);
  }

  /**
      Adjusts the `xpad` property.
    
    This may be used to adjust the cell rectangle that the renderer will use to draw.
    Params:
      xpad =       the Y padding for the drawing cell
  */
  void setXpad(int xpad)
  {
    gtk_source_gutter_renderer_set_xpad(cast(GtkSourceGutterRenderer*)cPtr, xpad);
  }

  /**
      Adjusts the `yalign` property.
    
    This may be used to adjust where within the cell rectangle the renderer will draw.
    Params:
      yalign =       the Y padding for the drawing cell
  */
  void setYalign(float yalign)
  {
    gtk_source_gutter_renderer_set_yalign(cast(GtkSourceGutterRenderer*)cPtr, yalign);
  }

  /**
      Adjusts the `ypad` property.
    
    This may be used to adjust the cell rectangle that the renderer will use to draw.
    Params:
      ypad =       the Y padding for the drawing cell
  */
  void setYpad(int ypad)
  {
    gtk_source_gutter_renderer_set_ypad(cast(GtkSourceGutterRenderer*)cPtr, ypad);
  }

  /**
      The signal is emitted when the renderer is activated.
  
    ## Parameters
    $(LIST
      * $(B iter)       a #GtkTextIter
      * $(B area)       a #GdkRectangle
      * $(B button)       the button that was pressed
      * $(B state)       a #GdkModifierType of state
      * $(B nPresses)       the number of button presses
      * $(B gutterRenderer) the instance the signal is connected to
    )
  */
  alias ActivateCallbackDlg = void delegate(gtk.text_iter.TextIter iter, gdk.rectangle.Rectangle area, uint button, gdk.types.ModifierType state, int nPresses, gtksource.gutter_renderer.GutterRenderer gutterRenderer);

  /** ditto */
  alias ActivateCallbackFunc = void function(gtk.text_iter.TextIter iter, gdk.rectangle.Rectangle area, uint button, gdk.types.ModifierType state, int nPresses, gtksource.gutter_renderer.GutterRenderer gutterRenderer);

  /**
    Connect to Activate signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ActivateCallbackDlg) || is(T : ActivateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 6, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gutterRenderer = getVal!(gtksource.gutter_renderer.GutterRenderer)(_paramVals);
      auto iter = getVal!(gtk.text_iter.TextIter)(&_paramVals[1]);
      auto area = getVal!(gdk.rectangle.Rectangle)(&_paramVals[2]);
      auto button = getVal!(uint)(&_paramVals[3]);
      auto state = getVal!(gdk.types.ModifierType)(&_paramVals[4]);
      auto nPresses = getVal!(int)(&_paramVals[5]);
      _dClosure.dlg(iter, area, button, state, nPresses, gutterRenderer);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }

  /**
      The signal is emitted when the renderer can possibly be activated.
  
    ## Parameters
    $(LIST
      * $(B iter)       a #GtkTextIter
      * $(B area)       a #GdkRectangle
      * $(B gutterRenderer) the instance the signal is connected to
    )
    Returns: 
  */
  alias QueryActivatableCallbackDlg = bool delegate(gtk.text_iter.TextIter iter, gdk.rectangle.Rectangle area, gtksource.gutter_renderer.GutterRenderer gutterRenderer);

  /** ditto */
  alias QueryActivatableCallbackFunc = bool function(gtk.text_iter.TextIter iter, gdk.rectangle.Rectangle area, gtksource.gutter_renderer.GutterRenderer gutterRenderer);

  /**
    Connect to QueryActivatable signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectQueryActivatable(T)(T callback, Flag!"after" after = No.after)
  if (is(T : QueryActivatableCallbackDlg) || is(T : QueryActivatableCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto gutterRenderer = getVal!(gtksource.gutter_renderer.GutterRenderer)(_paramVals);
      auto iter = getVal!(gtk.text_iter.TextIter)(&_paramVals[1]);
      auto area = getVal!(gdk.rectangle.Rectangle)(&_paramVals[2]);
      _retval = _dClosure.dlg(iter, area, gutterRenderer);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("query-activatable", closure, after);
  }

  /** */
  alias QueryDataCallbackDlg = void delegate(gobject.object.ObjectG object, uint p0, gtksource.gutter_renderer.GutterRenderer gutterRenderer);

  /** ditto */
  alias QueryDataCallbackFunc = void function(gobject.object.ObjectG object, uint p0, gtksource.gutter_renderer.GutterRenderer gutterRenderer);

  /**
    Connect to QueryData signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectQueryData(T)(T callback, Flag!"after" after = No.after)
  if (is(T : QueryDataCallbackDlg) || is(T : QueryDataCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gutterRenderer = getVal!(gtksource.gutter_renderer.GutterRenderer)(_paramVals);
      auto object = getVal!(gobject.object.ObjectG)(&_paramVals[1]);
      auto p0 = getVal!(uint)(&_paramVals[2]);
      _dClosure.dlg(object, p0, gutterRenderer);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("query-data", closure, after);
  }
}
