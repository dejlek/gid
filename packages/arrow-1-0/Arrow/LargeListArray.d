module Arrow.LargeListArray;

import Arrow.Array;
import Arrow.Buffer;
import Arrow.DataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class LargeListArray : Array
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_large_list_array_get_type != &gidSymbolNotFound ? garrow_large_list_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(DataType dataType, long length, Buffer valueOffsets, Array values, Buffer nullBitmap, long nNulls)
  {
    GArrowLargeListArray* _cretval;
    _cretval = garrow_large_list_array_new(dataType ? cast(GArrowDataType*)dataType.cPtr(No.Dup) : null, length, valueOffsets ? cast(GArrowBuffer*)valueOffsets.cPtr(No.Dup) : null, values ? cast(GArrowArray*)values.cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap.cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  Array getValue(long i)
  {
    GArrowArray* _cretval;
    _cretval = garrow_large_list_array_get_value(cast(GArrowLargeListArray*)cPtr, i);
    auto _retval = ObjectG.getDObject!Array(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  long getValueLength(long i)
  {
    long _retval;
    _retval = garrow_large_list_array_get_value_length(cast(GArrowLargeListArray*)cPtr, i);
    return _retval;
  }

  long getValueOffset(long i)
  {
    long _retval;
    _retval = garrow_large_list_array_get_value_offset(cast(GArrowLargeListArray*)cPtr, i);
    return _retval;
  }

  long[] getValueOffsets()
  {
    const(long)* _cretval;
    long _cretlength;
    _cretval = garrow_large_list_array_get_value_offsets(cast(GArrowLargeListArray*)cPtr, &_cretlength);
    long[] _retval;

    if (_cretval)
    {
      _retval = cast(long[] )_cretval[0 .. _cretlength];
    }
    return _retval;
  }

  alias getValueType = Array.getValueType;

  DataType getValueType()
  {
    GArrowDataType* _cretval;
    _cretval = garrow_large_list_array_get_value_type(cast(GArrowLargeListArray*)cPtr);
    auto _retval = ObjectG.getDObject!DataType(cast(GArrowDataType*)_cretval, Yes.Take);
    return _retval;
  }

  Array getValues()
  {
    GArrowArray* _cretval;
    _cretval = garrow_large_list_array_get_values(cast(GArrowLargeListArray*)cPtr);
    auto _retval = ObjectG.getDObject!Array(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }
}
