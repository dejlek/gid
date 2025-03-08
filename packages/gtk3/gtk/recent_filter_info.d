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

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.RecentFilterInfo");

    cInstance = *cast(GtkRecentFilterInfo*)ptr;

    if (take)
      safeFree(ptr);
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
    return (cast(GtkRecentFilterInfo*)cPtr).uri.fromCString(No.free);
  }

  @property void uri(string propval)
  {
    safeFree(cast(void*)(cast(GtkRecentFilterInfo*)cPtr).uri);
    (cast(GtkRecentFilterInfo*)cPtr).uri = propval.toCString(Yes.alloc);
  }

  @property string displayName()
  {
    return (cast(GtkRecentFilterInfo*)cPtr).displayName.fromCString(No.free);
  }

  @property void displayName(string propval)
  {
    safeFree(cast(void*)(cast(GtkRecentFilterInfo*)cPtr).displayName);
    (cast(GtkRecentFilterInfo*)cPtr).displayName = propval.toCString(Yes.alloc);
  }

  @property string mimeType()
  {
    return (cast(GtkRecentFilterInfo*)cPtr).mimeType.fromCString(No.free);
  }

  @property void mimeType(string propval)
  {
    safeFree(cast(void*)(cast(GtkRecentFilterInfo*)cPtr).mimeType);
    (cast(GtkRecentFilterInfo*)cPtr).mimeType = propval.toCString(Yes.alloc);
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
