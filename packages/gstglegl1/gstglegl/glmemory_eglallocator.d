/// Module for [GLMemoryEGLAllocator] class
module gstglegl.glmemory_eglallocator;

import gid.gid;
import gstgl.glmemory_allocator;
import gstglegl.c.functions;
import gstglegl.c.types;
import gstglegl.types;

/**
    Opaque #GstGLMemoryEGLAllocator struct
*/
class GLMemoryEGLAllocator : gstgl.glmemory_allocator.GLMemoryAllocator
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
    return cast(void function())gst_gl_memory_egl_allocator_get_type != &gidSymbolNotFound ? gst_gl_memory_egl_allocator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override GLMemoryEGLAllocator self()
  {
    return this;
  }
}
