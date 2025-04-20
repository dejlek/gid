/// Module for [GLFramebuffer] class
module gstgl.glframebuffer;

import gid.gid;
import gobject.object;
import gst.object;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glbase_memory;
import gstgl.glcontext;
import gstgl.types;

/**
    A #GstGLFramebuffer represents and holds an OpenGL framebuffer object with
    it's associated attachments.
    
    A #GstGLFramebuffer can be created with [gstgl.glframebuffer.GLFramebuffer.new_] or
    [gstgl.glframebuffer.GLFramebuffer.newWithDefaultDepth] and bound with
    [gstgl.glframebuffer.GLFramebuffer.bind].  Other resources can be bound with
    [gstgl.glframebuffer.GLFramebuffer.attach]
    
    Note: OpenGL framebuffers are not shareable resources so cannot be used
    between multiple OpenGL contexts.
*/
class GLFramebuffer : gst.object.ObjectWrap
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
    return cast(void function())gst_gl_framebuffer_get_type != &gidSymbolNotFound ? gst_gl_framebuffer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLFramebuffer self()
  {
    return this;
  }

  /**
      This function will internally create an OpenGL framebuffer object and must
      be called on context's OpenGL thread.
  
      Params:
        context = a #GstGLContext
      Returns: a new #GstGLFramebuffer
  */
  this(gstgl.glcontext.GLContext context)
  {
    GstGLFramebuffer* _cretval;
    _cretval = gst_gl_framebuffer_new(context ? cast(GstGLContext*)context.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      This function will internally create an OpenGL framebuffer object and must
      be called on context's OpenGL thread.
  
      Params:
        context = a #GstGLContext
        width = width for the depth buffer
        height = for the depth buffer
      Returns: a new #GstGLFramebuffer with a depth buffer of width and height
  */
  static gstgl.glframebuffer.GLFramebuffer newWithDefaultDepth(gstgl.glcontext.GLContext context, uint width, uint height)
  {
    GstGLFramebuffer* _cretval;
    _cretval = gst_gl_framebuffer_new_with_default_depth(context ? cast(GstGLContext*)context.cPtr(No.Dup) : null, width, height);
    auto _retval = gobject.object.ObjectWrap.getDObject!(gstgl.glframebuffer.GLFramebuffer)(cast(GstGLFramebuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
      attach mem to attachment_point
      
      Must be called with the same OpenGL context current that fb was created
      with.
  
      Params:
        attachmentPoint = the OpenGL attachment point to bind mem to
        mem = the memory object to bind to attachment_point
  */
  void attach(uint attachmentPoint, gstgl.glbase_memory.GLBaseMemory mem)
  {
    gst_gl_framebuffer_attach(cast(GstGLFramebuffer*)cPtr, attachmentPoint, mem ? cast(GstGLBaseMemory*)mem.cPtr(No.Dup) : null);
  }

  /**
      Bind fb into the current thread
      
      Must be called with the same OpenGL context current that fb was created
      with.
  */
  void bind()
  {
    gst_gl_framebuffer_bind(cast(GstGLFramebuffer*)cPtr);
  }

  /**
      Retrieve the effective dimensions from the current attachments attached to
      fb.
  
      Params:
        width = output width
        height = output height
  */
  void getEffectiveDimensions(out uint width, out uint height)
  {
    gst_gl_framebuffer_get_effective_dimensions(cast(GstGLFramebuffer*)cPtr, cast(uint*)&width, cast(uint*)&height);
  }

  /** */
  uint getId()
  {
    uint _retval;
    _retval = gst_gl_framebuffer_get_id(cast(GstGLFramebuffer*)cPtr);
    return _retval;
  }
}
