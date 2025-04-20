/// Module for [GutterRendererPixbuf] class
module gtksource.gutter_renderer_pixbuf;

import gdkpixbuf.pixbuf;
import gid.gid;
import gio.icon;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.gutter_renderer;
import gtksource.types;

/** */
class GutterRendererPixbuf : gtksource.gutter_renderer.GutterRenderer
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_gutter_renderer_pixbuf_get_type != &gidSymbolNotFound ? gtk_source_gutter_renderer_pixbuf_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
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
    _cretval = gtk_source_gutter_renderer_pixbuf_get_gicon(cast(GtkSourceGutterRendererPixbuf*)cPtr);
    auto _retval = gobject.object.ObjectWrap.getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /** */
  string getIconName()
  {
    const(char)* _cretval;
    _cretval = gtk_source_gutter_renderer_pixbuf_get_icon_name(cast(GtkSourceGutterRendererPixbuf*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the pixbuf of the renderer.
      Returns: a #GdkPixbuf
  */
  gdkpixbuf.pixbuf.Pixbuf getPixbuf()
  {
    PixbufC* _cretval;
    _cretval = gtk_source_gutter_renderer_pixbuf_get_pixbuf(cast(GtkSourceGutterRendererPixbuf*)cPtr);
    auto _retval = gobject.object.ObjectWrap.getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(PixbufC*)_cretval, No.Take);
    return _retval;
  }

  /** */
  void setGicon(gio.icon.Icon icon = null)
  {
    gtk_source_gutter_renderer_pixbuf_set_gicon(cast(GtkSourceGutterRendererPixbuf*)cPtr, icon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)icon).cPtr(No.Dup) : null);
  }

  /** */
  void setIconName(string iconName = null)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    gtk_source_gutter_renderer_pixbuf_set_icon_name(cast(GtkSourceGutterRendererPixbuf*)cPtr, _iconName);
  }

  /** */
  void setPixbuf(gdkpixbuf.pixbuf.Pixbuf pixbuf = null)
  {
    gtk_source_gutter_renderer_pixbuf_set_pixbuf(cast(GtkSourceGutterRendererPixbuf*)cPtr, pixbuf ? cast(PixbufC*)pixbuf.cPtr(No.Dup) : null);
  }
}
