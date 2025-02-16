module Arrow.RecordBatchFileWriter;

import Arrow.OutputStream;
import Arrow.RecordBatchStreamWriter;
import Arrow.Schema;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import Gid.gid;

class RecordBatchFileWriter : RecordBatchStreamWriter
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_record_batch_file_writer_get_type != &gidSymbolNotFound ? garrow_record_batch_file_writer_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(OutputStream sink, Schema schema)
  {
    GArrowRecordBatchFileWriter* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_file_writer_new(sink ? cast(GArrowOutputStream*)sink.cPtr(No.Dup) : null, schema ? cast(GArrowSchema*)schema.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }
}
