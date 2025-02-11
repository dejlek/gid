module ArrowFlight.DoPutResult;

import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import GObject.ObjectG;
import Gid.gid;

class DoPutResult : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gaflight_do_put_result_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }
}
