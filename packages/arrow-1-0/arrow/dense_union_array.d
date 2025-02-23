module arrow.dense_union_array;

import arrow.array;
import arrow.c.functions;
import arrow.c.types;
import arrow.dense_union_data_type;
import arrow.int32_array;
import arrow.int8_array;
import arrow.types;
import arrow.union_array;
import gid.gid;
import glib.error;
import gobject.object;

class DenseUnionArray : UnionArray
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_dense_union_array_get_type != &gidSymbolNotFound ? garrow_dense_union_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Int8Array typeIds, Int32Array valueOffsets, Array[] fields)
  {
    GArrowDenseUnionArray* _cretval;
    auto _fields = gListFromD!(Array)(fields);
    scope(exit) containerFree!(GList*, Array, GidOwnership.None)(_fields);
    GError *_err;
    _cretval = garrow_dense_union_array_new(typeIds ? cast(GArrowInt8Array*)typeIds.cPtr(No.Dup) : null, valueOffsets ? cast(GArrowInt32Array*)valueOffsets.cPtr(No.Dup) : null, _fields, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  static DenseUnionArray newDataType(DenseUnionDataType dataType, Int8Array typeIds, Int32Array valueOffsets, Array[] fields)
  {
    GArrowDenseUnionArray* _cretval;
    auto _fields = gListFromD!(Array)(fields);
    scope(exit) containerFree!(GList*, Array, GidOwnership.None)(_fields);
    GError *_err;
    _cretval = garrow_dense_union_array_new_data_type(dataType ? cast(GArrowDenseUnionDataType*)dataType.cPtr(No.Dup) : null, typeIds ? cast(GArrowInt8Array*)typeIds.cPtr(No.Dup) : null, valueOffsets ? cast(GArrowInt32Array*)valueOffsets.cPtr(No.Dup) : null, _fields, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!DenseUnionArray(cast(GArrowDenseUnionArray*)_cretval, Yes.Take);
    return _retval;
  }

  int getValueOffset(long i)
  {
    int _retval;
    _retval = garrow_dense_union_array_get_value_offset(cast(GArrowDenseUnionArray*)cPtr, i);
    return _retval;
  }
}
