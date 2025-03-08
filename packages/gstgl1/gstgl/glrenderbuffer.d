module gstgl.glrenderbuffer;

import gid.gid;
import gobject.boxed;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.types;

/**
    GstGLRenderbuffer is a #GstGLBaseMemory subclass providing support for
  OpenGL renderbuffers.
  
  #GstGLRenderbuffer is created or wrapped through [gstgl.glbase_memory.GLBaseMemory.alloc]
  with #GstGLRenderbufferAllocationParams.
*/
class GLRenderbuffer : gobject.boxed.Boxed
{

  this()
  {
    super(safeMalloc(GstGLRenderbuffer.sizeof), Yes.take);
  }

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"dup" dup = No.dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_renderbuffer_get_type != &gidSymbolNotFound ? gst_gl_renderbuffer_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  @property uint renderbufferId()
  {
    return (cast(GstGLRenderbuffer*)cPtr).renderbufferId;
  }

  @property void renderbufferId(uint propval)
  {
    (cast(GstGLRenderbuffer*)cPtr).renderbufferId = propval;
  }

  @property gstgl.types.GLFormat renderbufferFormat()
  {
    return cast(gstgl.types.GLFormat)(cast(GstGLRenderbuffer*)cPtr).renderbufferFormat;
  }

  @property void renderbufferFormat(gstgl.types.GLFormat propval)
  {
    (cast(GstGLRenderbuffer*)cPtr).renderbufferFormat = cast(GstGLFormat)propval;
  }

  @property uint width()
  {
    return (cast(GstGLRenderbuffer*)cPtr).width;
  }

  @property void width(uint propval)
  {
    (cast(GstGLRenderbuffer*)cPtr).width = propval;
  }

  @property uint height()
  {
    return (cast(GstGLRenderbuffer*)cPtr).height;
  }

  @property void height(uint propval)
  {
    (cast(GstGLRenderbuffer*)cPtr).height = propval;
  }

  @property bool renderbufferWrapped()
  {
    return (cast(GstGLRenderbuffer*)cPtr).renderbufferWrapped;
  }

  @property void renderbufferWrapped(bool propval)
  {
    (cast(GstGLRenderbuffer*)cPtr).renderbufferWrapped = propval;
  }

  /** */
  gstgl.types.GLFormat getFormat()
  {
    GstGLFormat _cretval;
    _cretval = gst_gl_renderbuffer_get_format(cast(GstGLRenderbuffer*)cPtr);
    gstgl.types.GLFormat _retval = cast(gstgl.types.GLFormat)_cretval;
    return _retval;
  }

  /** */
  int getHeight()
  {
    int _retval;
    _retval = gst_gl_renderbuffer_get_height(cast(GstGLRenderbuffer*)cPtr);
    return _retval;
  }

  /** */
  uint getId()
  {
    uint _retval;
    _retval = gst_gl_renderbuffer_get_id(cast(GstGLRenderbuffer*)cPtr);
    return _retval;
  }

  /** */
  int getWidth()
  {
    int _retval;
    _retval = gst_gl_renderbuffer_get_width(cast(GstGLRenderbuffer*)cPtr);
    return _retval;
  }

  /**
      Initializes the GL Base Texture allocator. It is safe to call this function
    multiple times.  This must be called before any other GstGLRenderbuffer operation.
  */
  static void initOnce()
  {
    gst_gl_renderbuffer_init_once();
  }
}
