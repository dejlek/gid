/// Module for [GutterRendererPixbuf] class
module gtksource.gutter_renderer_pixbuf;

import gdk.paintable;
import gdkpixbuf.pixbuf;
import gid.gid;
import gio.icon;
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
    Renders a pixbuf in the gutter.
    
    A [gtksource.gutter_renderer_pixbuf.GutterRendererPixbuf] can be used to render an image in a cell of
    `class@Gutter`.
*/
class GutterRendererPixbuf : gtksource.gutter_renderer.GutterRenderer
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_gutter_renderer_pixbuf_get_type != &gidSymbolNotFound ? gtk_source_gutter_renderer_pixbuf_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GutterRendererPixbuf self()
  {
    return this;
  }

  /** */
  @property gio.icon.Icon gicon()
  {
    return getGicon();
  }

  /** */
  @property void gicon(gio.icon.Icon propval)
  {
    return setGicon(propval);
  }

  /** */
  @property string iconName()
  {
    return getIconName();
  }

  /** */
  @property void iconName(string propval)
  {
    return setIconName(propval);
  }

  /** */
  @property gdk.paintable.Paintable paintable()
  {
    return getPaintable();
  }

  /** */
  @property void paintable(gdk.paintable.Paintable propval)
  {
    return setPaintable(propval);
  }

  /** */
  @property gdkpixbuf.pixbuf.Pixbuf pixbuf()
  {
    return getPixbuf();
  }

  /** */
  @property void pixbuf(gdkpixbuf.pixbuf.Pixbuf propval)
  {
    return setPixbuf(propval);
  }

  /**
      Create a new #GtkSourceGutterRendererPixbuf.
      Returns: A #GtkSourceGutterRenderer
  */
  this()
  {
    GtkSourceGutterRenderer* _cretval;
    _cretval = gtk_source_gutter_renderer_pixbuf_new();
    this(_cretval, Yes.Take);
  }

  /**
      Get the gicon of the renderer
      Returns: a #GIcon
  */
  gio.icon.Icon getGicon()
  {
    GIcon* _cretval;
    _cretval = gtk_source_gutter_renderer_pixbuf_get_gicon(cast(GtkSourceGutterRendererPixbuf*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /** */
  string getIconName()
  {
    const(char)* _cretval;
    _cretval = gtk_source_gutter_renderer_pixbuf_get_icon_name(cast(GtkSourceGutterRendererPixbuf*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets a [gdk.paintable.Paintable] that was set with
      [gtksource.gutter_renderer_pixbuf.GutterRendererPixbuf.setPaintable]
      Returns: a #GdkPaintable or null
  */
  gdk.paintable.Paintable getPaintable()
  {
    GdkPaintable* _cretval;
    _cretval = gtk_source_gutter_renderer_pixbuf_get_paintable(cast(GtkSourceGutterRendererPixbuf*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.paintable.Paintable)(cast(GdkPaintable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the pixbuf of the renderer.
      Returns: a #GdkPixbuf
  */
  gdkpixbuf.pixbuf.Pixbuf getPixbuf()
  {
    PixbufC* _cretval;
    _cretval = gtk_source_gutter_renderer_pixbuf_get_pixbuf(cast(GtkSourceGutterRendererPixbuf*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(PixbufC*)_cretval, No.Take);
    return _retval;
  }

  /**
      Allows overlaying a paintable on top of any other image that
      has been set for the pixbuf. This will be applied when the
      widget is next snapshot.
  
      Params:
        paintable = a #GdkPaintable
  */
  void overlayPaintable(gdk.paintable.Paintable paintable)
  {
    gtk_source_gutter_renderer_pixbuf_overlay_paintable(cast(GtkSourceGutterRendererPixbuf*)this._cPtr, paintable ? cast(GdkPaintable*)(cast(gobject.object.ObjectWrap)paintable)._cPtr(No.Dup) : null);
  }

  /** */
  void setGicon(gio.icon.Icon icon = null)
  {
    gtk_source_gutter_renderer_pixbuf_set_gicon(cast(GtkSourceGutterRendererPixbuf*)this._cPtr, icon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
  }

  /** */
  void setIconName(string iconName = null)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    gtk_source_gutter_renderer_pixbuf_set_icon_name(cast(GtkSourceGutterRendererPixbuf*)this._cPtr, _iconName);
  }

  /** */
  void setPaintable(gdk.paintable.Paintable paintable = null)
  {
    gtk_source_gutter_renderer_pixbuf_set_paintable(cast(GtkSourceGutterRendererPixbuf*)this._cPtr, paintable ? cast(GdkPaintable*)(cast(gobject.object.ObjectWrap)paintable)._cPtr(No.Dup) : null);
  }

  /** */
  void setPixbuf(gdkpixbuf.pixbuf.Pixbuf pixbuf = null)
  {
    gtk_source_gutter_renderer_pixbuf_set_pixbuf(cast(GtkSourceGutterRendererPixbuf*)this._cPtr, pixbuf ? cast(PixbufC*)pixbuf._cPtr(No.Dup) : null);
  }
}
