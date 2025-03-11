module gtk.recent_filter_info;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    A GtkRecentFilterInfo struct is used
  to pass information about the tested file to [gtk.recent_filter.RecentFilter.filter].
*/
class RecentFilterInfo
{
  GtkRecentFilterInfo cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.RecentFilterInfo");

    cInstance = *cast(GtkRecentFilterInfo*)ptr;

    if (take)
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gtk.types.RecentFilterFlags contains()
  {
    return cast(gtk.types.RecentFilterFlags)(cast(GtkRecentFilterInfo*)cPtr).contains;
  }

  @property void contains(gtk.types.RecentFilterFlags propval)
  {
    (cast(GtkRecentFilterInfo*)cPtr).contains = cast(GtkRecentFilterFlags)propval;
  }

  @property string uri()
  {
    return cToD!(string)(cast(void*)(cast(GtkRecentFilterInfo*)cPtr).uri);
  }

  @property void uri(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkRecentFilterInfo*)cPtr).uri);
    dToC(propval, cast(void*)&(cast(GtkRecentFilterInfo*)cPtr).uri);
  }

  @property string displayName()
  {
    return cToD!(string)(cast(void*)(cast(GtkRecentFilterInfo*)cPtr).displayName);
  }

  @property void displayName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkRecentFilterInfo*)cPtr).displayName);
    dToC(propval, cast(void*)&(cast(GtkRecentFilterInfo*)cPtr).displayName);
  }

  @property string mimeType()
  {
    return cToD!(string)(cast(void*)(cast(GtkRecentFilterInfo*)cPtr).mimeType);
  }

  @property void mimeType(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkRecentFilterInfo*)cPtr).mimeType);
    dToC(propval, cast(void*)&(cast(GtkRecentFilterInfo*)cPtr).mimeType);
  }

  @property int age()
  {
    return (cast(GtkRecentFilterInfo*)cPtr).age;
  }

  @property void age(int propval)
  {
    (cast(GtkRecentFilterInfo*)cPtr).age = propval;
  }
}
