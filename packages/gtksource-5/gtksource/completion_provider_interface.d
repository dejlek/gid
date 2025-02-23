module gtksource.completion_provider_interface;

import gid.gid;
import gobject.type_interface;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

class CompletionProviderInterface
{
  GtkSourceCompletionProviderInterface cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GtkSource.CompletionProviderInterface");

    cInstance = *cast(GtkSourceCompletionProviderInterface*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property TypeInterface parentIface()
  {
    return new TypeInterface(cast(GTypeInterface*)&(cast(GtkSourceCompletionProviderInterface*)cPtr).parentIface);
  }

  alias GetTitleFuncType = extern(C) char* function(GtkSourceCompletionProvider* self);

  @property GetTitleFuncType getTitle()
  {
    return (cast(GtkSourceCompletionProviderInterface*)cPtr).getTitle;
  }

  alias GetPriorityFuncType = extern(C) int function(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context);

  @property GetPriorityFuncType getPriority()
  {
    return (cast(GtkSourceCompletionProviderInterface*)cPtr).getPriority;
  }

  alias IsTriggerFuncType = extern(C) bool function(GtkSourceCompletionProvider* self, const(GtkTextIter)* iter, dchar ch);

  @property IsTriggerFuncType isTrigger()
  {
    return (cast(GtkSourceCompletionProviderInterface*)cPtr).isTrigger;
  }

  alias KeyActivatesFuncType = extern(C) bool function(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context, GtkSourceCompletionProposal* proposal, uint keyval, GdkModifierType state);

  @property KeyActivatesFuncType keyActivates()
  {
    return (cast(GtkSourceCompletionProviderInterface*)cPtr).keyActivates;
  }

  alias PopulateAsyncFuncType = extern(C) void function(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context, GCancellable* cancellable, GAsyncReadyCallback callback, void* userData);

  @property PopulateAsyncFuncType populateAsync()
  {
    return (cast(GtkSourceCompletionProviderInterface*)cPtr).populateAsync;
  }

  alias PopulateFinishFuncType = extern(C) GListModel* function(GtkSourceCompletionProvider* self, GAsyncResult* result, GError** _err);

  @property PopulateFinishFuncType populateFinish()
  {
    return (cast(GtkSourceCompletionProviderInterface*)cPtr).populateFinish;
  }

  alias RefilterFuncType = extern(C) void function(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context, GListModel* model);

  @property RefilterFuncType refilter()
  {
    return (cast(GtkSourceCompletionProviderInterface*)cPtr).refilter;
  }

  alias DisplayFuncType = extern(C) void function(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context, GtkSourceCompletionProposal* proposal, GtkSourceCompletionCell* cell);

  @property DisplayFuncType display()
  {
    return (cast(GtkSourceCompletionProviderInterface*)cPtr).display;
  }

  alias ActivateFuncType = extern(C) void function(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context, GtkSourceCompletionProposal* proposal);

  @property ActivateFuncType activate()
  {
    return (cast(GtkSourceCompletionProviderInterface*)cPtr).activate;
  }

  alias ListAlternatesFuncType = extern(C) GPtrArray* function(GtkSourceCompletionProvider* self, GtkSourceCompletionContext* context, GtkSourceCompletionProposal* proposal);

  @property ListAlternatesFuncType listAlternates()
  {
    return (cast(GtkSourceCompletionProviderInterface*)cPtr).listAlternates;
  }
}
