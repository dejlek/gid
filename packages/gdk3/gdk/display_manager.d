module gdk.display_manager;

import gdk.c.functions;
import gdk.c.types;
import gdk.display;
import gdk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;

/**
    The purpose of the #GdkDisplayManager singleton object is to offer
  notification when displays appear or disappear or the default display
  changes.
  
  You can use [gdk.display_manager.DisplayManager.get] to obtain the #GdkDisplayManager
  singleton, but that should be rarely necessary. Typically, initializing
  GTK+ opens a display that you can work with without ever accessing the
  #GdkDisplayManager.
  
  The GDK library can be built with support for multiple backends.
  The #GdkDisplayManager object determines which backend is used
  at runtime.
  
  When writing backend-specific code that is supposed to work with
  multiple GDK backends, you have to consider both compile time and
  runtime. At compile time, use the #GDK_WINDOWING_X11, #GDK_WINDOWING_WIN32
  macros, etc. to find out which backends are present in the GDK library
  you are building your application against. At runtime, use type-check
  macros like GDK_IS_X11_DISPLAY() to find out which backend is in use:
  
  ## Backend-specific code ## {#backend-specific}
  
  ```c
  #ifdef GDK_WINDOWING_X11
    if (GDK_IS_X11_DISPLAY (display))
      {
        // make X11-specific calls here
      }
    else
  #endif
  #ifdef GDK_WINDOWING_QUARTZ
    if (GDK_IS_QUARTZ_DISPLAY (display))
      {
        // make Quartz-specific calls here
      }
    else
  #endif
    g_error ("Unsupported GDK backend");
  ```
*/
class DisplayManager : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_display_manager_get_type != &gidSymbolNotFound ? gdk_display_manager_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Gets the singleton #GdkDisplayManager object.
    
    When called for the first time, this function consults the
    `GDK_BACKEND` environment variable to find out which
    of the supported GDK backends to use (in case GDK has been compiled
    with multiple backends). Applications can use [gdk.global.setAllowedBackends]
    to limit what backends can be used.
    Returns:     The global #GdkDisplayManager singleton;
          [gdk.global.parseArgs], [gdk.global.init_], or [gdk.global.initCheck] must have
          been called first.
  */
  static gdk.display_manager.DisplayManager get()
  {
    GdkDisplayManager* _cretval;
    _cretval = gdk_display_manager_get();
    auto _retval = ObjectG.getDObject!(gdk.display_manager.DisplayManager)(cast(GdkDisplayManager*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the default #GdkDisplay.
    Returns:     a #GdkDisplay, or null if
          there is no default display.
  */
  gdk.display.Display getDefaultDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gdk_display_manager_get_default_display(cast(GdkDisplayManager*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      List all currently open displays.
    Returns:     a newly
          allocated #GSList of #GdkDisplay objects. Free with [glib.slist.SList.free]
          when you are done with it.
  */
  gdk.display.Display[] listDisplays()
  {
    GSList* _cretval;
    _cretval = gdk_display_manager_list_displays(cast(GdkDisplayManager*)cPtr);
    auto _retval = gSListToD!(gdk.display.Display, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Opens a display.
    Params:
      name =       the name of the display to open
    Returns:     a #GdkDisplay, or null if the
          display could not be opened
  */
  gdk.display.Display openDisplay(string name)
  {
    GdkDisplay* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gdk_display_manager_open_display(cast(GdkDisplayManager*)cPtr, _name);
    auto _retval = ObjectG.getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets display as the default display.
    Params:
      display =       a #GdkDisplay
  */
  void setDefaultDisplay(gdk.display.Display display)
  {
    gdk_display_manager_set_default_display(cast(GdkDisplayManager*)cPtr, display ? cast(GdkDisplay*)display.cPtr(No.Dup) : null);
  }

  /**
      The ::display-opened signal is emitted when a display is opened.
  
    ## Parameters
    $(LIST
      * $(B display)       the opened display
      * $(B displayManager) the instance the signal is connected to
    )
  */
  alias DisplayOpenedCallbackDlg = void delegate(gdk.display.Display display, gdk.display_manager.DisplayManager displayManager);

  /** ditto */
  alias DisplayOpenedCallbackFunc = void function(gdk.display.Display display, gdk.display_manager.DisplayManager displayManager);

  /**
    Connect to DisplayOpened signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectDisplayOpened(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DisplayOpenedCallbackDlg) || is(T : DisplayOpenedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto displayManager = getVal!(gdk.display_manager.DisplayManager)(_paramVals);
      auto display = getVal!(gdk.display.Display)(&_paramVals[1]);
      _dClosure.dlg(display, displayManager);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("display-opened", closure, after);
  }
}
