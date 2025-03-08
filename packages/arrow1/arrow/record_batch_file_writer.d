module arrow.record_batch_file_writer;

import arrow.c.functions;
import arrow.c.types;
import arrow.output_stream;
import arrow.record_batch_stream_writer;
import arrow.schema;
import arrow.types;
import gid.gid;
import glib.error;

/** */
class RecordBatchFileWriter : arrow.record_batch_stream_writer.RecordBatchStreamWriter
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_record_batch_file_writer_get_type != &gidSymbolNotFound ? garrow_record_batch_file_writer_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(arrow.output_stream.OutputStream sink, arrow.schema.Schema schema)
  {
    GArrowRecordBatchFileWriter* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_file_writer_new(sink ? cast(GArrowOutputStream*)sink.cPtr(No.dup) : null, schema ? cast(GArrowSchema*)schema.cPtr(No.dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.take);
  }
}
