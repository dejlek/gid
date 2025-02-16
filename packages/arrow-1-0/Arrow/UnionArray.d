module Arrow.UnionArray;

import Arrow.Array;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class UnionArray : Array
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_union_array_get_type != &gidSymbolNotFound ? garrow_union_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  int getChildId(long i)
  {
    int _retval;
    _retval = garrow_union_array_get_child_id(cast(GArrowUnionArray*)cPtr, i);
    return _retval;
  }

  Array getField(int i)
  {
    GArrowArray* _cretval;
    _cretval = garrow_union_array_get_field(cast(GArrowUnionArray*)cPtr, i);
    auto _retval = ObjectG.getDObject!Array(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  byte getTypeCode(long i)
  {
    byte _retval;
    _retval = garrow_union_array_get_type_code(cast(GArrowUnionArray*)cPtr, i);
    return _retval;
  }
}
