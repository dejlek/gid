module arrow.dense_union_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.dense_union_data_type;
import arrow.scalar;
import arrow.types;
import arrow.union_scalar;
import gid.gid;

class DenseUnionScalar : arrow.union_scalar.UnionScalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_dense_union_scalar_get_type != &gidSymbolNotFound ? garrow_dense_union_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(arrow.dense_union_data_type.DenseUnionDataType dataType, byte typeCode, arrow.scalar.Scalar value)
  {
    GArrowDenseUnionScalar* _cretval;
    _cretval = garrow_dense_union_scalar_new(dataType ? cast(GArrowDenseUnionDataType*)dataType.cPtr(No.Dup) : null, typeCode, value ? cast(GArrowScalar*)value.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
