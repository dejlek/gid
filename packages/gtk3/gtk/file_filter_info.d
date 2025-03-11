module gtk.file_filter_info;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    A #GtkFileFilterInfo-struct is used to pass information about the
  tested file to [gtk.file_filter.FileFilter.filter].
*/
class FileFilterInfo
{
  GtkFileFilterInfo cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.FileFilterInfo");

    cInstance = *cast(GtkFileFilterInfo*)ptr;

    if (take)
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gtk.types.FileFilterFlags contains()
  {
    return cast(gtk.types.FileFilterFlags)(cast(GtkFileFilterInfo*)cPtr).contains;
  }

  @property void contains(gtk.types.FileFilterFlags propval)
  {
    (cast(GtkFileFilterInfo*)cPtr).contains = cast(GtkFileFilterFlags)propval;
  }

  @property string filename()
  {
    return cToD!(string)(cast(void*)(cast(GtkFileFilterInfo*)cPtr).filename);
  }

  @property void filename(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkFileFilterInfo*)cPtr).filename);
    dToC(propval, cast(void*)&(cast(GtkFileFilterInfo*)cPtr).filename);
  }

  @property string uri()
  {
    return cToD!(string)(cast(void*)(cast(GtkFileFilterInfo*)cPtr).uri);
  }

  @property void uri(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkFileFilterInfo*)cPtr).uri);
    dToC(propval, cast(void*)&(cast(GtkFileFilterInfo*)cPtr).uri);
  }

  @property string displayName()
  {
    return cToD!(string)(cast(void*)(cast(GtkFileFilterInfo*)cPtr).displayName);
  }

  @property void displayName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkFileFilterInfo*)cPtr).displayName);
    dToC(propval, cast(void*)&(cast(GtkFileFilterInfo*)cPtr).displayName);
  }

  @property string mimeType()
  {
    return cToD!(string)(cast(void*)(cast(GtkFileFilterInfo*)cPtr).mimeType);
  }

  @property void mimeType(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkFileFilterInfo*)cPtr).mimeType);
    dToC(propval, cast(void*)&(cast(GtkFileFilterInfo*)cPtr).mimeType);
  }
}
