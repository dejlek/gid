module gtk.recent_chooser_mixin;

public import gtk.recent_chooser_iface_proxy;
public import gid.gid;
public import glib.error;
public import gobject.dclosure;
public import gobject.object;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.recent_filter;
public import gtk.recent_info;
public import gtk.types;

/**
    #GtkRecentChooser is an interface that can be implemented by widgets
  displaying the list of recently used files.  In GTK+, the main objects
  that implement this interface are #GtkRecentChooserWidget,
  #GtkRecentChooserDialog and #GtkRecentChooserMenu.
  
  Recently used files are supported since GTK+ 2.10.
*/
template RecentChooserT()
{

  /**
      Adds filter to the list of #GtkRecentFilter objects held by chooser.
    
    If no previous filter objects were defined, this function will call
    [gtk.recent_chooser.RecentChooser.setFilter].
    Params:
      filter =       a #GtkRecentFilter
  */
  override void addFilter(gtk.recent_filter.RecentFilter filter)
  {
    gtk_recent_chooser_add_filter(cast(GtkRecentChooser*)cPtr, filter ? cast(GtkRecentFilter*)filter.cPtr(No.dup) : null);
  }

  /**
      Gets the #GtkRecentInfo currently selected by chooser.
    Returns:     a #GtkRecentInfo.  Use [gtk.recent_info.RecentInfo.unref] when
        when you have finished using it.
  */
  override gtk.recent_info.RecentInfo getCurrentItem()
  {
    GtkRecentInfo* _cretval;
    _cretval = gtk_recent_chooser_get_current_item(cast(GtkRecentChooser*)cPtr);
    auto _retval = _cretval ? new gtk.recent_info.RecentInfo(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }

  /**
      Gets the URI currently selected by chooser.
    Returns:     a newly allocated string holding a URI.
  */
  override string getCurrentUri()
  {
    char* _cretval;
    _cretval = gtk_recent_chooser_get_current_uri(cast(GtkRecentChooser*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.free);
    return _retval;
  }

  /**
      Gets the #GtkRecentFilter object currently used by chooser to affect
    the display of the recently used resources.
    Returns:     a #GtkRecentFilter object.
  */
  override gtk.recent_filter.RecentFilter getFilter()
  {
    GtkRecentFilter* _cretval;
    _cretval = gtk_recent_chooser_get_filter(cast(GtkRecentChooser*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.recent_filter.RecentFilter)(cast(GtkRecentFilter*)_cretval, No.take);
    return _retval;
  }

  /**
      Gets the list of recently used resources in form of #GtkRecentInfo objects.
    
    The return value of this function is affected by the “sort-type” and
    “limit” properties of chooser.
    Returns:     A newly allocated
        list of #GtkRecentInfo objects.  You should
        use [gtk.recent_info.RecentInfo.unref] on every item of the list, and then free
        the list itself using [glib.list.List.free].
  */
  override gtk.recent_info.RecentInfo[] getItems()
  {
    GList* _cretval;
    _cretval = gtk_recent_chooser_get_items(cast(GtkRecentChooser*)cPtr);
    auto _retval = gListToD!(gtk.recent_info.RecentInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Gets the number of items returned by [gtk.recent_chooser.RecentChooser.getItems]
    and [gtk.recent_chooser.RecentChooser.getUris].
    Returns:     A positive integer, or -1 meaning that all items are
        returned.
  */
  override int getLimit()
  {
    int _retval;
    _retval = gtk_recent_chooser_get_limit(cast(GtkRecentChooser*)cPtr);
    return _retval;
  }

  /**
      Gets whether only local resources should be shown in the recently used
    resources selector.  See [gtk.recent_chooser.RecentChooser.setLocalOnly]
    Returns:     true if only local resources should be shown.
  */
  override bool getLocalOnly()
  {
    bool _retval;
    _retval = gtk_recent_chooser_get_local_only(cast(GtkRecentChooser*)cPtr);
    return _retval;
  }

  /**
      Gets whether chooser can select multiple items.
    Returns:     true if chooser can select more than one item.
  */
  override bool getSelectMultiple()
  {
    bool _retval;
    _retval = gtk_recent_chooser_get_select_multiple(cast(GtkRecentChooser*)cPtr);
    return _retval;
  }

  /**
      Retrieves whether chooser should show an icon near the resource.
    Returns:     true if the icons should be displayed, false otherwise.
  */
  override bool getShowIcons()
  {
    bool _retval;
    _retval = gtk_recent_chooser_get_show_icons(cast(GtkRecentChooser*)cPtr);
    return _retval;
  }

  /**
      Retrieves whether chooser should show the recently used resources that
    were not found.
    Returns:     true if the resources not found should be displayed, and
        false otheriwse.
  */
  override bool getShowNotFound()
  {
    bool _retval;
    _retval = gtk_recent_chooser_get_show_not_found(cast(GtkRecentChooser*)cPtr);
    return _retval;
  }

  /**
      Returns whether chooser should display recently used resources
    registered as private.
    Returns:     true if the recent chooser should show private items,
        false otherwise.
  */
  override bool getShowPrivate()
  {
    bool _retval;
    _retval = gtk_recent_chooser_get_show_private(cast(GtkRecentChooser*)cPtr);
    return _retval;
  }

  /**
      Gets whether chooser should display tooltips containing the full path
    of a recently user resource.
    Returns:     true if the recent chooser should show tooltips,
        false otherwise.
  */
  override bool getShowTips()
  {
    bool _retval;
    _retval = gtk_recent_chooser_get_show_tips(cast(GtkRecentChooser*)cPtr);
    return _retval;
  }

  /**
      Gets the value set by [gtk.recent_chooser.RecentChooser.setSortType].
    Returns:     the sorting order of the chooser.
  */
  override gtk.types.RecentSortType getSortType()
  {
    GtkRecentSortType _cretval;
    _cretval = gtk_recent_chooser_get_sort_type(cast(GtkRecentChooser*)cPtr);
    gtk.types.RecentSortType _retval = cast(gtk.types.RecentSortType)_cretval;
    return _retval;
  }

  /**
      Gets the URI of the recently used resources.
    
    The return value of this function is affected by the “sort-type” and “limit”
    properties of chooser.
    
    Since the returned array is null terminated, length may be null.
    Returns:     A newly allocated, null-terminated array of strings. Use
          [glib.global.strfreev] to free it.
  */
  override string[] getUris()
  {
    char** _cretval;
    size_t _cretlength;
    _cretval = gtk_recent_chooser_get_uris(cast(GtkRecentChooser*)cPtr, &_cretlength);
    string[] _retval;

    if (_cretval)
    {
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.free);
    }
    return _retval;
  }

  /**
      Gets the #GtkRecentFilter objects held by chooser.
    Returns:     A singly linked list
        of #GtkRecentFilter objects.  You
        should just free the returned list using [glib.slist.SList.free].
  */
  override gtk.recent_filter.RecentFilter[] listFilters()
  {
    GSList* _cretval;
    _cretval = gtk_recent_chooser_list_filters(cast(GtkRecentChooser*)cPtr);
    auto _retval = gSListToD!(gtk.recent_filter.RecentFilter, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Removes filter from the list of #GtkRecentFilter objects held by chooser.
    Params:
      filter =       a #GtkRecentFilter
  */
  override void removeFilter(gtk.recent_filter.RecentFilter filter)
  {
    gtk_recent_chooser_remove_filter(cast(GtkRecentChooser*)cPtr, filter ? cast(GtkRecentFilter*)filter.cPtr(No.dup) : null);
  }

  /**
      Selects all the items inside chooser, if the chooser supports
    multiple selection.
  */
  override void selectAll()
  {
    gtk_recent_chooser_select_all(cast(GtkRecentChooser*)cPtr);
  }

  /**
      Selects uri inside chooser.
    Params:
      uri =       a URI
    Returns:     true if uri was found.
  */
  override bool selectUri(string uri)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.alloc);
    GError *_err;
    _retval = gtk_recent_chooser_select_uri(cast(GtkRecentChooser*)cPtr, _uri, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
      Sets uri as the current URI for chooser.
    Params:
      uri =       a URI
    Returns:     true if the URI was found.
  */
  override bool setCurrentUri(string uri)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.alloc);
    GError *_err;
    _retval = gtk_recent_chooser_set_current_uri(cast(GtkRecentChooser*)cPtr, _uri, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
      Sets filter as the current #GtkRecentFilter object used by chooser
    to affect the displayed recently used resources.
    Params:
      filter =       a #GtkRecentFilter
  */
  override void setFilter(gtk.recent_filter.RecentFilter filter = null)
  {
    gtk_recent_chooser_set_filter(cast(GtkRecentChooser*)cPtr, filter ? cast(GtkRecentFilter*)filter.cPtr(No.dup) : null);
  }

  /**
      Sets the number of items that should be returned by
    [gtk.recent_chooser.RecentChooser.getItems] and [gtk.recent_chooser.RecentChooser.getUris].
    Params:
      limit =       a positive integer, or -1 for all items
  */
  override void setLimit(int limit)
  {
    gtk_recent_chooser_set_limit(cast(GtkRecentChooser*)cPtr, limit);
  }

  /**
      Sets whether only local resources, that is resources using the file:// URI
    scheme, should be shown in the recently used resources selector.  If
    local_only is true (the default) then the shown resources are guaranteed
    to be accessible through the operating system native file system.
    Params:
      localOnly =       true if only local files can be shown
  */
  override void setLocalOnly(bool localOnly)
  {
    gtk_recent_chooser_set_local_only(cast(GtkRecentChooser*)cPtr, localOnly);
  }

  /**
      Sets whether chooser can select multiple items.
    Params:
      selectMultiple =       true if chooser can select more than one item
  */
  override void setSelectMultiple(bool selectMultiple)
  {
    gtk_recent_chooser_set_select_multiple(cast(GtkRecentChooser*)cPtr, selectMultiple);
  }

  /**
      Sets whether chooser should show an icon near the resource when
    displaying it.
    Params:
      showIcons =       whether to show an icon near the resource
  */
  override void setShowIcons(bool showIcons)
  {
    gtk_recent_chooser_set_show_icons(cast(GtkRecentChooser*)cPtr, showIcons);
  }

  /**
      Sets whether chooser should display the recently used resources that
    it didn’t find.  This only applies to local resources.
    Params:
      showNotFound =       whether to show the local items we didn’t find
  */
  override void setShowNotFound(bool showNotFound)
  {
    gtk_recent_chooser_set_show_not_found(cast(GtkRecentChooser*)cPtr, showNotFound);
  }

  /**
      Whether to show recently used resources marked registered as private.
    Params:
      showPrivate =       true to show private items, false otherwise
  */
  override void setShowPrivate(bool showPrivate)
  {
    gtk_recent_chooser_set_show_private(cast(GtkRecentChooser*)cPtr, showPrivate);
  }

  /**
      Sets whether to show a tooltips containing the full path of each
    recently used resource in a #GtkRecentChooser widget.
    Params:
      showTips =       true if tooltips should be shown
  */
  override void setShowTips(bool showTips)
  {
    gtk_recent_chooser_set_show_tips(cast(GtkRecentChooser*)cPtr, showTips);
  }

  /**
      Sets the comparison function used when sorting to be sort_func.  If
    the chooser has the sort type set to #GTK_RECENT_SORT_CUSTOM then
    the chooser will sort using this function.
    
    To the comparison function will be passed two #GtkRecentInfo structs and
    sort_data;  sort_func should return a positive integer if the first
    item comes before the second, zero if the two items are equal and
    a negative integer if the first item comes after the second.
    Params:
      sortFunc =       the comparison function
  */
  override void setSortFunc(gtk.types.RecentSortFunc sortFunc)
  {
    extern(C) int _sortFuncCallback(GtkRecentInfo* a, GtkRecentInfo* b, void* userData)
    {
      auto _dlg = cast(gtk.types.RecentSortFunc*)userData;

      int _retval = (*_dlg)(a ? new gtk.recent_info.RecentInfo(cast(void*)a, No.take) : null, b ? new gtk.recent_info.RecentInfo(cast(void*)b, No.take) : null);
      return _retval;
    }
    auto _sortFuncCB = sortFunc ? &_sortFuncCallback : null;

    auto _sortFunc = sortFunc ? freezeDelegate(cast(void*)&sortFunc) : null;
    GDestroyNotify _sortFuncDestroyCB = sortFunc ? &thawDelegate : null;
    gtk_recent_chooser_set_sort_func(cast(GtkRecentChooser*)cPtr, _sortFuncCB, _sortFunc, _sortFuncDestroyCB);
  }

  /**
      Changes the sorting order of the recently used resources list displayed by
    chooser.
    Params:
      sortType =       sort order that the chooser should use
  */
  override void setSortType(gtk.types.RecentSortType sortType)
  {
    gtk_recent_chooser_set_sort_type(cast(GtkRecentChooser*)cPtr, sortType);
  }

  /**
      Unselects all the items inside chooser.
  */
  override void unselectAll()
  {
    gtk_recent_chooser_unselect_all(cast(GtkRecentChooser*)cPtr);
  }

  /**
      Unselects uri inside chooser.
    Params:
      uri =       a URI
  */
  override void unselectUri(string uri)
  {
    const(char)* _uri = uri.toCString(No.alloc);
    gtk_recent_chooser_unselect_uri(cast(GtkRecentChooser*)cPtr, _uri);
  }

  /**
      This signal is emitted when the user "activates" a recent item
    in the recent chooser.  This can happen by double-clicking on an item
    in the recently used resources list, or by pressing
    `Enter`.
  
    ## Parameters
    $(LIST
      * $(B recentChooser) the instance the signal is connected to
    )
  */
  alias ItemActivatedCallbackDlg = void delegate(gtk.recent_chooser.RecentChooser recentChooser);

  /** ditto */
  alias ItemActivatedCallbackFunc = void function(gtk.recent_chooser.RecentChooser recentChooser);

  /**
    Connect to ItemActivated signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectItemActivated(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ItemActivatedCallbackDlg) || is(T : ItemActivatedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto recentChooser = getVal!(gtk.recent_chooser.RecentChooser)(_paramVals);
      _dClosure.dlg(recentChooser);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("item-activated", closure, after);
  }

  /**
      This signal is emitted when there is a change in the set of
    selected recently used resources.  This can happen when a user
    modifies the selection with the mouse or the keyboard, or when
    explicitly calling functions to change the selection.
  
    ## Parameters
    $(LIST
      * $(B recentChooser) the instance the signal is connected to
    )
  */
  alias SelectionChangedCallbackDlg = void delegate(gtk.recent_chooser.RecentChooser recentChooser);

  /** ditto */
  alias SelectionChangedCallbackFunc = void function(gtk.recent_chooser.RecentChooser recentChooser);

  /**
    Connect to SelectionChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectSelectionChanged(T)(T callback, Flag!"after" after = No.after)
  if (is(T : SelectionChangedCallbackDlg) || is(T : SelectionChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto recentChooser = getVal!(gtk.recent_chooser.RecentChooser)(_paramVals);
      _dClosure.dlg(recentChooser);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("selection-changed", closure, after);
  }
}
