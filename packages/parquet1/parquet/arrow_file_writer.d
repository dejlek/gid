module parquet.arrow_file_writer;

import arrow.chunked_array;
import arrow.output_stream;
import arrow.record_batch;
import arrow.schema;
import arrow.table;
import gid.gid;
import glib.error;
import gobject.object;
import parquet.c.functions;
import parquet.c.types;
import parquet.types;
import parquet.writer_properties;

class ArrowFileWriter : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gparquet_arrow_file_writer_get_type != &gidSymbolNotFound ? gparquet_arrow_file_writer_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  static ArrowFileWriter newArrow(Schema schema, OutputStream sink, WriterProperties writerProperties)
  {
    GParquetArrowFileWriter* _cretval;
    GError *_err;
    _cretval = gparquet_arrow_file_writer_new_arrow(schema ? cast(GArrowSchema*)schema.cPtr(No.Dup) : null, sink ? cast(GArrowOutputStream*)sink.cPtr(No.Dup) : null, writerProperties ? cast(GParquetWriterProperties*)writerProperties.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!ArrowFileWriter(cast(GParquetArrowFileWriter*)_cretval, Yes.Take);
    return _retval;
  }

  static ArrowFileWriter newPath(Schema schema, string path, WriterProperties writerProperties)
  {
    GParquetArrowFileWriter* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    GError *_err;
    _cretval = gparquet_arrow_file_writer_new_path(schema ? cast(GArrowSchema*)schema.cPtr(No.Dup) : null, _path, writerProperties ? cast(GParquetWriterProperties*)writerProperties.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!ArrowFileWriter(cast(GParquetArrowFileWriter*)_cretval, Yes.Take);
    return _retval;
  }

  bool close()
  {
    bool _retval;
    GError *_err;
    _retval = gparquet_arrow_file_writer_close(cast(GParquetArrowFileWriter*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  Schema getSchema()
  {
    GArrowSchema* _cretval;
    _cretval = gparquet_arrow_file_writer_get_schema(cast(GParquetArrowFileWriter*)cPtr);
    auto _retval = ObjectG.getDObject!Schema(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Start a new buffered row group.
   * Returns: %TRUE on success, %FALSE if there was an error.
   */
  bool newBufferedRowGroup()
  {
    bool _retval;
    GError *_err;
    _retval = gparquet_arrow_file_writer_new_buffered_row_group(cast(GParquetArrowFileWriter*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Start a new row group.
   * Params:
   *   chunkSize = The max number of rows in a row group.
   * Returns: %TRUE on success, %FALSE if there was an error.
   */
  bool newRowGroup(size_t chunkSize)
  {
    bool _retval;
    GError *_err;
    _retval = gparquet_arrow_file_writer_new_row_group(cast(GParquetArrowFileWriter*)cPtr, chunkSize, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Start a chunked array as a column chunk.
   * Params:
   *   chunkedArray = A #GArrowChunkedArray to be written.
   * Returns: %TRUE on success, %FALSE if there was an error.
   */
  bool writeChunkedArray(ChunkedArray chunkedArray)
  {
    bool _retval;
    GError *_err;
    _retval = gparquet_arrow_file_writer_write_chunked_array(cast(GParquetArrowFileWriter*)cPtr, chunkedArray ? cast(GArrowChunkedArray*)chunkedArray.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Write a record batch into the buffered row group.
   * Multiple record batches can be written into the same row group
   * through this function.
   * [Parquet.WriterProperties.getMaxRowGroupLength] is respected
   * and a new row group will be created if the current row group
   * exceeds the limit.
   * Record batches get flushed to the output stream once
   * gparquet_file_writer_new_buffered_row_group$(LPAREN)$(RPAREN) or
   * gparquet_file_writer_close$(LPAREN)$(RPAREN) is called.
   * Params:
   *   recordBatch = A record batch to be written.
   * Returns: %TRUE on success, %FALSE if there was an error.
   */
  bool writeRecordBatch(RecordBatch recordBatch)
  {
    bool _retval;
    GError *_err;
    _retval = gparquet_arrow_file_writer_write_record_batch(cast(GParquetArrowFileWriter*)cPtr, recordBatch ? cast(GArrowRecordBatch*)recordBatch.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  bool writeTable(Table table, size_t chunkSize)
  {
    bool _retval;
    GError *_err;
    _retval = gparquet_arrow_file_writer_write_table(cast(GParquetArrowFileWriter*)cPtr, table ? cast(GArrowTable*)table.cPtr(No.Dup) : null, chunkSize, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
