module atk.rectangle;

import atk.c.functions;
import atk.c.types;
import atk.types;
import gid.gid;
import gobject.boxed;

/**
    A data structure for holding a rectangle. Those coordinates are
  relative to the component top-level parent.
*/
class Rectangle : gobject.boxed.Boxed
{

  this()
  {
    super(safeMalloc(AtkRectangle.sizeof), Yes.Take);
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())atk_rectangle_get_type != &gidSymbolNotFound ? atk_rectangle_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  @property int x()
  {
    return (cast(AtkRectangle*)cPtr).x;
  }

  @property void x(int propval)
  {
    (cast(AtkRectangle*)cPtr).x = propval;
  }

  @property int y()
  {
    return (cast(AtkRectangle*)cPtr).y;
  }

  @property void y(int propval)
  {
    (cast(AtkRectangle*)cPtr).y = propval;
  }

  @property int width()
  {
    return (cast(AtkRectangle*)cPtr).width;
  }

  @property void width(int propval)
  {
    (cast(AtkRectangle*)cPtr).width = propval;
  }

  @property int height()
  {
    return (cast(AtkRectangle*)cPtr).height;
  }

  @property void height(int propval)
  {
    (cast(AtkRectangle*)cPtr).height = propval;
  }
}
