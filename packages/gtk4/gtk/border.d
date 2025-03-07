module gtk.border;

import gid.gid;
import gobject.boxed;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    A struct that specifies a border around a rectangular area.
  
  Each side can have different width.
*/
class Border : gobject.boxed.Boxed
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_border_get_type != &gidSymbolNotFound ? gtk_border_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  @property short left()
  {
    return (cast(GtkBorder*)cPtr).left;
  }

  @property void left(short propval)
  {
    (cast(GtkBorder*)cPtr).left = propval;
  }

  @property short right()
  {
    return (cast(GtkBorder*)cPtr).right;
  }

  @property void right(short propval)
  {
    (cast(GtkBorder*)cPtr).right = propval;
  }

  @property short top()
  {
    return (cast(GtkBorder*)cPtr).top;
  }

  @property void top(short propval)
  {
    (cast(GtkBorder*)cPtr).top = propval;
  }

  @property short bottom()
  {
    return (cast(GtkBorder*)cPtr).bottom;
  }

  @property void bottom(short propval)
  {
    (cast(GtkBorder*)cPtr).bottom = propval;
  }

  /**
      Allocates a new [gtk.border.Border] struct and initializes its elements to zero.
    Returns:     a newly allocated [gtk.border.Border] struct.
       Free with [gtk.border.Border.free]
  */
  this()
  {
    GtkBorder* _cretval;
    _cretval = gtk_border_new();
    this(_cretval, Yes.Take);
  }

  /**
      Copies a [gtk.border.Border].
    Returns:     a copy of border_.
  */
  gtk.border.Border copy()
  {
    GtkBorder* _cretval;
    _cretval = gtk_border_copy(cast(const(GtkBorder)*)cPtr);
    auto _retval = _cretval ? new gtk.border.Border(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
