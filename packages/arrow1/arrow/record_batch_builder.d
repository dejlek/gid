module arrow.record_batch_builder;

import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.record_batch;
import arrow.schema;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class RecordBatchBuilder : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_record_batch_builder_get_type != &gidSymbolNotFound ? garrow_record_batch_builder_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override RecordBatchBuilder self()
  {
    return this;
  }

  /** */
  this(arrow.schema.Schema schema)
  {
    GArrowRecordBatchBuilder* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_builder_new(schema ? cast(GArrowSchema*)schema.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.record_batch.RecordBatch flush()
  {
    GArrowRecordBatch* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_builder_flush(cast(GArrowRecordBatchBuilder*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.record_batch.RecordBatch)(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array_builder.ArrayBuilder getColumnBuilder(int i)
  {
    GArrowArrayBuilder* _cretval;
    _cretval = garrow_record_batch_builder_get_column_builder(cast(GArrowRecordBatchBuilder*)cPtr, i);
    auto _retval = ObjectG.getDObject!(arrow.array_builder.ArrayBuilder)(cast(GArrowArrayBuilder*)_cretval, No.Take);
    return _retval;
  }

  /** */
  arrow.array_builder.ArrayBuilder getField(int i)
  {
    GArrowArrayBuilder* _cretval;
    _cretval = garrow_record_batch_builder_get_field(cast(GArrowRecordBatchBuilder*)cPtr, i);
    auto _retval = ObjectG.getDObject!(arrow.array_builder.ArrayBuilder)(cast(GArrowArrayBuilder*)_cretval, No.Take);
    return _retval;
  }

  /** */
  long getInitialCapacity()
  {
    long _retval;
    _retval = garrow_record_batch_builder_get_initial_capacity(cast(GArrowRecordBatchBuilder*)cPtr);
    return _retval;
  }

  /** */
  int getNColumns()
  {
    int _retval;
    _retval = garrow_record_batch_builder_get_n_columns(cast(GArrowRecordBatchBuilder*)cPtr);
    return _retval;
  }

  /** */
  int getNFields()
  {
    int _retval;
    _retval = garrow_record_batch_builder_get_n_fields(cast(GArrowRecordBatchBuilder*)cPtr);
    return _retval;
  }

  /** */
  arrow.schema.Schema getSchema()
  {
    GArrowSchema* _cretval;
    _cretval = garrow_record_batch_builder_get_schema(cast(GArrowRecordBatchBuilder*)cPtr);
    auto _retval = ObjectG.getDObject!(arrow.schema.Schema)(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  void setInitialCapacity(long capacity)
  {
    garrow_record_batch_builder_set_initial_capacity(cast(GArrowRecordBatchBuilder*)cPtr, capacity);
  }
}
