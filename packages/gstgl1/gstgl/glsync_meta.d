module gstgl.glsync_meta;

import gid.gid;
import gst.meta;
import gst.meta_info;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glcontext;
import gstgl.types;

/**
    #GstGLSyncMeta provides the ability to synchronize the OpenGL command stream
  with the CPU or with other OpenGL contexts.
*/
class GLSyncMeta
{
  GstGLSyncMeta cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstGL.GLSyncMeta");

    cInstance = *cast(GstGLSyncMeta*)ptr;

    if (take)
      gFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property gst.meta.Meta parent()
  {
    return new gst.meta.Meta(cast(GstMeta*)&(cast(GstGLSyncMeta*)cPtr).parent);
  }

  @property gstgl.glcontext.GLContext context()
  {
    return cToD!(gstgl.glcontext.GLContext)(cast(void*)(cast(GstGLSyncMeta*)cPtr).context);
  }

  @property void context(gstgl.glcontext.GLContext propval)
  {
    cValueFree!(gstgl.glcontext.GLContext)(cast(void*)(cast(GstGLSyncMeta*)cPtr).context);
    dToC(propval, cast(void*)&(cast(GstGLSyncMeta*)cPtr).context);
  }

  alias SetSyncFuncType = extern(C) void function(GstGLSyncMeta* sync, GstGLContext* context);

  @property SetSyncFuncType setSync()
  {
    return (cast(GstGLSyncMeta*)cPtr).setSync;
  }

  alias SetSyncGlFuncType = extern(C) void function(GstGLSyncMeta* sync, GstGLContext* context);

  @property SetSyncGlFuncType setSyncGl()
  {
    return (cast(GstGLSyncMeta*)cPtr).setSyncGl;
  }

  alias WaitFuncType = extern(C) void function(GstGLSyncMeta* sync, GstGLContext* context);

  @property WaitFuncType wait()
  {
    return (cast(GstGLSyncMeta*)cPtr).wait;
  }

  alias WaitGlFuncType = extern(C) void function(GstGLSyncMeta* sync, GstGLContext* context);

  @property WaitGlFuncType waitGl()
  {
    return (cast(GstGLSyncMeta*)cPtr).waitGl;
  }

  alias WaitCpuFuncType = extern(C) void function(GstGLSyncMeta* sync, GstGLContext* context);

  @property WaitCpuFuncType waitCpu()
  {
    return (cast(GstGLSyncMeta*)cPtr).waitCpu;
  }

  alias WaitCpuGlFuncType = extern(C) void function(GstGLSyncMeta* sync, GstGLContext* context);

  @property WaitCpuGlFuncType waitCpuGl()
  {
    return (cast(GstGLSyncMeta*)cPtr).waitCpuGl;
  }

  alias CopyFuncType = extern(C) void function(GstGLSyncMeta* src, GstBuffer* sbuffer, GstGLSyncMeta* dest, GstBuffer* dbuffer);

  @property CopyFuncType copy()
  {
    return (cast(GstGLSyncMeta*)cPtr).copy;
  }

  alias FreeFuncType = extern(C) void function(GstGLSyncMeta* sync, GstGLContext* context);

  @property FreeFuncType free()
  {
    return (cast(GstGLSyncMeta*)cPtr).free;
  }

  alias FreeGlFuncType = extern(C) void function(GstGLSyncMeta* sync, GstGLContext* context);

  @property FreeGlFuncType freeGl()
  {
    return (cast(GstGLSyncMeta*)cPtr).freeGl;
  }

  /**
      Set a sync point to possibly wait on at a later time.
    Params:
      context =       a #GstGLContext
  */
  void setSyncPoint(gstgl.glcontext.GLContext context)
  {
    gst_gl_sync_meta_set_sync_point(cast(GstGLSyncMeta*)cPtr, context ? cast(GstGLContext*)context.cPtr(No.Dup) : null);
  }

  /**
      Insert a wait into context's command stream ensuring all previous OpenGL
    commands before sync_meta have completed.
    Params:
      context =       a #GstGLContext
  */
  void wait(gstgl.glcontext.GLContext context)
  {
    gst_gl_sync_meta_wait(cast(GstGLSyncMeta*)cPtr, context ? cast(GstGLContext*)context.cPtr(No.Dup) : null);
  }

  /**
      Perform a wait so that the sync point has passed from the CPU's perspective
    What that means, is that all GL operations changing CPU-visible data before
    the sync point are now visible.
    Params:
      context =       a #GstGLContext
  */
  void waitCpu(gstgl.glcontext.GLContext context)
  {
    gst_gl_sync_meta_wait_cpu(cast(GstGLSyncMeta*)cPtr, context ? cast(GstGLContext*)context.cPtr(No.Dup) : null);
  }

  /** */
  static gst.meta_info.MetaInfo getInfo()
  {
    const(GstMetaInfo)* _cretval;
    _cretval = gst_gl_sync_meta_get_info();
    auto _retval = _cretval ? new gst.meta_info.MetaInfo(cast(GstMetaInfo*)_cretval) : null;
    return _retval;
  }
}
