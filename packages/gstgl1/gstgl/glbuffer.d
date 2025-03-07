module gstgl.glbuffer;

import gid.gid;
import gobject.boxed;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glbase_memory;
import gstgl.types;

/**
    GstGLBuffer is a #GstMemory subclass providing support for the mapping of
  GL buffers.
  
  Data is uploaded or downloaded from the GPU as is necessary.
*/
class GLBuffer : gobject.boxed.Boxed
{

  this()
  {
    super(safeMalloc(GstGLBuffer.sizeof), Yes.Take);
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_buffer_get_type != &gidSymbolNotFound ? gst_gl_buffer_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  @property gstgl.glbase_memory.GLBaseMemory mem()
  {
    return new gstgl.glbase_memory.GLBaseMemory(cast(GstGLBaseMemory*)&(cast(GstGLBuffer*)cPtr).mem);
  }

  @property uint id()
  {
    return (cast(GstGLBuffer*)cPtr).id;
  }

  @property void id(uint propval)
  {
    (cast(GstGLBuffer*)cPtr).id = propval;
  }

  @property uint target()
  {
    return (cast(GstGLBuffer*)cPtr).target;
  }

  @property void target(uint propval)
  {
    (cast(GstGLBuffer*)cPtr).target = propval;
  }

  @property uint usageHints()
  {
    return (cast(GstGLBuffer*)cPtr).usageHints;
  }

  @property void usageHints(uint propval)
  {
    (cast(GstGLBuffer*)cPtr).usageHints = propval;
  }

  /**
      Initializes the GL Buffer allocator. It is safe to call this function
    multiple times.  This must be called before any other #GstGLBuffer operation.
  */
  static void initOnce()
  {
    gst_gl_buffer_init_once();
  }
}
