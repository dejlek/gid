module gstgl.glmemory_allocator;

import gid.gid;
import gobject.object;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glbase_memory_allocator;
import gstgl.glcontext;
import gstgl.types;

/**
    Opaque #GstGLMemoryAllocator struct
*/
class GLMemoryAllocator : gstgl.glbase_memory_allocator.GLBaseMemoryAllocator
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_memory_allocator_get_type != &gidSymbolNotFound ? gst_gl_memory_allocator_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  static gstgl.glmemory_allocator.GLMemoryAllocator getDefault(gstgl.glcontext.GLContext context)
  {
    GstGLMemoryAllocator* _cretval;
    _cretval = gst_gl_memory_allocator_get_default(context ? cast(GstGLContext*)context.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(gstgl.glmemory_allocator.GLMemoryAllocator)(cast(GstGLMemoryAllocator*)_cretval, Yes.Take);
    return _retval;
  }
}
