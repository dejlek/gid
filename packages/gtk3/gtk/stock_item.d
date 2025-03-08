module gtk.stock_item;

import gdk.types;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/** */
class StockItem
{
  GtkStockItem cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.StockItem");

    cInstance = *cast(GtkStockItem*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string stockId()
  {
    return (cast(GtkStockItem*)cPtr).stockId.fromCString(No.free);
  }

  @property void stockId(string propval)
  {
    safeFree(cast(void*)(cast(GtkStockItem*)cPtr).stockId);
    (cast(GtkStockItem*)cPtr).stockId = propval.toCString(Yes.alloc);
  }

  @property string label()
  {
    return (cast(GtkStockItem*)cPtr).label.fromCString(No.free);
  }

  @property void label(string propval)
  {
    safeFree(cast(void*)(cast(GtkStockItem*)cPtr).label);
    (cast(GtkStockItem*)cPtr).label = propval.toCString(Yes.alloc);
  }

  @property gdk.types.ModifierType modifier()
  {
    return cast(gdk.types.ModifierType)(cast(GtkStockItem*)cPtr).modifier;
  }

  @property void modifier(gdk.types.ModifierType propval)
  {
    (cast(GtkStockItem*)cPtr).modifier = cast(GdkModifierType)propval;
  }

  @property uint keyval()
  {
    return (cast(GtkStockItem*)cPtr).keyval;
  }

  @property void keyval(uint propval)
  {
    (cast(GtkStockItem*)cPtr).keyval = propval;
  }

  @property string translationDomain()
  {
    return (cast(GtkStockItem*)cPtr).translationDomain.fromCString(No.free);
  }

  @property void translationDomain(string propval)
  {
    safeFree(cast(void*)(cast(GtkStockItem*)cPtr).translationDomain);
    (cast(GtkStockItem*)cPtr).translationDomain = propval.toCString(Yes.alloc);
  }
}
