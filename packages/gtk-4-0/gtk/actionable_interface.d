module gtk.actionable_interface;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
 * The interface vtable for `GtkActionable`.
 */
class ActionableInterface
{
  GtkActionableInterface cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.ActionableInterface");

    cInstance = *cast(GtkActionableInterface*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  alias GetActionNameFuncType = extern(C) const(char)* function(GtkActionable* actionable);

  @property GetActionNameFuncType getActionName()
  {
    return (cast(GtkActionableInterface*)cPtr).getActionName;
  }

  alias SetActionNameFuncType = extern(C) void function(GtkActionable* actionable, const(char)* actionName);

  @property SetActionNameFuncType setActionName()
  {
    return (cast(GtkActionableInterface*)cPtr).setActionName;
  }

  alias GetActionTargetValueFuncType = extern(C) VariantC* function(GtkActionable* actionable);

  @property GetActionTargetValueFuncType getActionTargetValue()
  {
    return (cast(GtkActionableInterface*)cPtr).getActionTargetValue;
  }

  alias SetActionTargetValueFuncType = extern(C) void function(GtkActionable* actionable, VariantC* targetValue);

  @property SetActionTargetValueFuncType setActionTargetValue()
  {
    return (cast(GtkActionableInterface*)cPtr).setActionTargetValue;
  }
}
