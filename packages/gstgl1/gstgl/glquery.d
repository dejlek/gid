module gstgl.glquery;

import gid.gid;
import gst.element;
import gst.types;
import gstgl.c.functions;
import gstgl.c.types;
import gstgl.glcontext;
import gstgl.types;

/**
    A #GstGLQuery represents and holds an OpenGL query object.  Various types of
  queries can be run or counters retrieved.
*/
class GLQuery
{
  GstGLQuery cInstance;

  this(void* ptr, Flag!"take" take = No.take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for GstGL.GLQuery");

    cInstance = *cast(GstGLQuery*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Record the result of a counter
  */
  void counter()
  {
    gst_gl_query_counter(cast(GstGLQuery*)cPtr);
  }

  /**
      End counting the query
  */
  void end()
  {
    gst_gl_query_end(cast(GstGLQuery*)cPtr);
  }

  /** */
  void init_(gstgl.glcontext.GLContext context, gstgl.types.GLQueryType queryType)
  {
    gst_gl_query_init(cast(GstGLQuery*)cPtr, context ? cast(GstGLContext*)context.cPtr(No.dup) : null, queryType);
  }

  /** */
  ulong result()
  {
    ulong _retval;
    _retval = gst_gl_query_result(cast(GstGLQuery*)cPtr);
    return _retval;
  }

  /**
      Start counting the query
  */
  void start()
  {
    gst_gl_query_start(cast(GstGLQuery*)cPtr);
  }

  /**
      Free any dynamically allocated resources
  */
  void unset()
  {
    gst_gl_query_unset(cast(GstGLQuery*)cPtr);
  }

  /**
      Performs a GST_QUERY_CONTEXT query of type "gst.gl.local_context" on all
    #GstPads in element of direction for the local OpenGL context used by
    GStreamer elements.
    Params:
      element =       a #GstElement to query from
      direction =       the #GstPadDirection to query
      contextPtr =       location containing the current and/or resulting
                             #GstGLContext
    Returns:     whether context_ptr contains a #GstGLContext
  */
  static bool localGlContext(gst.element.Element element, gst.types.PadDirection direction, gstgl.glcontext.GLContext contextPtr)
  {
    bool _retval;
    _retval = gst_gl_query_local_gl_context(element ? cast(GstElement*)element.cPtr(No.dup) : null, direction, contextPtr ? cast(GstGLContext**)contextPtr.cPtr(No.dup) : null);
    return _retval;
  }
}
