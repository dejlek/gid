module Gdk.DmabufTexture;

import Gdk.Paintable;
import Gdk.PaintableT;
import Gdk.Texture;
import Gdk.Types;
import Gdk.c.functions;
import Gdk.c.types;
import Gid.gid;
import Gio.Icon;
import Gio.IconT;
import Gio.LoadableIcon;
import Gio.LoadableIconT;

/**
 * A `GdkTexture` representing a DMA buffer.
 * To create a `GdkDmabufTexture`, use the auxiliary
 * [Gdk.DmabufTextureBuilder] object.
 * Dma-buf textures can only be created on Linux.
 */
class DmabufTexture : Texture
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_dmabuf_texture_get_type != &gidSymbolNotFound ? gdk_dmabuf_texture_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
