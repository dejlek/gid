module Gio.DBusObjectT;

public import Gio.DBusObjectIfaceProxy;
public import GObject.DClosure;
public import GObject.ObjectG;
public import Gid.gid;
public import Gio.DBusInterface;
public import Gio.DBusInterfaceT;
public import Gio.Types;
public import Gio.c.functions;
public import Gio.c.types;

/**
 * The `GDBusObject` type is the base type for D-Bus objects on both
 * the service side $(LPAREN)see [Gio.DBusObjectSkeleton]$(RPAREN) and the client side
 * $(LPAREN)see [Gio.DBusObjectProxy]$(RPAREN). It is essentially just a container of
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
   *   #GDBusInterface that must be freed with [GObject.ObjectG.unref].
   */
  override DBusInterface getInterface(string interfaceName)
  {
    GDBusInterface* _cretval;
    const(char)* _interfaceName = interfaceName.toCString(No.Alloc);
    _cretval = g_dbus_object_get_interface(cast(GDBusObject*)cPtr, _interfaceName);
    auto _retval = ObjectG.getDObject!DBusInterface(cast(GDBusInterface*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Gets the D-Bus interfaces associated with object.
   * Returns: A list of #GDBusInterface instances.
   *   The returned list must be freed by [GLib.List.free] after each element has been freed
   *   with [GObject.ObjectG.unref].
   */
  override DBusInterface[] getInterfaces()
  {
    GList* _cretval;
    _cretval = g_dbus_object_get_interfaces(cast(GDBusObject*)cPtr);
    auto _retval = gListToD!(DBusInterface, GidOwnership.Full)(cast(GList*)_cretval);
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
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Emitted when interface is added to object.
   * Params
   *   interface_ = The #GDBusInterface that was added.
   *   dBusObject = the instance the signal is connected to
   */
  alias InterfaceAddedCallbackDlg = void delegate(DBusInterface interface_, DBusObject dBusObject);
  alias InterfaceAddedCallbackFunc = void function(DBusInterface interface_, DBusObject dBusObject);

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
      auto dBusObject = getVal!DBusObject(_paramVals);
      auto interface_ = getVal!DBusInterface(&_paramVals[1]);
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
  alias InterfaceRemovedCallbackDlg = void delegate(DBusInterface interface_, DBusObject dBusObject);
  alias InterfaceRemovedCallbackFunc = void function(DBusInterface interface_, DBusObject dBusObject);

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
      auto dBusObject = getVal!DBusObject(_paramVals);
      auto interface_ = getVal!DBusInterface(&_paramVals[1]);
      _dClosure.dlg(interface_, dBusObject);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("interface-removed", closure, after);
  }
}
