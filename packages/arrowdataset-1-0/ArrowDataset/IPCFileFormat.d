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
    return gadataset_ipc_file_format_get_type();
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
