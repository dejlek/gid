/// Module for [RecordBatchStream] class
module arrowflight.record_batch_stream;

import arrow.record_batch_reader;
import arrow.write_options;
import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.data_stream;
import arrowflight.types;
import gid.gid;

/** */
class RecordBatchStream : arrowflight.data_stream.DataStream
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_record_batch_stream_get_type != &gidSymbolNotFound ? gaflight_record_batch_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RecordBatchStream self()
  {
    return this;
  }

  /** */
  this(arrow.record_batch_reader.RecordBatchReader reader, arrow.write_options.WriteOptions options = null)
  {
    GAFlightRecordBatchStream* _cretval;
    _cretval = gaflight_record_batch_stream_new(reader ? cast(GArrowRecordBatchReader*)reader._cPtr(No.Dup) : null, options ? cast(GArrowWriteOptions*)options._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
