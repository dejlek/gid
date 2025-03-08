module arrow.sparse_union_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.sparse_union_data_type;
import arrow.types;
import arrow.union_scalar;
import gid.gid;

/** */
class SparseUnionScalar : arrow.union_scalar.UnionScalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_sparse_union_scalar_get_type != &gidSymbolNotFound ? garrow_sparse_union_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(arrow.sparse_union_data_type.SparseUnionDataType dataType, byte typeCode, arrow.scalar.Scalar value)
  {
    GArrowSparseUnionScalar* _cretval;
    _cretval = garrow_sparse_union_scalar_new(dataType ? cast(GArrowSparseUnionDataType*)dataType.cPtr(No.Dup) : null, typeCode, value ? cast(GArrowScalar*)value.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
