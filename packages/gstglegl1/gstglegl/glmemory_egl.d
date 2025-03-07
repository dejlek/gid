module gstglegl.glmemory_egl;

import gid.gid;
import gobject.boxed;
import gstglegl.c.functions;
import gstglegl.c.types;
import gstglegl.types;

/**
    #GstGLMemoryEGL is created or wrapped through [gstgl.glbase_memory.GLBaseMemory.alloc]
  with #GstGLVideoAllocationParams.
*/
class GLMemoryEGL : gobject.boxed.Boxed
{

  this()
  {
    super(safeMalloc(GstGLMemoryEGL.sizeof), Yes.Take);
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
    return cast(void function())gst_gl_memory_egl_get_type != &gidSymbolNotFound ? gst_gl_memory_egl_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  void* getDisplay()
  {
    auto _retval = gst_gl_memory_egl_get_display(cast(GstGLMemoryEGL*)cPtr);
    return _retval;
  }

  /** */
  void* getImage()
  {
    auto _retval = gst_gl_memory_egl_get_image(cast(GstGLMemoryEGL*)cPtr);
    return _retval;
  }

  /**
      Initializes the GL Memory allocator. It is safe to call this function
    multiple times.  This must be called before any other GstGLMemoryEGL operation.
  */
  static void initOnce()
  {
    gst_gl_memory_egl_init_once();
  }
}
