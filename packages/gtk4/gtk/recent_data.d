/// Module for [RecentData] class
module gtk.recent_data;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    Meta-data to be passed to [gtk.recent_manager.RecentManager.addFull] when
    registering a recently used resource.
*/
class RecentData
{
  GtkRecentData cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.RecentData");

    cInstance = *cast(GtkRecentData*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string displayName()
  {
    return cToD!(string)(cast(void*)(cast(GtkRecentData*)cPtr).displayName);
  }

  @property void displayName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkRecentData*)cPtr).displayName);
    dToC(propval, cast(void*)&(cast(GtkRecentData*)cPtr).displayName);
  }

  @property string description()
  {
    return cToD!(string)(cast(void*)(cast(GtkRecentData*)cPtr).description);
  }

  @property void description(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkRecentData*)cPtr).description);
    dToC(propval, cast(void*)&(cast(GtkRecentData*)cPtr).description);
  }

  @property string mimeType()
  {
    return cToD!(string)(cast(void*)(cast(GtkRecentData*)cPtr).mimeType);
  }

  @property void mimeType(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkRecentData*)cPtr).mimeType);
    dToC(propval, cast(void*)&(cast(GtkRecentData*)cPtr).mimeType);
  }

  @property string appName()
  {
    return cToD!(string)(cast(void*)(cast(GtkRecentData*)cPtr).appName);
  }

  @property void appName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkRecentData*)cPtr).appName);
    dToC(propval, cast(void*)&(cast(GtkRecentData*)cPtr).appName);
  }

  @property string appExec()
  {
    return cToD!(string)(cast(void*)(cast(GtkRecentData*)cPtr).appExec);
  }

  @property void appExec(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkRecentData*)cPtr).appExec);
    dToC(propval, cast(void*)&(cast(GtkRecentData*)cPtr).appExec);
  }

  @property bool isPrivate()
  {
    return (cast(GtkRecentData*)cPtr).isPrivate;
  }

  @property void isPrivate(bool propval)
  {
    (cast(GtkRecentData*)cPtr).isPrivate = propval;
  }
}
