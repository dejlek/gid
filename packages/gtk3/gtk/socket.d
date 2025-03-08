module gtk.socket;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gdk.window;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.container;
import gtk.types;
import xlib.types;

/**
    Together with #GtkPlug, #GtkSocket provides the ability to embed
  widgets from one process into another process in a fashion that
  is transparent to the user. One process creates a #GtkSocket widget
  and passes that widget’s window ID to the other process, which then
  creates a #GtkPlug with that window ID. Any widgets contained in the
  #GtkPlug then will appear inside the first application’s window.
  
  The socket’s window ID is obtained by using [gtk.socket.Socket.getId].
  Before using this function, the socket must have been realized,
  and for hence, have been added to its parent.
  
  ## Obtaining the window ID of a socket.
  
  ```c
  GtkWidget *socket = gtk_socket_new ();
  gtk_widget_show (socket);
  gtk_container_add (GTK_CONTAINER (parent), socket);
  
  // The following call is only necessary if one of
  // the ancestors of the socket is not yet visible.
  gtk_widget_realize (socket);
  g_print ("The ID of the sockets window is %#x\n",
           gtk_socket_get_id (socket));
  ```
  
  Note that if you pass the window ID of the socket to another
  process that will create a plug in the socket, you must make
  sure that the socket widget is not destroyed until that plug
  is created. Violating this rule will cause unpredictable
  consequences, the most likely consequence being that the plug
  will appear as a separate toplevel window. You can check if
  the plug has been created by using [gtk.socket.Socket.getPlugWindow].
  If it returns a non-null value, then the plug has been
  successfully created inside of the socket.
  
  When GTK+ is notified that the embedded window has been destroyed,
  then it will destroy the socket as well. You should always,
  therefore, be prepared for your sockets to be destroyed at any
  time when the main event loop is running. To prevent this from
  happening, you can connect to the #GtkSocket::plug-removed signal.
  
  The communication between a #GtkSocket and a #GtkPlug follows the
  [XEmbed Protocol](http://www.freedesktop.org/Standards/xembed-spec).
  This protocol has also been implemented in other toolkits, e.g. Qt,
  allowing the same level of integration when embedding a Qt widget
  in GTK or vice versa.
  
  The #GtkPlug and #GtkSocket widgets are only available when GTK+
  is compiled for the X11 platform and `GDK_WINDOWING_X11` is defined.
  They can only be used on a #GdkX11Display. To use #GtkPlug and
  #GtkSocket, you need to include the `gtk/gtkx.h` header.
*/
class Socket : gtk.container.Container
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_socket_get_type != &gidSymbolNotFound ? gtk_socket_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Create a new empty #GtkSocket.
    Returns:     the new #GtkSocket.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_socket_new();
    this(_cretval, No.take);
  }

  /**
      Adds an XEMBED client, such as a #GtkPlug, to the #GtkSocket.  The
    client may be in the same process or in a different process.
    
    To embed a #GtkPlug in a #GtkSocket, you can either create the
    #GtkPlug with `gtk_plug_new (0)`, call
    [gtk.plug.Plug.getId] to get the window ID of the plug, and then pass that to the
    [gtk.socket.Socket.addId], or you can call [gtk.socket.Socket.getId] to get the
    window ID for the socket, and call [gtk.plug.Plug.new_] passing in that
    ID.
    
    The #GtkSocket must have already be added into a toplevel window
     before you can make this call.
    Params:
      window =       the Window of a client participating in the XEMBED protocol.
  */
  void addId(xlib.types.Window window)
  {
    gtk_socket_add_id(cast(GtkSocket*)cPtr, window);
  }

  /**
      Gets the window ID of a #GtkSocket widget, which can then
    be used to create a client embedded inside the socket, for
    instance with [gtk.plug.Plug.new_].
    
    The #GtkSocket must have already be added into a toplevel window
    before you can make this call.
    Returns:     the window ID for the socket
  */
  xlib.types.Window getId()
  {
    xlib.types.Window _retval;
    _retval = gtk_socket_get_id(cast(GtkSocket*)cPtr);
    return _retval;
  }

  /**
      Retrieves the window of the plug. Use this to check if the plug has
    been created inside of the socket.
    Returns:     the window of the plug if
      available, or null
  */
  gdk.window.Window getPlugWindow()
  {
    GdkWindow* _cretval;
    _cretval = gtk_socket_get_plug_window(cast(GtkSocket*)cPtr);
    auto _retval = ObjectG.getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.take);
    return _retval;
  }

  /**
      This signal is emitted when a client is successfully
    added to the socket.
  
    ## Parameters
    $(LIST
      * $(B socket) the instance the signal is connected to
    )
  */
  alias PlugAddedCallbackDlg = void delegate(gtk.socket.Socket socket);

  /** ditto */
  alias PlugAddedCallbackFunc = void function(gtk.socket.Socket socket);

  /**
    Connect to PlugAdded signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectPlugAdded(T)(T callback, Flag!"after" after = No.after)
  if (is(T : PlugAddedCallbackDlg) || is(T : PlugAddedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto socket = getVal!(gtk.socket.Socket)(_paramVals);
      _dClosure.dlg(socket);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("plug-added", closure, after);
  }

  /**
      This signal is emitted when a client is removed from the socket.
    The default action is to destroy the #GtkSocket widget, so if you
    want to reuse it you must add a signal handler that returns true.
  
    ## Parameters
    $(LIST
      * $(B socket) the instance the signal is connected to
    )
    Returns:     true to stop other handlers from being invoked.
  */
  alias PlugRemovedCallbackDlg = bool delegate(gtk.socket.Socket socket);

  /** ditto */
  alias PlugRemovedCallbackFunc = bool function(gtk.socket.Socket socket);

  /**
    Connect to PlugRemoved signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectPlugRemoved(T)(T callback, Flag!"after" after = No.after)
  if (is(T : PlugRemovedCallbackDlg) || is(T : PlugRemovedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto socket = getVal!(gtk.socket.Socket)(_paramVals);
      _retval = _dClosure.dlg(socket);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("plug-removed", closure, after);
  }
}
