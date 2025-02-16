module Arrow.RunEndEncodedArray;

import Arrow.Array;
import Arrow.DataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class RunEndEncodedArray : Array
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_run_end_encoded_array_get_type != &gidSymbolNotFound ? garrow_run_end_encoded_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(DataType dataType, long logicalLength, Array runEnds, Array values, long logicalOffset)
  {
    GArrowRunEndEncodedArray* _cretval;
    GError *_err;
    _cretval = garrow_run_end_encoded_array_new(dataType ? cast(GArrowDataType*)dataType.cPtr(No.Dup) : null, logicalLength, runEnds ? cast(GArrowArray*)runEnds.cPtr(No.Dup) : null, values ? cast(GArrowArray*)values.cPtr(No.Dup) : null, logicalOffset, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  Array decode()
  {
    GArrowArray* _cretval;
    GError *_err;
    _cretval = garrow_run_end_encoded_array_decode(cast(GArrowRunEndEncodedArray*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Array(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  long findPhysicalLength()
  {
    long _retval;
    _retval = garrow_run_end_encoded_array_find_physical_length(cast(GArrowRunEndEncodedArray*)cPtr);
    return _retval;
  }

  long findPhysicalOffset()
  {
    long _retval;
    _retval = garrow_run_end_encoded_array_find_physical_offset(cast(GArrowRunEndEncodedArray*)cPtr);
    return _retval;
  }

  Array getLogicalRunEnds()
  {
    GArrowArray* _cretval;
    GError *_err;
    _cretval = garrow_run_end_encoded_array_get_logical_run_ends(cast(GArrowRunEndEncodedArray*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Array(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  Array getLogicalValues()
  {
    GArrowArray* _cretval;
    _cretval = garrow_run_end_encoded_array_get_logical_values(cast(GArrowRunEndEncodedArray*)cPtr);
    auto _retval = ObjectG.getDObject!Array(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  Array getRunEnds()
  {
    GArrowArray* _cretval;
    _cretval = garrow_run_end_encoded_array_get_run_ends(cast(GArrowRunEndEncodedArray*)cPtr);
    auto _retval = ObjectG.getDObject!Array(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  Array getValues()
  {
    GArrowArray* _cretval;
    _cretval = garrow_run_end_encoded_array_get_values(cast(GArrowRunEndEncodedArray*)cPtr);
    auto _retval = ObjectG.getDObject!Array(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }
}
