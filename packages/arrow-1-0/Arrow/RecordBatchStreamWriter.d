module Arrow.RecordBatchStreamWriter;

import Arrow.OutputStream;
import Arrow.RecordBatchWriter;
import Arrow.Schema;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import Gid.gid;

class RecordBatchStreamWriter : RecordBatchWriter
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_record_batch_stream_writer_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(OutputStream sink, Schema schema)
  {
    GArrowRecordBatchStreamWriter* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_stream_writer_new(sink ? cast(GArrowOutputStream*)sink.cPtr(No.Dup) : null, schema ? cast(GArrowSchema*)schema.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }
}
