//!repo Gio-2.0

//# Rename Application to ApplicationGio to avoid conflicts with Gtk.Application
//!subdtype Application ApplicationGio

//!set record[IOExtension][disable] 1
//!set record[IOExtensionPoint][disable] 1

//# DataInputStream.read_byte() conflicts with parent BufferedInputStream.read_byte()
//!set class[DataInputStream].method[read_byte][name] read_byte_data

//# Add missing closure designation
//!set callback[AsyncReadyCallback].parameters.parameter[data][closure] 2

//# Set return/param arrays to be zero-terminated=1
//!set callback[DBusSubtreeIntrospectFunc].return-value.array[][zero-terminated] 1
//!set class[Application].method[add_main_option_entries].parameters.parameter[entries].array[][zero-terminated] 1
//!set record[DBusAnnotationInfo].function[lookup].parameters.parameter[annotations].array[][zero-terminated] 1
//!set class[DBusMessage].method[get_header_fields].return-value.array[][zero-terminated] 1
//!set class[DataInputStream].method[read_line].return-value.array[][zero-terminated] 1
//!set class[DataInputStream].method[read_line_finish].return-value.array[][zero-terminated] 1
//!set class[InetAddress].constructor[new_from_bytes].parameters.parameter[bytes].array[][zero-terminated] 1
//!set function[dbus_escape_object_path_bytestring].parameters.parameter[bytes].array[][zero-terminated] 1
//!set function[dbus_unescape_object_path].return-value.array[][zero-terminated] 1

//# Set field arrays to be zero-terminated=1
//!set record[DBusAnnotationInfo].field[annotations].array[][zero-terminated] 1
//!set record[DBusArgInfo].field[annotations].array[][zero-terminated] 1
//!set record[DBusInterfaceInfo].field[methods].array[][zero-terminated] 1
//!set record[DBusInterfaceInfo].field[signals].array[][zero-terminated] 1
//!set record[DBusInterfaceInfo].field[properties].array[][zero-terminated] 1
//!set record[DBusInterfaceInfo].field[annotations].array[][zero-terminated] 1
//!set record[DBusMethodInfo].field[in_args].array[][zero-terminated] 1
//!set record[DBusMethodInfo].field[out_args].array[][zero-terminated] 1
//!set record[DBusMethodInfo].field[annotations].array[][zero-terminated] 1
//!set record[DBusNodeInfo].field[interfaces].array[][zero-terminated] 1
//!set record[DBusNodeInfo].field[nodes].array[][zero-terminated] 1
//!set record[DBusNodeInfo].field[annotations].array[][zero-terminated] 1
//!set record[DBusPropertyInfo].field[annotations].array[][zero-terminated] 1
//!set record[DBusSignalInfo].field[args].array[][zero-terminated] 1
//!set record[DBusSignalInfo].field[annotations].array[][zero-terminated] 1

//# Set parameters to out
//!set callback[DBusSubtreeDispatchFunc].parameters.parameter[out_user_data][direction] out

//!class ListModel

  /**
   * Get the item at position and cast to the template type.
   * NOTE: If type is an interface and no known D object is found that the object conforms to,
   * the interface IfaceProxy object will be used.
   * If position is greater than the number of items in list, %NULL is
   * returned.
   * %NULL may be returned if index is smaller than the length
   * of the list, but the object does not conform to the template type.
   * This function is meant to be used by language bindings in place
   * of [Gio.ListModel.getItem].
   * See also: [Gio.ListModel.getNItems]
   * Params:
   *   T = type to cast the resulting object to (can be an interface type)
   *   position = the position of the item to fetch
   * Returns: the object at position.
   */
  T getItem(T)(uint position)
  {
    auto gobj = cast(ObjectC*)g_list_model_get_object(cast(GListModel*)(cast(ObjectG)this).cPtr, position);
    return ObjectG.getDObject!T(gobj, Yes.Take);
  }

//# Disable ListStore.findWithEqualFuncFull with unnecessary additional user_data
//!set class[ListStore].method[find_with_equal_func_full][disable] 1

//# Override to use delegates with ObjectG arguments
//!set class[ListStore].method[find_with_equal_func][disable] 1
//!set class[ListStore].method[insert_sorted][disable] 1
//!set class[ListStore].method[sort][disable] 1
//!class ListStore

  //# Override findWithEqualFunc to handle ObjectG parameters instead of ObjectC pointers
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
