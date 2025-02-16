module ArrowDataset.IPCFileFormat;

import ArrowDataset.FileFormat;
import ArrowDataset.Types;
import ArrowDataset.c.functions;
import ArrowDataset.c.types;
import Gid.gid;

class IPCFileFormat : FileFormat
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gadataset_ipc_file_format_get_type != &gidSymbolNotFound ? gadataset_ipc_file_format_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GADatasetIPCFileFormat* _cretval;
    _cretval = gadataset_ipc_file_format_new();
    this(_cretval, Yes.Take);
  }
}
