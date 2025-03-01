module arrowflight.record_batch_reader;

import arrow.table;
import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.stream_chunk;
import arrowflight.types;
import gid.global;
import glib.error;
import gobject.object;

class RecordBatchReader : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_record_batch_reader_get_type != &gidSymbolNotFound ? gaflight_record_batch_reader_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  Table readAll()
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = gaflight_record_batch_reader_read_all(cast(GAFlightRecordBatchReader*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Table(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  StreamChunk readNext()
  {
    GAFlightStreamChunk* _cretval;
    GError *_err;
    _cretval = gaflight_record_batch_reader_read_next(cast(GAFlightRecordBatchReader*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!StreamChunk(cast(GAFlightStreamChunk*)_cretval, Yes.Take);
    return _retval;
  }
}
