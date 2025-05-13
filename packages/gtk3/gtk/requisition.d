/// Module for [Requisition] class
module gtk.requisition;

import gid.gid;
import gobject.boxed;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    A #GtkRequisition-struct represents the desired size of a widget. See
    [GtkWidget’s geometry management section][geometry-management] for
    more information.
*/
class Requisition : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
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
    return cast(void function())gtk_requisition_get_type != &gidSymbolNotFound ? gtk_requisition_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Requisition self()
  {
    return this;
  }

  /**
      Get `width` field.
      Returns: the widget’s desired width
  */
  @property int width()
  {
    return (cast(GtkRequisition*)this._cPtr).width;
  }

  /**
      Set `width` field.
      Params:
        propval = the widget’s desired width
  */
  @property void width(int propval)
  {
    (cast(GtkRequisition*)this._cPtr).width = propval;
  }

  /**
      Get `height` field.
      Returns: the widget’s desired height
  */
  @property int height()
  {
    return (cast(GtkRequisition*)this._cPtr).height;
  }

  /**
      Set `height` field.
      Params:
        propval = the widget’s desired height
  */
  @property void height(int propval)
  {
    (cast(GtkRequisition*)this._cPtr).height = propval;
  }

  /**
      Allocates a new #GtkRequisition-struct and initializes its elements to zero.
      Returns: a new empty #GtkRequisition. The newly allocated #GtkRequisition should
          be freed with [gtk.requisition.Requisition.free].
  */
  this()
  {
    GtkRequisition* _cretval;
    _cretval = gtk_requisition_new();
    this(_cretval, Yes.Take);
  }

  /**
      Copies a #GtkRequisition.
      Returns: a copy of requisition
  */
  gtk.requisition.Requisition copy()
  {
    GtkRequisition* _cretval;
    _cretval = gtk_requisition_copy(cast(const(GtkRequisition)*)this._cPtr);
    auto _retval = _cretval ? new gtk.requisition.Requisition(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
