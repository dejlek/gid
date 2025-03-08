module gtk.glarea;

import gdk.glcontext;
import gdk.types;
import gid.gid;
import glib.error;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
    [gtk.glarea.GLArea] is a widget that allows drawing with OpenGL.
  
  ![An example GtkGLArea](glarea.png)
  
  [gtk.glarea.GLArea] sets up its own [gdk.glcontext.GLContext], and creates a custom
  GL framebuffer that the widget will do GL rendering onto. It also ensures
  that this framebuffer is the default GL rendering target when rendering.
  The completed rendering is integrated into the larger GTK scene graph as
  a texture.
  
  In order to draw, you have to connect to the [gtk.glarea.GLArea.render]
  signal, or subclass [gtk.glarea.GLArea] and override the GtkGLAreaClass.render
  virtual function.
  
  The [gtk.glarea.GLArea] widget ensures that the [gdk.glcontext.GLContext] is associated with
  the widget's drawing area, and it is kept updated when the size and
  position of the drawing area changes.
  
  ## Drawing with GtkGLArea
  
  The simplest way to draw using OpenGL commands in a [gtk.glarea.GLArea] is to
  create a widget instance and connect to the [gtk.glarea.GLArea.render] signal:
  
  The `render()` function will be called when the [gtk.glarea.GLArea] is ready
  for you to draw its content:
  
  The initial contents of the framebuffer are transparent.
  
  ```c
  static gboolean
  render (GtkGLArea *area, GdkGLContext *context)
  {
    // inside this function it's safe to use GL; the given
    // GdkGLContext has been made current to the drawable
    // surface used by the `GtkGLArea` and the viewport has
    // already been set to be the size of the allocation
  
    // we can start by clearing the buffer
    glClearColor (0, 0, 0, 0);
    glClear (GL_COLOR_BUFFER_BIT);
  
    // draw your object
    // draw_an_object ();
  
    // we completed our drawing; the draw commands will be
    // flushed at the end of the signal emission chain, and
    // the buffers will be drawn on the window
    return TRUE;
  }
  
  void setup_glarea (void)
  {
    // create a GtkGLArea instance
    GtkWidget *gl_area = gtk_gl_area_new ();
  
    // connect to the "render" signal
    g_signal_connect (gl_area, "render", G_CALLBACK (render), NULL);
  }
  ```
  
  If you need to initialize OpenGL state, e.g. buffer objects or
  shaders, you should use the [gtk.widget.Widget.realize] signal;
  you can use the [gtk.widget.Widget.unrealize] signal to clean up.
  Since the [gdk.glcontext.GLContext] creation and initialization may fail, you
  will need to check for errors, using [gtk.glarea.GLArea.getError].
  
  An example of how to safely initialize the GL state is:
  
  ```c
  static void
  on_realize (GtkGLarea *area)
  {
    // We need to make the context current if we want to
    // call GL API
    gtk_gl_area_make_current (area);
  
    // If there were errors during the initialization or
    // when trying to make the context current, this
    // function will return a GError for you to catch
    if (gtk_gl_area_get_error (area) != NULL)
      return;
  
    // You can also use gtk_gl_area_set_error() in order
    // to show eventual initialization errors on the
    // GtkGLArea widget itself
    GError *internal_error = NULL;
    init_buffer_objects (&error);
    if (error != NULL)
      {
        gtk_gl_area_set_error (area, error);
        g_error_free (error);
        return;
      }
  
    init_shaders (&error);
    if (error != NULL)
      {
        gtk_gl_area_set_error (area, error);
        g_error_free (error);
        return;
      }
  }
  ```
  
  If you need to change the options for creating the [gdk.glcontext.GLContext]
  you should use the `signal@Gtk.GLArea::create-context` signal.
