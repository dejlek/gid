/// Module for [SparseUnionDataType] class
module arrow.sparse_union_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.field;
import arrow.types;
import arrow.union_data_type;
import gid.gid;

/** */
class SparseUnionDataType : arrow.union_data_type.UnionDataType
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_sparse_union_data_type_get_type != &gidSymbolNotFound ? garrow_sparse_union_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override SparseUnionDataType self()
  {
    return this;
  }

  /** */
  this(arrow.field.Field[] fields, byte[] typeCodes)
  {
    GArrowSparseUnionDataType* _cretval;
    auto _fields = gListFromD!(arrow.field.Field)(fields);
    scope(exit) containerFree!(GList*, arrow.field.Field, GidOwnership.None)(_fields);
    size_t _nTypeCodes;
    if (typeCodes)
      _nTypeCodes = cast(size_t)typeCodes.length;

    auto _typeCodes = cast(byte*)typeCodes.ptr;
    _cretval = garrow_sparse_union_data_type_new(_fields, _typeCodes, _nTypeCodes);
    this(_cretval, Yes.Take);
  }
}
