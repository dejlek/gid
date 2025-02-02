module Gio.DBusObjectSkeleton;

import GObject.DClosure;
import GObject.ObjectG;
import Gid.gid;
import Gio.DBusInterfaceSkeleton;
import Gio.DBusMethodInvocation;
import Gio.DBusObject;
import Gio.DBusObjectT;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

/**
 * A `GDBusObjectSkeleton` instance is essentially a group of D-Bus
 * interfaces. The set of exported interfaces on the object may be
 * dynamic and change at runtime.
 * This type is intended to be used with [Gio.DBusObjectManager].
 */
class DBusObjectSkeleton : ObjectG, DBusObject
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return g_dbus_object_skeleton_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin DBusObjectT!();

  /**
   * Creates a new #GDBusObjectSkeleton.
   * Params:
   *   objectPath = An object path.
   * Returns: A #GDBusObjectSkeleton. Free with [GObject.ObjectG.unref].
   */
  this(string objectPath)
  {
    GDBusObjectSkeleton* _cretval;
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    _cretval = g_dbus_object_skeleton_new(_objectPath);
    this(_cretval, Yes.Take);
  }

  /**
   * Adds interface_ to object.
   * If object already contains a #GDBusInterfaceSkeleton with the same
   * interface name, it is removed before interface_ is added.
   * Note that object takes its own reference on interface_ and holds
   * it until removed.
   * Params:
   *   interface_ = A #GDBusInterfaceSkeleton.
   */
  void addInterface(DBusInterfaceSkeleton interface_)
  {
    g_dbus_object_skeleton_add_interface(cast(GDBusObjectSkeleton*)cPtr, interface_ ? cast(GDBusInterfaceSkeleton*)interface_.cPtr(No.Dup) : null);
  }

  /**
   * This method simply calls [Gio.DBusInterfaceSkeleton.flush] on all
   * interfaces belonging to object. See that method for when flushing
   * is useful.
   */
  void flush()
  {
    g_dbus_object_skeleton_flush(cast(GDBusObjectSkeleton*)cPtr);
  }

  /**
   * Removes interface_ from object.
   * Params:
   *   interface_ = A #GDBusInterfaceSkeleton.
   */
  void removeInterface(DBusInterfaceSkeleton interface_)
  {
    g_dbus_object_skeleton_remove_interface(cast(GDBusObjectSkeleton*)cPtr, interface_ ? cast(GDBusInterfaceSkeleton*)interface_.cPtr(No.Dup) : null);
  }

  /**
   * Removes the #GDBusInterface with interface_name from object.
   * If no D-Bus interface of the given interface exists, this function
   * does nothing.
   * Params:
   *   interfaceName = A D-Bus interface name.
   */
  void removeInterfaceByName(string interfaceName)
  {
    const(char)* _interfaceName = interfaceName.toCString(No.Alloc);
    g_dbus_object_skeleton_remove_interface_by_name(cast(GDBusObjectSkeleton*)cPtr, _interfaceName);
  }

  /**
   * Sets the object path for object.
   * Params:
   *   objectPath = A valid D-Bus object path.
   */
  void setObjectPath(string objectPath)
  {
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    g_dbus_object_skeleton_set_object_path(cast(GDBusObjectSkeleton*)cPtr, _objectPath);
  }

  /**
   * Emitted when a method is invoked by a remote caller and used to
   * determine if the method call is authorized.
   * This signal is like #GDBusInterfaceSkeleton's
   * #GDBusInterfaceSkeleton::g-authorize-method signal,
   * except that it is for the enclosing object.
   * The default class handler just returns %TRUE.
   * Params
   *   interface_ = The #GDBusInterfaceSkeleton that invocation is for.
   *   invocation = A #GDBusMethodInvocation.
   *   dBusObjectSkeleton = the instance the signal is connected to
   * Returns: %TRUE if the call is authorized, %FALSE otherwise.
   */
  alias AuthorizeMethodCallbackDlg = bool delegate(DBusInterfaceSkeleton interface_, DBusMethodInvocation invocation, DBusObjectSkeleton dBusObjectSkeleton);
  alias AuthorizeMethodCallbackFunc = bool function(DBusInterfaceSkeleton interface_, DBusMethodInvocation invocation, DBusObjectSkeleton dBusObjectSkeleton);

  /**
   * Connect to AuthorizeMethod signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectAuthorizeMethod(T)(T callback, Flag!"After" after = No.After)
  if (is(T : AuthorizeMethodCallbackDlg) || is(T : AuthorizeMethodCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto dBusObjectSkeleton = getVal!DBusObjectSkeleton(_paramVals);
      auto interface_ = getVal!DBusInterfaceSkeleton(&_paramVals[1]);
      auto invocation = getVal!DBusMethodInvocation(&_paramVals[2]);
      _retval = _dClosure.dlg(interface_, invocation, dBusObjectSkeleton);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("authorize-method", closure, after);
  }
}
