module arrow.union_array;

import arrow.array;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class UnionArray : arrow.array.Array
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_union_array_get_type != &gidSymbolNotFound ? garrow_union_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  int getChildId(long i)
  {
    int _retval;
    _retval = garrow_union_array_get_child_id(cast(GArrowUnionArray*)cPtr, i);
    return _retval;
  }

  /** */
  arrow.array.Array getField(int i)
  {
    GArrowArray* _cretval;
    _cretval = garrow_union_array_get_field(cast(GArrowUnionArray*)cPtr, i);
    auto _retval = ObjectG.getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  byte getTypeCode(long i)
  {
    byte _retval;
    _retval = garrow_union_array_get_type_code(cast(GArrowUnionArray*)cPtr, i);
    return _retval;
  }
}
