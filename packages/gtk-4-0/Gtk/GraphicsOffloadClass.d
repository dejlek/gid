module Gtk.GraphicsOffloadClass;

import Gid.gid;
import Gtk.Types;
import Gtk.WidgetClass;
import Gtk.c.functions;
import Gtk.c.types;

class GraphicsOffloadClass
{
  GtkGraphicsOffloadClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.GraphicsOffloadClass");

    cInstance = *cast(GtkGraphicsOffloadClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property WidgetClass parentClass()
  {
    return new WidgetClass(cast(GtkWidgetClass*)&(cast(GtkGraphicsOffloadClass*)cPtr).parentClass);
  }
}
