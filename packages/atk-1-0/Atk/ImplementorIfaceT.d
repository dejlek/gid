module Atk.ImplementorIfaceT;

public import Atk.ImplementorIfaceIfaceProxy;
public import Atk.Types;
public import Atk.c.functions;
public import Atk.c.types;
public import Gid.gid;

/**
 * The AtkImplementor interface is implemented by objects for which
 * AtkObject peers may be obtained via calls to
 * iface->$(LPAREN)ref_accessible$(RPAREN)$(LPAREN)implementor$(RPAREN);
 */
template ImplementorIfaceT()
{
}
