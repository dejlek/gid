module Arrow.SourceNodeOptions;

import Arrow.ExecuteNodeOptions;
import Arrow.RecordBatch;
import Arrow.RecordBatchReader;
import Arrow.Table;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class SourceNodeOptions : ExecuteNodeOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_source_node_options_get_type();
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
