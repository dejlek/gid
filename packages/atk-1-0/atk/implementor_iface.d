module atk.implementor_iface;

public import atk.implementor_iface_iface_proxy;
import atk.c.functions;
import atk.c.types;
import atk.types;
import gid.gid;

/**
 * The AtkImplementor interface is implemented by objects for which
 * AtkObject peers may be obtained via calls to
 * iface->$(LPAREN)ref_accessible$(RPAREN)$(LPAREN)implementor$(RPAREN);
 */
interface ImplementorIface
{

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())atk_implementor_get_type != &gidSymbolNotFound ? atk_implementor_get_type() : cast(GType)0;
  }
}
