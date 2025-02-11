module Arrow.SparseUnionArray;

import Arrow.Array;
import Arrow.Int8Array;
import Arrow.SparseUnionDataType;
import Arrow.Types;
import Arrow.UnionArray;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class SparseUnionArray : UnionArray
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_sparse_union_array_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Int8Array typeIds, Array[] fields)
  {
    GArrowSparseUnionArray* _cretval;
    auto _fields = gListFromD!(Array)(fields);
    scope(exit) containerFree!(GList*, Array, GidOwnership.None)(_fields);
    GError *_err;
    _cretval = garrow_sparse_union_array_new(typeIds ? cast(GArrowInt8Array*)typeIds.cPtr(No.Dup) : null, _fields, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  static SparseUnionArray newDataType(SparseUnionDataType dataType, Int8Array typeIds, Array[] fields)
  {
    GArrowSparseUnionArray* _cretval;
    auto _fields = gListFromD!(Array)(fields);
    scope(exit) containerFree!(GList*, Array, GidOwnership.None)(_fields);
    GError *_err;
    _cretval = garrow_sparse_union_array_new_data_type(dataType ? cast(GArrowSparseUnionDataType*)dataType.cPtr(No.Dup) : null, typeIds ? cast(GArrowInt8Array*)typeIds.cPtr(No.Dup) : null, _fields, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!SparseUnionArray(cast(GArrowSparseUnionArray*)_cretval, Yes.Take);
    return _retval;
  }
}
