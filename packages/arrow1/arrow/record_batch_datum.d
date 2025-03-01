module arrow.record_batch_datum;

import arrow.c.functions;
import arrow.c.types;
import arrow.datum;
import arrow.record_batch;
import arrow.types;
import gid.global;

class RecordBatchDatum : Datum
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_record_batch_datum_get_type != &gidSymbolNotFound ? garrow_record_batch_datum_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(RecordBatch value)
  {
    GArrowRecordBatchDatum* _cretval;
    _cretval = garrow_record_batch_datum_new(value ? cast(GArrowRecordBatch*)value.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
