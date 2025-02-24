module gtksource.hover_provider_interface;

import gid.gid;
import gobject.type_interface;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

class HoverProviderInterface
{
  GtkSourceHoverProviderInterface cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GtkSource.HoverProviderInterface");

    cInstance = *cast(GtkSourceHoverProviderInterface*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property TypeInterface parentIface()
  {
    return new TypeInterface(cast(GTypeInterface*)&(cast(GtkSourceHoverProviderInterface*)cPtr).parentIface);
  }

  alias PopulateFuncType = extern(C) bool function(GtkSourceHoverProvider* self, GtkSourceHoverContext* context, GtkSourceHoverDisplay* display, GError** _err);

  @property PopulateFuncType populate()
  {
    return (cast(GtkSourceHoverProviderInterface*)cPtr).populate;
  }

  alias PopulateAsyncFuncType = extern(C) void function(GtkSourceHoverProvider* self, GtkSourceHoverContext* context, GtkSourceHoverDisplay* display, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData);

  @property PopulateAsyncFuncType populateAsync()
  {
    return (cast(GtkSourceHoverProviderInterface*)cPtr).populateAsync;
  }

  alias PopulateFinishFuncType = extern(C) bool function(GtkSourceHoverProvider* self, GAsyncResult* result, GError** _err);

  @property PopulateFinishFuncType populateFinish()
  {
    return (cast(GtkSourceHoverProviderInterface*)cPtr).populateFinish;
  }
}
