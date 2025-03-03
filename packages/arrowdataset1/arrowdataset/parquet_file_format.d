module arrowdataset.parquet_file_format;

import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.file_format;
import arrowdataset.types;
import gid.gid;

class ParquetFileFormat : arrowdataset.file_format.FileFormat
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gadataset_parquet_file_format_get_type != &gidSymbolNotFound ? gadataset_parquet_file_format_get_type() : cast(GType)0;
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
