/// Module for [GLOverlayCompositor] class
module gstgl.gloverlay_compositor;

import gid.gid;
import gst.buffer;
import gst.caps;
import gst.object;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glcontext;
import gstgl.types;

/**
    Opaque #GstGLOverlayCompositor object
*/
class GLOverlayCompositor : gst.object.ObjectGst
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
    return cast(void function())gst_gl_overlay_compositor_get_type != &gidSymbolNotFound ? gst_gl_overlay_compositor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType gType()
  {
    return getGType();
  }

  override GLOverlayCompositor self()
  {
    return this;
  }

  /** */
  this(gstgl.glcontext.GLContext context)
  {
    GstGLOverlayCompositor* _cretval;
    _cretval = gst_gl_overlay_compositor_new(context ? cast(GstGLContext*)context.cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /** */
  static gst.caps.Caps addCaps(gst.caps.Caps caps)
  {
    GstCaps* _cretval;
    _cretval = gst_gl_overlay_compositor_add_caps(caps ? cast(GstCaps*)caps.cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  void drawOverlays()
  {
    gst_gl_overlay_compositor_draw_overlays(cast(GstGLOverlayCompositor*)cPtr);
  }

  /** */
  void freeOverlays()
  {
    gst_gl_overlay_compositor_free_overlays(cast(GstGLOverlayCompositor*)cPtr);
  }

  /** */
  void uploadOverlays(gst.buffer.Buffer buf)
  {
    gst_gl_overlay_compositor_upload_overlays(cast(GstGLOverlayCompositor*)cPtr, buf ? cast(GstBuffer*)buf.cPtr(No.Dup) : null);
  }
}
