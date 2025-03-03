module gio.dbus_proxy;

import gid.gid;
import gio.async_initable;
import gio.async_initable_mixin;
import gio.async_result;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.dbus_connection;
import gio.dbus_interface;
import gio.dbus_interface_info;
import gio.dbus_interface_mixin;
import gio.initable;
import gio.initable_mixin;
import gio.types;
import gio.unix_fdlist;
import glib.error;
import glib.variant;
import gobject.dclosure;
import gobject.object;

/**
 * `GDBusProxy` is a base class used for proxies to access a D-Bus
 * interface on a remote object. A `GDBusProxy` can be constructed for
 * both well-known and unique names.
 * By default, `GDBusProxy` will cache all properties $(LPAREN)and listen to
 * changes$(RPAREN) of the remote object, and proxy all signals that get
 * emitted. This behaviour can be changed by passing suitable
 * [gio.types.DBusProxyFlags] when the proxy is created. If the proxy is for a
 * well-known name, the property cache is flushed when the name owner
 * vanishes and reloaded when a name owner appears.
 * The unique name owner of the proxy’s name is tracked and can be read from
 * property@Gio.DBusProxy:g-name-owner. Connect to the
 * [gobject.object.ObjectG.notify] signal to get notified of changes.
 * Additionally, only signals and property changes emitted from the current name
 * owner are considered and calls are always sent to the current name owner.
 * This avoids a number of race conditions when the name is lost by one owner
 * and claimed by another. However, if no name owner currently exists,
 * then calls will be sent to the well-known name which may result in
 * the message bus launching an owner $(LPAREN)unless
 * `G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START` is set$(RPAREN).
 * If the proxy is for a stateless D-Bus service, where the name owner may
 * be started and stopped between calls, the
 * property@Gio.DBusProxy:g-name-owner tracking of `GDBusProxy` will cause the
 * proxy to drop signal and property changes from the service after it has
 * restarted for the first time. When interacting with a stateless D-Bus
 * service, do not use `GDBusProxy` — use direct D-Bus method calls and signal
 * connections.
 * The generic signal@Gio.DBusProxy::g-properties-changed and
 * signal@Gio.DBusProxy::g-signal signals are not very convenient to work
 * with. Therefore, the recommended way of working with proxies is to subclass
 * `GDBusProxy`, and have more natural properties and signals in your derived
 * class. This [example](migrating-gdbus.html#using-gdbus-codegen) shows how
 * this can easily be done using the [`gdbus-codegen`](gdbus-codegen.html) tool.
 * A `GDBusProxy` instance can be used from multiple threads but note
 * that all signals $(LPAREN)e.g. signal@Gio.DBusProxy::g-signal,
 * signal@Gio.DBusProxy::g-properties-changed and
 * [gobject.object.ObjectG.notify]$(RPAREN) are emitted in the thread-default main
 * context $(LPAREN)see [glib.main_context.MainContext.pushThreadDefault]$(RPAREN) of the thread
 * where the instance was constructed.
 * An example using a proxy for a well-known name can be found in
 * [`gdbus-example-watch-proxy.c`](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-watch-proxy.c).
 */
