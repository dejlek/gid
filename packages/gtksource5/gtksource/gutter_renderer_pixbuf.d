module gtksource.gutter_renderer_pixbuf;

import gdk.paintable;
import gdk.paintable_mixin;
import gdkpixbuf.pixbuf;
import gid.global;
import gio.icon;
import gio.icon_mixin;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.gutter_renderer;
import gtksource.types;

/**
 * Renders a pixbuf in the gutter.
 * A `GtkSourceGutterRendererPixbuf` can be used to render an image in a cell of
 * class@Gutter.
 */
class GutterRendererPixbuf : GutterRenderer
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_gutter_renderer_pixbuf_get_type != &gidSymbolNotFound ? gtk_source_gutter_renderer_pixbuf_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Create a new #GtkSourceGutterRendererPixbuf.
   * Returns: A #GtkSourceGutterRenderer
   */
  this()
  {
    GtkSourceGutterRenderer* _cretval;
    _cretval = gtk_source_gutter_renderer_pixbuf_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Get the gicon of the renderer
   * Returns: a #GIcon
   */
  Icon getGicon()
  {
    GIcon* _cretval;
    _cretval = gtk_source_gutter_renderer_pixbuf_get_gicon(cast(GtkSourceGutterRendererPixbuf*)cPtr);
    auto _retval = ObjectG.getDObject!Icon(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  string getIconName()
  {
    const(char)* _cretval;
    _cretval = gtk_source_gutter_renderer_pixbuf_get_icon_name(cast(GtkSourceGutterRendererPixbuf*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Gets a [gdk.paintable.Paintable] that was set with
   * [gtksource.gutter_renderer_pixbuf.GutterRendererPixbuf.setPaintable]
   * Returns: a #GdkPaintable or %NULL
   */
  Paintable getPaintable()
  {
    GdkPaintable* _cretval;
    _cretval = gtk_source_gutter_renderer_pixbuf_get_paintable(cast(GtkSourceGutterRendererPixbuf*)cPtr);
    auto _retval = ObjectG.getDObject!Paintable(cast(GdkPaintable*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Get the pixbuf of the renderer.
   * Returns: a #GdkPixbuf
   */
  Pixbuf getPixbuf()
  {
    PixbufC* _cretval;
    _cretval = gtk_source_gutter_renderer_pixbuf_get_pixbuf(cast(GtkSourceGutterRendererPixbuf*)cPtr);
    auto _retval = ObjectG.getDObject!Pixbuf(cast(PixbufC*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Allows overlaying a paintable on top of any other image that
   * has been set for the pixbuf. This will be applied when the
   * widget is next snapshot.
   * Params:
   *   paintable = a #GdkPaintable
   */
  void overlayPaintable(Paintable paintable)
  {
    gtk_source_gutter_renderer_pixbuf_overlay_paintable(cast(GtkSourceGutterRendererPixbuf*)cPtr, paintable ? cast(GdkPaintable*)(cast(ObjectG)paintable).cPtr(No.Dup) : null);
  }

  void setGicon(Icon icon)
  {
    gtk_source_gutter_renderer_pixbuf_set_gicon(cast(GtkSourceGutterRendererPixbuf*)cPtr, icon ? cast(GIcon*)(cast(ObjectG)icon).cPtr(No.Dup) : null);
  }

  void setIconName(string iconName)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    gtk_source_gutter_renderer_pixbuf_set_icon_name(cast(GtkSourceGutterRendererPixbuf*)cPtr, _iconName);
  }

  void setPaintable(Paintable paintable)
  {
    gtk_source_gutter_renderer_pixbuf_set_paintable(cast(GtkSourceGutterRendererPixbuf*)cPtr, paintable ? cast(GdkPaintable*)(cast(ObjectG)paintable).cPtr(No.Dup) : null);
  }

  void setPixbuf(Pixbuf pixbuf)
  {
    gtk_source_gutter_renderer_pixbuf_set_pixbuf(cast(GtkSourceGutterRendererPixbuf*)cPtr, pixbuf ? cast(PixbufC*)pixbuf.cPtr(No.Dup) : null);
  }
}
