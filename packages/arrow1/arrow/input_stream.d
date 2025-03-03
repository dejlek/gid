module arrow.input_stream;

import arrow.c.functions;
import arrow.c.types;
import arrow.file;
import arrow.file_mixin;
import arrow.read_options;
import arrow.readable;
import arrow.readable_mixin;
import arrow.record_batch;
import arrow.schema;
import arrow.tensor;
import arrow.types;
import gid.gid;
import gio.input_stream;
import glib.error;
import gobject.object;

class InputStream : gio.input_stream.InputStream, arrow.file.File, arrow.readable.Readable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_input_stream_get_type != &gidSymbolNotFound ? garrow_input_stream_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin FileT!();
  mixin ReadableT!();
  alias close = gio.input_stream.InputStream.close;
  alias read = gio.input_stream.InputStream.read;
  alias readBytes = gio.input_stream.InputStream.readBytes;

  bool advance(long nBytes)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_input_stream_advance(cast(GArrowInputStream*)cPtr, nBytes, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  bool align_(int alignment)
  {
    bool _retval;
    GError *_err;
    _retval = garrow_input_stream_align(cast(GArrowInputStream*)cPtr, alignment, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  arrow.record_batch.RecordBatch readRecordBatch(arrow.schema.Schema schema, arrow.read_options.ReadOptions options = null)
  {
    GArrowRecordBatch* _cretval;
    GError *_err;
    _cretval = garrow_input_stream_read_record_batch(cast(GArrowInputStream*)cPtr, schema ? cast(GArrowSchema*)schema.cPtr(No.Dup) : null, options ? cast(GArrowReadOptions*)options.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.record_batch.RecordBatch)(cast(GArrowRecordBatch*)_cretval, Yes.Take);
    return _retval;
  }

  arrow.tensor.Tensor readTensor()
  {
    GArrowTensor* _cretval;
    GError *_err;
    _cretval = garrow_input_stream_read_tensor(cast(GArrowInputStream*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!(arrow.tensor.Tensor)(cast(GArrowTensor*)_cretval, Yes.Take);
    return _retval;
  }
}
