module gobject.type_info;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.type_value_table;
import gobject.types;

/**
 * This structure is used to provide the type system with the information
 * required to initialize and destruct $(LPAREN)finalize$(RPAREN) a type's class and
 * its instances.
 * The initialized structure is passed to the [GObject.Global.typeRegisterStatic] function
 * $(LPAREN)or is copied into the provided #GTypeInfo structure in the
 * [GObject.TypePlugin.completeTypeInfo]$(RPAREN). The type system will perform a deep
 * copy of this structure, so its memory does not need to be persistent
 * across invocation of [GObject.Global.typeRegisterStatic].
 */
class TypeInfoG
{
  GTypeInfo cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GObject.TypeInfoG");

    cInstance = *cast(GTypeInfo*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ushort classSize()
  {
    return (cast(GTypeInfo*)cPtr).classSize;
  }

  @property void classSize(ushort propval)
  {
    (cast(GTypeInfo*)cPtr).classSize = propval;
  }

  @property ushort instanceSize()
  {
    return (cast(GTypeInfo*)cPtr).instanceSize;
  }

  @property void instanceSize(ushort propval)
  {
    (cast(GTypeInfo*)cPtr).instanceSize = propval;
  }

  @property ushort nPreallocs()
  {
    return (cast(GTypeInfo*)cPtr).nPreallocs;
  }

  @property void nPreallocs(ushort propval)
  {
    (cast(GTypeInfo*)cPtr).nPreallocs = propval;
  }

  @property TypeValueTable valueTable()
  {
    return new TypeValueTable(cast(GTypeValueTable*)(cast(GTypeInfo*)cPtr).valueTable);
  }
}
