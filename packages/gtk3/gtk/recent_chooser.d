module gtk.recent_chooser;

public import gtk.recent_chooser_iface_proxy;
import gid.gid;
import glib.error;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.recent_filter;
import gtk.recent_info;
import gtk.types;

/**
    #GtkRecentChooser is an interface that can be implemented by widgets
  displaying the list of recently used files.  In GTK+, the main objects
  that implement this interface are #GtkRecentChooserWidget,
  #GtkRecentChooserDialog and #GtkRecentChooserMenu.
  
  Recently used files are supported since GTK+ 2.10.
*/
interface RecentChooser
{

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_recent_chooser_get_type != &gidSymbolNotFound ? gtk_recent_chooser_get_type() : cast(GType)0;
  }

  /**
      Adds filter to the list of #GtkRecentFilter objects held by chooser.
    
    If no previous filter objects were defined, this function will call
    [gtk.recent_chooser.RecentChooser.setFilter].
    Params:
      filter =       a #GtkRecentFilter
  */
  void addFilter(gtk.recent_filter.RecentFilter filter);

  /**
      Gets the #GtkRecentInfo currently selected by chooser.
    Returns:     a #GtkRecentInfo.  Use [gtk.recent_info.RecentInfo.unref] when
        when you have finished using it.
  */
  gtk.recent_info.RecentInfo getCurrentItem();

  /**
      Gets the URI currently selected by chooser.
    Returns:     a newly allocated string holding a URI.
  */
  string getCurrentUri();

  /**
      Gets the #GtkRecentFilter object currently used by chooser to affect
    the display of the recently used resources.
    Returns:     a #GtkRecentFilter object.
  */
  gtk.recent_filter.RecentFilter getFilter();

  /**
      Gets the list of recently used resources in form of #GtkRecentInfo objects.
    
    The return value of this function is affected by the “sort-type” and
    “limit” properties of chooser.
    Returns:     A newly allocated
        list of #GtkRecentInfo objects.  You should
        use [gtk.recent_info.RecentInfo.unref] on every item of the list, and then free
        the list itself using [glib.list.List.free].
  */
  gtk.recent_info.RecentInfo[] getItems();

  /**
      Gets the number of items returned by [gtk.recent_chooser.RecentChooser.getItems]
    and [gtk.recent_chooser.RecentChooser.getUris].
    Returns:     A positive integer, or -1 meaning that all items are
        returned.
  */
  int getLimit();

  /**
      Gets whether only local resources should be shown in the recently used
    resources selector.  See [gtk.recent_chooser.RecentChooser.setLocalOnly]
    Returns:     true if only local resources should be shown.
  */
  bool getLocalOnly();

  /**
      Gets whether chooser can select multiple items.
    Returns:     true if chooser can select more than one item.
  */
  bool getSelectMultiple();

  /**
      Retrieves whether chooser should show an icon near the resource.
    Returns:     true if the icons should be displayed, false otherwise.
  */
  bool getShowIcons();

  /**
      Retrieves whether chooser should show the recently used resources that
    were not found.
    Returns:     true if the resources not found should be displayed, and
        false otheriwse.
  */
  bool getShowNotFound();

  /**
      Returns whether chooser should display recently used resources
    registered as private.
    Returns:     true if the recent chooser should show private items,
        false otherwise.
  */
  bool getShowPrivate();

  /**
      Gets whether chooser should display tooltips containing the full path
    of a recently user resource.
    Returns:     true if the recent chooser should show tooltips,
        false otherwise.
  */
  bool getShowTips();

  /**
      Gets the value set by [gtk.recent_chooser.RecentChooser.setSortType].
    Returns:     the sorting order of the chooser.
  */
  gtk.types.RecentSortType getSortType();

  /**
      Gets the URI of the recently used resources.
    
    The return value of this function is affected by the “sort-type” and “limit”
    properties of chooser.
    
    Since the returned array is null terminated, length may be null.
    Returns:     A newly allocated, null-terminated array of strings. Use
          [glib.global.strfreev] to free it.
  */
  string[] getUris();

  /**
      Gets the #GtkRecentFilter objects held by chooser.
    Returns:     A singly linked list
        of #GtkRecentFilter objects.  You
        should just free the returned list using [glib.slist.SList.free].
  */
  gtk.recent_filter.RecentFilter[] listFilters();

  /**
      Removes filter from the list of #GtkRecentFilter objects held by chooser.
    Params:
      filter =       a #GtkRecentFilter
  */
  void removeFilter(gtk.recent_filter.RecentFilter filter);

  /**
      Selects all the items inside chooser, if the chooser supports
    multiple selection.
  */
  void selectAll();

  /**
      Selects uri inside chooser.
    Params:
      uri =       a URI
    Returns:     true if uri was found.
  */
  bool selectUri(string uri);

  /**
      Sets uri as the current URI for chooser.
    Params:
      uri =       a URI
    Returns:     true if the URI was found.
  */
  bool setCurrentUri(string uri);

  /**
      Sets filter as the current #GtkRecentFilter object used by chooser
    to affect the displayed recently used resources.
    Params:
      filter =       a #GtkRecentFilter
  */
  void setFilter(gtk.recent_filter.RecentFilter filter = null);

  /**
      Sets the number of items that should be returned by
    [gtk.recent_chooser.RecentChooser.getItems] and [gtk.recent_chooser.RecentChooser.getUris].
    Params:
      limit =       a positive integer, or -1 for all items
  */
  void setLimit(int limit);

  /**
      Sets whether only local resources, that is resources using the file:// URI
    scheme, should be shown in the recently used resources selector.  If
    local_only is true (the default) then the shown resources are guaranteed
    to be accessible through the operating system native file system.
    Params:
      localOnly =       true if only local files can be shown
  */
  void setLocalOnly(bool localOnly);

  /**
      Sets whether chooser can select multiple items.
    Params:
      selectMultiple =       true if chooser can select more than one item
  */
  void setSelectMultiple(bool selectMultiple);

  /**
      Sets whether chooser should show an icon near the resource when
    displaying it.
    Params:
      showIcons =       whether to show an icon near the resource
  */
  void setShowIcons(bool showIcons);

  /**
      Sets whether chooser should display the recently used resources that
    it didn’t find.  This only applies to local resources.
    Params:
      showNotFound =       whether to show the local items we didn’t find
  */
  void setShowNotFound(bool showNotFound);

  /**
      Whether to show recently used resources marked registered as private.
    Params:
      showPrivate =       true to show private items, false otherwise
  */
  void setShowPrivate(bool showPrivate);

  /**
      Sets whether to show a tooltips containing the full path of each
    recently used resource in a #GtkRecentChooser widget.
    Params:
      showTips =       true if tooltips should be shown
  */
  void setShowTips(bool showTips);

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
  void setSortFunc(gtk.types.RecentSortFunc sortFunc);

  /**
      Changes the sorting order of the recently used resources list displayed by
    chooser.
    Params:
      sortType =       sort order that the chooser should use
  */
  void setSortType(gtk.types.RecentSortType sortType);

  /**
      Unselects all the items inside chooser.
  */
  void unselectAll();

  /**
      Unselects uri inside chooser.
    Params:
      uri =       a URI
  */
  void unselectUri(string uri);

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
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectItemActivated(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ItemActivatedCallbackDlg) || is(T : ItemActivatedCallbackFunc));

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
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectSelectionChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : SelectionChangedCallbackDlg) || is(T : SelectionChangedCallbackFunc));
  }
