module Gio.BytesIcon;

import GLib.Bytes;
import GObject.ObjectG;
import Gid.gid;
import Gio.Icon;
import Gio.IconT;
import Gio.LoadableIcon;
import Gio.LoadableIconT;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

/**
 * `GBytesIcon` specifies an image held in memory in a common format $(LPAREN)usually
 * PNG$(RPAREN) to be used as icon.
 */
class BytesIcon : ObjectG, Icon, LoadableIcon
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())g_bytes_icon_get_type != &gidSymbolNotFound ? g_bytes_icon_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin IconT!();
  mixin LoadableIconT!();

  /**
   * Creates a new icon for a bytes.
   * This cannot fail, but loading and interpreting the bytes may fail later on
   * $(LPAREN)for example, if [Gio.LoadableIcon.load] is called$(RPAREN) if the image is invalid.
   * Params:
   *   bytes = a #GBytes.
   * Returns: a #GIcon for the given
   *   bytes.
   */
  this(Bytes bytes)
  {
    GIcon* _cretval;
    _cretval = g_bytes_icon_new(bytes ? cast(GBytes*)bytes.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Gets the #GBytes associated with the given icon.
   * Returns: a #GBytes.
   */
  Bytes getBytes()
  {
    GBytes* _cretval;
    _cretval = g_bytes_icon_get_bytes(cast(GBytesIcon*)cPtr);
    auto _retval = _cretval ? new Bytes(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
