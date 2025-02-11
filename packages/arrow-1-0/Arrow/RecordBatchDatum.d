module Arrow.RecordBatchDatum;

import Arrow.Datum;
import Arrow.RecordBatch;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class RecordBatchDatum : Datum
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_record_batch_datum_get_type();
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
