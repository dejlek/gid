/// Module for [SourceNodeOptions] class
module arrow.source_node_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.execute_node_options;
import arrow.record_batch;
import arrow.record_batch_reader;
import arrow.table;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class SourceNodeOptions : arrow.execute_node_options.ExecuteNodeOptions
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
    return cast(void function())garrow_source_node_options_get_type != &gidSymbolNotFound ? garrow_source_node_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SourceNodeOptions self()
  {
    return this;
  }

  /** */
  static arrow.source_node_options.SourceNodeOptions newRecordBatch(arrow.record_batch.RecordBatch recordBatch)
  {
    GArrowSourceNodeOptions* _cretval;
    _cretval = garrow_source_node_options_new_record_batch(recordBatch ? cast(GArrowRecordBatch*)recordBatch._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.source_node_options.SourceNodeOptions)(cast(GArrowSourceNodeOptions*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  static arrow.source_node_options.SourceNodeOptions newRecordBatchReader(arrow.record_batch_reader.RecordBatchReader reader)
  {
    GArrowSourceNodeOptions* _cretval;
    _cretval = garrow_source_node_options_new_record_batch_reader(reader ? cast(GArrowRecordBatchReader*)reader._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.source_node_options.SourceNodeOptions)(cast(GArrowSourceNodeOptions*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  static arrow.source_node_options.SourceNodeOptions newTable(arrow.table.Table table)
  {
    GArrowSourceNodeOptions* _cretval;
    _cretval = garrow_source_node_options_new_table(table ? cast(GArrowTable*)table._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.source_node_options.SourceNodeOptions)(cast(GArrowSourceNodeOptions*)_cretval, Yes.Take);
    return _retval;
  }
}
