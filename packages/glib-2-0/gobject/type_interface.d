module gobject.type_interface;

import gid.gid;
import gobject.c.functions;
import gobject.c.types;
import gobject.object;
import gobject.type_plugin;
import gobject.type_plugin_mixin;
import gobject.types;

/**
 * An opaque structure used as the base of all interface types.
 */
class TypeInterface
{
  GTypeInterface cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GObject.TypeInterface");

    cInstance = *cast(GTypeInterface*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
   * Returns the corresponding #GTypeInterface structure of the parent type
   * of the instance type to which g_iface belongs. This is useful when
   * deriving the implementation of an interface from the parent type and
   * then possibly overriding some methods.
   * Returns: the
   *   corresponding #GTypeInterface structure of the parent type of the
   *   instance type to which g_iface belongs, or %NULL if the parent
   *   type doesn't conform to the interface
   */
  TypeInterface peekParent()
  {
    GTypeInterface* _cretval;
    _cretval = g_type_interface_peek_parent(cast(GTypeInterface*)cPtr);
    auto _retval = _cretval ? new TypeInterface(cast(GTypeInterface*)_cretval) : null;
    return _retval;
  }

  /**
   * Adds prerequisite_type to the list of prerequisites of interface_type.
   * This means that any type implementing interface_type must also implement
   * prerequisite_type. Prerequisites can be thought of as an alternative to
   * interface derivation $(LPAREN)which GType doesn't support$(RPAREN). An interface can have
   * at most one instantiatable prerequisite type.
   * Params:
   *   interfaceType = #GType value of an interface type
   *   prerequisiteType = #GType value of an interface or instantiatable type
   */
  static void addPrerequisite(GType interfaceType, GType prerequisiteType)
  {
    g_type_interface_add_prerequisite(interfaceType, prerequisiteType);
  }

  /**
   * Returns the #GTypePlugin structure for the dynamic interface
   * interface_type which has been added to instance_type, or %NULL
   * if interface_type has not been added to instance_type or does
   * not have a #GTypePlugin structure. See [GObject.Global.typeAddInterfaceDynamic].
   * Params:
   *   instanceType = #GType of an instantiatable type
   *   interfaceType = #GType of an interface type
   * Returns: the #GTypePlugin for the dynamic
   *   interface interface_type of instance_type
   */
  static TypePlugin getPlugin(GType instanceType, GType interfaceType)
  {
    GTypePlugin* _cretval;
    _cretval = g_type_interface_get_plugin(instanceType, interfaceType);
    auto _retval = ObjectG.getDObject!TypePlugin(cast(GTypePlugin*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns the most specific instantiatable prerequisite of an
   * interface type. If the interface type has no instantiatable
   * prerequisite, %G_TYPE_INVALID is returned.
   * See [GObject.TypeInterface.addPrerequisite] for more information
   * about prerequisites.
   * Params:
   *   interfaceType = an interface type
   * Returns: the instantiatable prerequisite type or %G_TYPE_INVALID if none
   */
  static GType instantiatablePrerequisite(GType interfaceType)
  {
    GType _retval;
    _retval = g_type_interface_instantiatable_prerequisite(interfaceType);
    return _retval;
  }

  /**
   * Returns the prerequisites of an interfaces type.
   * Params:
   *   interfaceType = an interface type
   * Returns: a
   *   newly-allocated zero-terminated array of #GType containing
   *   the prerequisites of interface_type
   */
  static GType[] prerequisites(GType interfaceType)
  {
    GType* _cretval;
    uint _cretlength;
    _cretval = g_type_interface_prerequisites(interfaceType, &_cretlength);
    GType[] _retval;

    if (_cretval)
    {
      _retval = cast(GType[] )_cretval[0 .. _cretlength];
    }
    return _retval;
  }
}
