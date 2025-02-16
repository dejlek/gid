module ArrowDataset.InMemoryFragment;

import Arrow.RecordBatch;
import Arrow.Schema;
import ArrowDataset.Fragment;
import ArrowDataset.Types;
import ArrowDataset.c.functions;
import ArrowDataset.c.types;
import Gid.gid;

class InMemoryFragment : Fragment
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gadataset_in_memory_fragment_get_type != &gidSymbolNotFound ? gadataset_in_memory_fragment_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Schema schema, RecordBatch[] recordBatches)
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
