module gdkpixbuf.pixbuf_simple_anim_iter;

import gdkpixbuf.c.functions;
import gdkpixbuf.c.types;
import gdkpixbuf.pixbuf_animation_iter;
import gdkpixbuf.types;
import gid.gid;

/** */
class PixbufSimpleAnimIter : gdkpixbuf.pixbuf_animation_iter.PixbufAnimationIter
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_pixbuf_simple_anim_iter_get_type != &gidSymbolNotFound ? gdk_pixbuf_simple_anim_iter_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override PixbufSimpleAnimIter self()
  {
    return this;
  }
}
