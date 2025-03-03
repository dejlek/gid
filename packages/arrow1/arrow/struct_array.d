module arrow.struct_array;

import arrow.array;
import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

class StructArray : arrow.array.Array
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_struct_array_get_type != &gidSymbolNotFound ? garrow_struct_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(arrow.data_type.DataType dataType, long length, arrow.array.Array[] fields, arrow.buffer.Buffer nullBitmap, long nNulls)
  {
    GArrowStructArray* _cretval;
    auto _fields = gListFromD!(arrow.array.Array)(fields);
    scope(exit) containerFree!(GList*, arrow.array.Array, GidOwnership.None)(_fields);
    _cretval = garrow_struct_array_new(dataType ? cast(GArrowDataType*)dataType.cPtr(No.Dup) : null, length, _fields, nullBitmap ? cast(GArrowBuffer*)nullBitmap.cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  arrow.array.Array[] flatten()
  {
    GList* _cretval;
    GError *_err;
    _cretval = garrow_struct_array_flatten(cast(GArrowStructArray*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = gListToD!(arrow.array.Array, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  arrow.array.Array getField(int i)
  {
    GArrowArray* _cretval;
    _cretval = garrow_struct_array_get_field(cast(GArrowStructArray*)cPtr, i);
    auto _retval = ObjectG.getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  arrow.array.Array[] getFields()
  {
    GList* _cretval;
    _cretval = garrow_struct_array_get_fields(cast(GArrowStructArray*)cPtr);
    auto _retval = gListToD!(arrow.array.Array, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }
}
