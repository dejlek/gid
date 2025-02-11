module Arrow.DenseUnionArrayBuilder;

import Arrow.DenseUnionDataType;
import Arrow.Types;
import Arrow.UnionArrayBuilder;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import Gid.gid;

class DenseUnionArrayBuilder : UnionArrayBuilder
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_dense_union_array_builder_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(DenseUnionDataType dataType)
  {
    GArrowDenseUnionArrayBuilder* _cretval;
    GError *_err;
    _cretval = garrow_dense_union_array_builder_new(dataType ? cast(GArrowDenseUnionDataType*)dataType.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }
}
