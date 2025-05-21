/// Module for [Border] class
module gtk.border;

import gid.gid;
import gobject.boxed;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    A struct that specifies a border around a rectangular area
    that can be of different width on each side.
*/
class Border : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_border_get_type != &gidSymbolNotFound ? gtk_border_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Border self()
  {
    return this;
  }

  /**
      Get `left` field.
      Returns: The width of the left border
  */
  @property short left()
  {
    return (cast(GtkBorder*)this._cPtr).left;
  }

  /**
      Set `left` field.
      Params:
        propval = The width of the left border
  */
  @property void left(short propval)
  {
    (cast(GtkBorder*)this._cPtr).left = propval;
  }

  /**
      Get `right` field.
      Returns: The width of the right border
  */
  @property short right()
  {
    return (cast(GtkBorder*)this._cPtr).right;
  }

  /**
      Set `right` field.
      Params:
        propval = The width of the right border
  */
  @property void right(short propval)
  {
    (cast(GtkBorder*)this._cPtr).right = propval;
  }

  /**
      Get `top` field.
      Returns: The width of the top border
  */
  @property short top()
  {
    return (cast(GtkBorder*)this._cPtr).top;
  }

  /**
      Set `top` field.
      Params:
        propval = The width of the top border
  */
  @property void top(short propval)
  {
    (cast(GtkBorder*)this._cPtr).top = propval;
  }

  /**
      Get `bottom` field.
      Returns: The width of the bottom border
  */
  @property short bottom()
  {
    return (cast(GtkBorder*)this._cPtr).bottom;
  }

  /**
      Set `bottom` field.
      Params:
        propval = The width of the bottom border
  */
  @property void bottom(short propval)
  {
    (cast(GtkBorder*)this._cPtr).bottom = propval;
  }

  /**
      Allocates a new #GtkBorder-struct and initializes its elements to zero.
      Returns: a newly allocated #GtkBorder-struct.
         Free with [gtk.border.Border.free]
  */
  this()
  {
    GtkBorder* _cretval;
    _cretval = gtk_border_new();
    this(_cretval, Yes.Take);
  }

  /**
      Copies a #GtkBorder-struct.
      Returns: a copy of border_.
  */
  gtk.border.Border copy()
  {
    GtkBorder* _cretval;
    _cretval = gtk_border_copy(cast(const(GtkBorder)*)this._cPtr);
    auto _retval = _cretval ? new gtk.border.Border(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
