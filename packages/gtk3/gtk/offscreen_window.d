module gtk.offscreen_window;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import cairo.surface;
import gdkpixbuf.pixbuf;
import gid.gid;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.window;

/**
    GtkOffscreenWindow is strictly intended to be used for obtaining
  snapshots of widgets that are not part of a normal widget hierarchy.
  Since #GtkOffscreenWindow is a toplevel widget you cannot obtain
  snapshots of a full window with it since you cannot pack a toplevel
  widget in another toplevel.
  
  The idea is to take a widget and manually set the state of it,
  add it to a GtkOffscreenWindow and then retrieve the snapshot
  as a #cairo_surface_t or #GdkPixbuf.
  
  GtkOffscreenWindow derives from #GtkWindow only as an implementation
  detail.  Applications should not use any API specific to #GtkWindow
  to operate on this object.  It should be treated as a #GtkBin that
  has no parent widget.
  
  When contained offscreen widgets are redrawn, GtkOffscreenWindow
  will emit a #GtkWidget::damage-event signal.
*/
class OffscreenWindow : gtk.window.Window
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_offscreen_window_get_type != &gidSymbolNotFound ? gtk_offscreen_window_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
      Creates a toplevel container widget that is used to retrieve
    snapshots of widgets without showing them on the screen.
    Returns:     A pointer to a #GtkWidget
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_offscreen_window_new();
    this(_cretval, No.Take);
  }

  /**
      Retrieves a snapshot of the contained widget in the form of
    a #GdkPixbuf.  This is a new pixbuf with a reference count of 1,
    and the application should unreference it once it is no longer
    needed.
    Returns:     A #GdkPixbuf pointer, or null.
  */
  gdkpixbuf.pixbuf.Pixbuf getPixbuf()
  {
    PixbufC* _cretval;
    _cretval = gtk_offscreen_window_get_pixbuf(cast(GtkOffscreenWindow*)cPtr);
    auto _retval = ObjectG.getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(PixbufC*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Retrieves a snapshot of the contained widget in the form of
    a #cairo_surface_t.  If you need to keep this around over window
    resizes then you should add a reference to it.
    Returns:     A #cairo_surface_t pointer to the offscreen
          surface, or null.
  */
  cairo.surface.Surface getSurface()
  {
    cairo_surface_t* _cretval;
    _cretval = gtk_offscreen_window_get_surface(cast(GtkOffscreenWindow*)cPtr);
    auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