class DBusProxy : gobject.object.ObjectG, gio.async_initable.AsyncInitable, gio.dbus_interface.DBusInterface, gio.initable.Initable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_proxy_get_type != &gidSymbolNotFound ? g_dbus_proxy_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin AsyncInitableT!();
  mixin DBusInterfaceT!();
  mixin InitableT!();

  /**
   * Finishes creating a #GDBusProxy.
   * Params:
   *   res = A #GAsyncResult obtained from the #GAsyncReadyCallback function passed to [gio.dbus_proxy.DBusProxy.new_].
   * Returns: A #GDBusProxy or %NULL if error is set.
   *   Free with [gobject.object.ObjectG.unref].
   */
  static gio.dbus_proxy.DBusProxy newFinish(gio.async_result.AsyncResult res)
  {
    GDBusProxy* _cretval;
    GError *_err;
    _cretval = g_dbus_proxy_new_finish(res ? cast(GAsyncResult*)(cast(ObjectG)res).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gio.dbus_proxy.DBusProxy)(cast(GDBusProxy*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Finishes creating a #GDBusProxy.
   * Params:
   *   res = A #GAsyncResult obtained from the #GAsyncReadyCallback function passed to [gio.dbus_proxy.DBusProxy.newForBus].
   * Returns: A #GDBusProxy or %NULL if error is set.
   *   Free with [gobject.object.ObjectG.unref].
   */
  static gio.dbus_proxy.DBusProxy newForBusFinish(gio.async_result.AsyncResult res)
  {
    GDBusProxy* _cretval;
    GError *_err;
    _cretval = g_dbus_proxy_new_for_bus_finish(res ? cast(GAsyncResult*)(cast(ObjectG)res).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gio.dbus_proxy.DBusProxy)(cast(GDBusProxy*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Like [gio.dbus_proxy.DBusProxy.newSync] but takes a #GBusType instead of a #GDBusConnection.
   * #GDBusProxy is used in this [example][gdbus-wellknown-proxy].
   * Params:
   *   busType = A #GBusType.
   *   flags = Flags used when constructing the proxy.
   *   info = A #GDBusInterfaceInfo specifying the minimal interface
   *     that proxy conforms to or %NULL.
   *   name = A bus name $(LPAREN)well-known or unique$(RPAREN).
   *   objectPath = An object path.
   *   interfaceName = A D-Bus interface name.
   *   cancellable = A #GCancellable or %NULL.
   * Returns: A #GDBusProxy or %NULL if error is set.
   *   Free with [gobject.object.ObjectG.unref].
   */
  static gio.dbus_proxy.DBusProxy newForBusSync(gio.types.BusType busType, gio.types.DBusProxyFlags flags, gio.dbus_interface_info.DBusInterfaceInfo info, string name, string objectPath, string interfaceName, gio.cancellable.Cancellable cancellable)
  {
    GDBusProxy* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    const(char)* _interfaceName = interfaceName.toCString(No.Alloc);
    GError *_err;
    _cretval = g_dbus_proxy_new_for_bus_sync(busType, flags, info ? cast(GDBusInterfaceInfo*)info.cPtr(No.Dup) : null, _name, _objectPath, _interfaceName, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gio.dbus_proxy.DBusProxy)(cast(GDBusProxy*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Creates a proxy for accessing interface_name on the remote object
   * at object_path owned by name at connection and synchronously
   * loads D-Bus properties unless the
   * %G_DBUS_PROXY_FLAGS_DO_NOT_LOAD_PROPERTIES flag is used.
   * If the %G_DBUS_PROXY_FLAGS_DO_NOT_CONNECT_SIGNALS flag is not set, also sets up
   * match rules for signals. Connect to the #GDBusProxy::g-signal signal
   * to handle signals from the remote object.
   * If both %G_DBUS_PROXY_FLAGS_DO_NOT_LOAD_PROPERTIES and
   * %G_DBUS_PROXY_FLAGS_DO_NOT_CONNECT_SIGNALS are set, this constructor is
   * guaranteed to return immediately without blocking.
   * If name is a well-known name and the
   * %G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START and %G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START_AT_CONSTRUCTION
   * flags aren't set and no name owner currently exists, the message bus
   * will be requested to launch a name owner for the name.
   * This is a synchronous failable constructor. See [gio.dbus_proxy.DBusProxy.new_]
   * and [gio.dbus_proxy.DBusProxy.newFinish] for the asynchronous version.
   * #GDBusProxy is used in this [example][gdbus-wellknown-proxy].
   * Params:
   *   connection = A #GDBusConnection.
   *   flags = Flags used when constructing the proxy.
   *   info = A #GDBusInterfaceInfo specifying the minimal interface that proxy conforms to or %NULL.
   *   name = A bus name $(LPAREN)well-known or unique$(RPAREN) or %NULL if connection is not a message bus connection.
   *   objectPath = An object path.
   *   interfaceName = A D-Bus interface name.
   *   cancellable = A #GCancellable or %NULL.
   * Returns: A #GDBusProxy or %NULL if error is set.
   *   Free with [gobject.object.ObjectG.unref].
   */
  static gio.dbus_proxy.DBusProxy newSync(gio.dbus_connection.DBusConnection connection, gio.types.DBusProxyFlags flags, gio.dbus_interface_info.DBusInterfaceInfo info, string name, string objectPath, string interfaceName, gio.cancellable.Cancellable cancellable)
  {
    GDBusProxy* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    const(char)* _interfaceName = interfaceName.toCString(No.Alloc);
    GError *_err;
    _cretval = g_dbus_proxy_new_sync(connection ? cast(GDBusConnection*)connection.cPtr(No.Dup) : null, flags, info ? cast(GDBusInterfaceInfo*)info.cPtr(No.Dup) : null, _name, _objectPath, _interfaceName, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(gio.dbus_proxy.DBusProxy)(cast(GDBusProxy*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Creates a proxy for accessing interface_name on the remote object
   * at object_path owned by name at connection and asynchronously
   * loads D-Bus properties unless the
   * %G_DBUS_PROXY_FLAGS_DO_NOT_LOAD_PROPERTIES flag is used. Connect to
   * the #GDBusProxy::g-properties-changed signal to get notified about
   * property changes.
   * If the %G_DBUS_PROXY_FLAGS_DO_NOT_CONNECT_SIGNALS flag is not set, also sets up
   * match rules for signals. Connect to the #GDBusProxy::g-signal signal
   * to handle signals from the remote object.
   * If both %G_DBUS_PROXY_FLAGS_DO_NOT_LOAD_PROPERTIES and
   * %G_DBUS_PROXY_FLAGS_DO_NOT_CONNECT_SIGNALS are set, this constructor is
   * guaranteed to complete immediately without blocking.
   * If name is a well-known name and the
   * %G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START and %G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START_AT_CONSTRUCTION
   * flags aren't set and no name owner currently exists, the message bus
   * will be requested to launch a name owner for the name.
   * This is a failable asynchronous constructor - when the proxy is
   * ready, callback will be invoked and you can use
   * [gio.dbus_proxy.DBusProxy.newFinish] to get the result.
   * See [gio.dbus_proxy.DBusProxy.newSync] and for a synchronous version of this constructor.
   * #GDBusProxy is used in this [example][gdbus-wellknown-proxy].
   * Params:
   *   connection = A #GDBusConnection.
   *   flags = Flags used when constructing the proxy.
   *   info = A #GDBusInterfaceInfo specifying the minimal interface that proxy conforms to or %NULL.
   *   name = A bus name $(LPAREN)well-known or unique$(RPAREN) or %NULL if connection is not a message bus connection.
   *   objectPath = An object path.
   *   interfaceName = A D-Bus interface name.
   *   cancellable = A #GCancellable or %NULL.
   *   callback = Callback function to invoke when the proxy is ready.
   */
  static void new_(gio.dbus_connection.DBusConnection connection, gio.types.DBusProxyFlags flags, gio.dbus_interface_info.DBusInterfaceInfo info, string name, string objectPath, string interfaceName, gio.cancellable.Cancellable cancellable, gio.types.AsyncReadyCallback callback)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    const(char)* _interfaceName = interfaceName.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_dbus_proxy_new(connection ? cast(GDBusConnection*)connection.cPtr(No.Dup) : null, flags, info ? cast(GDBusInterfaceInfo*)info.cPtr(No.Dup) : null, _name, _objectPath, _interfaceName, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
   * Like [gio.dbus_proxy.DBusProxy.new_] but takes a #GBusType instead of a #GDBusConnection.
   * #GDBusProxy is used in this [example][gdbus-wellknown-proxy].
   * Params:
   *   busType = A #GBusType.
   *   flags = Flags used when constructing the proxy.
   *   info = A #GDBusInterfaceInfo specifying the minimal interface that proxy conforms to or %NULL.
   *   name = A bus name $(LPAREN)well-known or unique$(RPAREN).
   *   objectPath = An object path.
   *   interfaceName = A D-Bus interface name.
   *   cancellable = A #GCancellable or %NULL.
   *   callback = Callback function to invoke when the proxy is ready.
   */
  static void newForBus(gio.types.BusType busType, gio.types.DBusProxyFlags flags, gio.dbus_interface_info.DBusInterfaceInfo info, string name, string objectPath, string interfaceName, gio.cancellable.Cancellable cancellable, gio.types.AsyncReadyCallback callback)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    const(char)* _interfaceName = interfaceName.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_dbus_proxy_new_for_bus(busType, flags, info ? cast(GDBusInterfaceInfo*)info.cPtr(No.Dup) : null, _name, _objectPath, _interfaceName, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
   * Asynchronously invokes the method_name method on proxy.
   * If method_name contains any dots, then name is split into interface and
   * method name parts. This allows using proxy for invoking methods on
   * other interfaces.
   * If the #GDBusConnection associated with proxy is closed then
   * the operation will fail with %G_IO_ERROR_CLOSED. If
   * cancellable is canceled, the operation will fail with
   * %G_IO_ERROR_CANCELLED. If parameters contains a value not
   * compatible with the D-Bus protocol, the operation fails with
   * %G_IO_ERROR_INVALID_ARGUMENT.
   * If the parameters #GVariant is floating, it is consumed. This allows
   * convenient 'inline' use of [glib.variant.VariantG.new_], e.g.:
   * |[<!-- language\="C" -->
   * g_dbus_proxy_call $(LPAREN)proxy,
   * "TwoStrings",
   * g_variant_new $(LPAREN)"$(LPAREN)ss$(RPAREN)",
   * "Thing One",
   * "Thing Two"$(RPAREN),
   * G_DBUS_CALL_FLAGS_NONE,
   * -1,
   * NULL,
   * $(LPAREN)GAsyncReadyCallback$(RPAREN) two_strings_done,
   * &data$(RPAREN);
   * ]|
   * If proxy has an expected interface $(LPAREN)see
   * #GDBusProxy:g-interface-info$(RPAREN) and method_name is referenced by it,
   * then the return value is checked against the return type.
   * This is an asynchronous method. When the operation is finished,
   * callback will be invoked in the
   * [thread-default main context][g-main-context-push-thread-default]
   * of the thread you are calling this method from.
   * You can then call [gio.dbus_proxy.DBusProxy.callFinish] to get the result of
   * the operation. See [gio.dbus_proxy.DBusProxy.callSync] for the synchronous
   * version of this method.
   * If callback is %NULL then the D-Bus method call message will be sent with
   * the %G_DBUS_MESSAGE_FLAGS_NO_REPLY_EXPECTED flag set.
   * Params:
   *   methodName = Name of method to invoke.
   *   parameters = A #GVariant tuple with parameters for the signal or %NULL if not passing parameters.
   *   flags = Flags from the #GDBusCallFlags enumeration.
   *   timeoutMsec = The timeout in milliseconds $(LPAREN)with %G_MAXINT meaning
   *     "infinite"$(RPAREN) or -1 to use the proxy default timeout.
   *   cancellable = A #GCancellable or %NULL.
   *   callback = A #GAsyncReadyCallback to call when the request is satisfied or %NULL if you don't
   *     care about the result of the method invocation.
   */
  void call(string methodName, glib.variant.VariantG parameters, gio.types.DBusCallFlags flags, int timeoutMsec, gio.cancellable.Cancellable cancellable, gio.types.AsyncReadyCallback callback)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _methodName = methodName.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_dbus_proxy_call(cast(GDBusProxy*)cPtr, _methodName, parameters ? cast(VariantC*)parameters.cPtr(No.Dup) : null, flags, timeoutMsec, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
   * Finishes an operation started with [gio.dbus_proxy.DBusProxy.call].
   * Params:
   *   res = A #GAsyncResult obtained from the #GAsyncReadyCallback passed to [gio.dbus_proxy.DBusProxy.call].
   * Returns: %NULL if error is set. Otherwise a #GVariant tuple with
   *   return values. Free with [glib.variant.VariantG.unref].
   */
  glib.variant.VariantG callFinish(gio.async_result.AsyncResult res)
  {
    VariantC* _cretval;
    GError *_err;
    _cretval = g_dbus_proxy_call_finish(cast(GDBusProxy*)cPtr, res ? cast(GAsyncResult*)(cast(ObjectG)res).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = _cretval ? new glib.variant.VariantG(cast(VariantC*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Synchronously invokes the method_name method on proxy.
   * If method_name contains any dots, then name is split into interface and
   * method name parts. This allows using proxy for invoking methods on
   * other interfaces.
   * If the #GDBusConnection associated with proxy is disconnected then
   * the operation will fail with %G_IO_ERROR_CLOSED. If
   * cancellable is canceled, the operation will fail with
   * %G_IO_ERROR_CANCELLED. If parameters contains a value not
   * compatible with the D-Bus protocol, the operation fails with
   * %G_IO_ERROR_INVALID_ARGUMENT.
   * If the parameters #GVariant is floating, it is consumed. This allows
   * convenient 'inline' use of [glib.variant.VariantG.new_], e.g.:
   * |[<!-- language\="C" -->
   * g_dbus_proxy_call_sync $(LPAREN)proxy,
   * "TwoStrings",
   * g_variant_new $(LPAREN)"$(LPAREN)ss$(RPAREN)",
   * "Thing One",
   * "Thing Two"$(RPAREN),
   * G_DBUS_CALL_FLAGS_NONE,
   * -1,
   * NULL,
   * &error$(RPAREN);
   * ]|
   * The calling thread is blocked until a reply is received. See
   * [gio.dbus_proxy.DBusProxy.call] for the asynchronous version of this
   * method.
   * If proxy has an expected interface $(LPAREN)see
   * #GDBusProxy:g-interface-info$(RPAREN) and method_name is referenced by it,
   * then the return value is checked against the return type.
   * Params:
   *   methodName = Name of method to invoke.
   *   parameters = A #GVariant tuple with parameters for the signal
   *     or %NULL if not passing parameters.
   *   flags = Flags from the #GDBusCallFlags enumeration.
   *   timeoutMsec = The timeout in milliseconds $(LPAREN)with %G_MAXINT meaning
   *     "infinite"$(RPAREN) or -1 to use the proxy default timeout.
   *   cancellable = A #GCancellable or %NULL.
   * Returns: %NULL if error is set. Otherwise a #GVariant tuple with
   *   return values. Free with [glib.variant.VariantG.unref].
   */
  glib.variant.VariantG callSync(string methodName, glib.variant.VariantG parameters, gio.types.DBusCallFlags flags, int timeoutMsec, gio.cancellable.Cancellable cancellable)
  {
    VariantC* _cretval;
    const(char)* _methodName = methodName.toCString(No.Alloc);
    GError *_err;
    _cretval = g_dbus_proxy_call_sync(cast(GDBusProxy*)cPtr, _methodName, parameters ? cast(VariantC*)parameters.cPtr(No.Dup) : null, flags, timeoutMsec, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = _cretval ? new glib.variant.VariantG(cast(VariantC*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Like [gio.dbus_proxy.DBusProxy.call] but also takes a #GUnixFDList object.
   * This method is only available on UNIX.
   * Params:
   *   methodName = Name of method to invoke.
   *   parameters = A #GVariant tuple with parameters for the signal or %NULL if not passing parameters.
   *   flags = Flags from the #GDBusCallFlags enumeration.
   *   timeoutMsec = The timeout in milliseconds $(LPAREN)with %G_MAXINT meaning
   *     "infinite"$(RPAREN) or -1 to use the proxy default timeout.
   *   fdList = A #GUnixFDList or %NULL.
   *   cancellable = A #GCancellable or %NULL.
   *   callback = A #GAsyncReadyCallback to call when the request is satisfied or %NULL if you don't
   *     care about the result of the method invocation.
   */
  void callWithUnixFdList(string methodName, glib.variant.VariantG parameters, gio.types.DBusCallFlags flags, int timeoutMsec, gio.unix_fdlist.UnixFDList fdList, gio.cancellable.Cancellable cancellable, gio.types.AsyncReadyCallback callback)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    const(char)* _methodName = methodName.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_dbus_proxy_call_with_unix_fd_list(cast(GDBusProxy*)cPtr, _methodName, parameters ? cast(VariantC*)parameters.cPtr(No.Dup) : null, flags, timeoutMsec, fdList ? cast(GUnixFDList*)fdList.cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
   * Finishes an operation started with [gio.dbus_proxy.DBusProxy.callWithUnixFdList].
   * Params:
   *   outFdList = Return location for a #GUnixFDList or %NULL.
   *   res = A #GAsyncResult obtained from the #GAsyncReadyCallback passed to [gio.dbus_proxy.DBusProxy.callWithUnixFdList].
   * Returns: %NULL if error is set. Otherwise a #GVariant tuple with
   *   return values. Free with [glib.variant.VariantG.unref].
   */
  glib.variant.VariantG callWithUnixFdListFinish(out gio.unix_fdlist.UnixFDList outFdList, gio.async_result.AsyncResult res)
  {
    VariantC* _cretval;
    GUnixFDList* _outFdList;
    GError *_err;
    _cretval = g_dbus_proxy_call_with_unix_fd_list_finish(cast(GDBusProxy*)cPtr, &_outFdList, res ? cast(GAsyncResult*)(cast(ObjectG)res).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = _cretval ? new glib.variant.VariantG(cast(VariantC*)_cretval, Yes.Take) : null;
    outFdList = new gio.unix_fdlist.UnixFDList(cast(void*)_outFdList, Yes.Take);
    return _retval;
  }

  /**
   * Like [gio.dbus_proxy.DBusProxy.callSync] but also takes and returns #GUnixFDList objects.
   * This method is only available on UNIX.
   * Params:
   *   methodName = Name of method to invoke.
   *   parameters = A #GVariant tuple with parameters for the signal
   *     or %NULL if not passing parameters.
   *   flags = Flags from the #GDBusCallFlags enumeration.
   *   timeoutMsec = The timeout in milliseconds $(LPAREN)with %G_MAXINT meaning
   *     "infinite"$(RPAREN) or -1 to use the proxy default timeout.
   *   fdList = A #GUnixFDList or %NULL.
   *   outFdList = Return location for a #GUnixFDList or %NULL.
   *   cancellable = A #GCancellable or %NULL.
   * Returns: %NULL if error is set. Otherwise a #GVariant tuple with
   *   return values. Free with [glib.variant.VariantG.unref].
   */
  glib.variant.VariantG callWithUnixFdListSync(string methodName, glib.variant.VariantG parameters, gio.types.DBusCallFlags flags, int timeoutMsec, gio.unix_fdlist.UnixFDList fdList, out gio.unix_fdlist.UnixFDList outFdList, gio.cancellable.Cancellable cancellable)
  {
    VariantC* _cretval;
    const(char)* _methodName = methodName.toCString(No.Alloc);
    GUnixFDList* _outFdList;
    GError *_err;
    _cretval = g_dbus_proxy_call_with_unix_fd_list_sync(cast(GDBusProxy*)cPtr, _methodName, parameters ? cast(VariantC*)parameters.cPtr(No.Dup) : null, flags, timeoutMsec, fdList ? cast(GUnixFDList*)fdList.cPtr(No.Dup) : null, &_outFdList, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = _cretval ? new glib.variant.VariantG(cast(VariantC*)_cretval, Yes.Take) : null;
    outFdList = new gio.unix_fdlist.UnixFDList(cast(void*)_outFdList, Yes.Take);
    return _retval;
  }

  /**
   * Looks up the value for a property from the cache. This call does no
   * blocking IO.
   * If proxy has an expected interface $(LPAREN)see
   * #GDBusProxy:g-interface-info$(RPAREN) and property_name is referenced by
   * it, then value is checked against the type of the property.
   * Params:
   *   propertyName = Property name.
   * Returns: A reference to the #GVariant instance
   *   that holds the value for property_name or %NULL if the value is not in
   *   the cache. The returned reference must be freed with [glib.variant.VariantG.unref].
   */
  glib.variant.VariantG getCachedProperty(string propertyName)
  {
    VariantC* _cretval;
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    _cretval = g_dbus_proxy_get_cached_property(cast(GDBusProxy*)cPtr, _propertyName);
    auto _retval = _cretval ? new glib.variant.VariantG(cast(VariantC*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Gets the names of all cached properties on proxy.
   * Returns: A
   *   %NULL-terminated array of strings or %NULL if
   *   proxy has no cached properties. Free the returned array with
   *   [glib.global.strfreev].
   */
  string[] getCachedPropertyNames()
  {
    char** _cretval;
    _cretval = g_dbus_proxy_get_cached_property_names(cast(GDBusProxy*)cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
    }
    return _retval;
  }

  /**
   * Gets the connection proxy is for.
   * Returns: A #GDBusConnection owned by proxy. Do not free.
   */
  gio.dbus_connection.DBusConnection getConnection()
  {
    GDBusConnection* _cretval;
    _cretval = g_dbus_proxy_get_connection(cast(GDBusProxy*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.dbus_connection.DBusConnection)(cast(GDBusConnection*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the timeout to use if -1 $(LPAREN)specifying default timeout$(RPAREN) is
   * passed as timeout_msec in the [gio.dbus_proxy.DBusProxy.call] and
   * [gio.dbus_proxy.DBusProxy.callSync] functions.
   * See the #GDBusProxy:g-default-timeout property for more details.
   * Returns: Timeout to use for proxy.
   */
  int getDefaultTimeout()
  {
    int _retval;
    _retval = g_dbus_proxy_get_default_timeout(cast(GDBusProxy*)cPtr);
    return _retval;
  }

  /**
   * Gets the flags that proxy was constructed with.
   * Returns: Flags from the #GDBusProxyFlags enumeration.
   */
  gio.types.DBusProxyFlags getFlags()
  {
    GDBusProxyFlags _cretval;
    _cretval = g_dbus_proxy_get_flags(cast(GDBusProxy*)cPtr);
    gio.types.DBusProxyFlags _retval = cast(gio.types.DBusProxyFlags)_cretval;
    return _retval;
  }

  /**
   * Returns the #GDBusInterfaceInfo, if any, specifying the interface
   * that proxy conforms to. See the #GDBusProxy:g-interface-info
   * property for more details.
   * Returns: A #GDBusInterfaceInfo or %NULL.
   *   Do not unref the returned object, it is owned by proxy.
   */
  gio.dbus_interface_info.DBusInterfaceInfo getInterfaceInfo()
  {
    GDBusInterfaceInfo* _cretval;
    _cretval = g_dbus_proxy_get_interface_info(cast(GDBusProxy*)cPtr);
    auto _retval = _cretval ? new gio.dbus_interface_info.DBusInterfaceInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Gets the D-Bus interface name proxy is for.
   * Returns: A string owned by proxy. Do not free.
   */
  string getInterfaceName()
  {
    const(char)* _cretval;
    _cretval = g_dbus_proxy_get_interface_name(cast(GDBusProxy*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * Gets the name that proxy was constructed for.
   * When connected to a message bus, this will usually be non-%NULL.
   * However, it may be %NULL for a proxy that communicates using a peer-to-peer
   * pattern.
   * Returns: A string owned by proxy. Do not free.
   */
  string getName()
  {
    const(char)* _cretval;
    _cretval = g_dbus_proxy_get_name(cast(GDBusProxy*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * The unique name that owns the name that proxy is for or %NULL if
   * no-one currently owns that name. You may connect to the
   * #GObject::notify signal to track changes to the
   * #GDBusProxy:g-name-owner property.
   * Returns: The name owner or %NULL if no name
   *   owner exists. Free with [glib.global.gfree].
   */
  string getNameOwner()
  {
    char* _cretval;
    _cretval = g_dbus_proxy_get_name_owner(cast(GDBusProxy*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
   * Gets the object path proxy is for.
   * Returns: A string owned by proxy. Do not free.
   */
  string getObjectPath()
  {
    const(char)* _cretval;
    _cretval = g_dbus_proxy_get_object_path(cast(GDBusProxy*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * If value is not %NULL, sets the cached value for the property with
   * name property_name to the value in value.
   * If value is %NULL, then the cached value is removed from the
   * property cache.
   * If proxy has an expected interface $(LPAREN)see
   * #GDBusProxy:g-interface-info$(RPAREN) and property_name is referenced by
   * it, then value is checked against the type of the property.
   * If the value #GVariant is floating, it is consumed. This allows
   * convenient 'inline' use of [glib.variant.VariantG.new_], e.g.
   * |[<!-- language\="C" -->
   * g_dbus_proxy_set_cached_property $(LPAREN)proxy,
   * "SomeProperty",
   * g_variant_new $(LPAREN)"$(LPAREN)si$(RPAREN)",
   * "A String",
   * 42$(RPAREN)$(RPAREN);
   * ]|
   * Normally you will not need to use this method since proxy
   * is tracking changes using the
   * `org.freedesktop.DBus.Properties.PropertiesChanged`
   * D-Bus signal. However, for performance reasons an object may
   * decide to not use this signal for some properties and instead
   * use a proprietary out-of-band mechanism to transmit changes.
   * As a concrete example, consider an object with a property
   * `ChatroomParticipants` which is an array of strings. Instead of
   * transmitting the same $(LPAREN)long$(RPAREN) array every time the property changes,
   * it is more efficient to only transmit the delta using e.g. signals
   * `ChatroomParticipantJoined$(LPAREN)String name$(RPAREN)` and
   * `ChatroomParticipantParted$(LPAREN)String name$(RPAREN)`.
   * Params:
   *   propertyName = Property name.
   *   value = Value for the property or %NULL to remove it from the cache.
   */
  void setCachedProperty(string propertyName, glib.variant.VariantG value)
  {
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    g_dbus_proxy_set_cached_property(cast(GDBusProxy*)cPtr, _propertyName, value ? cast(VariantC*)value.cPtr(No.Dup) : null);
  }

  /**
   * Sets the timeout to use if -1 $(LPAREN)specifying default timeout$(RPAREN) is
   * passed as timeout_msec in the [gio.dbus_proxy.DBusProxy.call] and
   * [gio.dbus_proxy.DBusProxy.callSync] functions.
   * See the #GDBusProxy:g-default-timeout property for more details.
   * Params:
   *   timeoutMsec = Timeout in milliseconds.
   */
  void setDefaultTimeout(int timeoutMsec)
  {
    g_dbus_proxy_set_default_timeout(cast(GDBusProxy*)cPtr, timeoutMsec);
  }

  /**
   * Ensure that interactions with proxy conform to the given
   * interface. See the #GDBusProxy:g-interface-info property for more
   * details.
   * Params:
   *   info = Minimum interface this proxy conforms to
   *     or %NULL to unset.
   */
  void setInterfaceInfo(gio.dbus_interface_info.DBusInterfaceInfo info)
  {
    g_dbus_proxy_set_interface_info(cast(GDBusProxy*)cPtr, info ? cast(GDBusInterfaceInfo*)info.cPtr(No.Dup) : null);
  }

  /**
   * Emitted when one or more D-Bus properties on proxy changes. The
   * local cache has already been updated when this signal fires. Note
   * that both changed_properties and invalidated_properties are
   * guaranteed to never be %NULL $(LPAREN)either may be empty though$(RPAREN).
   * If the proxy has the flag
   * %G_DBUS_PROXY_FLAGS_GET_INVALIDATED_PROPERTIES set, then
   * invalidated_properties will always be empty.
   * This signal corresponds to the
   * `PropertiesChanged` D-Bus signal on the
   * `org.freedesktop.DBus.Properties` interface.
   * Params
   *   changedProperties = A #GVariant containing the properties that changed $(LPAREN)type: `a{sv}`$(RPAREN)
   *   invalidatedProperties = A %NULL terminated array of properties that was invalidated
   *   dBusProxy = the instance the signal is connected to
   */
  alias GPropertiesChangedCallbackDlg = void delegate(glib.variant.VariantG changedProperties, string[] invalidatedProperties, gio.dbus_proxy.DBusProxy dBusProxy);
  alias GPropertiesChangedCallbackFunc = void function(glib.variant.VariantG changedProperties, string[] invalidatedProperties, gio.dbus_proxy.DBusProxy dBusProxy);

  /**
   * Connect to GPropertiesChanged signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectGPropertiesChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : GPropertiesChangedCallbackDlg) || is(T : GPropertiesChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto dBusProxy = getVal!(gio.dbus_proxy.DBusProxy)(_paramVals);
      auto changedProperties = getVal!(glib.variant.VariantG)(&_paramVals[1]);
      auto invalidatedProperties = getVal!(char**)(&_paramVals[2]);
      string[] _invalidatedProperties;
      uint _leninvalidatedProperties;
      if (invalidatedProperties)
        for (; invalidatedProperties[_leninvalidatedProperties] !is null; _leninvalidatedProperties++)
        break;
      foreach (i; 0 .. _leninvalidatedProperties)
        _invalidatedProperties ~= invalidatedProperties[i].fromCString(No.Free);
      _dClosure.dlg(changedProperties, _invalidatedProperties, dBusProxy);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("g-properties-changed", closure, after);
  }

  /**
   * Emitted when a signal from the remote object and interface that proxy is for, has been received.
   * Since 2.72 this signal supports detailed connections. You can connect to
   * the detailed signal `g-signal::x` in order to receive callbacks only when
   * signal `x` is received from the remote object.
   * Params
   *   senderName = The sender of the signal or %NULL if the connection is not a bus connection.
   *   signalName = The name of the signal.
   *   parameters = A #GVariant tuple with parameters for the signal.
   *   dBusProxy = the instance the signal is connected to
   */
  alias GSignalCallbackDlg = void delegate(string senderName, string signalName, glib.variant.VariantG parameters, gio.dbus_proxy.DBusProxy dBusProxy);
  alias GSignalCallbackFunc = void function(string senderName, string signalName, glib.variant.VariantG parameters, gio.dbus_proxy.DBusProxy dBusProxy);

  /**
   * Connect to GSignal signal.
   * Params:
   *   detail = Signal detail or null (default)
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectGSignal(T)(string detail = null, T callback, Flag!"After" after = No.After)
  if (is(T : GSignalCallbackDlg) || is(T : GSignalCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto dBusProxy = getVal!(gio.dbus_proxy.DBusProxy)(_paramVals);
      auto senderName = getVal!(string)(&_paramVals[1]);
      auto signalName = getVal!(string)(&_paramVals[2]);
      auto parameters = getVal!(glib.variant.VariantG)(&_paramVals[3]);
      _dClosure.dlg(senderName, signalName, parameters, dBusProxy);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("g-signal"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }
}
