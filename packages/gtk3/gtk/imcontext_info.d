module gtk.imcontext_info;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    Bookkeeping information about a loadable input method.
*/
class IMContextInfo
{
  GtkIMContextInfo cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.IMContextInfo");

    cInstance = *cast(GtkIMContextInfo*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string contextId()
  {
    return (cast(GtkIMContextInfo*)cPtr).contextId.fromCString(No.Free);
  }

  @property void contextId(string propval)
  {
    safeFree(cast(void*)(cast(GtkIMContextInfo*)cPtr).contextId);
    (cast(GtkIMContextInfo*)cPtr).contextId = propval.toCString(Yes.Alloc);
  }

  @property string contextName()
  {
    return (cast(GtkIMContextInfo*)cPtr).contextName.fromCString(No.Free);
  }

  @property void contextName(string propval)
  {
    safeFree(cast(void*)(cast(GtkIMContextInfo*)cPtr).contextName);
    (cast(GtkIMContextInfo*)cPtr).contextName = propval.toCString(Yes.Alloc);
  }

  @property string domain()
  {
    return (cast(GtkIMContextInfo*)cPtr).domain.fromCString(No.Free);
  }

  @property void domain(string propval)
  {
    safeFree(cast(void*)(cast(GtkIMContextInfo*)cPtr).domain);
    (cast(GtkIMContextInfo*)cPtr).domain = propval.toCString(Yes.Alloc);
  }

  @property string domainDirname()
  {
    return (cast(GtkIMContextInfo*)cPtr).domainDirname.fromCString(No.Free);
  }

  @property void domainDirname(string propval)
  {
    safeFree(cast(void*)(cast(GtkIMContextInfo*)cPtr).domainDirname);
    (cast(GtkIMContextInfo*)cPtr).domainDirname = propval.toCString(Yes.Alloc);
  }

  @property string defaultLocales()
  {
    return (cast(GtkIMContextInfo*)cPtr).defaultLocales.fromCString(No.Free);
  }

  @property void defaultLocales(string propval)
  {
    safeFree(cast(void*)(cast(GtkIMContextInfo*)cPtr).defaultLocales);
    (cast(GtkIMContextInfo*)cPtr).defaultLocales = propval.toCString(Yes.Alloc);
  }
}
