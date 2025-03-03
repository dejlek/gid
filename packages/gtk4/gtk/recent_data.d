module gtk.recent_data;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
 * Meta-data to be passed to [gtk.recent_manager.RecentManager.addFull] when
 * registering a recently used resource.
 */
class RecentData
{
  GtkRecentData cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.RecentData");

    cInstance = *cast(GtkRecentData*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string displayName()
  {
    return (cast(GtkRecentData*)cPtr).displayName.fromCString(No.Free);
  }

  @property void displayName(string propval)
  {
    safeFree(cast(void*)(cast(GtkRecentData*)cPtr).displayName);
    (cast(GtkRecentData*)cPtr).displayName = propval.toCString(Yes.Alloc);
  }

  @property string description()
  {
    return (cast(GtkRecentData*)cPtr).description.fromCString(No.Free);
  }

  @property void description(string propval)
  {
    safeFree(cast(void*)(cast(GtkRecentData*)cPtr).description);
    (cast(GtkRecentData*)cPtr).description = propval.toCString(Yes.Alloc);
  }

  @property string mimeType()
  {
    return (cast(GtkRecentData*)cPtr).mimeType.fromCString(No.Free);
  }

  @property void mimeType(string propval)
  {
    safeFree(cast(void*)(cast(GtkRecentData*)cPtr).mimeType);
    (cast(GtkRecentData*)cPtr).mimeType = propval.toCString(Yes.Alloc);
  }

  @property string appName()
  {
    return (cast(GtkRecentData*)cPtr).appName.fromCString(No.Free);
  }

  @property void appName(string propval)
  {
    safeFree(cast(void*)(cast(GtkRecentData*)cPtr).appName);
    (cast(GtkRecentData*)cPtr).appName = propval.toCString(Yes.Alloc);
  }

  @property string appExec()
  {
    return (cast(GtkRecentData*)cPtr).appExec.fromCString(No.Free);
  }

  @property void appExec(string propval)
  {
    safeFree(cast(void*)(cast(GtkRecentData*)cPtr).appExec);
    (cast(GtkRecentData*)cPtr).appExec = propval.toCString(Yes.Alloc);
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
