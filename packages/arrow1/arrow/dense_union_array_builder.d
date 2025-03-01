module arrow.dense_union_array_builder;

import arrow.c.functions;
import arrow.c.types;
import arrow.dense_union_data_type;
import arrow.types;
import arrow.union_array_builder;
import gid.global;
import glib.error;

class DenseUnionArrayBuilder : UnionArrayBuilder
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_dense_union_array_builder_get_type != &gidSymbolNotFound ? garrow_dense_union_array_builder_get_type() : cast(GType)0;
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
