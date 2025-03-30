/// Module for [ActionEntry] class
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

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.ActionEntry");

    cInstance = *cast(GActionEntry*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string name()
  {
    return cToD!(string)(cast(void*)(cast(GActionEntry*)cPtr).name);
  }

  @property void name(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GActionEntry*)cPtr).name);
    dToC(propval, cast(void*)&(cast(GActionEntry*)cPtr).name);
  }

  alias ActivateFuncType = extern(C) void function(GSimpleAction* action, VariantC* parameter, void* userData);

  @property ActivateFuncType activate()
  {
    return (cast(GActionEntry*)cPtr).activate;
  }

  @property string parameterType()
  {
    return cToD!(string)(cast(void*)(cast(GActionEntry*)cPtr).parameterType);
  }

  @property void parameterType(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GActionEntry*)cPtr).parameterType);
    dToC(propval, cast(void*)&(cast(GActionEntry*)cPtr).parameterType);
  }

  @property string state()
  {
    return cToD!(string)(cast(void*)(cast(GActionEntry*)cPtr).state);
  }

  @property void state(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GActionEntry*)cPtr).state);
    dToC(propval, cast(void*)&(cast(GActionEntry*)cPtr).state);
  }

  alias ChangeStateFuncType = extern(C) void function(GSimpleAction* action, VariantC* value, void* userData);

  @property ChangeStateFuncType changeState()
  {
    return (cast(GActionEntry*)cPtr).changeState;
  }
}
