module gdk.window_attr;

import gdk.c.functions;
import gdk.c.types;
import gdk.cursor;
import gdk.types;
import gdk.visual;
import gid.gid;
import gobject.object;

/**
    Attributes to use for a newly-created window.
*/
class WindowAttr
{
  GdkWindowAttr cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.WindowAttr");

    cInstance = *cast(GdkWindowAttr*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string title()
  {
    return (cast(GdkWindowAttr*)cPtr).title.fromCString(No.Free);
  }

  @property void title(string propval)
  {
    safeFree(cast(void*)(cast(GdkWindowAttr*)cPtr).title);
    (cast(GdkWindowAttr*)cPtr).title = propval.toCString(Yes.Alloc);
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
    return ObjectG.getDObject!(gdk.visual.Visual)((cast(GdkWindowAttr*)cPtr).visual, No.Take);
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
    return ObjectG.getDObject!(gdk.cursor.Cursor)((cast(GdkWindowAttr*)cPtr).cursor, No.Take);
  }

  @property string wmclassName()
  {
    return (cast(GdkWindowAttr*)cPtr).wmclassName.fromCString(No.Free);
  }

  @property void wmclassName(string propval)
  {
    safeFree(cast(void*)(cast(GdkWindowAttr*)cPtr).wmclassName);
    (cast(GdkWindowAttr*)cPtr).wmclassName = propval.toCString(Yes.Alloc);
  }

  @property string wmclassClass()
  {
    return (cast(GdkWindowAttr*)cPtr).wmclassClass.fromCString(No.Free);
  }

  @property void wmclassClass(string propval)
  {
    safeFree(cast(void*)(cast(GdkWindowAttr*)cPtr).wmclassClass);
    (cast(GdkWindowAttr*)cPtr).wmclassClass = propval.toCString(Yes.Alloc);
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
