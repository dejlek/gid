module gio.dbus_connection;

import gid.gid;
import gio.action_group;
import gio.async_initable;
import gio.async_initable_mixin;
import gio.async_result;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.credentials;
import gio.dbus_auth_observer;
import gio.dbus_interface_info;
import gio.dbus_message;
import gio.initable;
import gio.initable_mixin;
import gio.iostream;
import gio.menu_model;
import gio.types;
import gio.unix_fdlist;
import glib.error;
import glib.types;
import glib.variant;
import glib.variant_type;
import gobject.closure;
import gobject.dclosure;
import gobject.object;

/**
 * The `GDBusConnection` type is used for D-Bus connections to remote
 * peers such as a message buses.
 * It is a low-level API that offers a lot of flexibility. For instance,
 * it lets you establish a connection over any transport that can by represented
 * as a [gio.iostream.IOStream].
 * This class is rarely used directly in D-Bus clients. If you are writing
 * a D-Bus client, it is often easier to use the func@Gio.bus_own_name,
 * func@Gio.bus_watch_name or [gio.dbus_proxy.DBusProxy.newForBus] APIs.
 * As an exception to the usual GLib rule that a particular object must not
 * be used by two threads at the same time, `GDBusConnection`s methods may be
 * called from any thread. This is so that func@Gio.bus_get and
 * func@Gio.bus_get_sync can safely return the same `GDBusConnection` when
 * called from any thread.
 * Most of the ways to obtain a `GDBusConnection` automatically initialize it
 * $(LPAREN)i.e. connect to D-Bus$(RPAREN): for instance, [gio.dbus_connection.DBusConnection.new_] and
 * func@Gio.bus_get, and the synchronous versions of those methods, give you
 * an initialized connection. Language bindings for GIO should use
 * [gio.initable.Initable.new_] or [gio.async_initable.AsyncInitable.newAsync], which also
 * initialize the connection.
 * If you construct an uninitialized `GDBusConnection`, such as via
 * [gobject.object.ObjectG.new_], you must initialize it via [gio.initable.Initable.init_] or
 * [gio.async_initable.AsyncInitable.initAsync] before using its methods or properties.
 * Calling methods or accessing properties on a `GDBusConnection` that has not
 * completed initialization successfully is considered to be invalid, and leads
 * to undefined behaviour. In particular, if initialization fails with a
 * `GError`, the only valid thing you can do with that `GDBusConnection` is to
 * free it with [gobject.object.ObjectG.unref].
 * ## An example D-Bus server
 * Here is an example for a D-Bus server:
 * [gdbus-example-server.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-server.c)
 * ## An example for exporting a subtree
 * Here is an example for exporting a subtree:
 * [gdbus-example-subtree.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-subtree.c)
 * ## An example for file descriptor passing
 * Here is an example for passing UNIX file descriptors:
 * [gdbus-unix-fd-client.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-unix-fd-client.c)
 * ## An example for exporting a GObject
 * Here is an example for exporting a #GObject:
 * [gdbus-example-export.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-export.c)
 */
