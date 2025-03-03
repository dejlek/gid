module gsk.color_stop;

import gdk.rgba;
import gid.gid;
import gsk.c.functions;
import gsk.c.types;
import gsk.types;

/**
 * A color stop in a gradient node.
 */
class ColorStop
{
  GskColorStop cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gsk.ColorStop");

    cInstance = *cast(GskColorStop*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property float offset()
  {
    return (cast(GskColorStop*)cPtr).offset;
  }

  @property void offset(float propval)
  {
    (cast(GskColorStop*)cPtr).offset = propval;
  }

  @property gdk.rgba.RGBA color()
  {
    return new gdk.rgba.RGBA(cast(GdkRGBA*)&(cast(GskColorStop*)cPtr).color);
  }
}
