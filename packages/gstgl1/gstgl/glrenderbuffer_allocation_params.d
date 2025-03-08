module gstgl.glrenderbuffer_allocation_params;

import gid.gid;
import glib.types;
import gobject.boxed;
import gst.allocation_params;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glcontext;
import gstgl.types;

/**
    Allocation parameters
*/
class GLRenderbufferAllocationParams : gobject.boxed.Boxed
{

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
    return cast(void function())gst_gl_renderbuffer_allocation_params_get_type != &gidSymbolNotFound ? gst_gl_renderbuffer_allocation_params_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  @property gstgl.types.GLFormat renderbufferFormat()
  {
    return cast(gstgl.types.GLFormat)(cast(GstGLRenderbufferAllocationParams*)cPtr).renderbufferFormat;
  }

  @property void renderbufferFormat(gstgl.types.GLFormat propval)
  {
    (cast(GstGLRenderbufferAllocationParams*)cPtr).renderbufferFormat = cast(GstGLFormat)propval;
  }

  @property uint width()
  {
    return (cast(GstGLRenderbufferAllocationParams*)cPtr).width;
  }

  @property void width(uint propval)
  {
    (cast(GstGLRenderbufferAllocationParams*)cPtr).width = propval;
  }

  @property uint height()
  {
    return (cast(GstGLRenderbufferAllocationParams*)cPtr).height;
  }

  @property void height(uint propval)
  {
    (cast(GstGLRenderbufferAllocationParams*)cPtr).height = propval;
  }

  /** */
  this(gstgl.glcontext.GLContext context, gst.allocation_params.AllocationParams allocParams, gstgl.types.GLFormat renderbufferFormat, uint width, uint height)
  {
    GstGLRenderbufferAllocationParams* _cretval;
    _cretval = gst_gl_renderbuffer_allocation_params_new(context ? cast(GstGLContext*)context.cPtr(No.dup) : null, allocParams ? cast(const(GstAllocationParams)*)allocParams.cPtr(No.dup) : null, renderbufferFormat, width, height);
    this(_cretval, Yes.take);
  }

  /** */
  static gstgl.glrenderbuffer_allocation_params.GLRenderbufferAllocationParams newWrapped(gstgl.glcontext.GLContext context, gst.allocation_params.AllocationParams allocParams, gstgl.types.GLFormat renderbufferFormat, uint width, uint height, void* glHandle = null, void* userData = null, glib.types.DestroyNotify notify = null)
  {
    extern(C) void _notifyCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      (*_dlg)();
    }
    auto _notifyCB = notify ? &_notifyCallback : null;

    GstGLRenderbufferAllocationParams* _cretval;
    _cretval = gst_gl_renderbuffer_allocation_params_new_wrapped(context ? cast(GstGLContext*)context.cPtr(No.dup) : null, allocParams ? cast(const(GstAllocationParams)*)allocParams.cPtr(No.dup) : null, renderbufferFormat, width, height, glHandle, userData, _notifyCB);
    auto _retval = _cretval ? new gstgl.glrenderbuffer_allocation_params.GLRenderbufferAllocationParams(cast(void*)_cretval, Yes.take) : null;
    return _retval;
  }
}
