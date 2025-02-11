module ArrowFlight.RecordBatchStream;

import Arrow.RecordBatchReader;
import Arrow.WriteOptions;
import ArrowFlight.DataStream;
import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import Gid.gid;

class RecordBatchStream : DataStream
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gaflight_record_batch_stream_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(RecordBatchReader reader, WriteOptions options)
  {
    GAFlightRecordBatchStream* _cretval;
    _cretval = gaflight_record_batch_stream_new(reader ? cast(GArrowRecordBatchReader*)reader.cPtr(No.Dup) : null, options ? cast(GArrowWriteOptions*)options.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
