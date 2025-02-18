module Atk.HyperlinkImpl;

public import Atk.HyperlinkImplIfaceProxy;
import Atk.Hyperlink;
import Atk.Types;
import Atk.c.functions;
import Atk.c.types;
import GObject.ObjectG;
import Gid.gid;

/**
 * A queryable interface which allows AtkHyperlink instances
 * associated with an AtkObject to be obtained.  AtkHyperlinkImpl
 * corresponds to AT-SPI's Hyperlink interface, and differs from
 * AtkHyperlink in that AtkHyperlink is an object type, rather than an
 * interface, and thus cannot be directly queried. FTW
 */
interface HyperlinkImpl
{

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())atk_hyperlink_impl_get_type != &gidSymbolNotFound ? atk_hyperlink_impl_get_type() : cast(GType)0;
  }

  /**
   * Gets the hyperlink associated with this object.
   * Returns: an AtkHyperlink object which points to this
   *   implementing AtkObject.
   */
  Hyperlink getHyperlink();
}
