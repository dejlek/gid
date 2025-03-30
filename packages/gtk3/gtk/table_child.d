/// Module for [TableChild] class
module gtk.table_child;

import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/** */
class TableChild
{
  GtkTableChild cInstance;

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.TableChild");

    cInstance = *cast(GtkTableChild*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gtk.widget.Widget widget()
  {
    return cToD!(gtk.widget.Widget)(cast(void*)(cast(GtkTableChild*)cPtr).widget);
  }

  @property void widget(gtk.widget.Widget propval)
  {
    cValueFree!(gtk.widget.Widget)(cast(void*)(cast(GtkTableChild*)cPtr).widget);
    dToC(propval, cast(void*)&(cast(GtkTableChild*)cPtr).widget);
  }

  @property ushort leftAttach()
  {
    return (cast(GtkTableChild*)cPtr).leftAttach;
  }

  @property void leftAttach(ushort propval)
  {
    (cast(GtkTableChild*)cPtr).leftAttach = propval;
  }

  @property ushort rightAttach()
  {
    return (cast(GtkTableChild*)cPtr).rightAttach;
  }

  @property void rightAttach(ushort propval)
  {
    (cast(GtkTableChild*)cPtr).rightAttach = propval;
  }

  @property ushort topAttach()
  {
    return (cast(GtkTableChild*)cPtr).topAttach;
  }

  @property void topAttach(ushort propval)
  {
    (cast(GtkTableChild*)cPtr).topAttach = propval;
  }

  @property ushort bottomAttach()
  {
    return (cast(GtkTableChild*)cPtr).bottomAttach;
  }

  @property void bottomAttach(ushort propval)
  {
    (cast(GtkTableChild*)cPtr).bottomAttach = propval;
  }

  @property ushort xpadding()
  {
    return (cast(GtkTableChild*)cPtr).xpadding;
  }

  @property void xpadding(ushort propval)
  {
    (cast(GtkTableChild*)cPtr).xpadding = propval;
  }

  @property ushort ypadding()
  {
    return (cast(GtkTableChild*)cPtr).ypadding;
  }

  @property void ypadding(ushort propval)
  {
    (cast(GtkTableChild*)cPtr).ypadding = propval;
  }

  @property uint xexpand()
  {
    return (cast(GtkTableChild*)cPtr).xexpand;
  }

  @property void xexpand(uint propval)
  {
    (cast(GtkTableChild*)cPtr).xexpand = propval;
  }

  @property uint yexpand()
  {
    return (cast(GtkTableChild*)cPtr).yexpand;
  }

  @property void yexpand(uint propval)
  {
    (cast(GtkTableChild*)cPtr).yexpand = propval;
  }

  @property uint xshrink()
  {
    return (cast(GtkTableChild*)cPtr).xshrink;
  }

  @property void xshrink(uint propval)
  {
    (cast(GtkTableChild*)cPtr).xshrink = propval;
  }

  @property uint yshrink()
  {
    return (cast(GtkTableChild*)cPtr).yshrink;
  }

  @property void yshrink(uint propval)
  {
    (cast(GtkTableChild*)cPtr).yshrink = propval;
  }

  @property uint xfill()
  {
    return (cast(GtkTableChild*)cPtr).xfill;
  }

  @property void xfill(uint propval)
  {
    (cast(GtkTableChild*)cPtr).xfill = propval;
  }

  @property uint yfill()
  {
    return (cast(GtkTableChild*)cPtr).yfill;
  }

  @property void yfill(uint propval)
  {
    (cast(GtkTableChild*)cPtr).yfill = propval;
  }
}
