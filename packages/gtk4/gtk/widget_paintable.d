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
    [gtk.widget_paintable.WidgetPaintable] is a [gdk.paintable.Paintable] that displays the contents
  of a widget.
  
  [gtk.widget_paintable.WidgetPaintable] will also take care of the widget not being in a
  state where it can be drawn (like when it isn't shown) and just draw
  nothing or where it does not have a size (like when it is hidden) and
  report no size in that case.
  
  Of course, [gtk.widget_paintable.WidgetPaintable] allows you to monitor widgets for size
  changes by emitting the `signal@Gdk.Paintable::invalidate-size` signal
  whenever the size of the widget changes as well as for visual changes by
  emitting the `signal@Gdk.Paintable::invalidate-contents` signal whenever
  the widget changes.
  
  You can use a [gtk.widget_paintable.WidgetPaintable] everywhere a [gdk.paintable.Paintable] is allowed,
  including using it on a [gtk.picture.Picture] (or one of its parents) that it was
  set on itself via [gtk.picture.Picture.setPaintable]. The paintable will take care
  of recursion when this happens. If you do this however, ensure that the
  `property@Gtk.Picture:can-shrink` property is set to true or you might
  end up with an infinitely growing widget.
*/
class WidgetPaintable : gobject.object.ObjectG, gdk.paintable.Paintable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_widget_paintable_get_type != &gidSymbolNotFound ? gtk_widget_paintable_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override WidgetPaintable self()
  {
    return this;
  }

  mixin PaintableT!();

  /**
      Creates a new widget paintable observing the given widget.
    Params:
      widget =       a [gtk.widget.Widget]
    Returns:     a new [gtk.widget_paintable.WidgetPaintable]
  */
  this(gtk.widget.Widget widget = null)
  {
    GdkPaintable* _cretval;
    _cretval = gtk_widget_paintable_new(widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Returns the widget that is observed or null if none.
    Returns:     the observed widget.
  */
  gtk.widget.Widget getWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_widget_paintable_get_widget(cast(GtkWidgetPaintable*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the widget that should be observed.
    Params:
      widget =       the widget to observe
  */
  void setWidget(gtk.widget.Widget widget = null)
  {
    gtk_widget_paintable_set_widget(cast(GtkWidgetPaintable*)cPtr, widget ? cast(GtkWidget*)widget.cPtr(No.Dup) : null);
  }
}
