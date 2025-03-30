/// Module for [UriLauncher] class
module gtk.uri_launcher;

import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.types;
import glib.error;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.window;

/**
    A [gtk.uri_launcher.UriLauncher] object collects the arguments that are needed to open a uri
    with an application.
    
    Depending on system configuration, user preferences and available APIs, this
    may or may not show an app chooser dialog or launch the default application
    right away.
    
    The operation is started with the [gtk.uri_launcher.UriLauncher.launch] function.
    This API follows the GIO async pattern, and the result can be obtained by
    calling [gtk.uri_launcher.UriLauncher.launchFinish].
    
    To launch a file, use [gtk.file_launcher.FileLauncher].
*/
class UriLauncher : gobject.object.ObjectG
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_uri_launcher_get_type != &gidSymbolNotFound ? gtk_uri_launcher_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override UriLauncher self()
  {
    return this;
  }

  /**
      Creates a new [gtk.uri_launcher.UriLauncher] object.
  
      Params:
        uri = the uri to open
      Returns: the new [gtk.uri_launcher.UriLauncher]
  */
  this(string uri = null)
  {
    GtkUriLauncher* _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    _cretval = gtk_uri_launcher_new(_uri);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the uri that will be opened.
      Returns: the uri
  */
  string getUri()
  {
    const(char)* _cretval;
    _cretval = gtk_uri_launcher_get_uri(cast(GtkUriLauncher*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Launch an application to open the uri.
      
      This may present an app chooser dialog to the user.
      
      The callback will be called when the operation is completed.
      It should call [gtk.uri_launcher.UriLauncher.launchFinish] to obtain
      the result.
  
      Params:
        parent = the parent [gtk.window.Window]
        cancellable = a [gio.cancellable.Cancellable] to cancel the operation
        callback = a callback to call when the operation is complete
  */
  void launch(gtk.window.Window parent = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_uri_launcher_launch(cast(GtkUriLauncher*)cPtr, parent ? cast(GtkWindow*)parent.cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gtk.uri_launcher.UriLauncher.launch] call and
      returns the result.
  
      Params:
        result = a [gio.async_result.AsyncResult]
      Returns: `TRUE` if an application was launched,
            or `FALSE` and error is set
      Throws: [ErrorG]
  */
  bool launchFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = gtk_uri_launcher_launch_finish(cast(GtkUriLauncher*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
      Sets the uri that will be opened.
  
      Params:
        uri = the uri
  */
  void setUri(string uri = null)
  {
    const(char)* _uri = uri.toCString(No.Alloc);
    gtk_uri_launcher_set_uri(cast(GtkUriLauncher*)cPtr, _uri);
  }
}
