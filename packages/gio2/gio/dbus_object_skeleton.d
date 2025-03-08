module gio.dbus_object_skeleton;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.dbus_interface_skeleton;
import gio.dbus_method_invocation;
import gio.dbus_object;
import gio.dbus_object_mixin;
import gio.types;
import gobject.dclosure;
import gobject.object;

/**
    A [gio.dbus_object_skeleton.DBusObjectSkeleton] instance is essentially a group of D-Bus
  interfaces. The set of exported interfaces on the object may be
  dynamic and change at runtime.
  
  This type is intended to be used with [gio.dbus_object_manager.DBusObjectManager].
*/
class DBusObjectSkeleton : gobject.object.ObjectG, gio.dbus_object.DBusObject
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_object_skeleton_get_type != &gidSymbolNotFound ? g_dbus_object_skeleton_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin DBusObjectT!();

  /**
      Creates a new #GDBusObjectSkeleton.
    Params:
      objectPath =       An object path.
    Returns:     A #GDBusObjectSkeleton. Free with [gobject.object.ObjectG.unref].
  */
  this(string objectPath)
  {
    GDBusObjectSkeleton* _cretval;
    const(char)* _objectPath = objectPath.toCString(No.alloc);
    _cretval = g_dbus_object_skeleton_new(_objectPath);
    this(_cretval, Yes.take);
  }

  /**
      Adds interface_ to object.
    
    If object already contains a #GDBusInterfaceSkeleton with the same
    interface name, it is removed before interface_ is added.
    
    Note that object takes its own reference on interface_ and holds
    it until removed.
    Params:
      interface_ =       A #GDBusInterfaceSkeleton.
  */
  void addInterface(gio.dbus_interface_skeleton.DBusInterfaceSkeleton interface_)
  {
    g_dbus_object_skeleton_add_interface(cast(GDBusObjectSkeleton*)cPtr, interface_ ? cast(GDBusInterfaceSkeleton*)interface_.cPtr(No.dup) : null);
  }

  /**
      This method simply calls [gio.dbus_interface_skeleton.DBusInterfaceSkeleton.flush] on all
    interfaces belonging to object. See that method for when flushing
    is useful.
  */
  void flush()
  {
    g_dbus_object_skeleton_flush(cast(GDBusObjectSkeleton*)cPtr);
  }

  /**
      Removes interface_ from object.
    Params:
      interface_ =       A #GDBusInterfaceSkeleton.
  */
  void removeInterface(gio.dbus_interface_skeleton.DBusInterfaceSkeleton interface_)
  {
    g_dbus_object_skeleton_remove_interface(cast(GDBusObjectSkeleton*)cPtr, interface_ ? cast(GDBusInterfaceSkeleton*)interface_.cPtr(No.dup) : null);
  }

  /**
      Removes the #GDBusInterface with interface_name from object.
    
    If no D-Bus interface of the given interface exists, this function
    does nothing.
    Params:
      interfaceName =       A D-Bus interface name.
  */
  void removeInterfaceByName(string interfaceName)
  {
    const(char)* _interfaceName = interfaceName.toCString(No.alloc);
    g_dbus_object_skeleton_remove_interface_by_name(cast(GDBusObjectSkeleton*)cPtr, _interfaceName);
  }

  /**
      Sets the object path for object.
    Params:
      objectPath =       A valid D-Bus object path.
  */
  void setObjectPath(string objectPath)
  {
    const(char)* _objectPath = objectPath.toCString(No.alloc);
    g_dbus_object_skeleton_set_object_path(cast(GDBusObjectSkeleton*)cPtr, _objectPath);
  }

  /**
      Emitted when a method is invoked by a remote caller and used to
    determine if the method call is authorized.
    
    This signal is like #GDBusInterfaceSkeleton's
    #GDBusInterfaceSkeleton::g-authorize-method signal,
    except that it is for the enclosing object.
    
    The default class handler just returns true.
  
    ## Parameters
    $(LIST
      * $(B interface_)       The #GDBusInterfaceSkeleton that invocation is for.
      * $(B invocation)       A #GDBusMethodInvocation.
      * $(B dBusObjectSkeleton) the instance the signal is connected to
    )
    Returns:     true if the call is authorized, false otherwise.
  */
  alias AuthorizeMethodCallbackDlg = bool delegate(gio.dbus_interface_skeleton.DBusInterfaceSkeleton interface_, gio.dbus_method_invocation.DBusMethodInvocation invocation, gio.dbus_object_skeleton.DBusObjectSkeleton dBusObjectSkeleton);

  /** ditto */
  alias AuthorizeMethodCallbackFunc = bool function(gio.dbus_interface_skeleton.DBusInterfaceSkeleton interface_, gio.dbus_method_invocation.DBusMethodInvocation invocation, gio.dbus_object_skeleton.DBusObjectSkeleton dBusObjectSkeleton);

  /**
    Connect to AuthorizeMethod signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.after to execute callback after default handler, No.after to execute before (default)
    Returns: Signal ID
  */
  ulong connectAuthorizeMethod(T)(T callback, Flag!"after" after = No.after)
  if (is(T : AuthorizeMethodCallbackDlg) || is(T : AuthorizeMethodCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto dBusObjectSkeleton = getVal!(gio.dbus_object_skeleton.DBusObjectSkeleton)(_paramVals);
      auto interface_ = getVal!(gio.dbus_interface_skeleton.DBusInterfaceSkeleton)(&_paramVals[1]);
      auto invocation = getVal!(gio.dbus_method_invocation.DBusMethodInvocation)(&_paramVals[2]);
      _retval = _dClosure.dlg(interface_, invocation, dBusObjectSkeleton);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("authorize-method", closure, after);
  }
}