class DBusConnection : gobject.object.ObjectG, gio.async_initable.AsyncInitable, gio.initable.Initable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_connection_get_type != &gidSymbolNotFound ? g_dbus_connection_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin AsyncInitableT!();
  mixin InitableT!();

  /**
   * Finishes an operation started with [gio.dbus_connection.DBusConnection.new_].
   * Params:
   *   res = a #GAsyncResult obtained from the #GAsyncReadyCallback
   *     passed to [gio.dbus_connection.DBusConnection.new_].
   * Returns: a #GDBusConnection or %NULL if error is set. Free
   *   with [gobject.object.ObjectG.unref].
   */
  static gio.dbus_connection.DBusConnection newFinish(gio.async_result.AsyncResult res)
  {
    GDBusConnection* _cretval;
    GError *_err;
    _cretval = g_dbus_connection_new_finish(res ? cast(GAsyncResult*)(cast(ObjectG)res).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gio.dbus_connection.DBusConnection)(cast(GDBusConnection*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Finishes an operation started with [gio.dbus_connection.DBusConnection.newForAddress].
   * Params:
   *   res = a #GAsyncResult obtained from the #GAsyncReadyCallback passed
   *     to [gio.dbus_connection.DBusConnection.new_]
   * Returns: a #GDBusConnection or %NULL if error is set.
   *   Free with [gobject.object.ObjectG.unref].
   */
  static gio.dbus_connection.DBusConnection newForAddressFinish(gio.async_result.AsyncResult res)
  {
    GDBusConnection* _cretval;
    GError *_err;
    _cretval = g_dbus_connection_new_for_address_finish(res ? cast(GAsyncResult*)(cast(ObjectG)res).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gio.dbus_connection.DBusConnection)(cast(GDBusConnection*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Synchronously connects and sets up a D-Bus client connection for
   * exchanging D-Bus messages with an endpoint specified by address
   * which must be in the
   * [D-Bus address format](https://dbus.freedesktop.org/doc/dbus-specification.html#addresses).
   * This constructor can only be used to initiate client-side
   * connections - use [gio.dbus_connection.DBusConnection.newSync] if you need to act
   * as the server. In particular, flags cannot contain the
   * %G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_SERVER,
   * %G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_ALLOW_ANONYMOUS or
   * %G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_REQUIRE_SAME_USER flags.
   * This is a synchronous failable constructor. See
   * [gio.dbus_connection.DBusConnection.newForAddress] for the asynchronous version.
   * If observer is not %NULL it may be used to control the
   * authentication process.
   * Params:
   *   address = a D-Bus address
   *   flags = flags describing how to make the connection
   *   observer = a #GDBusAuthObserver or %NULL
   *   cancellable = a #GCancellable or %NULL
   * Returns: a #GDBusConnection or %NULL if error is set.
   *   Free with [gobject.object.ObjectG.unref].
   */
  static gio.dbus_connection.DBusConnection newForAddressSync(string address, gio.types.DBusConnectionFlags flags, gio.dbus_auth_observer.DBusAuthObserver observer = null, gio.cancellable.Cancellable cancellable = null)
  {
    GDBusConnection* _cretval;
    const(char)* _address = address.toCString(No.Alloc);
    GError *_err;
    _cretval = g_dbus_connection_new_for_address_sync(_address, flags, observer ? cast(GDBusAuthObserver*)observer.cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gio.dbus_connection.DBusConnection)(cast(GDBusConnection*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Synchronously sets up a D-Bus connection for exchanging D-Bus messages
   * with the end represented by stream.
   * If stream is a #GSocketConnection, then the corresponding #GSocket
   * will be put into non-blocking mode.
   * The D-Bus connection will interact with stream from a worker thread.
   * As a result, the caller should not interact with stream after this
   * method has been called, except by calling [gobject.object.ObjectG.unref] on it.
   * If observer is not %NULL it may be used to control the
   * authentication process.
   * This is a synchronous failable constructor. See
   * [gio.dbus_connection.DBusConnection.new_] for the asynchronous version.
   * Params:
   *   stream = a #GIOStream
   *   guid = the GUID to use if authenticating as a server or %NULL
   *   flags = flags describing how to make the connection
   *   observer = a #GDBusAuthObserver or %NULL
   *   cancellable = a #GCancellable or %NULL
   * Returns: a #GDBusConnection or %NULL if error is set.
   *   Free with [gobject.object.ObjectG.unref].
   */
  static gio.dbus_connection.DBusConnection newSync(gio.iostream.IOStream stream, string guid, gio.types.DBusConnectionFlags flags, gio.dbus_auth_observer.DBusAuthObserver observer = null, gio.cancellable.Cancellable cancellable = null)
  {
    GDBusConnection* _cretval;
    const(char)* _guid = guid.toCString(No.Alloc);
    GError *_err;
    _cretval = g_dbus_connection_new_sync(stream ? cast(GIOStream*)stream.cPtr(No.Dup) : null, _guid, flags, observer ? cast(GDBusAuthObserver*)observer.cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gio.dbus_connection.DBusConnection)(cast(GDBusConnection*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Asynchronously sets up a D-Bus connection for exchanging D-Bus messages
   * with the end represented by stream.
   * If stream is a #GSocketConnection, then the corresponding #GSocket
   * will be put into non-blocking mode.
   * The D-Bus connection will interact with stream from a worker thread.
   * As a result, the caller should not interact with stream after this
   * method has been called, except by calling [gobject.object.ObjectG.unref] on it.
   * If observer is not %NULL it may be used to control the
   * authentication process.
   * When the operation is finished, callback will be invoked. You can
   * then call [gio.dbus_connection.DBusConnection.newFinish] to get the result of the
   * operation.
   * This is an asynchronous failable constructor. See
   * [gio.dbus_connection.DBusConnection.newSync] for the synchronous
   * version.
   * Params:
   *   stream = a #GIOStream
   *   guid = the GUID to use if authenticating as a server or %NULL
   *   flags = flags describing how to make the connection
   *   observer = a #GDBusAuthObserver or %NULL
   *   cancellable = a #GCancellable or %NULL
   *   callback = a #GAsyncReadyCallback to call when the request is satisfied
   */
  static void new_(gio.iostream.IOStream stream, string guid, gio.types.DBusConnectionFlags flags, gio.dbus_auth_observer.DBusAuthObserver observer = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _guid = guid.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_dbus_connection_new(stream ? cast(GIOStream*)stream.cPtr(No.Dup) : null, _guid, flags, observer ? cast(GDBusAuthObserver*)observer.cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
   * Asynchronously connects and sets up a D-Bus client connection for
   * exchanging D-Bus messages with an endpoint specified by address
   * which must be in the
   * [D-Bus address format](https://dbus.freedesktop.org/doc/dbus-specification.html#addresses).
   * This constructor can only be used to initiate client-side
   * connections - use [gio.dbus_connection.DBusConnection.new_] if you need to act as the
   * server. In particular, flags cannot contain the
   * %G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_SERVER,
   * %G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_ALLOW_ANONYMOUS or
   * %G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_REQUIRE_SAME_USER flags.
   * When the operation is finished, callback will be invoked. You can
   * then call [gio.dbus_connection.DBusConnection.newForAddressFinish] to get the result of
   * the operation.
   * If observer is not %NULL it may be used to control the
   * authentication process.
   * This is an asynchronous failable constructor. See
   * [gio.dbus_connection.DBusConnection.newForAddressSync] for the synchronous
   * version.
   * Params:
   *   address = a D-Bus address
   *   flags = flags describing how to make the connection
   *   observer = a #GDBusAuthObserver or %NULL
   *   cancellable = a #GCancellable or %NULL
   *   callback = a #GAsyncReadyCallback to call when the request is satisfied
   */
  static void newForAddress(string address, gio.types.DBusConnectionFlags flags, gio.dbus_auth_observer.DBusAuthObserver observer = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _address = address.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_dbus_connection_new_for_address(_address, flags, observer ? cast(GDBusAuthObserver*)observer.cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
   * Adds a message filter. Filters are handlers that are run on all
   * incoming and outgoing messages, prior to standard dispatch. Filters
   * are run in the order that they were added.  The same handler can be
   * added as a filter more than once, in which case it will be run more
   * than once.  Filters added during a filter callback won't be run on
   * the message being processed. Filter functions are allowed to modify
   * and even drop messages.
   * Note that filters are run in a dedicated message handling thread so
   * they can't block and, generally, can't do anything but signal a
   * worker thread. Also note that filters are rarely needed - use API
   * such as [gio.dbus_connection.DBusConnection.sendMessageWithReply],
   * [gio.dbus_connection.DBusConnection.signalSubscribe] or [gio.dbus_connection.DBusConnection.call] instead.
   * If a filter consumes an incoming message the message is not
   * dispatched anywhere else - not even the standard dispatch machinery
   * $(LPAREN)that API such as [gio.dbus_connection.DBusConnection.signalSubscribe] and
   * [gio.dbus_connection.DBusConnection.sendMessageWithReply] relies on$(RPAREN) will see the
   * message. Similarly, if a filter consumes an outgoing message, the
   * message will not be sent to the other peer.
   * If user_data_free_func is non-%NULL, it will be called $(LPAREN)in the
   * thread-default main context of the thread you are calling this
   * method from$(RPAREN) at some point after user_data is no longer
   * needed. $(LPAREN)It is not guaranteed to be called synchronously when the
   * filter is removed, and may be called after connection has been
   * destroyed.$(RPAREN)
   * Params:
   *   filterFunction = a filter function
   * Returns: a filter identifier that can be used with
   *   [gio.dbus_connection.DBusConnection.removeFilter]
   */
  uint addFilter(gio.types.DBusMessageFilterFunction filterFunction)
  {
    extern(C) GDBusMessage* _filterFunctionCallback(GDBusConnection* connection, GDBusMessage* message, bool incoming, void* userData)
    {
      gio.dbus_message.DBusMessage _dretval;
      auto _dlg = cast(gio.types.DBusMessageFilterFunction*)userData;

      _dretval = (*_dlg)(ObjectG.getDObject!(gio.dbus_connection.DBusConnection)(cast(void*)connection, No.Take), ObjectG.getDObject!(gio.dbus_message.DBusMessage)(cast(void*)message, Yes.Take), incoming);
      GDBusMessage* _retval = cast(GDBusMessage*)_dretval.cPtr(Yes.Dup);

      return _retval;
    }
    auto _filterFunctionCB = filterFunction ? &_filterFunctionCallback : null;

    uint _retval;
    auto _filterFunction = filterFunction ? freezeDelegate(cast(void*)&filterFunction) : null;
    GDestroyNotify _filterFunctionDestroyCB = filterFunction ? &thawDelegate : null;
    _retval = g_dbus_connection_add_filter(cast(GDBusConnection*)cPtr, _filterFunctionCB, _filterFunction, _filterFunctionDestroyCB);
    return _retval;
  }

  /**
   * Asynchronously invokes the method_name method on the
   * interface_name D-Bus interface on the remote object at
   * object_path owned by bus_name.
   * If connection is closed then the operation will fail with
   * %G_IO_ERROR_CLOSED. If cancellable is canceled, the operation will
   * fail with %G_IO_ERROR_CANCELLED. If parameters contains a value
   * not compatible with the D-Bus protocol, the operation fails with
   * %G_IO_ERROR_INVALID_ARGUMENT.
   * If reply_type is non-%NULL then the reply will be checked for having this type and an
   * error will be raised if it does not match.  Said another way, if you give a reply_type
   * then any non-%NULL return value will be of this type. Unless it’s
   * %G_VARIANT_TYPE_UNIT, the reply_type will be a tuple containing one or more
   * values.
   * If the parameters #GVariant is floating, it is consumed. This allows
   * convenient 'inline' use of [glib.variant.VariantG.new_], e.g.:
   * |[<!-- language\="C" -->
   * g_dbus_connection_call $(LPAREN)connection,
   * "org.freedesktop.StringThings",
   * "/org/freedesktop/StringThings",
   * "org.freedesktop.StringThings",
   * "TwoStrings",
   * g_variant_new $(LPAREN)"$(LPAREN)ss$(RPAREN)",
   * "Thing One",
   * "Thing Two"$(RPAREN),
   * NULL,
   * G_DBUS_CALL_FLAGS_NONE,
   * -1,
   * NULL,
   * $(LPAREN)GAsyncReadyCallback$(RPAREN) two_strings_done,
   * NULL$(RPAREN);
   * ]|
   * This is an asynchronous method. When the operation is finished,
   * callback will be invoked in the
   * [thread-default main context][g-main-context-push-thread-default]
   * of the thread you are calling this method from. You can then call
   * [gio.dbus_connection.DBusConnection.callFinish] to get the result of the operation.
   * See [gio.dbus_connection.DBusConnection.callSync] for the synchronous version of this
   * function.
   * If callback is %NULL then the D-Bus method call message will be sent with
   * the %G_DBUS_MESSAGE_FLAGS_NO_REPLY_EXPECTED flag set.
   * Params:
   *   busName = a unique or well-known bus name or %NULL if
   *     connection is not a message bus connection
   *   objectPath = path of remote object
   *   interfaceName = D-Bus interface to invoke method on
   *   methodName = the name of the method to invoke
   *   parameters = a #GVariant tuple with parameters for the method
   *     or %NULL if not passing parameters
   *   replyType = the expected type of the reply $(LPAREN)which will be a
   *     tuple$(RPAREN), or %NULL
   *   flags = flags from the #GDBusCallFlags enumeration
   *   timeoutMsec = the timeout in milliseconds, -1 to use the default
   *     timeout or %G_MAXINT for no timeout
   *   cancellable = a #GCancellable or %NULL
   *   callback = a #GAsyncReadyCallback to call when the request
   *     is satisfied or %NULL if you don't care about the result of the
   *     method invocation
   */
  void call(string busName, string objectPath, string interfaceName, string methodName, glib.variant.VariantG parameters, glib.variant_type.VariantType replyType, gio.types.DBusCallFlags flags, int timeoutMsec, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _busName = busName.toCString(No.Alloc);
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    const(char)* _interfaceName = interfaceName.toCString(No.Alloc);
    const(char)* _methodName = methodName.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_dbus_connection_call(cast(GDBusConnection*)cPtr, _busName, _objectPath, _interfaceName, _methodName, parameters ? cast(VariantC*)parameters.cPtr(No.Dup) : null, replyType ? cast(const(GVariantType)*)replyType.cPtr(No.Dup) : null, flags, timeoutMsec, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
   * Finishes an operation started with [gio.dbus_connection.DBusConnection.call].
   * Params:
   *   res = a #GAsyncResult obtained from the #GAsyncReadyCallback passed to [gio.dbus_connection.DBusConnection.call]
   * Returns: %NULL if error is set. Otherwise a non-floating
   *   #GVariant tuple with return values. Free with [glib.variant.VariantG.unref].
   */
  glib.variant.VariantG callFinish(gio.async_result.AsyncResult res)
  {
    VariantC* _cretval;
    GError *_err;
    _cretval = g_dbus_connection_call_finish(cast(GDBusConnection*)cPtr, res ? cast(GAsyncResult*)(cast(ObjectG)res).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = _cretval ? new glib.variant.VariantG(cast(VariantC*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Synchronously invokes the method_name method on the
   * interface_name D-Bus interface on the remote object at
   * object_path owned by bus_name.
   * If connection is closed then the operation will fail with
   * %G_IO_ERROR_CLOSED. If cancellable is canceled, the
   * operation will fail with %G_IO_ERROR_CANCELLED. If parameters
   * contains a value not compatible with the D-Bus protocol, the operation
   * fails with %G_IO_ERROR_INVALID_ARGUMENT.
   * If reply_type is non-%NULL then the reply will be checked for having
   * this type and an error will be raised if it does not match.  Said
   * another way, if you give a reply_type then any non-%NULL return
   * value will be of this type.
   * If the parameters #GVariant is floating, it is consumed.
   * This allows convenient 'inline' use of [glib.variant.VariantG.new_], e.g.:
   * |[<!-- language\="C" -->
   * g_dbus_connection_call_sync $(LPAREN)connection,
   * "org.freedesktop.StringThings",
   * "/org/freedesktop/StringThings",
   * "org.freedesktop.StringThings",
   * "TwoStrings",
   * g_variant_new $(LPAREN)"$(LPAREN)ss$(RPAREN)",
   * "Thing One",
   * "Thing Two"$(RPAREN),
   * NULL,
   * G_DBUS_CALL_FLAGS_NONE,
   * -1,
   * NULL,
   * &error$(RPAREN);
   * ]|
   * The calling thread is blocked until a reply is received. See
   * [gio.dbus_connection.DBusConnection.call] for the asynchronous version of
   * this method.
   * Params:
   *   busName = a unique or well-known bus name or %NULL if
   *     connection is not a message bus connection
   *   objectPath = path of remote object
   *   interfaceName = D-Bus interface to invoke method on
   *   methodName = the name of the method to invoke
   *   parameters = a #GVariant tuple with parameters for the method
   *     or %NULL if not passing parameters
   *   replyType = the expected type of the reply, or %NULL
   *   flags = flags from the #GDBusCallFlags enumeration
   *   timeoutMsec = the timeout in milliseconds, -1 to use the default
   *     timeout or %G_MAXINT for no timeout
   *   cancellable = a #GCancellable or %NULL
   * Returns: %NULL if error is set. Otherwise a non-floating
   *   #GVariant tuple with return values. Free with [glib.variant.VariantG.unref].
   */
  glib.variant.VariantG callSync(string busName, string objectPath, string interfaceName, string methodName, glib.variant.VariantG parameters, glib.variant_type.VariantType replyType, gio.types.DBusCallFlags flags, int timeoutMsec, gio.cancellable.Cancellable cancellable = null)
  {
    VariantC* _cretval;
    const(char)* _busName = busName.toCString(No.Alloc);
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    const(char)* _interfaceName = interfaceName.toCString(No.Alloc);
    const(char)* _methodName = methodName.toCString(No.Alloc);
    GError *_err;
    _cretval = g_dbus_connection_call_sync(cast(GDBusConnection*)cPtr, _busName, _objectPath, _interfaceName, _methodName, parameters ? cast(VariantC*)parameters.cPtr(No.Dup) : null, replyType ? cast(const(GVariantType)*)replyType.cPtr(No.Dup) : null, flags, timeoutMsec, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = _cretval ? new glib.variant.VariantG(cast(VariantC*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Like [gio.dbus_connection.DBusConnection.call] but also takes a #GUnixFDList object.
   * The file descriptors normally correspond to %G_VARIANT_TYPE_HANDLE
   * values in the body of the message. For example, if a message contains
   * two file descriptors, fd_list would have length 2, and
   * `g_variant_new_handle $(LPAREN)0$(RPAREN)` and `g_variant_new_handle $(LPAREN)1$(RPAREN)` would appear
   * somewhere in the body of the message $(LPAREN)not necessarily in that order!$(RPAREN)
   * to represent the file descriptors at indexes 0 and 1 respectively.
   * When designing D-Bus APIs that are intended to be interoperable,
   * please note that non-GDBus implementations of D-Bus can usually only
   * access file descriptors if they are referenced in this way by a
   * value of type %G_VARIANT_TYPE_HANDLE in the body of the message.
   * This method is only available on UNIX.
   * Params:
   *   busName = a unique or well-known bus name or %NULL if
   *     connection is not a message bus connection
   *   objectPath = path of remote object
   *   interfaceName = D-Bus interface to invoke method on
   *   methodName = the name of the method to invoke
   *   parameters = a #GVariant tuple with parameters for the method
   *     or %NULL if not passing parameters
   *   replyType = the expected type of the reply, or %NULL
   *   flags = flags from the #GDBusCallFlags enumeration
   *   timeoutMsec = the timeout in milliseconds, -1 to use the default
   *     timeout or %G_MAXINT for no timeout
   *   fdList = a #GUnixFDList or %NULL
   *   cancellable = a #GCancellable or %NULL
   *   callback = a #GAsyncReadyCallback to call when the request is
   *     satisfied or %NULL if you don't * care about the result of the
   *     method invocation
   */
  void callWithUnixFdList(string busName, string objectPath, string interfaceName, string methodName, glib.variant.VariantG parameters, glib.variant_type.VariantType replyType, gio.types.DBusCallFlags flags, int timeoutMsec, gio.unix_fdlist.UnixFDList fdList = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _busName = busName.toCString(No.Alloc);
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    const(char)* _interfaceName = interfaceName.toCString(No.Alloc);
    const(char)* _methodName = methodName.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_dbus_connection_call_with_unix_fd_list(cast(GDBusConnection*)cPtr, _busName, _objectPath, _interfaceName, _methodName, parameters ? cast(VariantC*)parameters.cPtr(No.Dup) : null, replyType ? cast(const(GVariantType)*)replyType.cPtr(No.Dup) : null, flags, timeoutMsec, fdList ? cast(GUnixFDList*)fdList.cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
   * Finishes an operation started with [gio.dbus_connection.DBusConnection.callWithUnixFdList].
   * The file descriptors normally correspond to %G_VARIANT_TYPE_HANDLE
   * values in the body of the message. For example,
   * if [glib.variant.VariantG.getHandle] returns 5, that is intended to be a reference
   * to the file descriptor that can be accessed by
   * `g_unix_fd_list_get $(LPAREN)*out_fd_list, 5, ...$(RPAREN)`.
   * When designing D-Bus APIs that are intended to be interoperable,
   * please note that non-GDBus implementations of D-Bus can usually only
   * access file descriptors if they are referenced in this way by a
   * value of type %G_VARIANT_TYPE_HANDLE in the body of the message.
   * Params:
   *   outFdList = return location for a #GUnixFDList or %NULL
   *   res = a #GAsyncResult obtained from the #GAsyncReadyCallback passed to
   *     [gio.dbus_connection.DBusConnection.callWithUnixFdList]
   * Returns: %NULL if error is set. Otherwise a non-floating
   *   #GVariant tuple with return values. Free with [glib.variant.VariantG.unref].
   */
  glib.variant.VariantG callWithUnixFdListFinish(out gio.unix_fdlist.UnixFDList outFdList, gio.async_result.AsyncResult res)
  {
    VariantC* _cretval;
    GUnixFDList* _outFdList;
    GError *_err;
    _cretval = g_dbus_connection_call_with_unix_fd_list_finish(cast(GDBusConnection*)cPtr, &_outFdList, res ? cast(GAsyncResult*)(cast(ObjectG)res).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = _cretval ? new glib.variant.VariantG(cast(VariantC*)_cretval, Yes.Take) : null;
    outFdList = new gio.unix_fdlist.UnixFDList(cast(void*)_outFdList, Yes.Take);
    return _retval;
  }

  /**
   * Like [gio.dbus_connection.DBusConnection.callSync] but also takes and returns #GUnixFDList objects.
   * See [gio.dbus_connection.DBusConnection.callWithUnixFdList] and
   * [gio.dbus_connection.DBusConnection.callWithUnixFdListFinish] for more details.
   * This method is only available on UNIX.
   * Params:
   *   busName = a unique or well-known bus name or %NULL
   *     if connection is not a message bus connection
   *   objectPath = path of remote object
   *   interfaceName = D-Bus interface to invoke method on
   *   methodName = the name of the method to invoke
   *   parameters = a #GVariant tuple with parameters for
   *     the method or %NULL if not passing parameters
   *   replyType = the expected type of the reply, or %NULL
   *   flags = flags from the #GDBusCallFlags enumeration
   *   timeoutMsec = the timeout in milliseconds, -1 to use the default
   *     timeout or %G_MAXINT for no timeout
   *   fdList = a #GUnixFDList or %NULL
   *   outFdList = return location for a #GUnixFDList or %NULL
   *   cancellable = a #GCancellable or %NULL
   * Returns: %NULL if error is set. Otherwise a non-floating
   *   #GVariant tuple with return values. Free with [glib.variant.VariantG.unref].
   */
  glib.variant.VariantG callWithUnixFdListSync(string busName, string objectPath, string interfaceName, string methodName, glib.variant.VariantG parameters, glib.variant_type.VariantType replyType, gio.types.DBusCallFlags flags, int timeoutMsec, gio.unix_fdlist.UnixFDList fdList, out gio.unix_fdlist.UnixFDList outFdList, gio.cancellable.Cancellable cancellable = null)
  {
    VariantC* _cretval;
    const(char)* _busName = busName.toCString(No.Alloc);
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    const(char)* _interfaceName = interfaceName.toCString(No.Alloc);
    const(char)* _methodName = methodName.toCString(No.Alloc);
    GUnixFDList* _outFdList;
    GError *_err;
    _cretval = g_dbus_connection_call_with_unix_fd_list_sync(cast(GDBusConnection*)cPtr, _busName, _objectPath, _interfaceName, _methodName, parameters ? cast(VariantC*)parameters.cPtr(No.Dup) : null, replyType ? cast(const(GVariantType)*)replyType.cPtr(No.Dup) : null, flags, timeoutMsec, fdList ? cast(GUnixFDList*)fdList.cPtr(No.Dup) : null, &_outFdList, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = _cretval ? new glib.variant.VariantG(cast(VariantC*)_cretval, Yes.Take) : null;
    outFdList = new gio.unix_fdlist.UnixFDList(cast(void*)_outFdList, Yes.Take);
    return _retval;
  }

  /**
   * Closes connection. Note that this never causes the process to
   * exit $(LPAREN)this might only happen if the other end of a shared message
   * bus connection disconnects, see #GDBusConnection:exit-on-close$(RPAREN).
   * Once the connection is closed, operations such as sending a message
   * will return with the error %G_IO_ERROR_CLOSED. Closing a connection
   * will not automatically flush the connection so queued messages may
   * be lost. Use [gio.dbus_connection.DBusConnection.flush] if you need such guarantees.
   * If connection is already closed, this method fails with
   * %G_IO_ERROR_CLOSED.
   * When connection has been closed, the #GDBusConnection::closed
   * signal is emitted in the
   * [thread-default main context][g-main-context-push-thread-default]
   * of the thread that connection was constructed in.
   * This is an asynchronous method. When the operation is finished,
   * callback will be invoked in the
   * [thread-default main context][g-main-context-push-thread-default]
   * of the thread you are calling this method from. You can
   * then call [gio.dbus_connection.DBusConnection.closeFinish] to get the result of the
   * operation. See [gio.dbus_connection.DBusConnection.closeSync] for the synchronous
   * version.
   * Params:
   *   cancellable = a #GCancellable or %NULL
   *   callback = a #GAsyncReadyCallback to call when the request is
   *     satisfied or %NULL if you don't care about the result
   */
  void close(gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_dbus_connection_close(cast(GDBusConnection*)cPtr, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
   * Finishes an operation started with [gio.dbus_connection.DBusConnection.close].
   * Params:
   *   res = a #GAsyncResult obtained from the #GAsyncReadyCallback passed
   *     to [gio.dbus_connection.DBusConnection.close]
   * Returns: %TRUE if the operation succeeded, %FALSE if error is set
   */
  bool closeFinish(gio.async_result.AsyncResult res)
  {
    bool _retval;
    GError *_err;
    _retval = g_dbus_connection_close_finish(cast(GDBusConnection*)cPtr, res ? cast(GAsyncResult*)(cast(ObjectG)res).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Synchronously closes connection. The calling thread is blocked
   * until this is done. See [gio.dbus_connection.DBusConnection.close] for the
   * asynchronous version of this method and more details about what it
   * does.
   * Params:
   *   cancellable = a #GCancellable or %NULL
   * Returns: %TRUE if the operation succeeded, %FALSE if error is set
   */
  bool closeSync(gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = g_dbus_connection_close_sync(cast(GDBusConnection*)cPtr, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Emits a signal.
   * If the parameters GVariant is floating, it is consumed.
   * This can only fail if parameters is not compatible with the D-Bus protocol
   * $(LPAREN)%G_IO_ERROR_INVALID_ARGUMENT$(RPAREN), or if connection has been closed
   * $(LPAREN)%G_IO_ERROR_CLOSED$(RPAREN).
   * Params:
   *   destinationBusName = the unique bus name for the destination
   *     for the signal or %NULL to emit to all listeners
   *   objectPath = path of remote object
   *   interfaceName = D-Bus interface to emit a signal on
   *   signalName = the name of the signal to emit
   *   parameters = a #GVariant tuple with parameters for the signal
   *     or %NULL if not passing parameters
   * Returns: %TRUE unless error is set
   */
  bool emitSignal(string destinationBusName, string objectPath, string interfaceName, string signalName, glib.variant.VariantG parameters = null)
  {
    bool _retval;
    const(char)* _destinationBusName = destinationBusName.toCString(No.Alloc);
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    const(char)* _interfaceName = interfaceName.toCString(No.Alloc);
    const(char)* _signalName = signalName.toCString(No.Alloc);
    GError *_err;
    _retval = g_dbus_connection_emit_signal(cast(GDBusConnection*)cPtr, _destinationBusName, _objectPath, _interfaceName, _signalName, parameters ? cast(VariantC*)parameters.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Exports action_group on connection at object_path.
   * The implemented D-Bus API should be considered private.  It is
   * subject to change in the future.
   * A given object path can only have one action group exported on it.
   * If this constraint is violated, the export will fail and 0 will be
   * returned $(LPAREN)with error set accordingly$(RPAREN).
   * You can unexport the action group using
   * [gio.dbus_connection.DBusConnection.unexportActionGroup] with the return value of
   * this function.
   * The thread default main context is taken at the time of this call.
   * All incoming action activations and state change requests are
   * reported from this context.  Any changes on the action group that
   * cause it to emit signals must also come from this same context.
   * Since incoming action activations and state change requests are
   * rather likely to cause changes on the action group, this effectively
   * limits a given action group to being exported from only one main
   * context.
   * Params:
   *   objectPath = a D-Bus object path
   *   actionGroup = a #GActionGroup
   * Returns: the ID of the export $(LPAREN)never zero$(RPAREN), or 0 in case of failure
   */
  uint exportActionGroup(string objectPath, gio.action_group.ActionGroup actionGroup)
  {
    uint _retval;
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    GError *_err;
    _retval = g_dbus_connection_export_action_group(cast(GDBusConnection*)cPtr, _objectPath, actionGroup ? cast(GActionGroup*)(cast(ObjectG)actionGroup).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Exports menu on connection at object_path.
   * The implemented D-Bus API should be considered private.
   * It is subject to change in the future.
   * An object path can only have one menu model exported on it. If this
   * constraint is violated, the export will fail and 0 will be
   * returned $(LPAREN)with error set accordingly$(RPAREN).
   * Exporting menus with sections containing more than
   * %G_MENU_EXPORTER_MAX_SECTION_SIZE items is not supported and results in
   * undefined behavior.
   * You can unexport the menu model using
   * [gio.dbus_connection.DBusConnection.unexportMenuModel] with the return value of
   * this function.
   * Params:
   *   objectPath = a D-Bus object path
   *   menu = a #GMenuModel
   * Returns: the ID of the export $(LPAREN)never zero$(RPAREN), or 0 in case of failure
   */
  uint exportMenuModel(string objectPath, gio.menu_model.MenuModel menu)
  {
    uint _retval;
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    GError *_err;
    _retval = g_dbus_connection_export_menu_model(cast(GDBusConnection*)cPtr, _objectPath, menu ? cast(GMenuModel*)menu.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Asynchronously flushes connection, that is, writes all queued
   * outgoing message to the transport and then flushes the transport
   * $(LPAREN)using [gio.output_stream.OutputStream.flushAsync]$(RPAREN). This is useful in programs
   * that wants to emit a D-Bus signal and then exit immediately. Without
   * flushing the connection, there is no guaranteed that the message has
   * been sent to the networking buffers in the OS kernel.
   * This is an asynchronous method. When the operation is finished,
   * callback will be invoked in the
   * [thread-default main context][g-main-context-push-thread-default]
   * of the thread you are calling this method from. You can
   * then call [gio.dbus_connection.DBusConnection.flushFinish] to get the result of the
   * operation. See [gio.dbus_connection.DBusConnection.flushSync] for the synchronous
   * version.
   * Params:
   *   cancellable = a #GCancellable or %NULL
   *   callback = a #GAsyncReadyCallback to call when the
   *     request is satisfied or %NULL if you don't care about the result
   */
  void flush(gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_dbus_connection_flush(cast(GDBusConnection*)cPtr, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
   * Finishes an operation started with [gio.dbus_connection.DBusConnection.flush].
   * Params:
   *   res = a #GAsyncResult obtained from the #GAsyncReadyCallback passed
   *     to [gio.dbus_connection.DBusConnection.flush]
   * Returns: %TRUE if the operation succeeded, %FALSE if error is set
   */
  bool flushFinish(gio.async_result.AsyncResult res)
  {
    bool _retval;
    GError *_err;
    _retval = g_dbus_connection_flush_finish(cast(GDBusConnection*)cPtr, res ? cast(GAsyncResult*)(cast(ObjectG)res).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Synchronously flushes connection. The calling thread is blocked
   * until this is done. See [gio.dbus_connection.DBusConnection.flush] for the
   * asynchronous version of this method and more details about what it
   * does.
   * Params:
   *   cancellable = a #GCancellable or %NULL
   * Returns: %TRUE if the operation succeeded, %FALSE if error is set
   */
  bool flushSync(gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = g_dbus_connection_flush_sync(cast(GDBusConnection*)cPtr, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Gets the capabilities negotiated with the remote peer
   * Returns: zero or more flags from the #GDBusCapabilityFlags enumeration
   */
  gio.types.DBusCapabilityFlags getCapabilities()
  {
    GDBusCapabilityFlags _cretval;
    _cretval = g_dbus_connection_get_capabilities(cast(GDBusConnection*)cPtr);
    gio.types.DBusCapabilityFlags _retval = cast(gio.types.DBusCapabilityFlags)_cretval;
    return _retval;
  }

  /**
   * Gets whether the process is terminated when connection is
   * closed by the remote peer. See
   * #GDBusConnection:exit-on-close for more details.
   * Returns: whether the process is terminated when connection is
   *   closed by the remote peer
   */
  bool getExitOnClose()
  {
    bool _retval;
    _retval = g_dbus_connection_get_exit_on_close(cast(GDBusConnection*)cPtr);
    return _retval;
  }

  /**
   * Gets the flags used to construct this connection
   * Returns: zero or more flags from the #GDBusConnectionFlags enumeration
   */
  gio.types.DBusConnectionFlags getFlags()
  {
    GDBusConnectionFlags _cretval;
    _cretval = g_dbus_connection_get_flags(cast(GDBusConnection*)cPtr);
    gio.types.DBusConnectionFlags _retval = cast(gio.types.DBusConnectionFlags)_cretval;
    return _retval;
  }

  /**
   * The GUID of the peer performing the role of server when
   * authenticating. See #GDBusConnection:guid for more details.
   * Returns: The GUID. Do not free this string, it is owned by
   *   connection.
   */
  string getGuid()
  {
    const(char)* _cretval;
    _cretval = g_dbus_connection_get_guid(cast(GDBusConnection*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * Retrieves the last serial number assigned to a #GDBusMessage on
   * the current thread. This includes messages sent via both low-level
   * API such as [gio.dbus_connection.DBusConnection.sendMessage] as well as
   * high-level API such as [gio.dbus_connection.DBusConnection.emitSignal],
   * [gio.dbus_connection.DBusConnection.call] or [gio.dbus_proxy.DBusProxy.call].
   * Returns: the last used serial or zero when no message has been sent
   *   within the current thread
   */
  uint getLastSerial()
  {
    uint _retval;
    _retval = g_dbus_connection_get_last_serial(cast(GDBusConnection*)cPtr);
    return _retval;
  }

  /**
   * Gets the credentials of the authenticated peer. This will always
   * return %NULL unless connection acted as a server
   * $(LPAREN)e.g. %G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_SERVER was passed$(RPAREN)
   * when set up and the client passed credentials as part of the
   * authentication process.
   * In a message bus setup, the message bus is always the server and
   * each application is a client. So this method will always return
   * %NULL for message bus clients.
   * Returns: a #GCredentials or %NULL if not
   *   available. Do not free this object, it is owned by connection.
   */
  gio.credentials.Credentials getPeerCredentials()
  {
    GCredentials* _cretval;
    _cretval = g_dbus_connection_get_peer_credentials(cast(GDBusConnection*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.credentials.Credentials)(cast(GCredentials*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the underlying stream used for IO.
   * While the #GDBusConnection is active, it will interact with this
   * stream from a worker thread, so it is not safe to interact with
   * the stream directly.
   * Returns: the stream used for IO
   */
  gio.iostream.IOStream getStream()
  {
    GIOStream* _cretval;
    _cretval = g_dbus_connection_get_stream(cast(GDBusConnection*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.iostream.IOStream)(cast(GIOStream*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the unique name of connection as assigned by the message
   * bus. This can also be used to figure out if connection is a
   * message bus connection.
   * Returns: the unique name or %NULL if connection is not a message
   *   bus connection. Do not free this string, it is owned by
   *   connection.
   */
  string getUniqueName()
  {
    const(char)* _cretval;
    _cretval = g_dbus_connection_get_unique_name(cast(GDBusConnection*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * Gets whether connection is closed.
   * Returns: %TRUE if the connection is closed, %FALSE otherwise
   */
  bool isClosed()
  {
    bool _retval;
    _retval = g_dbus_connection_is_closed(cast(GDBusConnection*)cPtr);
    return _retval;
  }

  /**
   * Version of [gio.dbus_connection.DBusConnection.registerObject] using closures instead of a
   * #GDBusInterfaceVTable for easier binding in other languages.
   * Params:
   *   objectPath = The object path to register at.
   *   interfaceInfo = Introspection data for the interface.
   *   methodCallClosure = #GClosure for handling incoming method calls.
   *   getPropertyClosure = #GClosure for getting a property.
   *   setPropertyClosure = #GClosure for setting a property.
   * Returns: 0 if error is set, otherwise a registration ID $(LPAREN)never 0$(RPAREN)
   *   that can be used with [gio.dbus_connection.DBusConnection.unregisterObject] .
   */
  uint registerObject(string objectPath, gio.dbus_interface_info.DBusInterfaceInfo interfaceInfo, gobject.closure.Closure methodCallClosure = null, gobject.closure.Closure getPropertyClosure = null, gobject.closure.Closure setPropertyClosure = null)
  {
    uint _retval;
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    GError *_err;
    _retval = g_dbus_connection_register_object_with_closures(cast(GDBusConnection*)cPtr, _objectPath, interfaceInfo ? cast(GDBusInterfaceInfo*)interfaceInfo.cPtr(No.Dup) : null, methodCallClosure ? cast(GClosure*)methodCallClosure.cPtr(No.Dup) : null, getPropertyClosure ? cast(GClosure*)getPropertyClosure.cPtr(No.Dup) : null, setPropertyClosure ? cast(GClosure*)setPropertyClosure.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Registers a whole subtree of dynamic objects.
   * The enumerate and introspection functions in vtable are used to
   * convey, to remote callers, what nodes exist in the subtree rooted
   * by object_path.
   * When handling remote calls into any node in the subtree, first the
   * enumerate function is used to check if the node exists. If the node exists
   * or the %G_DBUS_SUBTREE_FLAGS_DISPATCH_TO_UNENUMERATED_NODES flag is set
   * the introspection function is used to check if the node supports the
   * requested method. If so, the dispatch function is used to determine
   * where to dispatch the call. The collected #GDBusInterfaceVTable and
   * #gpointer will be used to call into the interface vtable for processing
   * the request.
   * All calls into user-provided code will be invoked in the
   * [thread-default main context][g-main-context-push-thread-default]
   * of the thread you are calling this method from.
   * If an existing subtree is already registered at object_path or
   * then error is set to %G_IO_ERROR_EXISTS.
   * Note that it is valid to register regular objects $(LPAREN)using
   * [gio.dbus_connection.DBusConnection.registerObject]$(RPAREN) in a subtree registered with
   * [gio.dbus_connection.DBusConnection.registerSubtree] - if so, the subtree handler
   * is tried as the last resort. One way to think about a subtree
   * handler is to consider it a fallback handler for object paths not
   * registered via [gio.dbus_connection.DBusConnection.registerObject] or other bindings.
   * Note that vtable will be copied so you cannot change it after
   * registration.
   * See this [server][gdbus-subtree-server] for an example of how to use
   * this method.
   * Params:
   *   objectPath = the object path to register the subtree at
   *   vtable = a #GDBusSubtreeVTable to enumerate, introspect and
   *     dispatch nodes in the subtree
   *   flags = flags used to fine tune the behavior of the subtree
   *   userData = data to pass to functions in vtable
   *   userDataFreeFunc = function to call when the subtree is unregistered
   * Returns: 0 if error is set, otherwise a subtree registration ID $(LPAREN)never 0$(RPAREN)
   *   that can be used with [gio.dbus_connection.DBusConnection.unregisterSubtree]
   */
  uint registerSubtree(string objectPath, gio.types.DBusSubtreeVTable vtable, gio.types.DBusSubtreeFlags flags, void* userData, glib.types.DestroyNotify userDataFreeFunc)
  {
    extern(C) void _userDataFreeFuncCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      (*_dlg)();
    }
    auto _userDataFreeFuncCB = userDataFreeFunc ? &_userDataFreeFuncCallback : null;

    uint _retval;
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    GError *_err;
    _retval = g_dbus_connection_register_subtree(cast(GDBusConnection*)cPtr, _objectPath, &vtable, flags, userData, _userDataFreeFuncCB, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Removes a filter.
   * Note that since filters run in a different thread, there is a race
   * condition where it is possible that the filter will be running even
   * after calling [gio.dbus_connection.DBusConnection.removeFilter], so you cannot just
   * free data that the filter might be using. Instead, you should pass
   * a #GDestroyNotify to [gio.dbus_connection.DBusConnection.addFilter], which will be
   * called when it is guaranteed that the data is no longer needed.
   * Params:
   *   filterId = an identifier obtained from [gio.dbus_connection.DBusConnection.addFilter]
   */
  void removeFilter(uint filterId)
  {
    g_dbus_connection_remove_filter(cast(GDBusConnection*)cPtr, filterId);
  }

  /**
   * Asynchronously sends message to the peer represented by connection.
   * Unless flags contain the
   * %G_DBUS_SEND_MESSAGE_FLAGS_PRESERVE_SERIAL flag, the serial number
   * will be assigned by connection and set on message via
   * [gio.dbus_message.DBusMessage.setSerial]. If out_serial is not %NULL, then the
   * serial number used will be written to this location prior to
   * submitting the message to the underlying transport. While it has a `volatile`
   * qualifier, this is a historical artifact and the argument passed to it should
   * not be `volatile`.
   * If connection is closed then the operation will fail with
   * %G_IO_ERROR_CLOSED. If message is not well-formed,
   * the operation fails with %G_IO_ERROR_INVALID_ARGUMENT.
   * See this [server][gdbus-server] and [client][gdbus-unix-fd-client]
   * for an example of how to use this low-level API to send and receive
   * UNIX file descriptors.
   * Note that message must be unlocked, unless flags contain the
   * %G_DBUS_SEND_MESSAGE_FLAGS_PRESERVE_SERIAL flag.
   * Params:
   *   message = a #GDBusMessage
   *   flags = flags affecting how the message is sent
   *   outSerial = return location for serial number assigned
   *     to message when sending it or %NULL
   * Returns: %TRUE if the message was well-formed and queued for
   *   transmission, %FALSE if error is set
   */
  bool sendMessage(gio.dbus_message.DBusMessage message, gio.types.DBusSendMessageFlags flags, out uint outSerial)
  {
    bool _retval;
    GError *_err;
    _retval = g_dbus_connection_send_message(cast(GDBusConnection*)cPtr, message ? cast(GDBusMessage*)message.cPtr(No.Dup) : null, flags, cast(uint*)&outSerial, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Asynchronously sends message to the peer represented by connection.
   * Unless flags contain the
   * %G_DBUS_SEND_MESSAGE_FLAGS_PRESERVE_SERIAL flag, the serial number
   * will be assigned by connection and set on message via
   * [gio.dbus_message.DBusMessage.setSerial]. If out_serial is not %NULL, then the
   * serial number used will be written to this location prior to
   * submitting the message to the underlying transport. While it has a `volatile`
   * qualifier, this is a historical artifact and the argument passed to it should
   * not be `volatile`.
   * If connection is closed then the operation will fail with
   * %G_IO_ERROR_CLOSED. If cancellable is canceled, the operation will
   * fail with %G_IO_ERROR_CANCELLED. If message is not well-formed,
   * the operation fails with %G_IO_ERROR_INVALID_ARGUMENT.
   * This is an asynchronous method. When the operation is finished, callback
   * will be invoked in the
   * [thread-default main context][g-main-context-push-thread-default]
   * of the thread you are calling this method from. You can then call
   * [gio.dbus_connection.DBusConnection.sendMessageWithReplyFinish] to get the result of the operation.
   * See [gio.dbus_connection.DBusConnection.sendMessageWithReplySync] for the synchronous version.
   * Note that message must be unlocked, unless flags contain the
   * %G_DBUS_SEND_MESSAGE_FLAGS_PRESERVE_SERIAL flag.
   * See this [server][gdbus-server] and [client][gdbus-unix-fd-client]
   * for an example of how to use this low-level API to send and receive
   * UNIX file descriptors.
   * Params:
   *   message = a #GDBusMessage
   *   flags = flags affecting how the message is sent
   *   timeoutMsec = the timeout in milliseconds, -1 to use the default
   *     timeout or %G_MAXINT for no timeout
   *   outSerial = return location for serial number assigned
   *     to message when sending it or %NULL
   *   cancellable = a #GCancellable or %NULL
   *   callback = a #GAsyncReadyCallback to call when the request
   *     is satisfied or %NULL if you don't care about the result
   */
  void sendMessageWithReply(gio.dbus_message.DBusMessage message, gio.types.DBusSendMessageFlags flags, int timeoutMsec, out uint outSerial, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_dbus_connection_send_message_with_reply(cast(GDBusConnection*)cPtr, message ? cast(GDBusMessage*)message.cPtr(No.Dup) : null, flags, timeoutMsec, cast(uint*)&outSerial, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
   * Finishes an operation started with [gio.dbus_connection.DBusConnection.sendMessageWithReply].
   * Note that error is only set if a local in-process error
   * occurred. That is to say that the returned #GDBusMessage object may
   * be of type %G_DBUS_MESSAGE_TYPE_ERROR. Use
   * [gio.dbus_message.DBusMessage.toGerror] to transcode this to a #GError.
   * See this [server][gdbus-server] and [client][gdbus-unix-fd-client]
   * for an example of how to use this low-level API to send and receive
   * UNIX file descriptors.
   * Params:
   *   res = a #GAsyncResult obtained from the #GAsyncReadyCallback passed to
   *     [gio.dbus_connection.DBusConnection.sendMessageWithReply]
   * Returns: a locked #GDBusMessage or %NULL if error is set
   */
  gio.dbus_message.DBusMessage sendMessageWithReplyFinish(gio.async_result.AsyncResult res)
  {
    GDBusMessage* _cretval;
    GError *_err;
    _cretval = g_dbus_connection_send_message_with_reply_finish(cast(GDBusConnection*)cPtr, res ? cast(GAsyncResult*)(cast(ObjectG)res).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gio.dbus_message.DBusMessage)(cast(GDBusMessage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Synchronously sends message to the peer represented by connection
   * and blocks the calling thread until a reply is received or the
   * timeout is reached. See [gio.dbus_connection.DBusConnection.sendMessageWithReply]
   * for the asynchronous version of this method.
   * Unless flags contain the
   * %G_DBUS_SEND_MESSAGE_FLAGS_PRESERVE_SERIAL flag, the serial number
   * will be assigned by connection and set on message via
   * [gio.dbus_message.DBusMessage.setSerial]. If out_serial is not %NULL, then the
   * serial number used will be written to this location prior to
   * submitting the message to the underlying transport. While it has a `volatile`
   * qualifier, this is a historical artifact and the argument passed to it should
   * not be `volatile`.
   * If connection is closed then the operation will fail with
   * %G_IO_ERROR_CLOSED. If cancellable is canceled, the operation will
   * fail with %G_IO_ERROR_CANCELLED. If message is not well-formed,
   * the operation fails with %G_IO_ERROR_INVALID_ARGUMENT.
   * Note that error is only set if a local in-process error
   * occurred. That is to say that the returned #GDBusMessage object may
   * be of type %G_DBUS_MESSAGE_TYPE_ERROR. Use
   * [gio.dbus_message.DBusMessage.toGerror] to transcode this to a #GError.
   * See this [server][gdbus-server] and [client][gdbus-unix-fd-client]
   * for an example of how to use this low-level API to send and receive
   * UNIX file descriptors.
   * Note that message must be unlocked, unless flags contain the
   * %G_DBUS_SEND_MESSAGE_FLAGS_PRESERVE_SERIAL flag.
   * Params:
   *   message = a #GDBusMessage
   *   flags = flags affecting how the message is sent.
   *   timeoutMsec = the timeout in milliseconds, -1 to use the default
   *     timeout or %G_MAXINT for no timeout
   *   outSerial = return location for serial number
   *     assigned to message when sending it or %NULL
   *   cancellable = a #GCancellable or %NULL
   * Returns: a locked #GDBusMessage that is the reply
   *   to message or %NULL if error is set
   */
  gio.dbus_message.DBusMessage sendMessageWithReplySync(gio.dbus_message.DBusMessage message, gio.types.DBusSendMessageFlags flags, int timeoutMsec, out uint outSerial, gio.cancellable.Cancellable cancellable = null)
  {
    GDBusMessage* _cretval;
    GError *_err;
    _cretval = g_dbus_connection_send_message_with_reply_sync(cast(GDBusConnection*)cPtr, message ? cast(GDBusMessage*)message.cPtr(No.Dup) : null, flags, timeoutMsec, cast(uint*)&outSerial, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gio.dbus_message.DBusMessage)(cast(GDBusMessage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Sets whether the process should be terminated when connection is
   * closed by the remote peer. See #GDBusConnection:exit-on-close for
   * more details.
   * Note that this function should be used with care. Most modern UNIX
   * desktops tie the notion of a user session with the session bus, and expect
   * all of a user's applications to quit when their bus connection goes away.
   * If you are setting exit_on_close to %FALSE for the shared session
   * bus connection, you should make sure that your application exits
   * when the user session ends.
   * Params:
   *   exitOnClose = whether the process should be terminated
   *     when connection is closed by the remote peer
   */
  void setExitOnClose(bool exitOnClose)
  {
    g_dbus_connection_set_exit_on_close(cast(GDBusConnection*)cPtr, exitOnClose);
  }

  /**
   * Subscribes to signals on connection and invokes callback whenever
   * the signal is received. Note that callback will be invoked in the
   * [thread-default main context][g-main-context-push-thread-default]
   * of the thread you are calling this method from.
   * If connection is not a message bus connection, sender must be
   * %NULL.
   * If sender is a well-known name note that callback is invoked with
   * the unique name for the owner of sender, not the well-known name
   * as one would expect. This is because the message bus rewrites the
   * name. As such, to avoid certain race conditions, users should be
   * tracking the name owner of the well-known name and use that when
   * processing the received signal.
   * If one of %G_DBUS_SIGNAL_FLAGS_MATCH_ARG0_NAMESPACE or
   * %G_DBUS_SIGNAL_FLAGS_MATCH_ARG0_PATH are given, arg0 is
   * interpreted as part of a namespace or path.  The first argument
   * of a signal is matched against that part as specified by D-Bus.
   * If user_data_free_func is non-%NULL, it will be called $(LPAREN)in the
   * thread-default main context of the thread you are calling this
   * method from$(RPAREN) at some point after user_data is no longer
   * needed. $(LPAREN)It is not guaranteed to be called synchronously when the
   * signal is unsubscribed from, and may be called after connection
   * has been destroyed.$(RPAREN)
   * As callback is potentially invoked in a different thread from where it’s
   * emitted, it’s possible for this to happen after
   * [gio.dbus_connection.DBusConnection.signalUnsubscribe] has been called in another thread.
   * Due to this, user_data should have a strong reference which is freed with
   * user_data_free_func, rather than pointing to data whose lifecycle is tied
   * to the signal subscription. For example, if a #GObject is used to store the
   * subscription ID from [gio.dbus_connection.DBusConnection.signalSubscribe], a strong reference
   * to that #GObject must be passed to user_data, and [gobject.object.ObjectG.unref] passed to
   * user_data_free_func. You are responsible for breaking the resulting
   * reference count cycle by explicitly unsubscribing from the signal when
   * dropping the last external reference to the #GObject. Alternatively, a weak
   * reference may be used.
   * It is guaranteed that if you unsubscribe from a signal using
   * [gio.dbus_connection.DBusConnection.signalUnsubscribe] from the same thread which made the
   * corresponding [gio.dbus_connection.DBusConnection.signalSubscribe] call, callback will not
   * be invoked after [gio.dbus_connection.DBusConnection.signalUnsubscribe] returns.
   * The returned subscription identifier is an opaque value which is guaranteed
   * to never be zero.
   * This function can never fail.
   * Params:
   *   sender = sender name to match on $(LPAREN)unique or well-known name$(RPAREN)
   *     or %NULL to listen from all senders
   *   interfaceName = D-Bus interface name to match on or %NULL to
   *     match on all interfaces
   *   member = D-Bus signal name to match on or %NULL to match on
   *     all signals
   *   objectPath = object path to match on or %NULL to match on
   *     all object paths
   *   arg0 = contents of first string argument to match on or %NULL
   *     to match on all kinds of arguments
   *   flags = #GDBusSignalFlags describing how arg0 is used in subscribing to the
   *     signal
   *   callback = callback to invoke when there is a signal matching the requested data
   * Returns: a subscription identifier that can be used with [gio.dbus_connection.DBusConnection.signalUnsubscribe]
   */
  uint signalSubscribe(string sender, string interfaceName, string member, string objectPath, string arg0, gio.types.DBusSignalFlags flags, gio.types.DBusSignalCallback callback)
  {
    extern(C) void _callbackCallback(GDBusConnection* connection, const(char)* senderName, const(char)* objectPath, const(char)* interfaceName, const(char)* signalName, VariantC* parameters, void* userData)
    {
      auto _dlg = cast(gio.types.DBusSignalCallback*)userData;
      string _senderName = senderName.fromCString(No.Free);
      string _objectPath = objectPath.fromCString(No.Free);
      string _interfaceName = interfaceName.fromCString(No.Free);
      string _signalName = signalName.fromCString(No.Free);

      (*_dlg)(ObjectG.getDObject!(gio.dbus_connection.DBusConnection)(cast(void*)connection, No.Take), _senderName, _objectPath, _interfaceName, _signalName, parameters ? new glib.variant.VariantG(cast(void*)parameters, No.Take) : null);
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    uint _retval;
    const(char)* _sender = sender.toCString(No.Alloc);
    const(char)* _interfaceName = interfaceName.toCString(No.Alloc);
    const(char)* _member = member.toCString(No.Alloc);
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    const(char)* _arg0 = arg0.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    GDestroyNotify _callbackDestroyCB = callback ? &thawDelegate : null;
    _retval = g_dbus_connection_signal_subscribe(cast(GDBusConnection*)cPtr, _sender, _interfaceName, _member, _objectPath, _arg0, flags, _callbackCB, _callback, _callbackDestroyCB);
    return _retval;
  }

  /**
   * Unsubscribes from signals.
   * Note that there may still be D-Bus traffic to process $(LPAREN)relating to this
   * signal subscription$(RPAREN) in the current thread-default #GMainContext after this
   * function has returned. You should continue to iterate the #GMainContext
   * until the #GDestroyNotify function passed to
   * [gio.dbus_connection.DBusConnection.signalSubscribe] is called, in order to avoid memory
   * leaks through callbacks queued on the #GMainContext after it’s stopped being
   * iterated.
   * Alternatively, any idle source with a priority lower than %G_PRIORITY_DEFAULT
   * that was scheduled after unsubscription, also indicates that all resources
   * of this subscription are released.
   * Params:
   *   subscriptionId = a subscription id obtained from
   *     [gio.dbus_connection.DBusConnection.signalSubscribe]
   */
  void signalUnsubscribe(uint subscriptionId)
  {
    g_dbus_connection_signal_unsubscribe(cast(GDBusConnection*)cPtr, subscriptionId);
  }

  /**
   * If connection was created with
   * %G_DBUS_CONNECTION_FLAGS_DELAY_MESSAGE_PROCESSING, this method
   * starts processing messages. Does nothing on if connection wasn't
   * created with this flag or if the method has already been called.
   */
  void startMessageProcessing()
  {
    g_dbus_connection_start_message_processing(cast(GDBusConnection*)cPtr);
  }

  /**
   * Reverses the effect of a previous call to
   * [gio.dbus_connection.DBusConnection.exportActionGroup].
   * It is an error to call this function with an ID that wasn't returned
   * from [gio.dbus_connection.DBusConnection.exportActionGroup] or to call it with the
   * same ID more than once.
   * Params:
   *   exportId = the ID from [gio.dbus_connection.DBusConnection.exportActionGroup]
   */
  void unexportActionGroup(uint exportId)
  {
    g_dbus_connection_unexport_action_group(cast(GDBusConnection*)cPtr, exportId);
  }

  /**
   * Reverses the effect of a previous call to
   * [gio.dbus_connection.DBusConnection.exportMenuModel].
   * It is an error to call this function with an ID that wasn't returned
   * from [gio.dbus_connection.DBusConnection.exportMenuModel] or to call it with the
   * same ID more than once.
   * Params:
   *   exportId = the ID from [gio.dbus_connection.DBusConnection.exportMenuModel]
   */
  void unexportMenuModel(uint exportId)
  {
    g_dbus_connection_unexport_menu_model(cast(GDBusConnection*)cPtr, exportId);
  }

  /**
   * Unregisters an object.
   * Params:
   *   registrationId = a registration id obtained from
   *     [gio.dbus_connection.DBusConnection.registerObject]
   * Returns: %TRUE if the object was unregistered, %FALSE otherwise
   */
  bool unregisterObject(uint registrationId)
  {
    bool _retval;
    _retval = g_dbus_connection_unregister_object(cast(GDBusConnection*)cPtr, registrationId);
    return _retval;
  }

  /**
   * Unregisters a subtree.
   * Params:
   *   registrationId = a subtree registration id obtained from
   *     [gio.dbus_connection.DBusConnection.registerSubtree]
   * Returns: %TRUE if the subtree was unregistered, %FALSE otherwise
   */
  bool unregisterSubtree(uint registrationId)
  {
    bool _retval;
    _retval = g_dbus_connection_unregister_subtree(cast(GDBusConnection*)cPtr, registrationId);
    return _retval;
  }

  /**
   * Emitted when the connection is closed.
   * The cause of this event can be
   * - If [gio.dbus_connection.DBusConnection.close] is called. In this case
   * remote_peer_vanished is set to %FALSE and error is %NULL.
   * - If the remote peer closes the connection. In this case
   * remote_peer_vanished is set to %TRUE and error is set.
   * - If the remote peer sends invalid or malformed data. In this
   * case remote_peer_vanished is set to %FALSE and error is set.
   * Upon receiving this signal, you should give up your reference to
   * connection. You are guaranteed that this signal is emitted only
   * once.
   * Params
   *   remotePeerVanished = %TRUE if connection is closed because the
   *     remote peer closed its end of the connection
   *   error = a #GError with more details about the event or %NULL
   *   dBusConnection = the instance the signal is connected to
   */
  alias ClosedCallbackDlg = void delegate(bool remotePeerVanished, glib.error.ErrorG error, gio.dbus_connection.DBusConnection dBusConnection);
  alias ClosedCallbackFunc = void function(bool remotePeerVanished, glib.error.ErrorG error, gio.dbus_connection.DBusConnection dBusConnection);

  /**
   * Connect to Closed signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectClosed(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ClosedCallbackDlg) || is(T : ClosedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto dBusConnection = getVal!(gio.dbus_connection.DBusConnection)(_paramVals);
      auto remotePeerVanished = getVal!(bool)(&_paramVals[1]);
      auto error = getVal!(glib.error.ErrorG)(&_paramVals[2]);
      _dClosure.dlg(remotePeerVanished, error, dBusConnection);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("closed", closure, after);
  }
}
