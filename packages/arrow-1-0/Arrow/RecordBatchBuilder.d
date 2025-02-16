module Arrow.RecordBatchBuilder;

import Arrow.ArrayBuilder;
import Arrow.RecordBatch;
import Arrow.Schema;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class RecordBatchBuilder : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_record_batch_builder_get_type != &gidSymbolNotFound ? garrow_record_batch_builder_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Schema schema)
  {
    GArrowRecordBatchBuilder* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_builder_new(schema ? cast(GArrowSchema*)schema.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  RecordBatch flush()
  {
    GArrowRecordBatch* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_builder_flush(cast(GArrowRecordBatchBuilder*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!RecordBatch(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }

  ArrayBuilder getColumnBuilder(int i)
  {
    GArrowArrayBuilder* _cretval;
    _cretval = garrow_record_batch_builder_get_column_builder(cast(GArrowRecordBatchBuilder*)cPtr, i);
    auto _retval = ObjectG.getDObject!ArrayBuilder(cast(GArrowArrayBuilder*)_cretval, No.Take);
    return _retval;
  }

  ArrayBuilder getField(int i)
  {
    GArrowArrayBuilder* _cretval;
    _cretval = garrow_record_batch_builder_get_field(cast(GArrowRecordBatchBuilder*)cPtr, i);
    auto _retval = ObjectG.getDObject!ArrayBuilder(cast(GArrowArrayBuilder*)_cretval, No.Take);
    return _retval;
  }

  long getInitialCapacity()
  {
    long _retval;
    _retval = garrow_record_batch_builder_get_initial_capacity(cast(GArrowRecordBatchBuilder*)cPtr);
    return _retval;
  }

  int getNColumns()
  {
    int _retval;
    _retval = garrow_record_batch_builder_get_n_columns(cast(GArrowRecordBatchBuilder*)cPtr);
    return _retval;
  }

  int getNFields()
  {
    int _retval;
    _retval = garrow_record_batch_builder_get_n_fields(cast(GArrowRecordBatchBuilder*)cPtr);
    return _retval;
  }

  Schema getSchema()
  {
    GArrowSchema* _cretval;
    _cretval = garrow_record_batch_builder_get_schema(cast(GArrowRecordBatchBuilder*)cPtr);
    auto _retval = ObjectG.getDObject!Schema(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }

  void setInitialCapacity(long capacity)
  {
    garrow_record_batch_builder_set_initial_capacity(cast(GArrowRecordBatchBuilder*)cPtr, capacity);
  }
}
