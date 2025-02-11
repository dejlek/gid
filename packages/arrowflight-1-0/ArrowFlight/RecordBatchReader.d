module ArrowFlight.RecordBatchReader;

import Arrow.Table;
import ArrowFlight.StreamChunk;
import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class RecordBatchReader : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gaflight_record_batch_reader_get_type();
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
