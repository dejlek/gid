module arrow.sink_node_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.execute_node_options;
import arrow.record_batch_reader;
import arrow.schema;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class SinkNodeOptions : arrow.execute_node_options.ExecuteNodeOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_sink_node_options_get_type != &gidSymbolNotFound ? garrow_sink_node_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override SinkNodeOptions self()
  {
    return this;
  }

  /** */
  this()
  {
    GArrowSinkNodeOptions* _cretval;
    _cretval = garrow_sink_node_options_new();
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.record_batch_reader.RecordBatchReader getReader(arrow.schema.Schema schema)
  {
    GArrowRecordBatchReader* _cretval;
    _cretval = garrow_sink_node_options_get_reader(cast(GArrowSinkNodeOptions*)cPtr, schema ? cast(GArrowSchema*)schema.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(arrow.record_batch_reader.RecordBatchReader)(cast(GArrowRecordBatchReader*)_cretval, Yes.Take);
    return _retval;
  }
}
