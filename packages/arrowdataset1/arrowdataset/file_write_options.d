module arrowdataset.file_write_options;

import arrowdataset.c.functions;
import arrowdataset.c.types;
import arrowdataset.types;
import gid.gid;
import gobject.object;

class FileWriteOptions : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gadataset_file_write_options_get_type != &gidSymbolNotFound ? gadataset_file_write_options_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
