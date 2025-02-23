module arrow.record_batch_stream_writer;

import arrow.c.functions;
import arrow.c.types;
import arrow.output_stream;
import arrow.record_batch_writer;
import arrow.schema;
import arrow.types;
import gid.gid;
import glib.error;

class RecordBatchStreamWriter : RecordBatchWriter
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_record_batch_stream_writer_get_type != &gidSymbolNotFound ? garrow_record_batch_stream_writer_get_type() : cast(GType)0;
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
