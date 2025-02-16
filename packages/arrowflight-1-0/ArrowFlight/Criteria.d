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
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_criteria_get_type != &gidSymbolNotFound ? gaflight_criteria_get_type() : cast(GType)0;
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
