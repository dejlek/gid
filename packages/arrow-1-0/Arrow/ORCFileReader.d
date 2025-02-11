module Arrow.ORCFileReader;

import Arrow.RecordBatch;
import Arrow.Schema;
import Arrow.SeekableInputStream;
import Arrow.Table;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class ORCFileReader : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_orc_file_reader_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(SeekableInputStream file)
  {
    GArrowORCFileReader* _cretval;
    GError *_err;
    _cretval = garrow_orc_file_reader_new(file ? cast(GArrowSeekableInputStream*)file.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  int[] getFieldIndexes()
  {
    const(int)* _cretval;
    uint _cretlength;
    _cretval = garrow_orc_file_reader_get_field_indexes(cast(GArrowORCFileReader*)cPtr, &_cretlength);
    int[] _retval;

    if (_cretval)
    {
      _retval = cast(int[] )_cretval[0 .. _cretlength];
    }
    return _retval;
  }

  int[] getFieldIndices()
  {
    const(int)* _cretval;
    uint _cretlength;
    _cretval = garrow_orc_file_reader_get_field_indices(cast(GArrowORCFileReader*)cPtr, &_cretlength);
    int[] _retval;

    if (_cretval)
    {
      _retval = cast(int[] )_cretval[0 .. _cretlength];
    }
    return _retval;
  }

  long getNRows()
  {
    long _retval;
    _retval = garrow_orc_file_reader_get_n_rows(cast(GArrowORCFileReader*)cPtr);
    return _retval;
  }

  long getNStripes()
  {
    long _retval;
    _retval = garrow_orc_file_reader_get_n_stripes(cast(GArrowORCFileReader*)cPtr);
    return _retval;
  }

  RecordBatch readStripe(long i)
  {
    GArrowRecordBatch* _cretval;
    GError *_err;
    _cretval = garrow_orc_file_reader_read_stripe(cast(GArrowORCFileReader*)cPtr, i, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!RecordBatch(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }

  Table readStripes()
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = garrow_orc_file_reader_read_stripes(cast(GArrowORCFileReader*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Table(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  Schema readType()
  {
    GArrowSchema* _cretval;
    GError *_err;
    _cretval = garrow_orc_file_reader_read_type(cast(GArrowORCFileReader*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Schema(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }

  void setFieldIndexes(int[] fieldIndexes)
  {
    uint _nFieldIndexes;
    if (fieldIndexes)
      _nFieldIndexes = cast(uint)fieldIndexes.length;

    auto _fieldIndexes = cast(const(int)*)fieldIndexes.ptr;
    garrow_orc_file_reader_set_field_indexes(cast(GArrowORCFileReader*)cPtr, _fieldIndexes, _nFieldIndexes);
  }

  void setFieldIndices(int[] fieldIndices)
  {
    uint _nFieldIndices;
    if (fieldIndices)
      _nFieldIndices = cast(uint)fieldIndices.length;

    auto _fieldIndices = cast(const(int)*)fieldIndices.ptr;
    garrow_orc_file_reader_set_field_indices(cast(GArrowORCFileReader*)cPtr, _fieldIndices, _nFieldIndices);
  }
}
