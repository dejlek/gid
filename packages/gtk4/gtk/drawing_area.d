module gtk.drawing_area;

import cairo.context;
import gid.global;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
 * `GtkDrawingArea` is a widget that allows drawing with cairo.
 * ![An example GtkDrawingArea](drawingarea.png)
 * It’s essentially a blank widget; you can draw on it. After
 * creating a drawing area, the application may want to connect to:
 * - The [gtk.widget.Widget.realize] signal to take any necessary actions
 * when the widget is instantiated on a particular display.
 * $(LPAREN)Create GDK resources in response to this signal.$(RPAREN)
 * - The [gtk.drawing_area.DrawingArea.resize] signal to take any necessary
 * actions when the widget changes size.
 * - Call [gtk.drawing_area.DrawingArea.setDrawFunc] to handle redrawing the
 * contents of the widget.
 * The following code portion demonstrates using a drawing
 * area to display a circle in the normal widget foreground
 * color.
 * ## Simple GtkDrawingArea usage
 * ```c
 * static void
 * draw_function $(LPAREN)GtkDrawingArea *area,
 * cairo_t        *cr,
 * int             width,
 * int             height,
 * gpointer        data$(RPAREN)
 * {
 * GdkRGBA color;
 * cairo_arc $(LPAREN)cr,
 * width / 2.0, height / 2.0,
 * MIN $(LPAREN)width, height$(RPAREN) / 2.0,
 * 0, 2 * G_PI$(RPAREN);
 * gtk_widget_get_color $(LPAREN)GTK_WIDGET $(LPAREN)area$(RPAREN),
 * &color$(RPAREN);
 * gdk_cairo_set_source_rgba $(LPAREN)cr, &color$(RPAREN);
 * cairo_fill $(LPAREN)cr$(RPAREN);
 * }
 * int
 * main $(LPAREN)int argc, char **argv$(RPAREN)
 * {
 * gtk_init $(LPAREN)$(RPAREN);
 * GtkWidget *area \= gtk_drawing_area_new $(LPAREN)$(RPAREN);
 * gtk_drawing_area_set_content_width $(LPAREN)GTK_DRAWING_AREA $(LPAREN)area$(RPAREN), 100$(RPAREN);
 * gtk_drawing_area_set_content_height $(LPAREN)GTK_DRAWING_AREA $(LPAREN)area$(RPAREN), 100$(RPAREN);
 * gtk_drawing_area_set_draw_func $(LPAREN)GTK_DRAWING_AREA $(LPAREN)area$(RPAREN),
 * draw_function,
 * NULL, NULL$(RPAREN);
 * return 0;
 * }
 * ```
 * The draw function is normally called when a drawing area first comes
 * onscreen, or when it’s covered by another window and then uncovered.
 * You can also force a redraw by adding to the “damage region” of the
 * drawing area’s window using [gtk.widget.Widget.queueDraw].
 * This will cause the drawing area to call the draw function again.
 * The available routines for drawing are documented in the
 * [Cairo documentation](https://www.cairographics.org/manual/); GDK
 * offers additional API to integrate with Cairo, like func@Gdk.cairo_set_source_rgba
 * or func@Gdk.cairo_set_source_pixbuf.
 * To receive mouse events on a drawing area, you will need to use
 * event controllers. To receive keyboard events, you will need to set
 * the “can-focus” property on the drawing area, and you should probably
 * draw some user-visible indication that the drawing area is focused.
 * If you need more complex control over your widget, you should consider
 * creating your own `GtkWidget` subclass.
 */
class DrawingArea : Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_drawing_area_get_type != &gidSymbolNotFound ? gtk_drawing_area_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new drawing area.
   * Returns: a new `GtkDrawingArea`
   */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_drawing_area_new();
    this(_cretval, No.Take);
  }

  /**
   * Retrieves the content height of the `GtkDrawingArea`.
   * Returns: The height requested for content of the drawing area
   */
  int getContentHeight()
  {
    int _retval;
    _retval = gtk_drawing_area_get_content_height(cast(GtkDrawingArea*)cPtr);
    return _retval;
  }

  /**
   * Retrieves the content width of the `GtkDrawingArea`.
   * Returns: The width requested for content of the drawing area
   */
  int getContentWidth()
  {
    int _retval;
    _retval = gtk_drawing_area_get_content_width(cast(GtkDrawingArea*)cPtr);
    return _retval;
  }

  /**
   * Sets the desired height of the contents of the drawing area.
   * Note that because widgets may be allocated larger sizes than they
   * requested, it is possible that the actual height passed to your draw
   * function is larger than the height set here. You can use
   * [gtk.widget.Widget.setValign] to avoid that.
   * If the height is set to 0 $(LPAREN)the default$(RPAREN), the drawing area may disappear.
   * Params:
   *   height = the height of contents
   */
  void setContentHeight(int height)
  {
    gtk_drawing_area_set_content_height(cast(GtkDrawingArea*)cPtr, height);
  }

  /**
   * Sets the desired width of the contents of the drawing area.
   * Note that because widgets may be allocated larger sizes than they
   * requested, it is possible that the actual width passed to your draw
   * function is larger than the width set here. You can use
   * [gtk.widget.Widget.setHalign] to avoid that.
   * If the width is set to 0 $(LPAREN)the default$(RPAREN), the drawing area may disappear.
   * Params:
   *   width = the width of contents
   */
  void setContentWidth(int width)
  {
    gtk_drawing_area_set_content_width(cast(GtkDrawingArea*)cPtr, width);
  }

  /**
   * Setting a draw function is the main thing you want to do when using
   * a drawing area.
   * The draw function is called whenever GTK needs to draw the contents
   * of the drawing area to the screen.
   * The draw function will be called during the drawing stage of GTK.
   * In the drawing stage it is not allowed to change properties of any
   * GTK widgets or call any functions that would cause any properties
   * to be changed. You should restrict yourself exclusively to drawing
   * your contents in the draw function.
   * If what you are drawing does change, call [gtk.widget.Widget.queueDraw]
   * on the drawing area. This will cause a redraw and will call draw_func again.
   * Params:
   *   drawFunc = callback that lets you draw
   *     the drawing area's contents
   */
  void setDrawFunc(DrawingAreaDrawFunc drawFunc)
  {
    extern(C) void _drawFuncCallback(GtkDrawingArea* drawingArea, cairo_t* cr, int width, int height, void* userData)
    {
      auto _dlg = cast(DrawingAreaDrawFunc*)userData;

      (*_dlg)(ObjectG.getDObject!DrawingArea(cast(void*)drawingArea, No.Take), cr ? new Context(cast(void*)cr, No.Take) : null, width, height);
    }
    auto _drawFuncCB = drawFunc ? &_drawFuncCallback : null;

    auto _drawFunc = drawFunc ? freezeDelegate(cast(void*)&drawFunc) : null;
    GDestroyNotify _drawFuncDestroyCB = drawFunc ? &thawDelegate : null;
    gtk_drawing_area_set_draw_func(cast(GtkDrawingArea*)cPtr, _drawFuncCB, _drawFunc, _drawFuncDestroyCB);
  }

  /**
   * Emitted once when the widget is realized, and then each time the widget
   * is changed while realized.
   * This is useful in order to keep state up to date with the widget size,
   * like for instance a backing surface.
   * Params
   *   width = the width of the viewport
   *   height = the height of the viewport
   *   drawingArea = the instance the signal is connected to
   */
  alias ResizeCallbackDlg = void delegate(int width, int height, DrawingArea drawingArea);
  alias ResizeCallbackFunc = void function(int width, int height, DrawingArea drawingArea);

  /**
   * Connect to Resize signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectResize(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ResizeCallbackDlg) || is(T : ResizeCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto drawingArea = getVal!DrawingArea(_paramVals);
      auto width = getVal!int(&_paramVals[1]);
      auto height = getVal!int(&_paramVals[2]);
      _dClosure.dlg(width, height, drawingArea);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("resize", closure, after);
  }
}
