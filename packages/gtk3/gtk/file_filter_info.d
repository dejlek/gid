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
      safeFree(ptr);
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
    return (cast(GtkFileFilterInfo*)cPtr).filename.fromCString(No.Free);
  }

  @property void filename(string propval)
  {
    safeFree(cast(void*)(cast(GtkFileFilterInfo*)cPtr).filename);
    (cast(GtkFileFilterInfo*)cPtr).filename = propval.toCString(Yes.Alloc);
  }

  @property string uri()
  {
    return (cast(GtkFileFilterInfo*)cPtr).uri.fromCString(No.Free);
  }

  @property void uri(string propval)
  {
    safeFree(cast(void*)(cast(GtkFileFilterInfo*)cPtr).uri);
    (cast(GtkFileFilterInfo*)cPtr).uri = propval.toCString(Yes.Alloc);
  }

  @property string displayName()
  {
    return (cast(GtkFileFilterInfo*)cPtr).displayName.fromCString(No.Free);
  }

  @property void displayName(string propval)
  {
    safeFree(cast(void*)(cast(GtkFileFilterInfo*)cPtr).displayName);
    (cast(GtkFileFilterInfo*)cPtr).displayName = propval.toCString(Yes.Alloc);
  }

  @property string mimeType()
  {
    return (cast(GtkFileFilterInfo*)cPtr).mimeType.fromCString(No.Free);
  }

  @property void mimeType(string propval)
  {
    safeFree(cast(void*)(cast(GtkFileFilterInfo*)cPtr).mimeType);
    (cast(GtkFileFilterInfo*)cPtr).mimeType = propval.toCString(Yes.Alloc);
  }
}
