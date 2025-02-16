module Arrow.SparseUnionScalar;

import Arrow.Scalar;
import Arrow.SparseUnionDataType;
import Arrow.Types;
import Arrow.UnionScalar;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class SparseUnionScalar : UnionScalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_sparse_union_scalar_get_type != &gidSymbolNotFound ? garrow_sparse_union_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(SparseUnionDataType dataType, byte typeCode, Scalar value)
  {
    GArrowSparseUnionScalar* _cretval;
    _cretval = garrow_sparse_union_scalar_new(dataType ? cast(GArrowSparseUnionDataType*)dataType.cPtr(No.Dup) : null, typeCode, value ? cast(GArrowScalar*)value.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
