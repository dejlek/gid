module gio.action_entry;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;

/**
    This struct defines a single action.  It is for use with
  [gio.action_map.ActionMap.addActionEntries].
  
  The order of the items in the structure are intended to reflect
  frequency of use.  It is permissible to use an incomplete initialiser
  in order to leave some of the later values as null.  All values
  after @name are optional.  Additional optional fields may be added in
  the future.
  
  See [gio.action_map.ActionMap.addActionEntries] for an example.
*/
class ActionEntry
{
  GActionEntry cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.ActionEntry");

    cInstance = *cast(GActionEntry*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string name()
  {
    return (cast(GActionEntry*)cPtr).name.fromCString(No.free);
  }

  @property void name(string propval)
  {
    safeFree(cast(void*)(cast(GActionEntry*)cPtr).name);
    (cast(GActionEntry*)cPtr).name = propval.toCString(Yes.alloc);
  }

  alias ActivateFuncType = extern(C) void function(GSimpleAction* action, VariantC* parameter, void* userData);

  @property ActivateFuncType activate()
  {
    return (cast(GActionEntry*)cPtr).activate;
  }

  @property string parameterType()
  {
    return (cast(GActionEntry*)cPtr).parameterType.fromCString(No.free);
  }

  @property void parameterType(string propval)
  {
    safeFree(cast(void*)(cast(GActionEntry*)cPtr).parameterType);
    (cast(GActionEntry*)cPtr).parameterType = propval.toCString(Yes.alloc);
  }

  @property string state()
  {
    return (cast(GActionEntry*)cPtr).state.fromCString(No.free);
  }

  @property void state(string propval)
  {
    safeFree(cast(void*)(cast(GActionEntry*)cPtr).state);
    (cast(GActionEntry*)cPtr).state = propval.toCString(Yes.alloc);
  }

  alias ChangeStateFuncType = extern(C) void function(GSimpleAction* action, VariantC* value, void* userData);

  @property ChangeStateFuncType changeState()
  {
    return (cast(GActionEntry*)cPtr).changeState;
  }
}
