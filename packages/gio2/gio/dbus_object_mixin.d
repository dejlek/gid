module gio.dbus_object_mixin;

public import gio.dbus_object_iface_proxy;
public import gid.gid;
public import gio.c.functions;
public import gio.c.types;
public import gio.dbus_interface;
public import gio.types;
public import gobject.dclosure;
public import gobject.object;

/**
 * The `GDBusObject` type is the base type for D-Bus objects on both
 * the service side $(LPAREN)see [gio.dbus_object_skeleton.DBusObjectSkeleton]$(RPAREN) and the client side
 * $(LPAREN)see [gio.dbus_object_proxy.DBusObjectProxy]$(RPAREN). It is essentially just a container of
 * interfaces.
 */
template DBusObjectT()
{

  /**
   * Gets the D-Bus interface with name interface_name associated with
   * object, if any.
   * Params:
   *   interfaceName = A D-Bus interface name.
   * Returns: %NULL if not found, otherwise a
   *   #GDBusInterface that must be freed with [gobject.object.ObjectG.unref].
   */
  override gio.dbus_interface.DBusInterface getInterface(string interfaceName)
  {
    GDBusInterface* _cretval;
    const(char)* _interfaceName = interfaceName.toCString(No.Alloc);
    _cretval = g_dbus_object_get_interface(cast(GDBusObject*)cPtr, _interfaceName);
    auto _retval = ObjectG.getDObject!(gio.dbus_interface.DBusInterface)(cast(GDBusInterface*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Gets the D-Bus interfaces associated with object.
   * Returns: A list of #GDBusInterface instances.
   *   The returned list must be freed by [glib.list.List.free] after each element has been freed
   *   with [gobject.object.ObjectG.unref].
   */
  override gio.dbus_interface.DBusInterface[] getInterfaces()
  {
    GList* _cretval;
    _cretval = g_dbus_object_get_interfaces(cast(GDBusObject*)cPtr);
    auto _retval = gListToD!(gio.dbus_interface.DBusInterface, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
   * Gets the object path for object.
   * Returns: A string owned by object. Do not free.
   */
  override string getObjectPath()
  {
    const(char)* _cretval;
    _cretval = g_dbus_object_get_object_path(cast(GDBusObject*)cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
   * Emitted when interface is added to object.
   * Params
   *   interface_ = The #GDBusInterface that was added.
   *   dBusObject = the instance the signal is connected to
   */
  alias InterfaceAddedCallbackDlg = void delegate(gio.dbus_interface.DBusInterface interface_, gio.dbus_object.DBusObject dBusObject);
  alias InterfaceAddedCallbackFunc = void function(gio.dbus_interface.DBusInterface interface_, gio.dbus_object.DBusObject dBusObject);

  /**
   * Connect to InterfaceAdded signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectInterfaceAdded(T)(T callback, Flag!"After" after = No.After)
  if (is(T : InterfaceAddedCallbackDlg) || is(T : InterfaceAddedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto dBusObject = getVal!(gio.dbus_object.DBusObject)(_paramVals);
      auto interface_ = getVal!(gio.dbus_interface.DBusInterface)(&_paramVals[1]);
      _dClosure.dlg(interface_, dBusObject);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("interface-added", closure, after);
  }

  /**
   * Emitted when interface is removed from object.
   * Params
   *   interface_ = The #GDBusInterface that was removed.
   *   dBusObject = the instance the signal is connected to
   */
  alias InterfaceRemovedCallbackDlg = void delegate(gio.dbus_interface.DBusInterface interface_, gio.dbus_object.DBusObject dBusObject);
  alias InterfaceRemovedCallbackFunc = void function(gio.dbus_interface.DBusInterface interface_, gio.dbus_object.DBusObject dBusObject);

  /**
   * Connect to InterfaceRemoved signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectInterfaceRemoved(T)(T callback, Flag!"After" after = No.After)
  if (is(T : InterfaceRemovedCallbackDlg) || is(T : InterfaceRemovedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto dBusObject = getVal!(gio.dbus_object.DBusObject)(_paramVals);
      auto interface_ = getVal!(gio.dbus_interface.DBusInterface)(&_paramVals[1]);
      _dClosure.dlg(interface_, dBusObject);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("interface-removed", closure, after);
  }
}
