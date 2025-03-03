module gtk.widget_paintable;

import gdk.paintable;
import gdk.paintable_mixin;
import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
 * `GtkWidgetPaintable` is a `GdkPaintable` that displays the contents
 * of a widget.
 * `GtkWidgetPaintable` will also take care of the widget not being in a
 * state where it can be drawn $(LPAREN)like when it isn't shown$(RPAREN) and just draw
 * nothing or where it does not have a size $(LPAREN)like when it is hidden$(RPAREN) and
 * report no size in that case.
 * Of course, `GtkWidgetPaintable` allows you to monitor widgets for size
 * changes by emitting the signal@Gdk.Paintable::invalidate-size signal
 * whenever the size of the widget changes as well as for visual changes by
 * emitting the signal@Gdk.Paintable::invalidate-contents signal whenever
 * the widget changes.
 * You can use a `GtkWidgetPaintable` everywhere a `GdkPaintable` is allowed,
 * including using it on a `GtkPicture` $(LPAREN)or one of its parents$(RPAREN) that it was
 * set on itself via [gtk.picture.Picture.setPaintable]. The paintable will take care
 * of recursion when this happens. If you do this however, ensure that the
 * property@Gtk.Picture:can-shrink property is set to %TRUE or you might
 * end up with an infinitely growing widget.
 */
class WidgetPaintable : gobject.object.ObjectG, gdk.paintable.Paintable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_widget_paintable_get_type != &gidSymbolNotFound ? gtk_widget_paintable_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin PaintableT!();

  /**
   * Creates a new widget paintable observing the given widget.
   * Params:
   *   widget = a `GtkWidget`
   * Returns: a new `GtkWidgetPaintable`
   */
  this(gtk.widget.Widget widget)
  {
    GdkPaintable* _cretval;
    _cretval = gtk_widget_paintable_new(widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Returns the widget that is observed or %NULL if none.
   * Returns: the observed widget.
   */
  gtk.widget.Widget getWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_widget_paintable_get_widget(cast(GtkWidgetPaintable*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Sets the widget that should be observed.
   * Params:
   *   widget = the widget to observe
   */
  void setWidget(gtk.widget.Widget widget)
  {
    gtk_widget_paintable_set_widget(cast(GtkWidgetPaintable*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null);
  }
}
