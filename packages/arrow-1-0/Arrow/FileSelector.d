module Arrow.FileSelector;

import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GObject.ObjectG;
import Gid.gid;

class FileSelector : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_file_selector_get_type != &gidSymbolNotFound ? garrow_file_selector_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
