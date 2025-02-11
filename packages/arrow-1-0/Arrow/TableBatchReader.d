module Arrow.TableBatchReader;

import Arrow.RecordBatchReader;
import Arrow.Table;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class TableBatchReader : RecordBatchReader
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return garrow_table_batch_reader_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Table table)
  {
    GArrowTableBatchReader* _cretval;
    _cretval = garrow_table_batch_reader_new(table ? cast(GArrowTable*)table.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Set the desired maximum chunk size of record batches.
   * The actual chunk size of each record batch may be smaller,
   * depending on actual chunking characteristics of each table column.
   * Params:
   *   maxChunkSize = The maximum chunk size of record batches.
   */
  void setMaxChunkSize(long maxChunkSize)
  {
    garrow_table_batch_reader_set_max_chunk_size(cast(GArrowTableBatchReader*)cPtr, maxChunkSize);
  }
}
