module gtk.native_mixin;

public import gtk.native_iface_proxy;
public import gdk.surface;
public import gid.global;
public import gobject.object;
public import gsk.renderer;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

/**
 * `GtkNative` is the interface implemented by all widgets that have
 * their own `GdkSurface`.
 * The obvious example of a `GtkNative` is `GtkWindow`.
 * Every widget that is not itself a `GtkNative` is contained in one,
 * and you can get it with [gtk.widget.Widget.getNative].
 * To get the surface of a `GtkNative`, use [gtk.native.Native.getSurface].
 * It is also possible to find the `GtkNative` to which a surface
 * belongs, with [gtk.native.Native.getForSurface].
 * In addition to a [gdk.surface.Surface], a `GtkNative` also provides
 * a [gsk.renderer.Renderer] for rendering on that surface. To get the
 * renderer, use [gtk.native.Native.getRenderer].
 */
template NativeT()
{


  /**
   * Returns the renderer that is used for this `GtkNative`.
   * Returns: the renderer for self
   */
  override Renderer getRenderer()
  {
    GskRenderer* _cretval;
    _cretval = gtk_native_get_renderer(cast(GtkNative*)cPtr);
    auto _retval = ObjectG.getDObject!Renderer(cast(GskRenderer*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns the surface of this `GtkNative`.
   * Returns: the surface of self
   */
  override Surface getSurface()
  {
    GdkSurface* _cretval;
    _cretval = gtk_native_get_surface(cast(GtkNative*)cPtr);
    auto _retval = ObjectG.getDObject!Surface(cast(GdkSurface*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Retrieves the surface transform of self.
   * This is the translation from self's surface coordinates into
   * self's widget coordinates.
   * Params:
   *   x = return location for the x coordinate
   *   y = return location for the y coordinate
   */
  override void getSurfaceTransform(out double x, out double y)
  {
    gtk_native_get_surface_transform(cast(GtkNative*)cPtr, cast(double*)&x, cast(double*)&y);
  }

  /**
   * Realizes a `GtkNative`.
   * This should only be used by subclasses.
   */
  override void realize()
  {
    gtk_native_realize(cast(GtkNative*)cPtr);
  }

  /**
   * Unrealizes a `GtkNative`.
   * This should only be used by subclasses.
   */
  override void unrealize()
  {
    gtk_native_unrealize(cast(GtkNative*)cPtr);
  }
}
