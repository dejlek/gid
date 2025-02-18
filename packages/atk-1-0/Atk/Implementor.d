module Atk.Implementor;

import Atk.ObjectAtk;
import Atk.Types;
import Atk.c.functions;
import Atk.c.types;
import GObject.ObjectG;
import Gid.gid;

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
   * Gets a reference to an object's #AtkObject implementation, if
   * the object implements #AtkObjectIface
   * Returns: a reference to an object's #AtkObject
   *   implementation
   */
  ObjectAtk refAccessible()
  {
    AtkObject* _cretval;
    _cretval = atk_implementor_ref_accessible(cast(AtkImplementor*)cPtr);
    auto _retval = ObjectG.getDObject!ObjectAtk(cast(AtkObject*)_cretval, Yes.Take);
    return _retval;
  }
}
