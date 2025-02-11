module Arrow.StructArray;

import Arrow.Array;
import Arrow.Buffer;
import Arrow.DataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class StructArray : Array
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_struct_array_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(DataType dataType, long length, Array[] fields, Buffer nullBitmap, long nNulls)
  {
    GArrowStructArray* _cretval;
    auto _fields = gListFromD!(Array)(fields);
    scope(exit) containerFree!(GList*, Array, GidOwnership.None)(_fields);
    _cretval = garrow_struct_array_new(dataType ? cast(GArrowDataType*)dataType.cPtr(No.Dup) : null, length, _fields, nullBitmap ? cast(GArrowBuffer*)nullBitmap.cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  Array[] flatten()
  {
    GList* _cretval;
    GError *_err;
    _cretval = garrow_struct_array_flatten(cast(GArrowStructArray*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = gListToD!(Array, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  Array getField(int i)
  {
    GArrowArray* _cretval;
    _cretval = garrow_struct_array_get_field(cast(GArrowStructArray*)cPtr, i);
    auto _retval = ObjectG.getDObject!Array(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  Array[] getFields()
  {
    GList* _cretval;
    _cretval = garrow_struct_array_get_fields(cast(GArrowStructArray*)cPtr);
    auto _retval = gListToD!(Array, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }
}
