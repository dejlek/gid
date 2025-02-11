module Arrow.RecordBatchIterator;

import Arrow.RecordBatch;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class RecordBatchIterator : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_record_batch_iterator_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(RecordBatch[] recordBatches)
  {
    GArrowRecordBatchIterator* _cretval;
    auto _recordBatches = gListFromD!(RecordBatch)(recordBatches);
    scope(exit) containerFree!(GList*, RecordBatch, GidOwnership.None)(_recordBatches);
    _cretval = garrow_record_batch_iterator_new(_recordBatches);
    this(_cretval, Yes.Take);
  }

  bool equal(RecordBatchIterator otherIterator)
  {
    bool _retval;
    _retval = garrow_record_batch_iterator_equal(cast(GArrowRecordBatchIterator*)cPtr, otherIterator ? cast(GArrowRecordBatchIterator*)otherIterator.cPtr(No.Dup) : null);
    return _retval;
  }

  RecordBatch next()
  {
    GArrowRecordBatch* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_iterator_next(cast(GArrowRecordBatchIterator*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!RecordBatch(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }

  RecordBatch[] toList()
  {
    GList* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_iterator_to_list(cast(GArrowRecordBatchIterator*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = gListToD!(RecordBatch, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }
}
