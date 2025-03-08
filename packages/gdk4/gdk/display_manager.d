module gdk.display_manager;

import gdk.c.functions;
import gdk.c.types;
import gdk.display;
import gdk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;

/**
    A singleton object that offers notification when displays appear or
  disappear.
  
  You can use [gdk.display_manager.DisplayManager.get] to obtain the [gdk.display_manager.DisplayManager]
  singleton, but that should be rarely necessary. Typically, initializing
  GTK opens a display that you can work with without ever accessing the
  [gdk.display_manager.DisplayManager].
  
  The GDK library can be built with support for multiple backends.
  The [gdk.display_manager.DisplayManager] object determines which backend is used
  at runtime.
  
  In the rare case that you need to influence which of the backends
  is being used, you can use `func@Gdk.set_allowed_backends`. Note
  that you need to call this function before initializing GTK.
  
  ## Backend-specific code
  
  When writing backend-specific code that is supposed to work with
  multiple GDK backends, you have to consider both compile time and
  runtime. At compile time, use the `GDK_WINDOWING_X11`, `GDK_WINDOWING_WIN32`
  macros, etc. to find out which backends are present in the GDK library
  you are building your application against. At runtime, use type-check
  macros like GDK_IS_X11_DISPLAY() to find out which backend is in use:
  
  ```c
  #ifdef GDK_WINDOWING_X11
    if (GDK_IS_X11_DISPLAY (display))
      {
        // make X11-specific calls here
      }
    else
  #endif
  #ifdef GDK_WINDOWING_MACOS
    if (GDK_IS_MACOS_DISPLAY (display))
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
      Gets the singleton [gdk.display_manager.DisplayManager] object.
    
    When called for the first time, this function consults the
    `GDK_BACKEND` environment variable to find out which of the
    supported GDK backends to use (in case GDK has been compiled
    with multiple backends).
    
    Applications can use `funcset_allowed_backends` to limit what
    backends will be used.
    Returns:     The global [gdk.display_manager.DisplayManager] singleton
  */
  static gdk.display_manager.DisplayManager get()
  {
    GdkDisplayManager* _cretval;
    _cretval = gdk_display_manager_get();
    auto _retval = ObjectG.getDObject!(gdk.display_manager.DisplayManager)(cast(GdkDisplayManager*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the default [gdk.display.Display].
    Returns:     a [gdk.display.Display]
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
        allocated [glib.slist.SList] of [gdk.display.Display] objects
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
    Returns:     a [gdk.display.Display], or null
        if the display could not be opened
  */
  gdk.display.Display openDisplay(string name = null)
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
      display =       a [gdk.display.Display]
  */
  void setDefaultDisplay(gdk.display.Display display)
  {
    gdk_display_manager_set_default_display(cast(GdkDisplayManager*)cPtr, display ? cast(GdkDisplay*)display.cPtr(No.Dup) : null);
  }

  /**
      Emitted when a display is opened.
  
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
