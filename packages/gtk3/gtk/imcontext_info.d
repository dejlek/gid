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

  this(void* ptr, Flag!"take" take = No.take)
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
    return (cast(GtkIMContextInfo*)cPtr).contextId.fromCString(No.free);
  }

  @property void contextId(string propval)
  {
    safeFree(cast(void*)(cast(GtkIMContextInfo*)cPtr).contextId);
    (cast(GtkIMContextInfo*)cPtr).contextId = propval.toCString(Yes.alloc);
  }

  @property string contextName()
  {
    return (cast(GtkIMContextInfo*)cPtr).contextName.fromCString(No.free);
  }

  @property void contextName(string propval)
  {
    safeFree(cast(void*)(cast(GtkIMContextInfo*)cPtr).contextName);
    (cast(GtkIMContextInfo*)cPtr).contextName = propval.toCString(Yes.alloc);
  }

  @property string domain()
  {
    return (cast(GtkIMContextInfo*)cPtr).domain.fromCString(No.free);
  }

  @property void domain(string propval)
  {
    safeFree(cast(void*)(cast(GtkIMContextInfo*)cPtr).domain);
    (cast(GtkIMContextInfo*)cPtr).domain = propval.toCString(Yes.alloc);
  }

  @property string domainDirname()
  {
    return (cast(GtkIMContextInfo*)cPtr).domainDirname.fromCString(No.free);
  }

  @property void domainDirname(string propval)
  {
    safeFree(cast(void*)(cast(GtkIMContextInfo*)cPtr).domainDirname);
    (cast(GtkIMContextInfo*)cPtr).domainDirname = propval.toCString(Yes.alloc);
  }

  @property string defaultLocales()
  {
    return (cast(GtkIMContextInfo*)cPtr).defaultLocales.fromCString(No.free);
  }

  @property void defaultLocales(string propval)
  {
    safeFree(cast(void*)(cast(GtkIMContextInfo*)cPtr).defaultLocales);
    (cast(GtkIMContextInfo*)cPtr).defaultLocales = propval.toCString(Yes.alloc);
  }
}
