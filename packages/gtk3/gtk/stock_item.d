/// Module for [StockItem] class
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

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.StockItem");

    cInstance = *cast(GtkStockItem*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property string stockId()
  {
    return cToD!(string)(cast(void*)(cast(GtkStockItem*)cPtr).stockId);
  }

  @property void stockId(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkStockItem*)cPtr).stockId);
    dToC(propval, cast(void*)&(cast(GtkStockItem*)cPtr).stockId);
  }

  @property string label()
  {
    return cToD!(string)(cast(void*)(cast(GtkStockItem*)cPtr).label);
  }

  @property void label(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkStockItem*)cPtr).label);
    dToC(propval, cast(void*)&(cast(GtkStockItem*)cPtr).label);
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
    return cToD!(string)(cast(void*)(cast(GtkStockItem*)cPtr).translationDomain);
  }

  @property void translationDomain(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GtkStockItem*)cPtr).translationDomain);
    dToC(propval, cast(void*)&(cast(GtkStockItem*)cPtr).translationDomain);
  }
}
