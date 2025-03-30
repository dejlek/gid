/// Module for [VulkanRenderer] class
module gsk.vulkan_renderer;

import gid.gid;
import gsk.c.functions;
import gsk.c.types;
import gsk.renderer;
import gsk.types;

/**
    A GSK renderer that is using Vulkan.
    
    This renderer will fail to realize if Vulkan is not supported.
*/
class VulkanRenderer : gsk.renderer.Renderer
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
    return cast(void function())gsk_vulkan_renderer_get_type != &gidSymbolNotFound ? gsk_vulkan_renderer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override VulkanRenderer self()
  {
    return this;
  }

  /** */
  this()
  {
    GskRenderer* _cretval;
    _cretval = gsk_vulkan_renderer_new();
    this(_cretval, Yes.Take);
  }
}
