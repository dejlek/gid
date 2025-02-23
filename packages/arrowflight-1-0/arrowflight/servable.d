module arrowflight.servable;

public import arrowflight.servable_iface_proxy;
import arrowflight.c.functions;
import arrowflight.c.types;
import arrowflight.types;
import gid.gid;

interface Servable
{

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_servable_get_type != &gidSymbolNotFound ? gaflight_servable_get_type() : cast(GType)0;
  }
}
