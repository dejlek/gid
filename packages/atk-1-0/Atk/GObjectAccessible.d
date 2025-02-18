module Atk.GObjectAccessible;

import Atk.ObjectAtk;
import Atk.Types;
import Atk.c.functions;
import Atk.c.types;
import GObject.ObjectG;
import Gid.gid;

/**
 * This object class is derived from AtkObject and can be used as a basis implementing accessible objects.
 * This object class is derived from AtkObject. It can be used as a
 * basis for implementing accessible objects for GObjects which are
 * not derived from GtkWidget. One example of its use is in providing
 * an accessible object for GnomeCanvasItem in the GAIL library.
 */
class GObjectAccessible : ObjectAtk
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())atk_gobject_accessible_get_type != &gidSymbolNotFound ? atk_gobject_accessible_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Gets the accessible object for the specified obj.
   * Params:
   *   obj = a #GObject
   * Returns: a #AtkObject which is the accessible object for
   *   the obj
   */
  static ObjectAtk forObject(ObjectG obj)
  {
    AtkObject* _cretval;
    _cretval = atk_gobject_accessible_for_object(obj ? cast(ObjectC*)obj.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!ObjectAtk(cast(AtkObject*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the GObject for which obj is the accessible object.
   * Returns: a #GObject which is the object for which obj is
   *   the accessible object
   */
  ObjectG getObject()
  {
    ObjectC* _cretval;
    _cretval = atk_gobject_accessible_get_object(cast(AtkGObjectAccessible*)cPtr);
    auto _retval = ObjectG.getDObject!ObjectG(cast(ObjectC*)_cretval, No.Take);
    return _retval;
  }
}
