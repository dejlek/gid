module Atk.HyperlinkImplT;

public import Atk.HyperlinkImplIfaceProxy;
public import Atk.Hyperlink;
public import Atk.Types;
public import Atk.c.functions;
public import Atk.c.types;
public import GObject.ObjectG;
public import Gid.gid;

/**
 * A queryable interface which allows AtkHyperlink instances
 * associated with an AtkObject to be obtained.  AtkHyperlinkImpl
 * corresponds to AT-SPI's Hyperlink interface, and differs from
 * AtkHyperlink in that AtkHyperlink is an object type, rather than an
 * interface, and thus cannot be directly queried. FTW
 */
template HyperlinkImplT()
{

  /**
   * Gets the hyperlink associated with this object.
   * Returns: an AtkHyperlink object which points to this
   *   implementing AtkObject.
   */
  override Hyperlink getHyperlink()
  {
    AtkHyperlink* _cretval;
    _cretval = atk_hyperlink_impl_get_hyperlink(cast(AtkHyperlinkImpl*)cPtr);
    auto _retval = ObjectG.getDObject!Hyperlink(cast(AtkHyperlink*)_cretval, Yes.Take);
    return _retval;
  }
}
