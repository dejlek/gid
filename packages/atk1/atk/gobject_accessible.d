module atk.gobject_accessible;

import atk.c.functions;
import atk.c.types;
import atk.object;
import atk.types;
import gid.gid;
import gobject.object;

/**
    This object class is derived from AtkObject and can be used as a basis implementing accessible objects.
  
  This object class is derived from AtkObject. It can be used as a
  basis for implementing accessible objects for GObjects which are
  not derived from GtkWidget. One example of its use is in providing
  an accessible object for GnomeCanvasItem in the GAIL library.
*/
class GObjectAccessible : atk.object.ObjectAtk
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())atk_gobject_accessible_get_type != &gidSymbolNotFound ? atk_gobject_accessible_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Gets the accessible object for the specified obj.
    Params:
      obj =       a #GObject
    Returns:     a #AtkObject which is the accessible object for
      the obj
  */
  static atk.object.ObjectAtk forObject(gobject.object.ObjectG obj)
  {
    AtkObject* _cretval;
    _cretval = atk_gobject_accessible_for_object(obj ? cast(ObjectC*)obj.cPtr(No.dup) : null);
    auto _retval = ObjectG.getDObject!(atk.object.ObjectAtk)(cast(AtkObject*)_cretval, No.take);
    return _retval;
  }

  /**
      Gets the GObject for which obj is the accessible object.
    Returns:     a #GObject which is the object for which obj is
      the accessible object
  */
  gobject.object.ObjectG getObject()
  {
    ObjectC* _cretval;
    _cretval = atk_gobject_accessible_get_object(cast(AtkGObjectAccessible*)cPtr);
    auto _retval = ObjectG.getDObject!(gobject.object.ObjectG)(cast(ObjectC*)_cretval, No.take);
    return _retval;
  }
}
