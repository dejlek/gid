module gio.list_store;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.list_model;
import gio.list_model_mixin;
import gio.types;
import gobject.object;
import gobject.types;

/**
    [gio.list_store.ListStore] is a simple implementation of [gio.list_model.ListModel] that stores
  all items in memory.
  
  It provides insertions, deletions, and lookups in logarithmic time
  with a fast path for the common case of iterating the list linearly.
*/
class ListStore : gobject.object.ObjectG, gio.list_model.ListModel
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_list_store_get_type != &gidSymbolNotFound ? g_list_store_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin ListModelT!();

  /**
  * Looks up the given item in the list store by looping over the items and
  * comparing them with equal_func until the first occurrence of item which
  * matches. If item was not found, then position will not be set, and this
  * method will return %FALSE.
  * item is always passed as second parameter to equal_func.
  * Since GLib 2.76 it is possible to pass `NULL` for item.
  * Params:
  *   item = an item
  *   equalFunc = A custom equality check function
  *   position = the first position of item, if it was found.
  * Returns: Whether store contains item. If it was found, position will be
  *   set to the position where item occurred for the first time.
  */
  bool findWithEqualFunc(ObjectG item, bool delegate(ObjectG, ObjectG) equalFunc, out uint position)
  {
    static bool delegate(ObjectG, ObjectG) _static_equalFunc;

    extern(C) bool _equalFuncCallback(const(void)* a, const(void)* b)
    {
      bool _retval = _static_equalFunc(getDObject!ObjectG(cast(void*)a), getDObject!ObjectG(cast(void*)b));
      return _retval;
    }

    _static_equalFunc = equalFunc;
    bool _retval;
    _retval = g_list_store_find_with_equal_func(cast(GListStore*)cPtr, item ? cast(ObjectC*)item.cPtr : null, &_equalFuncCallback, cast(uint*)&position);
    _static_equalFunc = null;
    return _retval;
  }

  /**
  * Inserts item into store at a position to be determined by the
  * compare_func.
  * The list must already be sorted before calling this function or the
  * result is undefined.  Usually you would approach this by only ever
  * inserting items by way of this function.
  * This function takes a ref on item.
  * Params:
  *   item = the new item
  *   compareFunc = pairwise comparison function for sorting
  * Returns: the position at which item was inserted
  */
  uint insertSorted(ObjectG item, int delegate(ObjectG, ObjectG) compareFunc)
  {
    static int delegate(ObjectG, ObjectG) _static_compareFunc;

    extern(C) int _compareFuncCallback(const(void)* a, const(void)* b, void* userData)
    {
      int _retval = _static_compareFunc(getDObject!ObjectG(cast(void*)a), getDObject!ObjectG(cast(void*)b));
      return _retval;
    }

    _static_compareFunc = compareFunc;
    uint _retval;
    _retval = g_list_store_insert_sorted(cast(GListStore*)cPtr, item ? cast(ObjectC*)item.cPtr : null, &_compareFuncCallback, null);
    _static_compareFunc = null;
    return _retval;
  }

  /**
  * Sort the items in store according to compare_func.
  * Params:
  *   compareFunc = pairwise comparison function for sorting
  */
  void sort(int delegate(ObjectG, ObjectG) compareFunc)
  {
    static int delegate(ObjectG, ObjectG) _static_compareFunc;

    extern(C) int _compareFuncCallback(const(void)* a, const(void)* b, void* userData)
    {
      int _retval = _static_compareFunc(getDObject!ObjectG(cast(void*)a), getDObject!ObjectG(cast(void*)b));
      return _retval;
    }

    _static_compareFunc = compareFunc;
    g_list_store_sort(cast(GListStore*)cPtr, &_compareFuncCallback, null);
    _static_compareFunc = null;
  }

  /**
      Creates a new #GListStore with items of type item_type. item_type
    must be a subclass of #GObject.
    Params:
      itemType =       the #GType of items in the list
    Returns:     a new #GListStore
  */
  this(gobject.types.GType itemType)
  {
    GListStore* _cretval;
    _cretval = g_list_store_new(itemType);
    this(_cretval, Yes.Take);
  }

  /**
      Appends item to store. item must be of type #GListStore:item-type.
    
    This function takes a ref on item.
    
    Use [gio.list_store.ListStore.splice] to append multiple items at the same time
    efficiently.
    Params:
      item =       the new item
  */
  void append(gobject.object.ObjectG item)
  {
    g_list_store_append(cast(GListStore*)cPtr, item ? cast(ObjectC*)item.cPtr(No.Dup) : null);
  }

  /**
      Looks up the given item in the list store by looping over the items until
    the first occurrence of item. If item was not found, then position will
    not be set, and this method will return false.
    
    If you need to compare the two items with a custom comparison function, use
    [gio.list_store.ListStore.findWithEqualFunc] with a custom #GEqualFunc instead.
    Params:
      item =       an item
      position =       the first position of item, if it was found.
    Returns:     Whether store contains item. If it was found, position will be
      set to the position where item occurred for the first time.
  */
  bool find(gobject.object.ObjectG item, out uint position)
  {
    bool _retval;
    _retval = g_list_store_find(cast(GListStore*)cPtr, item ? cast(ObjectC*)item.cPtr(No.Dup) : null, cast(uint*)&position);
    return _retval;
  }

  /**
      Inserts item into store at position. item must be of type
    #GListStore:item-type or derived from it. position must be smaller
    than the length of the list, or equal to it to append.
    
    This function takes a ref on item.
    
    Use [gio.list_store.ListStore.splice] to insert multiple items at the same time
    efficiently.
    Params:
      position =       the position at which to insert the new item
      item =       the new item
  */
  void insert(uint position, gobject.object.ObjectG item)
  {
    g_list_store_insert(cast(GListStore*)cPtr, position, item ? cast(ObjectC*)item.cPtr(No.Dup) : null);
  }

  /**
      Removes the item from store that is at position. position must be
    smaller than the current length of the list.
    
    Use [gio.list_store.ListStore.splice] to remove multiple items at the same time
    efficiently.
    Params:
      position =       the position of the item that is to be removed
  */
  void remove(uint position)
  {
    g_list_store_remove(cast(GListStore*)cPtr, position);
  }

  /**
      Removes all items from store.
  */
  void removeAll()
  {
    g_list_store_remove_all(cast(GListStore*)cPtr);
  }

  /**
      Changes store by removing n_removals items and adding n_additions
    items to it. additions must contain n_additions items of type
    #GListStore:item-type.  null is not permitted.
    
    This function is more efficient than [gio.list_store.ListStore.insert] and
    [gio.list_store.ListStore.remove], because it only emits
    #GListModel::items-changed once for the change.
    
    This function takes a ref on each item in additions.
    
    The parameters position and n_removals must be correct (ie:
    position + n_removals must be less than or equal to the length of
    the list at the time this function is called).
    Params:
      position =       the position at which to make the change
      nRemovals =       the number of items to remove
      additions =       the items to add
  */
  void splice(uint position, uint nRemovals, gobject.object.ObjectG[] additions)
  {
    uint _nAdditions;
    if (additions)
      _nAdditions = cast(uint)additions.length;

    ObjectC*[] _tmpadditions;
    foreach (obj; additions)
      _tmpadditions ~= obj ? cast(ObjectC*)obj.cPtr : null;
    void** _additions = cast(void**)_tmpadditions.ptr;
    g_list_store_splice(cast(GListStore*)cPtr, position, nRemovals, _additions, _nAdditions);
  }
}
