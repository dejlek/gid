/// Module for [DmabufTexture] class
module gdk.dmabuf_texture;

import gdk.c.functions;
import gdk.c.types;
import gdk.paintable;
import gdk.paintable_mixin;
import gdk.texture;
import gdk.types;
import gid.gid;
import gio.icon;
import gio.icon_mixin;
import gio.loadable_icon;
import gio.loadable_icon_mixin;

/**
    A [gdk.texture.Texture] representing a DMA buffer.
    
    To create a [gdk.dmabuf_texture.DmabufTexture], use the auxiliary
    [gdk.dmabuf_texture_builder.DmabufTextureBuilder] object.
    
    Dma-buf textures can only be created on Linux.
*/
class DmabufTexture : gdk.texture.Texture
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gdk_dmabuf_texture_get_type != &gidSymbolNotFound ? gdk_dmabuf_texture_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DmabufTexture self()
  {
    return this;
  }
}
