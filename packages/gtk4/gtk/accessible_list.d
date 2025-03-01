module gtk.accessible_list;

import gid.global;
import gobject.boxed;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
 * A boxed type which wraps a list of references to GtkAccessible objects.
 */
class AccessibleList : Boxed
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_accessible_list_get_type != &gidSymbolNotFound ? gtk_accessible_list_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Allocates a new list of accessible instances.
   * Params:
   *   accessibles = array of GtkAccessible
   * Returns: the newly created list of accessible instances
   */
  static AccessibleList newFromArray(Accessible[] accessibles)
  {
    GtkAccessibleList* _cretval;
    size_t _nAccessibles;
    if (accessibles)
      _nAccessibles = cast(size_t)accessibles.length;

    GtkAccessible*[] _tmpaccessibles;
    foreach (obj; accessibles)
      _tmpaccessibles ~= obj ? cast(GtkAccessible*)(cast(ObjectG)obj).cPtr : null;
    GtkAccessible** _accessibles = _tmpaccessibles.ptr;
    _cretval = gtk_accessible_list_new_from_array(_accessibles, _nAccessibles);
    auto _retval = _cretval ? new AccessibleList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Allocates a new `GtkAccessibleList`, doing a shallow copy of the
   * passed list of `GtkAccessible` instances.
   * Params:
   *   list = a reference to a `GList` containing a list of accessible values
   * Returns: the list of accessible instances
   */
  static AccessibleList newFromList(Accessible[] list)
  {
    GtkAccessibleList* _cretval;
    auto _list = gListFromD!(Accessible)(list);
    scope(exit) containerFree!(GList*, Accessible, GidOwnership.None)(_list);
    _cretval = gtk_accessible_list_new_from_list(_list);
    auto _retval = _cretval ? new AccessibleList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Gets the list of objects this boxed type holds
   * Returns: a shallow copy of the objects
   */
  Accessible[] getObjects()
  {
    GList* _cretval;
    _cretval = gtk_accessible_list_get_objects(cast(GtkAccessibleList*)cPtr);
    auto _retval = gListToD!(Accessible, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }
}
