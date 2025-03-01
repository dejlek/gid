module arrow.source_node_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.execute_node_options;
import arrow.record_batch;
import arrow.record_batch_reader;
import arrow.table;
import arrow.types;
import gid.global;
import gobject.object;

class SourceNodeOptions : ExecuteNodeOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_source_node_options_get_type != &gidSymbolNotFound ? garrow_source_node_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  static SourceNodeOptions newRecordBatch(RecordBatch recordBatch)
  {
    GArrowSourceNodeOptions* _cretval;
    _cretval = garrow_source_node_options_new_record_batch(recordBatch ? cast(GArrowRecordBatch*)recordBatch.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!SourceNodeOptions(cast(GArrowSourceNodeOptions*)_cretval, Yes.Take);
    return _retval;
  }

  static SourceNodeOptions newRecordBatchReader(RecordBatchReader reader)
  {
    GArrowSourceNodeOptions* _cretval;
    _cretval = garrow_source_node_options_new_record_batch_reader(reader ? cast(GArrowRecordBatchReader*)reader.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!SourceNodeOptions(cast(GArrowSourceNodeOptions*)_cretval, Yes.Take);
    return _retval;
  }

  static SourceNodeOptions newTable(Table table)
  {
    GArrowSourceNodeOptions* _cretval;
    _cretval = garrow_source_node_options_new_table(table ? cast(GArrowTable*)table.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!SourceNodeOptions(cast(GArrowSourceNodeOptions*)_cretval, Yes.Take);
    return _retval;
  }
}
