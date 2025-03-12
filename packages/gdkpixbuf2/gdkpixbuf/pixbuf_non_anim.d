module gdkpixbuf.pixbuf_non_anim;

import gdkpixbuf.c.functions;
import gdkpixbuf.c.types;
import gdkpixbuf.pixbuf;
import gdkpixbuf.pixbuf_animation;
import gdkpixbuf.types;
import gid.gid;

/** */
class PixbufNonAnim : gdkpixbuf.pixbuf_animation.PixbufAnimation
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_pixbuf_non_anim_get_type != &gidSymbolNotFound ? gdk_pixbuf_non_anim_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override PixbufNonAnim self()
  {
    return this;
  }

  /** */
  this(gdkpixbuf.pixbuf.Pixbuf pixbuf)
  {
    GdkPixbufAnimation* _cretval;
    _cretval = gdk_pixbuf_non_anim_new(pixbuf ? cast(PixbufC*)pixbuf.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
