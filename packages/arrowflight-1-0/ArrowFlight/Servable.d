module ArrowFlight.Servable;

public import ArrowFlight.ServableIfaceProxy;
import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import Gid.gid;

interface Servable
{

  static GType getType()
  {
    return gaflight_servable_get_type();
  }
}
