module Arrow.OutputStream;

import Arrow.File;
import Arrow.FileT;
import Arrow.RecordBatch;
import Arrow.Tensor;
import Arrow.Types;
import Arrow.Writable;
import Arrow.WritableT;
import Arrow.WriteOptions;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class OutputStream : ObjectG, File, Writable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_output_stream_get_type != &gidSymbolNotFound ? garrow_output_stream_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin FileT!();
  mixin WritableT!();

  bool align_(int alignment)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_output_stream_align(cast(GArrowOutputStream*)cPtr, alignment, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  long writeRecordBatch(RecordBatch recordBatch, WriteOptions options)
  {
    long _retval;
    GError *_err;
    _retval = garrow_output_stream_write_record_batch(cast(GArrowOutputStream*)cPtr, recordBatch ? cast(GArrowRecordBatch*)recordBatch.cPtr(No.Dup) : null, options ? cast(GArrowWriteOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  long writeTensor(Tensor tensor)
  {
    long _retval;
    GError *_err;
    _retval = garrow_output_stream_write_tensor(cast(GArrowOutputStream*)cPtr, tensor ? cast(GArrowTensor*)tensor.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
