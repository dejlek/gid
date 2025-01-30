module GdkPixbuf.PixbufNonAnim;

import GdkPixbuf.Pixbuf;
import GdkPixbuf.PixbufAnimation;
import GdkPixbuf.Types;
import GdkPixbuf.c.functions;
import GdkPixbuf.c.types;
import Gid.gid;

class PixbufNonAnim : PixbufAnimation
{

  this()
  {
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gdk_pixbuf_non_anim_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Pixbuf pixbuf)
  {
    GdkPixbufAnimation* _cretval;
    _cretval = gdk_pixbuf_non_anim_new(pixbuf ? cast(PixbufC*)pixbuf.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
