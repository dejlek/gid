module gtksource.indenter_interface;

import gid.gid;
import gobject.type_interface;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/**
 * The virtual function table for #GtkSourceIndenter.
 */
class IndenterInterface
{
  GtkSourceIndenterInterface cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GtkSource.IndenterInterface");

    cInstance = *cast(GtkSourceIndenterInterface*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property TypeInterface parentIface()
  {
    return new TypeInterface(cast(GTypeInterface*)&(cast(GtkSourceIndenterInterface*)cPtr).parentIface);
  }

  alias IsTriggerFuncType = extern(C) bool function(GtkSourceIndenter* self, GtkSourceView* view, const(GtkTextIter)* location, GdkModifierType state, uint keyval);

  @property IsTriggerFuncType isTrigger()
  {
    return (cast(GtkSourceIndenterInterface*)cPtr).isTrigger;
  }

  alias IndentFuncType = extern(C) void function(GtkSourceIndenter* self, GtkSourceView* view, GtkTextIter* iter);

  @property IndentFuncType indent()
  {
    return (cast(GtkSourceIndenterInterface*)cPtr).indent;
  }
}
