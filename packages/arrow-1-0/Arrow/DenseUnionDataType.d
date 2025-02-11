module Arrow.DenseUnionDataType;

import Arrow.Field;
import Arrow.Types;
import Arrow.UnionDataType;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class DenseUnionDataType : UnionDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_dense_union_data_type_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Field[] fields, byte[] typeCodes)
  {
    GArrowDenseUnionDataType* _cretval;
    auto _fields = gListFromD!(Field)(fields);
    scope(exit) containerFree!(GList*, Field, GidOwnership.None)(_fields);
    size_t _nTypeCodes;
    if (typeCodes)
      _nTypeCodes = cast(size_t)typeCodes.length;

    auto _typeCodes = cast(byte*)typeCodes.ptr;
    _cretval = garrow_dense_union_data_type_new(_fields, _typeCodes, _nTypeCodes);
    this(_cretval, Yes.Take);
  }
}
