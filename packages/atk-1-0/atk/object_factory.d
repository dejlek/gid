module atk.object_factory;

import atk.c.functions;
import atk.c.types;
import atk.object;
import atk.types;
import gid.gid;
import gobject.object;
import gobject.types;

/**
 * The base object class for a factory used to
 * create accessible objects for objects of a specific GType.
 * This class is the base object class for a factory used to create an
 * accessible object for a specific GType. The function
 * [Atk.Registry.setFactoryType] is normally called to store in the
 * registry the factory type to be used to create an accessible of a
 * particular GType.
 */
class ObjectFactory : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())atk_object_factory_get_type != &gidSymbolNotFound ? atk_object_factory_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Provides an #AtkObject that implements an accessibility interface
   * on behalf of obj
   * Params:
   *   obj = a #GObject
   * Returns: an #AtkObject that implements an accessibility
   *   interface on behalf of obj
   */
  ObjectAtk createAccessible(ObjectG obj)
  {
    AtkObject* _cretval;
    _cretval = atk_object_factory_create_accessible(cast(AtkObjectFactory*)cPtr, obj ? cast(ObjectC*)obj.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!ObjectAtk(cast(AtkObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Gets the GType of the accessible which is created by the factory.
   * Returns: the type of the accessible which is created by the factory.
   *   The value G_TYPE_INVALID is returned if no type if found.
   */
  GType getAccessibleType()
  {
    GType _retval;
    _retval = atk_object_factory_get_accessible_type(cast(AtkObjectFactory*)cPtr);
    return _retval;
  }

  /**
   * Inform factory that it is no longer being used to create
   * accessibles. When called, factory may need to inform
   * #AtkObjects which it has created that they need to be re-instantiated.
   * Note: primarily used for runtime replacement of #AtkObjectFactorys
   * in object registries.
   */
  void invalidate()
  {
    atk_object_factory_invalidate(cast(AtkObjectFactory*)cPtr);
  }
}
