/// Module for [TargetPair] class
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

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gtk.target_pair.TargetPair");

    cInstance = *cast(GtkTargetPair*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Get `target` field.
      Returns: #GdkAtom representation of the target type
  */
  @property gdk.atom.Atom target()
  {
    return new gdk.atom.Atom(cast(GdkAtom*)&(cast(GtkTargetPair*)cPtr).target);
  }

  /**
      Get `flags` field.
      Returns: #GtkTargetFlags for DND
  */
  @property uint flags()
  {
    return (cast(GtkTargetPair*)cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = #GtkTargetFlags for DND
  */
  @property void flags(uint propval)
  {
    (cast(GtkTargetPair*)cPtr).flags = propval;
  }

  /**
      Get `info` field.
      Returns: an application-assigned integer ID which will
          get passed as a parameter to e.g the #GtkWidget::selection-get
          signal. It allows the application to identify the target
          type without extensive string compares.
  */
  @property uint info()
  {
    return (cast(GtkTargetPair*)cPtr).info;
  }

  /**
      Set `info` field.
      Params:
        propval = an application-assigned integer ID which will
            get passed as a parameter to e.g the #GtkWidget::selection-get
            signal. It allows the application to identify the target
            type without extensive string compares.
  */
  @property void info(uint propval)
  {
    (cast(GtkTargetPair*)cPtr).info = propval;
  }
}
