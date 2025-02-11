module Parquet.ArrowFileReader;

import Arrow.ChunkedArray;
import Arrow.Schema;
import Arrow.SeekableInputStream;
import Arrow.Table;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;
import Parquet.FileMetadata;
import Parquet.Types;
import Parquet.c.functions;
import Parquet.c.types;

class ArrowFileReader : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gparquet_arrow_file_reader_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  static ArrowFileReader newArrow(SeekableInputStream source)
  {
    GParquetArrowFileReader* _cretval;
    GError *_err;
    _cretval = gparquet_arrow_file_reader_new_arrow(source ? cast(GArrowSeekableInputStream*)source.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!ArrowFileReader(cast(GParquetArrowFileReader*)_cretval, Yes.Take);
    return _retval;
  }

  static ArrowFileReader newPath(string path)
  {
    GParquetArrowFileReader* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    GError *_err;
    _cretval = gparquet_arrow_file_reader_new_path(_path, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!ArrowFileReader(cast(GParquetArrowFileReader*)_cretval, Yes.Take);
    return _retval;
  }

  FileMetadata getMetadata()
  {
    GParquetFileMetadata* _cretval;
    _cretval = gparquet_arrow_file_reader_get_metadata(cast(GParquetArrowFileReader*)cPtr);
    auto _retval = ObjectG.getDObject!FileMetadata(cast(GParquetFileMetadata*)_cretval, Yes.Take);
    return _retval;
  }

  int getNRowGroups()
  {
    int _retval;
    _retval = gparquet_arrow_file_reader_get_n_row_groups(cast(GParquetArrowFileReader*)cPtr);
    return _retval;
  }

  long getNRows()
  {
    long _retval;
    _retval = gparquet_arrow_file_reader_get_n_rows(cast(GParquetArrowFileReader*)cPtr);
    return _retval;
  }

  Schema getSchema()
  {
    GArrowSchema* _cretval;
    GError *_err;
    _cretval = gparquet_arrow_file_reader_get_schema(cast(GParquetArrowFileReader*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Schema(cast(GArrowSchema*)_cretval, Yes.Take);
    return _retval;
  }

  ChunkedArray readColumnData(int i)
  {
    GArrowChunkedArray* _cretval;
    GError *_err;
    _cretval = gparquet_arrow_file_reader_read_column_data(cast(GParquetArrowFileReader*)cPtr, i, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!ChunkedArray(cast(GArrowChunkedArray*)_cretval, Yes.Take);
    return _retval;
  }

  Table readRowGroup(int rowGroupIndex, int[] columnIndices)
  {
    GArrowTable* _cretval;
    size_t _nColumnIndices;
    if (columnIndices)
      _nColumnIndices = cast(size_t)columnIndices.length;

    auto _columnIndices = cast(int*)columnIndices.ptr;
    GError *_err;
    _cretval = gparquet_arrow_file_reader_read_row_group(cast(GParquetArrowFileReader*)cPtr, rowGroupIndex, _columnIndices, _nColumnIndices, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Table(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  Table readTable()
  {
    GArrowTable* _cretval;
    GError *_err;
    _cretval = gparquet_arrow_file_reader_read_table(cast(GParquetArrowFileReader*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Table(cast(GArrowTable*)_cretval, Yes.Take);
    return _retval;
  }

  void setUseThreads(bool useThreads)
  {
    gparquet_arrow_file_reader_set_use_threads(cast(GParquetArrowFileReader*)cPtr, useThreads);
  }
}
