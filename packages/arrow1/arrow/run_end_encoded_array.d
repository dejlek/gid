module arrow.run_end_encoded_array;

import arrow.array;
import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class RunEndEncodedArray : arrow.array.Array
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_run_end_encoded_array_get_type != &gidSymbolNotFound ? garrow_run_end_encoded_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(arrow.data_type.DataType dataType, long logicalLength, arrow.array.Array runEnds, arrow.array.Array values, long logicalOffset)
  {
    GArrowRunEndEncodedArray* _cretval;
    GError *_err;
    _cretval = garrow_run_end_encoded_array_new(dataType ? cast(GArrowDataType*)dataType.cPtr(No.Dup) : null, logicalLength, runEnds ? cast(GArrowArray*)runEnds.cPtr(No.Dup) : null, values ? cast(GArrowArray*)values.cPtr(No.Dup) : null, logicalOffset, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.array.Array decode()
  {
    GArrowArray* _cretval;
    GError *_err;
    _cretval = garrow_run_end_encoded_array_decode(cast(GArrowRunEndEncodedArray*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  long findPhysicalLength()
  {
    long _retval;
    _retval = garrow_run_end_encoded_array_find_physical_length(cast(GArrowRunEndEncodedArray*)cPtr);
    return _retval;
  }

  /** */
  long findPhysicalOffset()
  {
    long _retval;
    _retval = garrow_run_end_encoded_array_find_physical_offset(cast(GArrowRunEndEncodedArray*)cPtr);
    return _retval;
  }

  /** */
  arrow.array.Array getLogicalRunEnds()
  {
    GArrowArray* _cretval;
    GError *_err;
    _cretval = garrow_run_end_encoded_array_get_logical_run_ends(cast(GArrowRunEndEncodedArray*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array getLogicalValues()
  {
    GArrowArray* _cretval;
    _cretval = garrow_run_end_encoded_array_get_logical_values(cast(GArrowRunEndEncodedArray*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array getRunEnds()
  {
    GArrowArray* _cretval;
    _cretval = garrow_run_end_encoded_array_get_run_ends(cast(GArrowRunEndEncodedArray*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array getValues()
  {
    GArrowArray* _cretval;
    _cretval = garrow_run_end_encoded_array_get_values(cast(GArrowRunEndEncodedArray*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }
}
