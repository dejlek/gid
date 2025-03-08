module gtk.target_pair;

import gdk.atom;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    A #GtkTargetPair is used to represent the same
  information as a table of #GtkTargetEntry, but in
  an efficient form.
*/
class TargetPair
{
  GtkTargetPair cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.TargetPair");

    cInstance = *cast(GtkTargetPair*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gdk.atom.Atom target()
  {
    return new gdk.atom.Atom(cast(GdkAtom*)&(cast(GtkTargetPair*)cPtr).target);
  }

  @property uint flags()
  {
    return (cast(GtkTargetPair*)cPtr).flags;
  }

  @property void flags(uint propval)
  {
    (cast(GtkTargetPair*)cPtr).flags = propval;
  }

  @property uint info()
  {
    return (cast(GtkTargetPair*)cPtr).info;
  }

  @property void info(uint propval)
  {
    (cast(GtkTargetPair*)cPtr).info = propval;
  }
}
