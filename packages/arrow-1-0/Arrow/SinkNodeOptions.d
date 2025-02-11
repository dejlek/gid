module Arrow.SinkNodeOptions;

import Arrow.ExecuteNodeOptions;
import Arrow.RecordBatchReader;
import Arrow.Schema;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class SinkNodeOptions : ExecuteNodeOptions
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_sink_node_options_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowSinkNodeOptions* _cretval;
    _cretval = garrow_sink_node_options_new();
    this(_cretval, Yes.Take);
  }

  RecordBatchReader getReader(Schema schema)
  {
    GArrowRecordBatchReader* _cretval;
    _cretval = garrow_sink_node_options_get_reader(cast(GArrowSinkNodeOptions*)cPtr, schema ? cast(GArrowSchema*)schema.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!RecordBatchReader(cast(GArrowRecordBatchReader*)_cretval, Yes.Take);
    return _retval;
  }
}
