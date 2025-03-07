module arrowdataset.in_memory_fragment;

import arrow.record_batch;
import arrow.schema;
import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.fragment;
import arrowdataset.types;
import gid.gid;

/** */
class InMemoryFragment : arrowdataset.fragment.Fragment
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gadataset_in_memory_fragment_get_type != &gidSymbolNotFound ? gadataset_in_memory_fragment_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  this(arrow.schema.Schema schema, arrow.record_batch.RecordBatch[] recordBatches)
  {
    GADatasetInMemoryFragment* _cretval;
    size_t _nRecordBatches;
    if (recordBatches)
      _nRecordBatches = cast(size_t)recordBatches.length;

    GArrowRecordBatch*[] _tmprecordBatches;
    foreach (obj; recordBatches)
      _tmprecordBatches ~= obj ? cast(GArrowRecordBatch*)obj.cPtr : null;
    GArrowRecordBatch** _recordBatches = cast(GArrowRecordBatch**)_tmprecordBatches.ptr;
    _cretval = gadataset_in_memory_fragment_new(schema ? cast(GArrowSchema*)schema.cPtr(No.Dup) : null, _recordBatches, _nRecordBatches);
    this(_cretval, Yes.Take);
  }
}