*/
class GLArea : gtk.widget.Widget
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_gl_area_get_type != &gidSymbolNotFound ? gtk_gl_area_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new [gtk.glarea.GLArea] widget.
    Returns:     a new [gtk.glarea.GLArea]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_gl_area_new();
    this(_cretval, No.take);
  }

  /**
      Binds buffers to the framebuffer.
    
    Ensures that the area framebuffer object is made the current draw
    and read target, and that all the required buffers for the area
    are created and bound to the framebuffer.
    
    This function is automatically called before emitting the
    [gtk.glarea.GLArea.render] signal, and doesn't normally need to be
    called by application code.
  */
  void attachBuffers()
  {
    gtk_gl_area_attach_buffers(cast(GtkGLArea*)cPtr);
  }

  /**
      Gets the allowed APIs.
    
    See [gtk.glarea.GLArea.setAllowedApis].
    Returns:     the allowed APIs
  */
  gdk.types.GLAPI getAllowedApis()
  {
    GdkGLAPI _cretval;
    _cretval = gtk_gl_area_get_allowed_apis(cast(GtkGLArea*)cPtr);
    gdk.types.GLAPI _retval = cast(gdk.types.GLAPI)_cretval;
    return _retval;
  }

  /**
      Gets the API that is currently in use.
    
    If the GL area has not been realized yet, 0 is returned.
    Returns:     the currently used API
  */
  gdk.types.GLAPI getApi()
  {
    GdkGLAPI _cretval;
    _cretval = gtk_gl_area_get_api(cast(GtkGLArea*)cPtr);
    gdk.types.GLAPI _retval = cast(gdk.types.GLAPI)_cretval;
    return _retval;
  }

  /**
      Returns whether the area is in auto render mode or not.
    Returns:     true if the area is auto rendering, false otherwise
  */
  bool getAutoRender()
  {
    bool _retval;
    _retval = gtk_gl_area_get_auto_render(cast(GtkGLArea*)cPtr);
    return _retval;
  }

  /**
      Retrieves the [gdk.glcontext.GLContext] used by area.
    Returns:     the [gdk.glcontext.GLContext]
  */
  gdk.glcontext.GLContext getContext()
  {
    GdkGLContext* _cretval;
    _cretval = gtk_gl_area_get_context(cast(GtkGLArea*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.glcontext.GLContext)(cast(GdkGLContext*)_cretval, No.take);
    return _retval;
  }

  /**
      Gets the current error set on the area.
    Returns:     the [glib.error.ErrorG]
  */
  glib.error.ErrorG getError()
  {
    GError* _cretval;
    _cretval = gtk_gl_area_get_error(cast(GtkGLArea*)cPtr);
    auto _retval = _cretval ? new glib.error.ErrorG(cast(GError*)_cretval) : null;
    return _retval;
  }

  /**
      Returns whether the area has a depth buffer.
    Returns:     true if the area has a depth buffer, false otherwise
  */
  bool getHasDepthBuffer()
  {
    bool _retval;
    _retval = gtk_gl_area_get_has_depth_buffer(cast(GtkGLArea*)cPtr);
    return _retval;
  }

  /**
      Returns whether the area has a stencil buffer.
    Returns:     true if the area has a stencil buffer, false otherwise
  */
  bool getHasStencilBuffer()
  {
    bool _retval;
    _retval = gtk_gl_area_get_has_stencil_buffer(cast(GtkGLArea*)cPtr);
    return _retval;
  }

  /**
      Retrieves the required version of OpenGL.
    
    See [gtk.glarea.GLArea.setRequiredVersion].
    Params:
      major =       return location for the required major version
      minor =       return location for the required minor version
  */
  void getRequiredVersion(out int major, out int minor)
  {
    gtk_gl_area_get_required_version(cast(GtkGLArea*)cPtr, cast(int*)&major, cast(int*)&minor);
  }

  /**
      Returns whether the [gtk.glarea.GLArea] should use OpenGL ES.
    
    See [gtk.glarea.GLArea.setUseEs].
    Returns:     true if the [gtk.glarea.GLArea] should create an OpenGL ES context
        and false otherwise
  
    Deprecated:     Use [gtk.glarea.GLArea.getApi]
  */
  bool getUseEs()
  {
    bool _retval;
    _retval = gtk_gl_area_get_use_es(cast(GtkGLArea*)cPtr);
    return _retval;
  }

  /**
      Ensures that the [gdk.glcontext.GLContext] used by area is associated with
    the [gtk.glarea.GLArea].
    
    This function is automatically called before emitting the
    [gtk.glarea.GLArea.render] signal, and doesn't normally need
    to be called by application code.
  */
  void makeCurrent()
  {
    gtk_gl_area_make_current(cast(GtkGLArea*)cPtr);
  }

  /**
      Marks the currently rendered data (if any) as invalid, and queues
    a redraw of the widget.
    
    This ensures that the [gtk.glarea.GLArea.render] signal
    is emitted during the draw.
    
    This is only needed when [gtk.glarea.GLArea.setAutoRender] has
    been called with a false value. The default behaviour is to
    emit [gtk.glarea.GLArea.render] on each draw.
  */
  void queueRender()
  {
    gtk_gl_area_queue_render(cast(GtkGLArea*)cPtr);
  }

  /**
      Sets the allowed APIs to create a context with.
    
    You should check [gtk.glarea.GLArea.Gdk.GLAPI] before drawing
    with either API.
    
    By default, all APIs are allowed.
    Params:
      apis =       the allowed APIs
  */
  void setAllowedApis(gdk.types.GLAPI apis)
  {
    gtk_gl_area_set_allowed_apis(cast(GtkGLArea*)cPtr, apis);
  }

  /**
      Sets whether the [gtk.glarea.GLArea] is in auto render mode.
    
    If auto_render is true the [gtk.glarea.GLArea.render] signal will
    be emitted every time the widget draws. This is the default and is
    useful if drawing the widget is faster.
    
    If auto_render is false the data from previous rendering is kept
    around and will be used for drawing the widget the next time,
    unless the window is resized. In order to force a rendering
    [gtk.glarea.GLArea.queueRender] must be called. This mode is
    useful when the scene changes seldom, but takes a long time to redraw.
    Params:
      autoRender =       a boolean
  */
  void setAutoRender(bool autoRender)
  {
    gtk_gl_area_set_auto_render(cast(GtkGLArea*)cPtr, autoRender);
  }

  /**
      Sets an error on the area which will be shown instead of the
    GL rendering.
    
    This is useful in the `signalGtk.GLArea::create-context`
    signal if GL context creation fails.
    Params:
      error =       a new [glib.error.ErrorG], or null to unset the error
  */
  void setError(glib.error.ErrorG error = null)
  {
    gtk_gl_area_set_error(cast(GtkGLArea*)cPtr, error ? cast(const(GError)*)error.cPtr : null);
  }

  /**
      Sets whether the [gtk.glarea.GLArea] should use a depth buffer.
    
    If has_depth_buffer is true the widget will allocate and
    enable a depth buffer for the target framebuffer. Otherwise
    there will be none.
    Params:
      hasDepthBuffer =       true to add a depth buffer
  */
  void setHasDepthBuffer(bool hasDepthBuffer)
  {
    gtk_gl_area_set_has_depth_buffer(cast(GtkGLArea*)cPtr, hasDepthBuffer);
  }

  /**
      Sets whether the [gtk.glarea.GLArea] should use a stencil buffer.
    
    If has_stencil_buffer is true the widget will allocate and
    enable a stencil buffer for the target framebuffer. Otherwise
    there will be none.
    Params:
      hasStencilBuffer =       true to add a stencil buffer
  */
  void setHasStencilBuffer(bool hasStencilBuffer)
  {
    gtk_gl_area_set_has_stencil_buffer(cast(GtkGLArea*)cPtr, hasStencilBuffer);
  }

  /**
      Sets the required version of OpenGL to be used when creating
    the context for the widget.
    
    This function must be called before the area has been realized.
    Params:
      major =       the major version
      minor =       the minor version
  */
  void setRequiredVersion(int major, int minor)
  {
    gtk_gl_area_set_required_version(cast(GtkGLArea*)cPtr, major, minor);
  }

  /**
      Sets whether the area should create an OpenGL or an OpenGL ES context.
    
    You should check the capabilities of the [gdk.glcontext.GLContext] before drawing
    with either API.
    Params:
      useEs =       whether to use OpenGL or OpenGL ES
  
    Deprecated:     Use [gtk.glarea.GLArea.setAllowedApis]
  */
  void setUseEs(bool useEs)
  {
    gtk_gl_area_set_use_es(cast(GtkGLArea*)cPtr, useEs);
  }

  /**
      Emitted when the widget is being realized.
    
    This allows you to override how the GL context is created.
    This is useful when you want to reuse an existing GL context,
    or if you want to try creating different kinds of GL options.
    
    If context creation fails then the signal handler can use
    [gtk.glarea.GLArea.setError] to register a more detailed error
    of how the construction failed.
  
    ## Parameters
    $(LIST
      * $(B gLArea) the instance the signal is connected to
    )
    Returns:     a newly created [gdk.glcontext.GLContext];
          the [gtk.glarea.GLArea] widget will take ownership of the returned value.
  */
  alias CreateContextCallbackDlg = gdk.glcontext.GLContext delegate(gtk.glarea.GLArea gLArea);

  /** ditto */
  alias CreateContextCallbackFunc = gdk.glcontext.GLContext function(gtk.glarea.GLArea gLArea);

  /**
    Connect to CreateContext signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectCreateContext(T)(T callback, Flag!"after" after = No.after)
  if (is(T : CreateContextCallbackDlg) || is(T : CreateContextCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gLArea = getVal!(gtk.glarea.GLArea)(_paramVals);
      auto _retval = _dClosure.dlg(gLArea);
      setVal!gdk.glcontext.GLContext(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("create-context", closure, after);
  }

  /**
      Emitted every time the contents of the [gtk.glarea.GLArea] should be redrawn.
    
    The context is bound to the area prior to emitting this function,
    and the buffers are painted to the window once the emission terminates.
  
    ## Parameters
    $(LIST
      * $(B context)       the [gdk.glcontext.GLContext] used by area
      * $(B gLArea) the instance the signal is connected to
    )
    Returns:     true to stop other handlers from being invoked for the event.
        false to propagate the event further.
  */
  alias RenderCallbackDlg = bool delegate(gdk.glcontext.GLContext context, gtk.glarea.GLArea gLArea);

  /** ditto */
  alias RenderCallbackFunc = bool function(gdk.glcontext.GLContext context, gtk.glarea.GLArea gLArea);

  /**
    Connect to Render signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectRender(T)(T callback, Flag!"after" after = No.after)
  if (is(T : RenderCallbackDlg) || is(T : RenderCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto gLArea = getVal!(gtk.glarea.GLArea)(_paramVals);
      auto context = getVal!(gdk.glcontext.GLContext)(&_paramVals[1]);
      _retval = _dClosure.dlg(context, gLArea);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("render", closure, after);
  }

  /**
      Emitted once when the widget is realized, and then each time the widget
    is changed while realized.
    
    This is useful in order to keep GL state up to date with the widget size,
    like for instance camera properties which may depend on the width/height
    ratio.
    
    The GL context for the area is guaranteed to be current when this signal
    is emitted.
    
    The default handler sets up the GL viewport.
  
    ## Parameters
    $(LIST
      * $(B width)       the width of the viewport
      * $(B height)       the height of the viewport
      * $(B gLArea) the instance the signal is connected to
    )
  */
  alias ResizeCallbackDlg = void delegate(int width, int height, gtk.glarea.GLArea gLArea);

  /** ditto */
  alias ResizeCallbackFunc = void function(int width, int height, gtk.glarea.GLArea gLArea);

  /**
    Connect to Resize signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectResize(T)(T callback, Flag!"after" after = No.after)
  if (is(T : ResizeCallbackDlg) || is(T : ResizeCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gLArea = getVal!(gtk.glarea.GLArea)(_paramVals);
      auto width = getVal!(int)(&_paramVals[1]);
      auto height = getVal!(int)(&_paramVals[2]);
      _dClosure.dlg(width, height, gLArea);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("resize", closure, after);
  }
}
