/// Module for [Shadow] class
module gsk.shadow;

import gdk.rgba;
import gid.gid;
import gsk.c.functions;
import gsk.c.types;
import gsk.types;

/**
    The shadow parameters in a shadow node.
*/
class Shadow
{
  GskShadow cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gsk.Shadow");

    cInstance = *cast(GskShadow*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gdk.rgba.RGBA color()
  {
    return cToD!(gdk.rgba.RGBA)(cast(void*)&(cast(GskShadow*)cPtr).color);
  }

  @property float dx()
  {
    return (cast(GskShadow*)cPtr).dx;
  }

  @property void dx(float propval)
  {
    (cast(GskShadow*)cPtr).dx = propval;
  }

  @property float dy()
  {
    return (cast(GskShadow*)cPtr).dy;
  }

  @property void dy(float propval)
  {
    (cast(GskShadow*)cPtr).dy = propval;
  }

  @property float radius()
  {
    return (cast(GskShadow*)cPtr).radius;
  }

  @property void radius(float propval)
  {
    (cast(GskShadow*)cPtr).radius = propval;
  }
}
