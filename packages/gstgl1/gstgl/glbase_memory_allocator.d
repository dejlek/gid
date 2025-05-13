/// Module for [GLBaseMemoryAllocator] class
module gstgl.glbase_memory_allocator;

import gid.gid;
import gst.allocator;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.types;

/**
    Opaque #GstGLBaseMemoryAllocator struct
*/
class GLBaseMemoryAllocator : gst.allocator.Allocator
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_base_memory_allocator_get_type != &gidSymbolNotFound ? gst_gl_base_memory_allocator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLBaseMemoryAllocator self()
  {
    return this;
  }
}
