module gtk.target_entry;

import gid.gid;
import gobject.boxed;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    A #GtkTargetEntry represents a single type of
  data than can be supplied for by a widget for a selection
  or for supplied or received during drag-and-drop.
*/
class TargetEntry : gobject.boxed.Boxed
{

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
    return cast(void function())gtk_target_entry_get_type != &gidSymbolNotFound ? gtk_target_entry_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  @property string target()
  {
    return (cast(GtkTargetEntry*)cPtr).target.fromCString(No.free);
  }

  @property void target(string propval)
  {
    safeFree(cast(void*)(cast(GtkTargetEntry*)cPtr).target);
    (cast(GtkTargetEntry*)cPtr).target = propval.toCString(Yes.alloc);
  }

  @property uint flags()
  {
    return (cast(GtkTargetEntry*)cPtr).flags;
  }

  @property void flags(uint propval)
  {
    (cast(GtkTargetEntry*)cPtr).flags = propval;
  }

  @property uint info()
  {
    return (cast(GtkTargetEntry*)cPtr).info;
  }

  @property void info(uint propval)
  {
    (cast(GtkTargetEntry*)cPtr).info = propval;
  }

  /**
      Makes a new #GtkTargetEntry.
    Params:
      target =       String identifier for target
      flags =       Set of flags, see #GtkTargetFlags
      info =       an ID that will be passed back to the application
    Returns:     a pointer to a new #GtkTargetEntry.
          Free with [gtk.target_entry.TargetEntry.free]
  */
  this(string target, uint flags, uint info)
  {
    GtkTargetEntry* _cretval;
    const(char)* _target = target.toCString(No.alloc);
    _cretval = gtk_target_entry_new(_target, flags, info);
    this(_cretval, Yes.take);
  }

  /**
      Makes a copy of a #GtkTargetEntry and its data.
    Returns:     a pointer to a copy of data.
          Free with [gtk.target_entry.TargetEntry.free]
  */
  gtk.target_entry.TargetEntry copy()
  {
    GtkTargetEntry* _cretval;
    _cretval = gtk_target_entry_copy(cast(GtkTargetEntry*)cPtr);
    auto _retval = _cretval ? new gtk.target_entry.TargetEntry(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }
}
