module gstgl.glbuffer_allocation_params;

import gid.gid;
import gobject.boxed;
import gst.allocation_params;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glallocation_params;
import gstgl.glcontext;
import gstgl.types;

/** */
class GLBufferAllocationParams : gobject.boxed.Boxed
{

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
    return cast(void function())gst_gl_buffer_allocation_params_get_type != &gidSymbolNotFound ? gst_gl_buffer_allocation_params_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  @property gstgl.glallocation_params.GLAllocationParams parent()
  {
    return cToD!(gstgl.glallocation_params.GLAllocationParams)(cast(void*)&(cast(GstGLBufferAllocationParams*)cPtr).parent);
  }

  @property uint glTarget()
  {
    return (cast(GstGLBufferAllocationParams*)cPtr).glTarget;
  }

  @property void glTarget(uint propval)
  {
    (cast(GstGLBufferAllocationParams*)cPtr).glTarget = propval;
  }

  @property uint glUsage()
  {
    return (cast(GstGLBufferAllocationParams*)cPtr).glUsage;
  }

  @property void glUsage(uint propval)
  {
    (cast(GstGLBufferAllocationParams*)cPtr).glUsage = propval;
  }

  /** */
  this(gstgl.glcontext.GLContext context, size_t allocSize, gst.allocation_params.AllocationParams allocParams, uint glTarget, uint glUsage)
  {
    GstGLBufferAllocationParams* _cretval;
    _cretval = gst_gl_buffer_allocation_params_new(context ? cast(GstGLContext*)context.cPtr(No.Dup) : null, allocSize, allocParams ? cast(const(GstAllocationParams)*)allocParams.cPtr(No.Dup) : null, glTarget, glUsage);
    this(_cretval, Yes.Take);
  }
}
