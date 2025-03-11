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
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string contextId()
  {
    return cToD!(string)(cast(void*)(cast(GtkIMContextInfo*)cPtr).contextId);
  }

  @property void contextId(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkIMContextInfo*)cPtr).contextId);
    dToC(propval, cast(void*)&(cast(GtkIMContextInfo*)cPtr).contextId);
  }

  @property string contextName()
  {
    return cToD!(string)(cast(void*)(cast(GtkIMContextInfo*)cPtr).contextName);
  }

  @property void contextName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkIMContextInfo*)cPtr).contextName);
    dToC(propval, cast(void*)&(cast(GtkIMContextInfo*)cPtr).contextName);
  }

  @property string domain()
  {
    return cToD!(string)(cast(void*)(cast(GtkIMContextInfo*)cPtr).domain);
  }

  @property void domain(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkIMContextInfo*)cPtr).domain);
    dToC(propval, cast(void*)&(cast(GtkIMContextInfo*)cPtr).domain);
  }

  @property string domainDirname()
  {
    return cToD!(string)(cast(void*)(cast(GtkIMContextInfo*)cPtr).domainDirname);
  }

  @property void domainDirname(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkIMContextInfo*)cPtr).domainDirname);
    dToC(propval, cast(void*)&(cast(GtkIMContextInfo*)cPtr).domainDirname);
  }

  @property string defaultLocales()
  {
    return cToD!(string)(cast(void*)(cast(GtkIMContextInfo*)cPtr).defaultLocales);
  }

  @property void defaultLocales(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkIMContextInfo*)cPtr).defaultLocales);
    dToC(propval, cast(void*)&(cast(GtkIMContextInfo*)cPtr).defaultLocales);
  }
}
