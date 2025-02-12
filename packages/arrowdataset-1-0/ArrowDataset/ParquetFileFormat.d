module ArrowDataset.ParquetFileFormat;

import ArrowDataset.FileFormat;
import ArrowDataset.Types;
import ArrowDataset.c.functions;
import ArrowDataset.c.types;
import Gid.gid;

class ParquetFileFormat : FileFormat
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gadataset_parquet_file_format_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GADatasetParquetFileFormat* _cretval;
    _cretval = gadataset_parquet_file_format_new();
    this(_cretval, Yes.Take);
  }
}
