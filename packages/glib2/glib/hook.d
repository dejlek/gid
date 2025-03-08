module glib.hook;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.hook_list;
import glib.types;

/**
    The #GHook struct represents a single hook function in a #GHookList.
*/
class Hook
{
  GHook cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GLib.Hook");

    cInstance = *cast(GHook*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property glib.hook.Hook next()
  {
    return new glib.hook.Hook(cast(GHook*)(cast(GHook*)cPtr).next);
  }

  @property glib.hook.Hook prev()
  {
    return new glib.hook.Hook(cast(GHook*)(cast(GHook*)cPtr).prev);
  }

  @property uint refCount()
  {
    return (cast(GHook*)cPtr).refCount;
  }

  @property void refCount(uint propval)
  {
    (cast(GHook*)cPtr).refCount = propval;
  }

  @property gulong hookId()
  {
    return (cast(GHook*)cPtr).hookId;
  }

  @property void hookId(gulong propval)
  {
    (cast(GHook*)cPtr).hookId = propval;
  }

  @property uint flags()
  {
    return (cast(GHook*)cPtr).flags;
  }

  @property void flags(uint propval)
  {
    (cast(GHook*)cPtr).flags = propval;
  }

  @property GDestroyNotify destroy()
  {
    return (cast(GHook*)cPtr).destroy;
  }

  @property void destroy(GDestroyNotify propval)
  {
    (cast(GHook*)cPtr).destroy = propval;
  }

  /**
      Compares the ids of two #GHook elements, returning a negative value
    if the second id is greater than the first.
    Params:
      sibling =       a #GHook to compare with new_hook
    Returns:     a value <= 0 if the id of sibling is >= the id of new_hook
  */
  int compareIds(glib.hook.Hook sibling)
  {
    int _retval;
    _retval = g_hook_compare_ids(cast(GHook*)cPtr, sibling ? cast(GHook*)sibling.cPtr : null);
    return _retval;
  }

  /**
      Destroys a #GHook, given its ID.
    Params:
      hookList =       a #GHookList
      hookId =       a hook ID
    Returns:     true if the #GHook was found in the #GHookList and destroyed
  */
  static bool destroy(glib.hook_list.HookList hookList, gulong hookId)
  {
    bool _retval;
    _retval = g_hook_destroy(hookList ? cast(GHookList*)hookList.cPtr : null, hookId);
    return _retval;
  }

  /**
      Removes one #GHook from a #GHookList, marking it
    inactive and calling [glib.hook.Hook.unref] on it.
    Params:
      hookList =       a #GHookList
      hook =       the #GHook to remove
  */
  static void destroyLink(glib.hook_list.HookList hookList, glib.hook.Hook hook)
  {
    g_hook_destroy_link(hookList ? cast(GHookList*)hookList.cPtr : null, hook ? cast(GHook*)hook.cPtr : null);
  }

  /**
      Calls the #GHookList finalize_hook function if it exists,
    and frees the memory allocated for the #GHook.
    Params:
      hookList =       a #GHookList
      hook =       the #GHook to free
  */
  static void free(glib.hook_list.HookList hookList, glib.hook.Hook hook)
  {
    g_hook_free(hookList ? cast(GHookList*)hookList.cPtr : null, hook ? cast(GHook*)hook.cPtr : null);
  }

  /**
      Inserts a #GHook into a #GHookList, before a given #GHook.
    Params:
      hookList =       a #GHookList
      sibling =       the #GHook to insert the new #GHook before
      hook =       the #GHook to insert
  */
  static void insertBefore(glib.hook_list.HookList hookList, glib.hook.Hook sibling, glib.hook.Hook hook)
  {
    g_hook_insert_before(hookList ? cast(GHookList*)hookList.cPtr : null, sibling ? cast(GHook*)sibling.cPtr : null, hook ? cast(GHook*)hook.cPtr : null);
  }

  /**
      Inserts a #GHook into a #GHookList, sorted by the given function.
    Params:
      hookList =       a #GHookList
      hook =       the #GHook to insert
      func =       the comparison function used to sort the #GHook elements
  */
  static void insertSorted(glib.hook_list.HookList hookList, glib.hook.Hook hook, glib.types.HookCompareFunc func)
  {
    static glib.types.HookCompareFunc _static_func;

    extern(C) int _funcCallback(GHook* newHook, GHook* sibling)
    {
      int _retval = _static_func(newHook ? new glib.hook.Hook(cast(void*)newHook, No.take) : null, sibling ? new glib.hook.Hook(cast(void*)sibling, No.take) : null);
      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;

    _static_func = func;
    g_hook_insert_sorted(hookList ? cast(GHookList*)hookList.cPtr : null, hook ? cast(GHook*)hook.cPtr : null, _funcCB);
    _static_func = null;
  }

  /**
      Prepends a #GHook on the start of a #GHookList.
    Params:
      hookList =       a #GHookList
      hook =       the #GHook to add to the start of hook_list
  */
  static void prepend(glib.hook_list.HookList hookList, glib.hook.Hook hook)
  {
    g_hook_prepend(hookList ? cast(GHookList*)hookList.cPtr : null, hook ? cast(GHook*)hook.cPtr : null);
  }

  /**
      Decrements the reference count of a #GHook.
    If the reference count falls to 0, the #GHook is removed
    from the #GHookList and [glib.hook.Hook.free] is called to free it.
    Params:
      hookList =       a #GHookList
      hook =       the #GHook to unref
  */
  static void unref(glib.hook_list.HookList hookList, glib.hook.Hook hook)
  {
    g_hook_unref(hookList ? cast(GHookList*)hookList.cPtr : null, hook ? cast(GHook*)hook.cPtr : null);
  }
}
