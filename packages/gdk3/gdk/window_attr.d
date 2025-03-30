/// Module for [WindowAttr] class
module gdk.window_attr;

import gdk.c.functions;
import gdk.c.types;
import gdk.cursor;
import gdk.types;
import gdk.visual;
import gid.gid;

/**
    Attributes to use for a newly-created window.
*/
class WindowAttr
{
  GdkWindowAttr cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.WindowAttr");

    cInstance = *cast(GdkWindowAttr*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string title()
  {
    return cToD!(string)(cast(void*)(cast(GdkWindowAttr*)cPtr).title);
  }

  @property void title(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdkWindowAttr*)cPtr).title);
    dToC(propval, cast(void*)&(cast(GdkWindowAttr*)cPtr).title);
  }

  @property int eventMask()
  {
    return (cast(GdkWindowAttr*)cPtr).eventMask;
  }

  @property void eventMask(int propval)
  {
    (cast(GdkWindowAttr*)cPtr).eventMask = propval;
  }

  @property int x()
  {
    return (cast(GdkWindowAttr*)cPtr).x;
  }

  @property void x(int propval)
  {
    (cast(GdkWindowAttr*)cPtr).x = propval;
  }

  @property int y()
  {
    return (cast(GdkWindowAttr*)cPtr).y;
  }

  @property void y(int propval)
  {
    (cast(GdkWindowAttr*)cPtr).y = propval;
  }

  @property int width()
  {
    return (cast(GdkWindowAttr*)cPtr).width;
  }

  @property void width(int propval)
  {
    (cast(GdkWindowAttr*)cPtr).width = propval;
  }

  @property int height()
  {
    return (cast(GdkWindowAttr*)cPtr).height;
  }

  @property void height(int propval)
  {
    (cast(GdkWindowAttr*)cPtr).height = propval;
  }

  @property gdk.types.WindowWindowClass wclass()
  {
    return cast(gdk.types.WindowWindowClass)(cast(GdkWindowAttr*)cPtr).wclass;
  }

  @property void wclass(gdk.types.WindowWindowClass propval)
  {
    (cast(GdkWindowAttr*)cPtr).wclass = cast(GdkWindowWindowClass)propval;
  }

  @property gdk.visual.Visual visual()
  {
    return cToD!(gdk.visual.Visual)(cast(void*)(cast(GdkWindowAttr*)cPtr).visual);
  }

  @property void visual(gdk.visual.Visual propval)
  {
    cValueFree!(gdk.visual.Visual)(cast(void*)(cast(GdkWindowAttr*)cPtr).visual);
    dToC(propval, cast(void*)&(cast(GdkWindowAttr*)cPtr).visual);
  }

  @property gdk.types.WindowType windowType()
  {
    return cast(gdk.types.WindowType)(cast(GdkWindowAttr*)cPtr).windowType;
  }

  @property void windowType(gdk.types.WindowType propval)
  {
    (cast(GdkWindowAttr*)cPtr).windowType = cast(GdkWindowType)propval;
  }

  @property gdk.cursor.Cursor cursor()
  {
    return cToD!(gdk.cursor.Cursor)(cast(void*)(cast(GdkWindowAttr*)cPtr).cursor);
  }

  @property void cursor(gdk.cursor.Cursor propval)
  {
    cValueFree!(gdk.cursor.Cursor)(cast(void*)(cast(GdkWindowAttr*)cPtr).cursor);
    dToC(propval, cast(void*)&(cast(GdkWindowAttr*)cPtr).cursor);
  }

  @property string wmclassName()
  {
    return cToD!(string)(cast(void*)(cast(GdkWindowAttr*)cPtr).wmclassName);
  }

  @property void wmclassName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdkWindowAttr*)cPtr).wmclassName);
    dToC(propval, cast(void*)&(cast(GdkWindowAttr*)cPtr).wmclassName);
  }

  @property string wmclassClass()
  {
    return cToD!(string)(cast(void*)(cast(GdkWindowAttr*)cPtr).wmclassClass);
  }

  @property void wmclassClass(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GdkWindowAttr*)cPtr).wmclassClass);
    dToC(propval, cast(void*)&(cast(GdkWindowAttr*)cPtr).wmclassClass);
  }

  @property bool overrideRedirect()
  {
    return (cast(GdkWindowAttr*)cPtr).overrideRedirect;
  }

  @property void overrideRedirect(bool propval)
  {
    (cast(GdkWindowAttr*)cPtr).overrideRedirect = propval;
  }

  @property gdk.types.WindowTypeHint typeHint()
  {
    return cast(gdk.types.WindowTypeHint)(cast(GdkWindowAttr*)cPtr).typeHint;
  }

  @property void typeHint(gdk.types.WindowTypeHint propval)
  {
    (cast(GdkWindowAttr*)cPtr).typeHint = cast(GdkWindowTypeHint)propval;
  }
}
