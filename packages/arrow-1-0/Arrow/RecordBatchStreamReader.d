module Arrow.RecordBatchStreamReader;

import Arrow.InputStream;
import Arrow.RecordBatchReader;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import Gid.gid;

class RecordBatchStreamReader : RecordBatchReader
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_record_batch_stream_reader_get_type != &gidSymbolNotFound ? garrow_record_batch_stream_reader_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(InputStream stream)
  {
    GArrowRecordBatchStreamReader* _cretval;
    GError *_err;
    _cretval = garrow_record_batch_stream_reader_new(stream ? cast(GArrowInputStream*)stream.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    this(_cretval, Yes.Take);
  }
}
