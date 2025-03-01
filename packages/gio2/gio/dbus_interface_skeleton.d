module gio.dbus_interface_skeleton;

import gid.global;
import gio.c.functions;
import gio.c.types;
import gio.dbus_connection;
import gio.dbus_interface;
import gio.dbus_interface_info;
import gio.dbus_interface_mixin;
import gio.dbus_method_invocation;
import gio.types;
import glib.error;
import glib.variant;
import gobject.dclosure;
import gobject.object;

/**
 * Abstract base class for D-Bus interfaces on the service side.
 */
class DBusInterfaceSkeleton : ObjectG, DBusInterface
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_interface_skeleton_get_type != &gidSymbolNotFound ? g_dbus_interface_skeleton_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin DBusInterfaceT!();

  /**
   * Exports interface_ at object_path on connection.
   * This can be called multiple times to export the same interface_
   * onto multiple connections however the object_path provided must be
   * the same for all connections.
   * Use [gio.dbus_interface_skeleton.DBusInterfaceSkeleton.unexport] to unexport the object.
   * Params:
   *   connection = A #GDBusConnection to export interface_ on.
   *   objectPath = The path to export the interface at.
   * Returns: %TRUE if the interface was exported on connection, otherwise %FALSE with
   *   error set.
   */
  bool export_(DBusConnection connection, string objectPath)
  {
    bool _retval;
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    GError *_err;
    _retval = g_dbus_interface_skeleton_export(cast(GDBusInterfaceSkeleton*)cPtr, connection ? cast(GDBusConnection*)connection.cPtr(No.Dup) : null, _objectPath, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * If interface_ has outstanding changes, request for these changes to be
   * emitted immediately.
   * For example, an exported D-Bus interface may queue up property
   * changes and emit the
   * `org.freedesktop.DBus.Properties.PropertiesChanged`
   * signal later $(LPAREN)e.g. in an idle handler$(RPAREN). This technique is useful
   * for collapsing multiple property changes into one.
   */
  void flush()
  {
    g_dbus_interface_skeleton_flush(cast(GDBusInterfaceSkeleton*)cPtr);
  }

  /**
   * Gets the first connection that interface_ is exported on, if any.
   * Returns: A #GDBusConnection or %NULL if interface_ is
   *   not exported anywhere. Do not free, the object belongs to interface_.
   */
  DBusConnection getConnection()
  {
    GDBusConnection* _cretval;
    _cretval = g_dbus_interface_skeleton_get_connection(cast(GDBusInterfaceSkeleton*)cPtr);
    auto _retval = ObjectG.getDObject!DBusConnection(cast(GDBusConnection*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets a list of the connections that interface_ is exported on.
   * Returns: A list of
   *   all the connections that interface_ is exported on. The returned
   *   list should be freed with [glib.list.List.free] after each element has
   *   been freed with [gobject.object.ObjectG.unref].
   */
  DBusConnection[] getConnections()
  {
    GList* _cretval;
    _cretval = g_dbus_interface_skeleton_get_connections(cast(GDBusInterfaceSkeleton*)cPtr);
    auto _retval = gListToD!(DBusConnection, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
   * Gets the #GDBusInterfaceSkeletonFlags that describes what the behavior
   * of interface_
   * Returns: One or more flags from the #GDBusInterfaceSkeletonFlags enumeration.
   */
  DBusInterfaceSkeletonFlags getFlags()
  {
    GDBusInterfaceSkeletonFlags _cretval;
    _cretval = g_dbus_interface_skeleton_get_flags(cast(GDBusInterfaceSkeleton*)cPtr);
    DBusInterfaceSkeletonFlags _retval = cast(DBusInterfaceSkeletonFlags)_cretval;
    return _retval;
  }

  /**
   * Gets D-Bus introspection information for the D-Bus interface
   * implemented by interface_.
   * Returns: A #GDBusInterfaceInfo $(LPAREN)never %NULL$(RPAREN). Do not free.
   */
  DBusInterfaceInfo getInfo()
  {
    GDBusInterfaceInfo* _cretval;
    _cretval = g_dbus_interface_skeleton_get_info(cast(GDBusInterfaceSkeleton*)cPtr);
    auto _retval = _cretval ? new DBusInterfaceInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Gets the object path that interface_ is exported on, if any.
   * Returns: A string owned by interface_ or %NULL if interface_ is not exported
   *   anywhere. Do not free, the string belongs to interface_.
   */
  string getObjectPath()
  {
    const(char)* _cretval;
    _cretval = g_dbus_interface_skeleton_get_object_path(cast(GDBusInterfaceSkeleton*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Gets all D-Bus properties for interface_.
   * Returns: A #GVariant of type
   *   ['a{sv}'][G-VARIANT-TYPE-VARDICT:CAPS].
   *   Free with [glib.variant.VariantG.unref].
   */
  VariantG getProperties()
  {
    VariantC* _cretval;
    _cretval = g_dbus_interface_skeleton_get_properties(cast(GDBusInterfaceSkeleton*)cPtr);
    auto _retval = _cretval ? new VariantG(cast(VariantC*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Gets the interface vtable for the D-Bus interface implemented by
   * interface_. The returned function pointers should expect interface_
   * itself to be passed as user_data.
   * Returns: the vtable of the D-Bus interface implemented by the skeleton
   */
  DBusInterfaceVTable getVtable()
  {
    GDBusInterfaceVTable* _cretval;
    _cretval = g_dbus_interface_skeleton_get_vtable(cast(GDBusInterfaceSkeleton*)cPtr);
    DBusInterfaceVTable _retval;
    if (_cretval)
      _retval = *_cretval;
    return _retval;
  }

  /**
   * Checks if interface_ is exported on connection.
   * Params:
   *   connection = A #GDBusConnection.
   * Returns: %TRUE if interface_ is exported on connection, %FALSE otherwise.
   */
  bool hasConnection(DBusConnection connection)
  {
    bool _retval;
    _retval = g_dbus_interface_skeleton_has_connection(cast(GDBusInterfaceSkeleton*)cPtr, connection ? cast(GDBusConnection*)connection.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
   * Sets flags describing what the behavior of skeleton should be.
   * Params:
   *   flags = Flags from the #GDBusInterfaceSkeletonFlags enumeration.
   */
  void setFlags(DBusInterfaceSkeletonFlags flags)
  {
    g_dbus_interface_skeleton_set_flags(cast(GDBusInterfaceSkeleton*)cPtr, flags);
  }

  /**
   * Stops exporting interface_ on all connections it is exported on.
   * To unexport interface_ from only a single connection, use
   * [gio.dbus_interface_skeleton.DBusInterfaceSkeleton.unexportFromConnection]
   */
  void unexport()
  {
    g_dbus_interface_skeleton_unexport(cast(GDBusInterfaceSkeleton*)cPtr);
  }

  /**
   * Stops exporting interface_ on connection.
   * To stop exporting on all connections the interface is exported on,
   * use [gio.dbus_interface_skeleton.DBusInterfaceSkeleton.unexport].
   * Params:
   *   connection = A #GDBusConnection.
   */
  void unexportFromConnection(DBusConnection connection)
  {
    g_dbus_interface_skeleton_unexport_from_connection(cast(GDBusInterfaceSkeleton*)cPtr, connection ? cast(GDBusConnection*)connection.cPtr(No.Dup) : null);
  }

  /**
   * Emitted when a method is invoked by a remote caller and used to
   * determine if the method call is authorized.
   * Note that this signal is emitted in a thread dedicated to
   * handling the method call so handlers are allowed to perform
   * blocking IO. This means that it is appropriate to call e.g.
   * [polkit_authority_check_authorization_sync$(LPAREN)$(RPAREN)](http://hal.freedesktop.org/docs/polkit/PolkitAuthority.html#polkit-authority-check-authorization-sync)
   * with the
   * [POLKIT_CHECK_AUTHORIZATION_FLAGS_ALLOW_USER_INTERACTION](http://hal.freedesktop.org/docs/polkit/PolkitAuthority.html#POLKIT-CHECK-AUTHORIZATION-FLAGS-ALLOW-USER-INTERACTION:CAPS)
   * flag set.
   * If %FALSE is returned then no further handlers are run and the
   * signal handler must take a reference to invocation and finish
   * handling the call $(LPAREN)e.g. return an error via
   * [gio.dbus_method_invocation.DBusMethodInvocation.returnError]$(RPAREN).
   * Otherwise, if %TRUE is returned, signal emission continues. If no
   * handlers return %FALSE, then the method is dispatched. If
   * interface has an enclosing #GDBusObjectSkeleton, then the
   * #GDBusObjectSkeleton::authorize-method signal handlers run before
   * the handlers for this signal.
   * The default class handler just returns %TRUE.
   * Please note that the common case is optimized: if no signals
   * handlers are connected and the default class handler isn't
   * overridden $(LPAREN)for both interface and the enclosing
   * #GDBusObjectSkeleton, if any$(RPAREN) and #GDBusInterfaceSkeleton:g-flags does
   * not have the
   * %G_DBUS_INTERFACE_SKELETON_FLAGS_HANDLE_METHOD_INVOCATIONS_IN_THREAD
   * flags set, no dedicated thread is ever used and the call will be
   * handled in the same thread as the object that interface belongs
   * to was exported in.
   * Params
   *   invocation = A #GDBusMethodInvocation.
   *   dBusInterfaceSkeleton = the instance the signal is connected to
   * Returns: %TRUE if the call is authorized, %FALSE otherwise.
   */
  alias GAuthorizeMethodCallbackDlg = bool delegate(DBusMethodInvocation invocation, DBusInterfaceSkeleton dBusInterfaceSkeleton);
  alias GAuthorizeMethodCallbackFunc = bool function(DBusMethodInvocation invocation, DBusInterfaceSkeleton dBusInterfaceSkeleton);

  /**
   * Connect to GAuthorizeMethod signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectGAuthorizeMethod(T)(T callback, Flag!"After" after = No.After)
  if (is(T : GAuthorizeMethodCallbackDlg) || is(T : GAuthorizeMethodCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto dBusInterfaceSkeleton = getVal!DBusInterfaceSkeleton(_paramVals);
      auto invocation = getVal!DBusMethodInvocation(&_paramVals[1]);
      _retval = _dClosure.dlg(invocation, dBusInterfaceSkeleton);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("g-authorize-method", closure, after);
  }
}
