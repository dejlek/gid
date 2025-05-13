/// Module for [RunEndEncodedArray] class
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

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_run_end_encoded_array_get_type != &gidSymbolNotFound ? garrow_run_end_encoded_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RunEndEncodedArray self()
  {
    return this;
  }

  /** */
  this(arrow.data_type.DataType dataType, long logicalLength, arrow.array.Array runEnds, arrow.array.Array values, long logicalOffset)
  {
    GArrowRunEndEncodedArray* _cretval;
    GError *_err;
    _cretval = garrow_run_end_encoded_array_new(dataType ? cast(GArrowDataType*)dataType._cPtr(No.Dup) : null, logicalLength, runEnds ? cast(GArrowArray*)runEnds._cPtr(No.Dup) : null, values ? cast(GArrowArray*)values._cPtr(No.Dup) : null, logicalOffset, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.array.Array decode()
  {
    GArrowArray* _cretval;
    GError *_err;
    _cretval = garrow_run_end_encoded_array_decode(cast(GArrowRunEndEncodedArray*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  long findPhysicalLength()
  {
    long _retval;
    _retval = garrow_run_end_encoded_array_find_physical_length(cast(GArrowRunEndEncodedArray*)this._cPtr);
    return _retval;
  }

  /** */
  long findPhysicalOffset()
  {
    long _retval;
    _retval = garrow_run_end_encoded_array_find_physical_offset(cast(GArrowRunEndEncodedArray*)this._cPtr);
    return _retval;
  }

  /** */
  arrow.array.Array getLogicalRunEnds()
  {
    GArrowArray* _cretval;
    GError *_err;
    _cretval = garrow_run_end_encoded_array_get_logical_run_ends(cast(GArrowRunEndEncodedArray*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array getLogicalValues()
  {
    GArrowArray* _cretval;
    _cretval = garrow_run_end_encoded_array_get_logical_values(cast(GArrowRunEndEncodedArray*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array getRunEnds()
  {
    GArrowArray* _cretval;
    _cretval = garrow_run_end_encoded_array_get_run_ends(cast(GArrowRunEndEncodedArray*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array getValues()
  {
    GArrowArray* _cretval;
    _cretval = garrow_run_end_encoded_array_get_values(cast(GArrowRunEndEncodedArray*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }
}
