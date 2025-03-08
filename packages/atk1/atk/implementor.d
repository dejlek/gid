module atk.implementor;

import atk.c.functions;
import atk.c.types;
import atk.object;
import atk.types;
import gid.gid;
import gobject.object;

/** */
class Implementor
{
  AtkImplementor* cInstancePtr;
  bool owned;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Atk.Implementor");

    cInstancePtr = cast(AtkImplementor*)ptr;

    owned = take;
  }

  void* cPtr()
  {
    return cast(void*)cInstancePtr;
  }

  /**
      Gets a reference to an object's #AtkObject implementation, if
    the object implements #AtkObjectIface
    Returns:     a reference to an object's #AtkObject
      implementation
  */
  atk.object.ObjectAtk refAccessible()
  {
    AtkObject* _cretval;
    _cretval = atk_implementor_ref_accessible(cast(AtkImplementor*)cPtr);
    auto _retval = ObjectG.getDObject!(atk.object.ObjectAtk)(cast(AtkObject*)_cretval, Yes.Take);
    return _retval;
  }
}
