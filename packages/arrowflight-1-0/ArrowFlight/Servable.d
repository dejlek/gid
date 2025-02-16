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
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_servable_get_type != &gidSymbolNotFound ? gaflight_servable_get_type() : cast(GType)0;
  }
}
