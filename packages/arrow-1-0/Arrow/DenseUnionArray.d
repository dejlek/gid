module Arrow.DenseUnionArray;

import Arrow.Array;
import Arrow.DenseUnionDataType;
import Arrow.Int32Array;
import Arrow.Int8Array;
import Arrow.Types;
import Arrow.UnionArray;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class DenseUnionArray : UnionArray
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_dense_union_array_get_type();
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
