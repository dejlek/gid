module GdkPixbuf.PixbufSimpleAnimIter;

import GdkPixbuf.PixbufAnimationIter;
import GdkPixbuf.Types;
import GdkPixbuf.c.functions;
import GdkPixbuf.c.types;
import Gid.gid;

class PixbufSimpleAnimIter : PixbufAnimationIter
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gdk_pixbuf_simple_anim_iter_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }
}
