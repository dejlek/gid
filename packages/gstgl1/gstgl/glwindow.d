module gstgl.glwindow;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gst.object;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glcontext;
import gstgl.gldisplay;
import gstgl.types;

/**
    GstGLWindow represents a window that elements can render into.  A window can
  either be a user visible window (onscreen) or hidden (offscreen).
*/
class GLWindow : gst.object.ObjectGst
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_window_get_type != &gidSymbolNotFound ? gst_gl_window_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override GLWindow self()
  {
    return this;
  }

  /** */
  this(gstgl.gldisplay.GLDisplay display)
  {
    GstGLWindow* _cretval;
    _cretval = gst_gl_window_new(display ? cast(GstGLDisplay*)display.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Checks if window controls the GL viewport.
    Returns:     true if window controls the GL viewport, otherwise false
  */
  bool controlsViewport()
  {
    bool _retval;
    _retval = gst_gl_window_controls_viewport(cast(GstGLWindow*)cPtr);
    return _retval;
  }

  /**
      Redraw the window contents.  Implementations should invoke the draw callback.
  */
  void draw()
  {
    gst_gl_window_draw(cast(GstGLWindow*)cPtr);
  }

  /** */
  gstgl.glcontext.GLContext getContext()
  {
    GstGLContext* _cretval;
    _cretval = gst_gl_window_get_context(cast(GstGLWindow*)cPtr);
    auto _retval = ObjectG.getDObject!(gstgl.glcontext.GLContext)(cast(GstGLContext*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  size_t getDisplay()
  {
    size_t _retval;
    _retval = gst_gl_window_get_display(cast(GstGLWindow*)cPtr);
    return _retval;
  }

  /** */
  void getSurfaceDimensions(out uint width, out uint height)
  {
    gst_gl_window_get_surface_dimensions(cast(GstGLWindow*)cPtr, cast(uint*)&width, cast(uint*)&height);
  }

  /** */
  size_t getWindowHandle()
  {
    size_t _retval;
    _retval = gst_gl_window_get_window_handle(cast(GstGLWindow*)cPtr);
    return _retval;
  }

  /**
      Tell a window that it should handle events from the window system. These
    events are forwarded upstream as navigation events. In some window systems
    events are not propagated in the window hierarchy if a client is listening
    for them. This method allows you to disable events handling completely
    from the window.
    Params:
      handleEvents =       a #gboolean indicating if events should be handled or not.
  */
  void handleEvents(bool handleEvents)
  {
    gst_gl_window_handle_events(cast(GstGLWindow*)cPtr, handleEvents);
  }

  /**
      Query whether window has output surface or not
    Returns:     true if window has useable output surface
  */
  bool hasOutputSurface()
  {
    bool _retval;
    _retval = gst_gl_window_has_output_surface(cast(GstGLWindow*)cPtr);
    return _retval;
  }

  /**
      Queue resizing of window.
  */
  void queueResize()
  {
    gst_gl_window_queue_resize(cast(GstGLWindow*)cPtr);
  }

  /**
      Quit the runloop's execution.
  */
  void quit()
  {
    gst_gl_window_quit(cast(GstGLWindow*)cPtr);
  }

  /**
      Resize window to the given width and height.
    Params:
      width =       new width
      height =       new height
  */
  void resize(uint width, uint height)
  {
    gst_gl_window_resize(cast(GstGLWindow*)cPtr, width, height);
  }

  /**
      Start the execution of the runloop.
  */
  void run()
  {
    gst_gl_window_run(cast(GstGLWindow*)cPtr);
  }

  /** */
  void sendKeyEvent(string eventType, string keyStr)
  {
    const(char)* _eventType = eventType.toCString(No.Alloc);
    const(char)* _keyStr = keyStr.toCString(No.Alloc);
    gst_gl_window_send_key_event(cast(GstGLWindow*)cPtr, _eventType, _keyStr);
  }

  /**
      Invoke callback with data on the window thread.  callback is guaranteed to
    have executed when this function returns.
    Params:
      callback =       function to invoke
  */
  void sendMessage(gstgl.types.GLWindowCB callback)
  {
    extern(C) void _callbackCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gstgl.types.GLWindowCB*)data;

      (*_dlg)();
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gst_gl_window_send_message(cast(GstGLWindow*)cPtr, _callbackCB, _callback);
  }

  /**
      Invoke callback with data on the window thread.  The callback may not
    have been executed when this function returns.
    Params:
      callback =       function to invoke
  */
  void sendMessageAsync(gstgl.types.GLWindowCB callback)
  {
    extern(C) void _callbackCallback(void* data)
    {
      auto _dlg = cast(gstgl.types.GLWindowCB*)data;

      (*_dlg)();
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
    gst_gl_window_send_message_async(cast(GstGLWindow*)cPtr, _callbackCB, _callback, _callbackDestroyCB);
  }

  /** */
  void sendMouseEvent(string eventType, int button, double posx, double posy)
  {
    const(char)* _eventType = eventType.toCString(No.Alloc);
    gst_gl_window_send_mouse_event(cast(GstGLWindow*)cPtr, _eventType, button, posx, posy);
  }

  /**
      Notify a window about a scroll event. A scroll signal holding the event
    coordinates will be emitted.
    Params:
      posx =       x position of the mouse cursor
      posy =       y position of the mouse cursor
      deltaX =       the x offset of the scroll event
      deltaY =       the y offset of the scroll event
  */
  void sendScrollEvent(double posx, double posy, double deltaX, double deltaY)
  {
    gst_gl_window_send_scroll_event(cast(GstGLWindow*)cPtr, posx, posy, deltaX, deltaY);
  }

  /**
      Sets the callback called when the window is about to close.
    Params:
      callback =       function to invoke
  */
  void setCloseCallback(gstgl.types.GLWindowCB callback)
  {
    extern(C) void _callbackCallback(void* data)
    {
      auto _dlg = cast(gstgl.types.GLWindowCB*)data;

      (*_dlg)();
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
    gst_gl_window_set_close_callback(cast(GstGLWindow*)cPtr, _callbackCB, _callback, _callbackDestroyCB);
  }

  /**
      Sets the draw callback called every time [gstgl.glwindow.GLWindow.draw] is called
    Params:
      callback =       function to invoke
  */
  void setDrawCallback(gstgl.types.GLWindowCB callback)
  {
    extern(C) void _callbackCallback(void* data)
    {
      auto _dlg = cast(gstgl.types.GLWindowCB*)data;

      (*_dlg)();
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
    gst_gl_window_set_draw_callback(cast(GstGLWindow*)cPtr, _callbackCB, _callback, _callbackDestroyCB);
  }

  /**
      Set the preferred width and height of the window.  Implementations are free
    to ignore this information.
    Params:
      width =       new preferred width
      height =       new preferred height
  */
  void setPreferredSize(int width, int height)
  {
    gst_gl_window_set_preferred_size(cast(GstGLWindow*)cPtr, width, height);
  }

  /**
      Tell a window that it should render into a specific region of the window
    according to the #GstVideoOverlay interface.
    Params:
      x =       x position
      y =       y position
      width =       width
      height =       height
    Returns:     whether the specified region could be set
  */
  bool setRenderRectangle(int x, int y, int width, int height)
  {
    bool _retval;
    _retval = gst_gl_window_set_render_rectangle(cast(GstGLWindow*)cPtr, x, y, width, height);
    return _retval;
  }

  /**
      Sets the resize callback called every time a resize of the window occurs.
    Params:
      callback =       function to invoke
  */
  void setResizeCallback(gstgl.types.GLWindowResizeCB callback)
  {
    extern(C) void _callbackCallback(void* data, uint width, uint height)
    {
      auto _dlg = cast(gstgl.types.GLWindowResizeCB*)data;

      (*_dlg)(width, height);
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
    gst_gl_window_set_resize_callback(cast(GstGLWindow*)cPtr, _callbackCB, _callback, _callbackDestroyCB);
  }

  /**
      Sets the window that this window should render into.  Some implementations
    require this to be called with a valid handle before drawing can commence.
    Params:
      handle =       handle to the window
  */
  void setWindowHandle(size_t handle)
  {
    gst_gl_window_set_window_handle(cast(GstGLWindow*)cPtr, handle);
  }

  /**
      Present the window to the screen.
  */
  void show()
  {
    gst_gl_window_show(cast(GstGLWindow*)cPtr);
  }

  /**
      Will be emitted when a key event is received by the GstGLwindow.
  
    ## Parameters
    $(LIST
      * $(B id)       the name of the event
      * $(B key)       the id of the key pressed
      * $(B gLWindow) the instance the signal is connected to
    )
  */
  alias KeyEventCallbackDlg = void delegate(string id, string key, gstgl.glwindow.GLWindow gLWindow);

  /** ditto */
  alias KeyEventCallbackFunc = void function(string id, string key, gstgl.glwindow.GLWindow gLWindow);

  /**
    Connect to KeyEvent signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectKeyEvent(T)(T callback, Flag!"After" after = No.After)
  if (is(T : KeyEventCallbackDlg) || is(T : KeyEventCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gLWindow = getVal!(gstgl.glwindow.GLWindow)(_paramVals);
      auto id = getVal!(string)(&_paramVals[1]);
      auto key = getVal!(string)(&_paramVals[2]);
      _dClosure.dlg(id, key, gLWindow);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("key-event", closure, after);
  }

  /**
      Will be emitted when a mouse event is received by the GstGLwindow.
  
    ## Parameters
    $(LIST
      * $(B id)       the name of the event
      * $(B button)       the id of the button
      * $(B x)       the x coordinate of the mouse event
      * $(B y)       the y coordinate of the mouse event
      * $(B gLWindow) the instance the signal is connected to
    )
  */
  alias MouseEventCallbackDlg = void delegate(string id, int button, double x, double y, gstgl.glwindow.GLWindow gLWindow);

  /** ditto */
  alias MouseEventCallbackFunc = void function(string id, int button, double x, double y, gstgl.glwindow.GLWindow gLWindow);

  /**
    Connect to MouseEvent signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectMouseEvent(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MouseEventCallbackDlg) || is(T : MouseEventCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gLWindow = getVal!(gstgl.glwindow.GLWindow)(_paramVals);
      auto id = getVal!(string)(&_paramVals[1]);
      auto button = getVal!(int)(&_paramVals[2]);
      auto x = getVal!(double)(&_paramVals[3]);
      auto y = getVal!(double)(&_paramVals[4]);
      _dClosure.dlg(id, button, x, y, gLWindow);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("mouse-event", closure, after);
  }

  /**
      Will be emitted when a mouse scroll event is received by the GstGLwindow.
  
    ## Parameters
    $(LIST
      * $(B x)       the x coordinate of the mouse event
      * $(B y)       the y coordinate of the mouse event
      * $(B deltaX)       the x offset of the scroll event
      * $(B deltaY)       the y offset of the scroll event
      * $(B gLWindow) the instance the signal is connected to
    )
  */
  alias ScrollEventCallbackDlg = void delegate(double x, double y, double deltaX, double deltaY, gstgl.glwindow.GLWindow gLWindow);

  /** ditto */
  alias ScrollEventCallbackFunc = void function(double x, double y, double deltaX, double deltaY, gstgl.glwindow.GLWindow gLWindow);

  /**
    Connect to ScrollEvent signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectScrollEvent(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ScrollEventCallbackDlg) || is(T : ScrollEventCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gLWindow = getVal!(gstgl.glwindow.GLWindow)(_paramVals);
      auto x = getVal!(double)(&_paramVals[1]);
      auto y = getVal!(double)(&_paramVals[2]);
      auto deltaX = getVal!(double)(&_paramVals[3]);
      auto deltaY = getVal!(double)(&_paramVals[4]);
      _dClosure.dlg(x, y, deltaX, deltaY, gLWindow);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("scroll-event", closure, after);
  }

  /**
      Will be emitted when the window handle has been set into the native
    implementation, but before the context is re-activated. By using this
    signal, elements can refresh associated resource without relying on
    direct handle comparision.
  
    ## Parameters
    $(LIST
      * $(B gLWindow) the instance the signal is connected to
    )
  */
  alias WindowHandleChangedCallbackDlg = void delegate(gstgl.glwindow.GLWindow gLWindow);

  /** ditto */
  alias WindowHandleChangedCallbackFunc = void function(gstgl.glwindow.GLWindow gLWindow);

  /**
    Connect to WindowHandleChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectWindowHandleChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : WindowHandleChangedCallbackDlg) || is(T : WindowHandleChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gLWindow = getVal!(gstgl.glwindow.GLWindow)(_paramVals);
      _dClosure.dlg(gLWindow);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("window-handle-changed", closure, after);
  }
}
