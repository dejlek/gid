module gstgl.glallocation_params;

import gid.gid;
import gobject.boxed;
import gst.allocation_params;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glcontext;
import gstgl.types;

/** */
class GLAllocationParams : gobject.boxed.Boxed
{

  this()
  {
    super(gMalloc(GstGLAllocationParams.sizeof), Yes.Take);
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
    return cast(void function())gst_gl_allocation_params_get_type != &gidSymbolNotFound ? gst_gl_allocation_params_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  @property size_t structSize()
  {
    return (cast(GstGLAllocationParams*)cPtr).structSize;
  }

  @property void structSize(size_t propval)
  {
    (cast(GstGLAllocationParams*)cPtr).structSize = propval;
  }

  @property GstGLAllocationParamsFreeFunc free()
  {
    return (cast(GstGLAllocationParams*)cPtr).free;
  }

  @property void free(GstGLAllocationParamsFreeFunc propval)
  {
    (cast(GstGLAllocationParams*)cPtr).free = propval;
  }

  @property uint allocFlags()
  {
    return (cast(GstGLAllocationParams*)cPtr).allocFlags;
  }

  @property void allocFlags(uint propval)
  {
    (cast(GstGLAllocationParams*)cPtr).allocFlags = propval;
  }

  @property size_t allocSize()
  {
    return (cast(GstGLAllocationParams*)cPtr).allocSize;
  }

  @property void allocSize(size_t propval)
  {
    (cast(GstGLAllocationParams*)cPtr).allocSize = propval;
  }

  @property gst.allocation_params.AllocationParams allocParams()
  {
    return cToD!(gst.allocation_params.AllocationParams)(cast(void*)(cast(GstGLAllocationParams*)cPtr).allocParams);
  }

  @property void allocParams(gst.allocation_params.AllocationParams propval)
  {
    cValueFree!(gst.allocation_params.AllocationParams)(cast(void*)(cast(GstGLAllocationParams*)cPtr).allocParams);
    dToC(propval, cast(void*)&(cast(GstGLAllocationParams*)cPtr).allocParams);
  }

  @property gstgl.glcontext.GLContext context()
  {
    return cToD!(gstgl.glcontext.GLContext)(cast(void*)(cast(GstGLAllocationParams*)cPtr).context);
  }

  @property void context(gstgl.glcontext.GLContext propval)
  {
    cValueFree!(gstgl.glcontext.GLContext)(cast(void*)(cast(GstGLAllocationParams*)cPtr).context);
    dToC(propval, cast(void*)&(cast(GstGLAllocationParams*)cPtr).context);
  }

  @property GDestroyNotify notify()
  {
    return (cast(GstGLAllocationParams*)cPtr).notify;
  }

  @property void notify(GDestroyNotify propval)
  {
    (cast(GstGLAllocationParams*)cPtr).notify = propval;
  }

  /** */
  gstgl.glallocation_params.GLAllocationParams copy()
  {
    GstGLAllocationParams* _cretval;
    _cretval = gst_gl_allocation_params_copy(cast(GstGLAllocationParams*)cPtr);
    auto _retval = _cretval ? new gstgl.glallocation_params.GLAllocationParams(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Copies the dynamically allocated data from src to dest.  Direct subclasses
    should call this function in their own overridden copy function.
    Params:
      dest =       the destination #GstGLAllocationParams
  */
  void copyData(gstgl.glallocation_params.GLAllocationParams dest)
  {
    gst_gl_allocation_params_copy_data(cast(GstGLAllocationParams*)cPtr, dest ? cast(GstGLAllocationParams*)dest.cPtr(No.Dup) : null);
  }

  /**
      Frees the dynamically allocated data in params.  Direct subclasses
    should call this function in their own overridden free function.
  */
  void freeData()
  {
    gst_gl_allocation_params_free_data(cast(GstGLAllocationParams*)cPtr);
  }
}
