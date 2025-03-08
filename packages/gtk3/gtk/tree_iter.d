module gtk.tree_iter;

import gid.gid;
import gobject.boxed;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    The #GtkTreeIter is the primary structure
  for accessing a #GtkTreeModel. Models are expected to put a unique
  integer in the @stamp member, and put
  model-specific data in the three @user_data
  members.
*/
class TreeIter : gobject.boxed.Boxed
{

  this()
  {
    super(safeMalloc(GtkTreeIter.sizeof), Yes.take);
  }

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"dup" dup = No.dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_tree_iter_get_type != &gidSymbolNotFound ? gtk_tree_iter_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  @property int stamp()
  {
    return (cast(GtkTreeIter*)cPtr).stamp;
  }

  @property void stamp(int propval)
  {
    (cast(GtkTreeIter*)cPtr).stamp = propval;
  }

  /**
      Creates a dynamically allocated tree iterator as a copy of iter.
    
    This function is not intended for use in applications,
    because you can just copy the structs by value
    (`GtkTreeIter new_iter = iter;`).
    You must free this iter with [gtk.tree_iter.TreeIter.free].
    Returns:     a newly-allocated copy of iter
  */
  gtk.tree_iter.TreeIter copy()
  {
    GtkTreeIter* _cretval;
    _cretval = gtk_tree_iter_copy(cast(GtkTreeIter*)cPtr);
    auto _retval = _cretval ? new gtk.tree_iter.TreeIter(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }
}
