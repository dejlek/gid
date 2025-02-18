module Atk.ImplementorIface;

public import Atk.ImplementorIfaceIfaceProxy;
import Atk.Types;
import Atk.c.functions;
import Atk.c.types;
import Gid.gid;

/**
 * The AtkImplementor interface is implemented by objects for which
 * AtkObject peers may be obtained via calls to
 * iface->$(LPAREN)ref_accessible$(RPAREN)$(LPAREN)implementor$(RPAREN);
 */
interface ImplementorIface
{

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())atk_implementor_get_type != &gidSymbolNotFound ? atk_implementor_get_type() : cast(GType)0;
  }
}
