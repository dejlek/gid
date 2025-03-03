module gtk.drawing_area;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
 * The #GtkDrawingArea widget is used for creating custom user interface
 * elements. It’s essentially a blank widget; you can draw on it. After
 * creating a drawing area, the application may want to connect to:
 * - Mouse and button press signals to respond to input from
 * the user. $(LPAREN)Use [gtk.widget.Widget.addEvents] to enable events
 * you wish to receive.$(RPAREN)
 * - The #GtkWidget::realize signal to take any necessary actions
 * when the widget is instantiated on a particular display.
 * $(LPAREN)Create GDK resources in response to this signal.$(RPAREN)
 * - The #GtkWidget::size-allocate signal to take any necessary
 * actions when the widget changes size.
 * - The #GtkWidget::draw signal to handle redrawing the
 * contents of the widget.
 * The following code portion demonstrates using a drawing
 * area to display a circle in the normal widget foreground
 * color.
 * Note that GDK automatically clears the exposed area before sending
 * the expose event, and that drawing is implicitly clipped to the exposed
 * area. If you want to have a theme-provided background, you need
 * to call [gtk.global.renderBackground] in your ::draw method.
 * ## Simple GtkDrawingArea usage
 * |[<!-- language\="C" -->
 * gboolean
 * draw_callback $(LPAREN)GtkWidget *widget, cairo_t *cr, gpointer data$(RPAREN)
 * {
 * guint width, height;
 * GdkRGBA color;
 * GtkStyleContext *context;
 * context \= gtk_widget_get_style_context $(LPAREN)widget$(RPAREN);
 * width \= gtk_widget_get_allocated_width $(LPAREN)widget$(RPAREN);
 * height \= gtk_widget_get_allocated_height $(LPAREN)widget$(RPAREN);
 * gtk_render_background $(LPAREN)context, cr, 0, 0, width, height$(RPAREN);
 * cairo_arc $(LPAREN)cr,
 * width / 2.0, height / 2.0,
 * MIN $(LPAREN)width, height$(RPAREN) / 2.0,
 * 0, 2 * G_PI$(RPAREN);
 * gtk_style_context_get_color $(LPAREN)context,
 * gtk_style_context_get_state $(LPAREN)context$(RPAREN),
 * &color$(RPAREN);
 * gdk_cairo_set_source_rgba $(LPAREN)cr, &color$(RPAREN);
 * cairo_fill $(LPAREN)cr$(RPAREN);
 * return FALSE;
 * }
 * [...]
 * GtkWidget *drawing_area \= gtk_drawing_area_new $(LPAREN)$(RPAREN);
 * gtk_widget_set_size_request $(LPAREN)drawing_area, 100, 100$(RPAREN);
 * g_signal_connect $(LPAREN)G_OBJECT $(LPAREN)drawing_area$(RPAREN), "draw",
 * G_CALLBACK $(LPAREN)draw_callback$(RPAREN), NULL$(RPAREN);
 * ]|
 * Draw signals are normally delivered when a drawing area first comes
 * onscreen, or when it’s covered by another window and then uncovered.
 * You can also force an expose event by adding to the “damage region”
 * of the drawing area’s window; [gtk.widget.Widget.queueDrawArea] and
 * [gdk.window.Window.invalidateRect] are equally good ways to do this.
 * You’ll then get a draw signal for the invalid region.
 * The available routines for drawing are documented on the
 * [GDK Drawing Primitives][gdk3-Cairo-Interaction] page
 * and the cairo documentation.
 * To receive mouse events on a drawing area, you will need to enable
 * them with [gtk.widget.Widget.addEvents]. To receive keyboard events, you
 * will need to set the “can-focus” property on the drawing area, and you
 * should probably draw some user-visible indication that the drawing
 * area is focused. Use [gtk.widget.Widget.hasFocus] in your expose event
 * handler to decide whether to draw the focus indicator. See
 * [gtk.global.renderFocus] for one way to draw focus.
 */
class DrawingArea : gtk.widget.Widget
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
   * Returns: a new #GtkDrawingArea
   */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_drawing_area_new();
    this(_cretval, No.Take);
  }
}
