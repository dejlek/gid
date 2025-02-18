module Atk.Util;

import Atk.Types;
import Atk.c.functions;
import Atk.c.types;
import GObject.ObjectG;
import Gid.gid;

/**
 * A set of ATK utility functions for event and toolkit support.
 * A set of ATK utility functions which are used to support event
 * registration of various types, and obtaining the 'root' accessible
 * of a process and information about the current ATK implementation
 * and toolkit version.
 */
class Util : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())atk_util_get_type != &gidSymbolNotFound ? atk_util_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
