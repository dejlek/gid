module Arrow.DenseUnionScalar;

import Arrow.DenseUnionDataType;
import Arrow.Scalar;
import Arrow.Types;
import Arrow.UnionScalar;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class DenseUnionScalar : UnionScalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_dense_union_scalar_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(DenseUnionDataType dataType, byte typeCode, Scalar value)
  {
    GArrowDenseUnionScalar* _cretval;
    _cretval = garrow_dense_union_scalar_new(dataType ? cast(GArrowDenseUnionDataType*)dataType.cPtr(No.Dup) : null, typeCode, value ? cast(GArrowScalar*)value.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
