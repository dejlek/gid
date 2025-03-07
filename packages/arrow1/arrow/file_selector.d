module arrow.file_selector;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class FileSelector : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_file_selector_get_type != &gidSymbolNotFound ? garrow_file_selector_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }
}
