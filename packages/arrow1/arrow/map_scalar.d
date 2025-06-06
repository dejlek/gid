/// Module for [MapScalar] class
module arrow.map_scalar;

import arrow.base_list_scalar;
import arrow.c.functions;
import arrow.c.types;
import arrow.struct_array;
import arrow.types;
import gid.gid;

/** */
class MapScalar : arrow.base_list_scalar.BaseListScalar
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_map_scalar_get_type != &gidSymbolNotFound ? garrow_map_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MapScalar self()
  {
    return this;
  }

  /** */
  this(arrow.struct_array.StructArray value)
  {
    GArrowMapScalar* _cretval;
    _cretval = garrow_map_scalar_new(value ? cast(GArrowStructArray*)value._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
