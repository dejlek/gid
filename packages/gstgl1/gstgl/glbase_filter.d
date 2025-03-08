module gstgl.glbase_filter;

import gid.gid;
import gobject.object;
import gstbase.base_transform;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glcontext;
import gstgl.types;

/**
    #GstGLBaseFilter handles the nitty gritty details of retrieving an OpenGL
  context.  It also provided some wrappers around #GstBaseTransform's
  `start()`, `stop()` and `set_caps()` virtual methods that ensure an OpenGL
  context is available and current in the calling thread.
*/
class GLBaseFilter : gstbase.base_transform.BaseTransform
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_gl_base_filter_get_type != &gidSymbolNotFound ? gst_gl_base_filter_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /** */
  bool findGlContext()
  {
    bool _retval;
    _retval = gst_gl_base_filter_find_gl_context(cast(GstGLBaseFilter*)cPtr);
    return _retval;
  }

  /** */
  gstgl.glcontext.GLContext getGlContext()
  {
    GstGLContext* _cretval;
    _cretval = gst_gl_base_filter_get_gl_context(cast(GstGLBaseFilter*)cPtr);
    auto _retval = ObjectG.getDObject!(gstgl.glcontext.GLContext)(cast(GstGLContext*)_cretval, Yes.Take);
    return _retval;
  }
}
