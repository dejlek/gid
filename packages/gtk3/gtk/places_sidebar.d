module gtk.places_sidebar;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gdk.drag_context;
import gid.gid;
import gio.file;
import gio.mount_operation;
import gio.volume;
import gobject.dclosure;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.scrolled_window;
import gtk.types;
import gtk.widget;

/**
    #GtkPlacesSidebar is a widget that displays a list of frequently-used places in the
  file system:  the user’s home directory, the user’s bookmarks, and volumes and drives.
  This widget is used as a sidebar in #GtkFileChooser and may be used by file managers
  and similar programs.
  
  The places sidebar displays drives and volumes, and will automatically mount
  or unmount them when the user selects them.
  
  Applications can hook to various signals in the places sidebar to customize
  its behavior.  For example, they can add extra commands to the context menu
  of the sidebar.
  
  While bookmarks are completely in control of the user, the places sidebar also
  allows individual applications to provide extra shortcut folders that are unique
  to each application.  For example, a Paint program may want to add a shortcut
  for a Clipart folder.  You can do this with [gtk.places_sidebar.PlacesSidebar.addShortcut].
  
  To make use of the places sidebar, an application at least needs to connect
  to the #GtkPlacesSidebar::open-location signal.  This is emitted when the
  user selects in the sidebar a location to open.  The application should also
  call [gtk.places_sidebar.PlacesSidebar.setLocation] when it changes the currently-viewed
  location.
  
  # CSS nodes
  
  GtkPlacesSidebar uses a single CSS node with name placessidebar and style
  class .sidebar.
  
  Among the children of the places sidebar, the following style classes can
  be used:
  $(LIST
    * .sidebar-new-bookmark-row for the 'Add new bookmark' row
    * .sidebar-placeholder-row for a row that is a placeholder
    * .has-open-popup when a popup is open for a row
  )
*/
class PlacesSidebar : gtk.scrolled_window.ScrolledWindow
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_places_sidebar_get_type != &gidSymbolNotFound ? gtk_places_sidebar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
      Creates a new #GtkPlacesSidebar widget.
    
    The application should connect to at least the
    #GtkPlacesSidebar::open-location signal to be notified
    when the user makes a selection in the sidebar.
    Returns:     a newly created #GtkPlacesSidebar
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_places_sidebar_new();
    this(_cretval, No.Take);
  }

  /**
      Applications may want to present some folders in the places sidebar if
    they could be immediately useful to users.  For example, a drawing
    program could add a “/usr/share/clipart” location when the sidebar is
    being used in an “Insert Clipart” dialog box.
    
    This function adds the specified location to a special place for immutable
    shortcuts.  The shortcuts are application-specific; they are not shared
    across applications, and they are not persistent.  If this function
    is called multiple times with different locations, then they are added
    to the sidebar’s list in the same order as the function is called.
    Params:
      location =       location to add as an application-specific shortcut
  */
  void addShortcut(gio.file.File location)
  {
    gtk_places_sidebar_add_shortcut(cast(GtkPlacesSidebar*)cPtr, location ? cast(GFile*)(cast(ObjectG)location).cPtr(No.Dup) : null);
  }

  /**
      Returns the value previously set with [gtk.places_sidebar.PlacesSidebar.setLocalOnly].
    Returns:     true if the sidebar will only show local files.
  */
  bool getLocalOnly()
  {
    bool _retval;
    _retval = gtk_places_sidebar_get_local_only(cast(GtkPlacesSidebar*)cPtr);
    return _retval;
  }

  /**
      Gets the currently selected location in the sidebar. This can be null when
    nothing is selected, for example, when [gtk.places_sidebar.PlacesSidebar.setLocation] has
    been called with a location that is not among the sidebar’s list of places to
    show.
    
    You can use this function to get the selection in the sidebar.  Also, if you
    connect to the #GtkPlacesSidebar::populate-popup signal, you can use this
    function to get the location that is being referred to during the callbacks
    for your menu items.
    Returns:     a #GFile with the selected location, or
      null if nothing is visually selected.
  */
  gio.file.File getLocation()
  {
    GFile* _cretval;
    _cretval = gtk_places_sidebar_get_location(cast(GtkPlacesSidebar*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This function queries the bookmarks added by the user to the places sidebar,
    and returns one of them.  This function is used by #GtkFileChooser to implement
    the “Alt-1”, “Alt-2”, etc. shortcuts, which activate the cooresponding bookmark.
    Params:
      n =       index of the bookmark to query
    Returns:     The bookmark specified by the index n, or
      null if no such index exist.  Note that the indices start at 0, even though
      the file chooser starts them with the keyboard shortcut "Alt-1".
  */
  gio.file.File getNthBookmark(int n)
  {
    GFile* _cretval;
    _cretval = gtk_places_sidebar_get_nth_bookmark(cast(GtkPlacesSidebar*)cPtr, n);
    auto _retval = ObjectG.getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the open flags.
    Returns:     the #GtkPlacesOpenFlags of sidebar
  */
  gtk.types.PlacesOpenFlags getOpenFlags()
  {
    GtkPlacesOpenFlags _cretval;
    _cretval = gtk_places_sidebar_get_open_flags(cast(GtkPlacesSidebar*)cPtr);
    gtk.types.PlacesOpenFlags _retval = cast(gtk.types.PlacesOpenFlags)_cretval;
    return _retval;
  }

  /**
      Returns the value previously set with [gtk.places_sidebar.PlacesSidebar.setShowConnectToServer]
    Returns:     true if the sidebar will display a “Connect to Server” item.
  
    Deprecated:     It is recommended to group this functionality with the drives
          and network location under the new 'Other Location' item
  */
  bool getShowConnectToServer()
  {
    bool _retval;
    _retval = gtk_places_sidebar_get_show_connect_to_server(cast(GtkPlacesSidebar*)cPtr);
    return _retval;
  }

  /**
      Returns the value previously set with [gtk.places_sidebar.PlacesSidebar.setShowDesktop]
    Returns:     true if the sidebar will display a builtin shortcut to the desktop folder.
  */
  bool getShowDesktop()
  {
    bool _retval;
    _retval = gtk_places_sidebar_get_show_desktop(cast(GtkPlacesSidebar*)cPtr);
    return _retval;
  }

  /**
      Returns the value previously set with [gtk.places_sidebar.PlacesSidebar.setShowEnterLocation]
    Returns:     true if the sidebar will display an “Enter Location” item.
  */
  bool getShowEnterLocation()
  {
    bool _retval;
    _retval = gtk_places_sidebar_get_show_enter_location(cast(GtkPlacesSidebar*)cPtr);
    return _retval;
  }

  /**
      Returns the value previously set with [gtk.places_sidebar.PlacesSidebar.setShowOtherLocations]
    Returns:     true if the sidebar will display an “Other Locations” item.
  */
  bool getShowOtherLocations()
  {
    bool _retval;
    _retval = gtk_places_sidebar_get_show_other_locations(cast(GtkPlacesSidebar*)cPtr);
    return _retval;
  }

  /**
      Returns the value previously set with [gtk.places_sidebar.PlacesSidebar.setShowRecent]
    Returns:     true if the sidebar will display a builtin shortcut for recent files
  */
  bool getShowRecent()
  {
    bool _retval;
    _retval = gtk_places_sidebar_get_show_recent(cast(GtkPlacesSidebar*)cPtr);
    return _retval;
  }

  /**
      Returns the value previously set with [gtk.places_sidebar.PlacesSidebar.setShowStarredLocation]
    Returns:     true if the sidebar will display a Starred item.
  */
  bool getShowStarredLocation()
  {
    bool _retval;
    _retval = gtk_places_sidebar_get_show_starred_location(cast(GtkPlacesSidebar*)cPtr);
    return _retval;
  }

  /**
      Returns the value previously set with [gtk.places_sidebar.PlacesSidebar.setShowTrash]
    Returns:     true if the sidebar will display a “Trash” item.
  */
  bool getShowTrash()
  {
    bool _retval;
    _retval = gtk_places_sidebar_get_show_trash(cast(GtkPlacesSidebar*)cPtr);
    return _retval;
  }

  /**
      Gets the list of shortcuts.
    Returns:     A #GSList of #GFile of the locations that have been added as
          application-specific shortcuts with [gtk.places_sidebar.PlacesSidebar.addShortcut].
          To free this list, you can use
      ```c
      g_slist_free_full (list, (GDestroyNotify) g_object_unref);
      ```
  */
  gio.file.File[] listShortcuts()
  {
    GSList* _cretval;
    _cretval = gtk_places_sidebar_list_shortcuts(cast(GtkPlacesSidebar*)cPtr);
    auto _retval = gSListToD!(gio.file.File, GidOwnership.Full)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Removes an application-specific shortcut that has been previously been
    inserted with [gtk.places_sidebar.PlacesSidebar.addShortcut].  If the location is not a
    shortcut in the sidebar, then nothing is done.
    Params:
      location =       location to remove
  */
  void removeShortcut(gio.file.File location)
  {
    gtk_places_sidebar_remove_shortcut(cast(GtkPlacesSidebar*)cPtr, location ? cast(GFile*)(cast(ObjectG)location).cPtr(No.Dup) : null);
  }

  /**
      Make the GtkPlacesSidebar show drop targets, so it can show the available
    drop targets and a "new bookmark" row. This improves the Drag-and-Drop
    experience of the user and allows applications to show all available
    drop targets at once.
    
    This needs to be called when the application is aware of an ongoing drag
    that might target the sidebar. The drop-targets-visible state will be unset
    automatically if the drag finishes in the GtkPlacesSidebar. You only need
    to unset the state when the drag ends on some other widget on your application.
    Params:
      visible =       whether to show the valid targets or not.
      context =       drag context used to ask the source about the action that wants to
            perform, so hints are more accurate.
  */
  void setDropTargetsVisible(bool visible, gdk.drag_context.DragContext context)
  {
    gtk_places_sidebar_set_drop_targets_visible(cast(GtkPlacesSidebar*)cPtr, visible, context ? cast(GdkDragContext*)context.cPtr(No.Dup) : null);
  }

  /**
      Sets whether the sidebar should only show local files.
    Params:
      localOnly =       whether to show only local files
  */
  void setLocalOnly(bool localOnly)
  {
    gtk_places_sidebar_set_local_only(cast(GtkPlacesSidebar*)cPtr, localOnly);
  }

  /**
      Sets the location that is being shown in the widgets surrounding the
    sidebar, for example, in a folder view in a file manager.  In turn, the
    sidebar will highlight that location if it is being shown in the list of
    places, or it will unhighlight everything if the location is not among the
    places in the list.
    Params:
      location =       location to select, or null for no current path
  */
  void setLocation(gio.file.File location = null)
  {
    gtk_places_sidebar_set_location(cast(GtkPlacesSidebar*)cPtr, location ? cast(GFile*)(cast(ObjectG)location).cPtr(No.Dup) : null);
  }

  /**
      Sets the way in which the calling application can open new locations from
    the places sidebar.  For example, some applications only open locations
    “directly” into their main view, while others may support opening locations
    in a new notebook tab or a new window.
    
    This function is used to tell the places sidebar about the ways in which the
    application can open new locations, so that the sidebar can display (or not)
    the “Open in new tab” and “Open in new window” menu items as appropriate.
    
    When the #GtkPlacesSidebar::open-location signal is emitted, its flags
    argument will be set to one of the flags that was passed in
    [gtk.places_sidebar.PlacesSidebar.setOpenFlags].
    
    Passing 0 for flags will cause #GTK_PLACES_OPEN_NORMAL to always be sent
    to callbacks for the “open-location” signal.
    Params:
      flags =       Bitmask of modes in which the calling application can open locations
  */
  void setOpenFlags(gtk.types.PlacesOpenFlags flags)
  {
    gtk_places_sidebar_set_open_flags(cast(GtkPlacesSidebar*)cPtr, flags);
  }

  /**
      Sets whether the sidebar should show an item for connecting to a network server;
    this is off by default. An application may want to turn this on if it implements
    a way for the user to connect to network servers directly.
    
    If you enable this, you should connect to the
    #GtkPlacesSidebar::show-connect-to-server signal.
    Params:
      showConnectToServer =       whether to show an item for the Connect to Server command
  
    Deprecated:     It is recommended to group this functionality with the drives
          and network location under the new 'Other Location' item
  */
  void setShowConnectToServer(bool showConnectToServer)
  {
    gtk_places_sidebar_set_show_connect_to_server(cast(GtkPlacesSidebar*)cPtr, showConnectToServer);
  }

  /**
      Sets whether the sidebar should show an item for the Desktop folder.
    The default value for this option is determined by the desktop
    environment and the user’s configuration, but this function can be
    used to override it on a per-application basis.
    Params:
      showDesktop =       whether to show an item for the Desktop folder
  */
  void setShowDesktop(bool showDesktop)
  {
    gtk_places_sidebar_set_show_desktop(cast(GtkPlacesSidebar*)cPtr, showDesktop);
  }

  /**
      Sets whether the sidebar should show an item for entering a location;
    this is off by default. An application may want to turn this on if manually
    entering URLs is an expected user action.
    
    If you enable this, you should connect to the
    #GtkPlacesSidebar::show-enter-location signal.
    Params:
      showEnterLocation =       whether to show an item to enter a location
  */
  void setShowEnterLocation(bool showEnterLocation)
  {
    gtk_places_sidebar_set_show_enter_location(cast(GtkPlacesSidebar*)cPtr, showEnterLocation);
  }

  /**
      Sets whether the sidebar should show an item for the application to show
    an Other Locations view; this is off by default. When set to true, persistent
    devices such as hard drives are hidden, otherwise they are shown in the sidebar.
    An application may want to turn this on if it implements a way for the user to
    see and interact with drives and network servers directly.
    
    If you enable this, you should connect to the
    #GtkPlacesSidebar::show-other-locations signal.
    Params:
      showOtherLocations =       whether to show an item for the Other Locations view
  */
  void setShowOtherLocations(bool showOtherLocations)
  {
    gtk_places_sidebar_set_show_other_locations(cast(GtkPlacesSidebar*)cPtr, showOtherLocations);
  }

  /**
      Sets whether the sidebar should show an item for recent files.
    The default value for this option is determined by the desktop
    environment, but this function can be used to override it on a
    per-application basis.
    Params:
      showRecent =       whether to show an item for recent files
  */
  void setShowRecent(bool showRecent)
  {
    gtk_places_sidebar_set_show_recent(cast(GtkPlacesSidebar*)cPtr, showRecent);
  }

  /**
      If you enable this, you should connect to the
    #GtkPlacesSidebar::show-starred-location signal.
    Params:
      showStarredLocation =       whether to show an item for Starred files
  */
  void setShowStarredLocation(bool showStarredLocation)
  {
    gtk_places_sidebar_set_show_starred_location(cast(GtkPlacesSidebar*)cPtr, showStarredLocation);
  }

  /**
      Sets whether the sidebar should show an item for the Trash location.
    Params:
      showTrash =       whether to show an item for the Trash location
  */
  void setShowTrash(bool showTrash)
  {
    gtk_places_sidebar_set_show_trash(cast(GtkPlacesSidebar*)cPtr, showTrash);
  }

  /**
      The places sidebar emits this signal when it needs to ask the application
    to pop up a menu to ask the user for which drag action to perform.
  
    ## Parameters
    $(LIST
      * $(B actions)       Possible drag actions that need to be asked for.
      * $(B placesSidebar) the instance the signal is connected to
    )
    Returns:     the final drag action that the sidebar should pass to the drag side
      of the drag-and-drop operation.
  */
  alias DragActionAskCallbackDlg = int delegate(int actions, gtk.places_sidebar.PlacesSidebar placesSidebar);

  /** ditto */
  alias DragActionAskCallbackFunc = int function(int actions, gtk.places_sidebar.PlacesSidebar placesSidebar);

  /**
    Connect to DragActionAsk signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectDragActionAsk(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DragActionAskCallbackDlg) || is(T : DragActionAskCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      int _retval;
      auto placesSidebar = getVal!(gtk.places_sidebar.PlacesSidebar)(_paramVals);
      auto actions = getVal!(int)(&_paramVals[1]);
      _retval = _dClosure.dlg(actions, placesSidebar);
      setVal!int(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-action-ask", closure, after);
  }

  /**
      The places sidebar emits this signal when it starts a new operation
    because the user clicked on some location that needs mounting.
    In this way the application using the #GtkPlacesSidebar can track the
    progress of the operation and, for example, show a notification.
  
    ## Parameters
    $(LIST
      * $(B mountOperation)       the #GMountOperation that is going to start.
      * $(B placesSidebar) the instance the signal is connected to
    )
  */
  alias MountCallbackDlg = void delegate(gio.mount_operation.MountOperation mountOperation, gtk.places_sidebar.PlacesSidebar placesSidebar);

  /** ditto */
  alias MountCallbackFunc = void function(gio.mount_operation.MountOperation mountOperation, gtk.places_sidebar.PlacesSidebar placesSidebar);

  /**
    Connect to Mount signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectMount(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MountCallbackDlg) || is(T : MountCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto placesSidebar = getVal!(gtk.places_sidebar.PlacesSidebar)(_paramVals);
      auto mountOperation = getVal!(gio.mount_operation.MountOperation)(&_paramVals[1]);
      _dClosure.dlg(mountOperation, placesSidebar);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("mount", closure, after);
  }

  /**
      The places sidebar emits this signal when the user selects a location
    in it.  The calling application should display the contents of that
    location; for example, a file manager should show a list of files in
    the specified location.
  
    ## Parameters
    $(LIST
      * $(B location)       #GFile to which the caller should switch.
      * $(B openFlags)       a single value from #GtkPlacesOpenFlags specifying how the location should be opened.
      * $(B placesSidebar) the instance the signal is connected to
    )
  */
  alias OpenLocationCallbackDlg = void delegate(gio.file.File location, gtk.types.PlacesOpenFlags openFlags, gtk.places_sidebar.PlacesSidebar placesSidebar);

  /** ditto */
  alias OpenLocationCallbackFunc = void function(gio.file.File location, gtk.types.PlacesOpenFlags openFlags, gtk.places_sidebar.PlacesSidebar placesSidebar);

  /**
    Connect to OpenLocation signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectOpenLocation(T)(T callback, Flag!"After" after = No.After)
  if (is(T : OpenLocationCallbackDlg) || is(T : OpenLocationCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto placesSidebar = getVal!(gtk.places_sidebar.PlacesSidebar)(_paramVals);
      auto location = getVal!(gio.file.File)(&_paramVals[1]);
      auto openFlags = getVal!(gtk.types.PlacesOpenFlags)(&_paramVals[2]);
      _dClosure.dlg(location, openFlags, placesSidebar);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("open-location", closure, after);
  }

  /**
      The places sidebar emits this signal when the user invokes a contextual
    popup on one of its items. In the signal handler, the application may
    add extra items to the menu as appropriate. For example, a file manager
    may want to add a "Properties" command to the menu.
    
    It is not necessary to store the selected_item for each menu item;
    during their callbacks, the application can use [gtk.places_sidebar.PlacesSidebar.getLocation]
    to get the file to which the item refers.
    
    The selected_item argument may be null in case the selection refers to
    a volume. In this case, selected_volume will be non-null. In this case,
    the calling application will have to [gobject.object.ObjectG.ref_] the selected_volume and
    keep it around to use it in the callback.
    
    The container and all its contents are destroyed after the user
    dismisses the popup. The popup is re-created (and thus, this signal is
    emitted) every time the user activates the contextual menu.
    
    Before 3.18, the container always was a #GtkMenu, and you were expected
    to add your items as #GtkMenuItems. Since 3.18, the popup may be implemented
    as a #GtkPopover, in which case container will be something else, e.g. a
    #GtkBox, to which you may add #GtkModelButtons or other widgets, such as
    #GtkEntries, #GtkSpinButtons, etc. If your application can deal with this
    situation, you can set #GtkPlacesSidebar::populate-all to true to request
    that this signal is emitted for populating popovers as well.
  
    ## Parameters
    $(LIST
      * $(B container)       a #GtkMenu or another #GtkContainer
      * $(B selectedItem)       #GFile with the item to which
            the popup should refer, or null in the case of a selected_volume.
      * $(B selectedVolume)       #GVolume if the selected
            item is a volume, or null if it is a file.
      * $(B placesSidebar) the instance the signal is connected to
    )
  */
  alias PopulatePopupCallbackDlg = void delegate(gtk.widget.Widget container, gio.file.File selectedItem, gio.volume.Volume selectedVolume, gtk.places_sidebar.PlacesSidebar placesSidebar);

  /** ditto */
  alias PopulatePopupCallbackFunc = void function(gtk.widget.Widget container, gio.file.File selectedItem, gio.volume.Volume selectedVolume, gtk.places_sidebar.PlacesSidebar placesSidebar);

  /**
    Connect to PopulatePopup signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectPopulatePopup(T)(T callback, Flag!"After" after = No.After)
  if (is(T : PopulatePopupCallbackDlg) || is(T : PopulatePopupCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto placesSidebar = getVal!(gtk.places_sidebar.PlacesSidebar)(_paramVals);
      auto container = getVal!(gtk.widget.Widget)(&_paramVals[1]);
      auto selectedItem = getVal!(gio.file.File)(&_paramVals[2]);
      auto selectedVolume = getVal!(gio.volume.Volume)(&_paramVals[3]);
      _dClosure.dlg(container, selectedItem, selectedVolume, placesSidebar);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("populate-popup", closure, after);
  }

  /**
      The places sidebar emits this signal when it needs the calling
    application to present an way to connect directly to a network server.
    For example, the application may bring up a dialog box asking for
    a URL like "sftp://ftp.example.com".  It is up to the application to create
    the corresponding mount by using, for example, [gio.file.File.mountEnclosingVolume].
  
    ## Parameters
    $(LIST
      * $(B placesSidebar) the instance the signal is connected to
    )
  
    Deprecated:     use the #GtkPlacesSidebar::show-other-locations signal
          to connect to network servers.
  */
  alias ShowConnectToServerCallbackDlg = void delegate(gtk.places_sidebar.PlacesSidebar placesSidebar);

  /** ditto */
  alias ShowConnectToServerCallbackFunc = void function(gtk.places_sidebar.PlacesSidebar placesSidebar);

  /**
    Connect to ShowConnectToServer signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectShowConnectToServer(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ShowConnectToServerCallbackDlg) || is(T : ShowConnectToServerCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto placesSidebar = getVal!(gtk.places_sidebar.PlacesSidebar)(_paramVals);
      _dClosure.dlg(placesSidebar);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("show-connect-to-server", closure, after);
  }

  /**
      The places sidebar emits this signal when it needs the calling
    application to present an way to directly enter a location.
    For example, the application may bring up a dialog box asking for
    a URL like "http://http.example.com".
  
    ## Parameters
    $(LIST
      * $(B placesSidebar) the instance the signal is connected to
    )
  */
  alias ShowEnterLocationCallbackDlg = void delegate(gtk.places_sidebar.PlacesSidebar placesSidebar);

  /** ditto */
  alias ShowEnterLocationCallbackFunc = void function(gtk.places_sidebar.PlacesSidebar placesSidebar);

  /**
    Connect to ShowEnterLocation signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectShowEnterLocation(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ShowEnterLocationCallbackDlg) || is(T : ShowEnterLocationCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto placesSidebar = getVal!(gtk.places_sidebar.PlacesSidebar)(_paramVals);
      _dClosure.dlg(placesSidebar);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("show-enter-location", closure, after);
  }

  /**
      The places sidebar emits this signal when it needs the calling
    application to present an error message.  Most of these messages
    refer to mounting or unmounting media, for example, when a drive
    cannot be started for some reason.
  
    ## Parameters
    $(LIST
      * $(B primary)       primary message with a summary of the error to show.
      * $(B secondary)       secondary message with details of the error to show.
      * $(B placesSidebar) the instance the signal is connected to
    )
  */
  alias ShowErrorMessageCallbackDlg = void delegate(string primary, string secondary, gtk.places_sidebar.PlacesSidebar placesSidebar);

  /** ditto */
  alias ShowErrorMessageCallbackFunc = void function(string primary, string secondary, gtk.places_sidebar.PlacesSidebar placesSidebar);

  /**
    Connect to ShowErrorMessage signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectShowErrorMessage(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ShowErrorMessageCallbackDlg) || is(T : ShowErrorMessageCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto placesSidebar = getVal!(gtk.places_sidebar.PlacesSidebar)(_paramVals);
      auto primary = getVal!(string)(&_paramVals[1]);
      auto secondary = getVal!(string)(&_paramVals[2]);
      _dClosure.dlg(primary, secondary, placesSidebar);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("show-error-message", closure, after);
  }

  /**
      The places sidebar emits this signal when it needs the calling
    application to present a way to show other locations e.g. drives
    and network access points.
    For example, the application may bring up a page showing persistent
    volumes and discovered network addresses.
  
    ## Parameters
    $(LIST
      * $(B placesSidebar) the instance the signal is connected to
    )
  
    Deprecated:     use the #GtkPlacesSidebar::show-other-locations-with-flags
      which includes the open flags in order to allow the user to specify to open
      in a new tab or window, in a similar way than #GtkPlacesSidebar::open-location
  */
  alias ShowOtherLocationsCallbackDlg = void delegate(gtk.places_sidebar.PlacesSidebar placesSidebar);

  /** ditto */
  alias ShowOtherLocationsCallbackFunc = void function(gtk.places_sidebar.PlacesSidebar placesSidebar);

  /**
    Connect to ShowOtherLocations signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectShowOtherLocations(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ShowOtherLocationsCallbackDlg) || is(T : ShowOtherLocationsCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto placesSidebar = getVal!(gtk.places_sidebar.PlacesSidebar)(_paramVals);
      _dClosure.dlg(placesSidebar);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("show-other-locations", closure, after);
  }

  /**
      The places sidebar emits this signal when it needs the calling
    application to present a way to show other locations e.g. drives
    and network access points.
    For example, the application may bring up a page showing persistent
    volumes and discovered network addresses.
  
    ## Parameters
    $(LIST
      * $(B openFlags)       a single value from #GtkPlacesOpenFlags specifying how it should be opened.
      * $(B placesSidebar) the instance the signal is connected to
    )
  */
  alias ShowOtherLocationsWithFlagsCallbackDlg = void delegate(gtk.types.PlacesOpenFlags openFlags, gtk.places_sidebar.PlacesSidebar placesSidebar);

  /** ditto */
  alias ShowOtherLocationsWithFlagsCallbackFunc = void function(gtk.types.PlacesOpenFlags openFlags, gtk.places_sidebar.PlacesSidebar placesSidebar);

  /**
    Connect to ShowOtherLocationsWithFlags signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectShowOtherLocationsWithFlags(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ShowOtherLocationsWithFlagsCallbackDlg) || is(T : ShowOtherLocationsWithFlagsCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto placesSidebar = getVal!(gtk.places_sidebar.PlacesSidebar)(_paramVals);
      auto openFlags = getVal!(gtk.types.PlacesOpenFlags)(&_paramVals[1]);
      _dClosure.dlg(openFlags, placesSidebar);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("show-other-locations-with-flags", closure, after);
  }

  /**
      The places sidebar emits this signal when it needs the calling
    application to present a way to show the starred files. In GNOME,
    starred files are implemented by setting the nao:predefined-tag-favorite
    tag in the tracker database.
  
    ## Parameters
    $(LIST
      * $(B openFlags)       a single value from #GtkPlacesOpenFlags specifying how the
          starred file should be opened.
      * $(B placesSidebar) the instance the signal is connected to
    )
  */
  alias ShowStarredLocationCallbackDlg = void delegate(gtk.types.PlacesOpenFlags openFlags, gtk.places_sidebar.PlacesSidebar placesSidebar);

  /** ditto */
  alias ShowStarredLocationCallbackFunc = void function(gtk.types.PlacesOpenFlags openFlags, gtk.places_sidebar.PlacesSidebar placesSidebar);

  /**
    Connect to ShowStarredLocation signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectShowStarredLocation(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ShowStarredLocationCallbackDlg) || is(T : ShowStarredLocationCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto placesSidebar = getVal!(gtk.places_sidebar.PlacesSidebar)(_paramVals);
      auto openFlags = getVal!(gtk.types.PlacesOpenFlags)(&_paramVals[1]);
      _dClosure.dlg(openFlags, placesSidebar);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("show-starred-location", closure, after);
  }

  /**
      The places sidebar emits this signal when it starts a new operation
    because the user for example ejected some drive or unmounted a mount.
    In this way the application using the #GtkPlacesSidebar can track the
    progress of the operation and, for example, show a notification.
  
    ## Parameters
    $(LIST
      * $(B mountOperation)       the #GMountOperation that is going to start.
      * $(B placesSidebar) the instance the signal is connected to
    )
  */
  alias UnmountCallbackDlg = void delegate(gio.mount_operation.MountOperation mountOperation, gtk.places_sidebar.PlacesSidebar placesSidebar);

  /** ditto */
  alias UnmountCallbackFunc = void function(gio.mount_operation.MountOperation mountOperation, gtk.places_sidebar.PlacesSidebar placesSidebar);

  /**
    Connect to Unmount signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectUnmount(T)(T callback, Flag!"After" after = No.After)
  if (is(T : UnmountCallbackDlg) || is(T : UnmountCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto placesSidebar = getVal!(gtk.places_sidebar.PlacesSidebar)(_paramVals);
      auto mountOperation = getVal!(gio.mount_operation.MountOperation)(&_paramVals[1]);
      _dClosure.dlg(mountOperation, placesSidebar);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("unmount", closure, after);
  }
}
