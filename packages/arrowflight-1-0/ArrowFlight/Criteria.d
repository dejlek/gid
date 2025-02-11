module ArrowFlight.Criteria;

import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import GLib.Bytes;
import GObject.ObjectG;
import Gid.gid;

class Criteria : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gaflight_criteria_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Bytes expression)
  {
    GAFlightCriteria* _cretval;
    _cretval = gaflight_criteria_new(expression ? cast(GBytes*)expression.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
