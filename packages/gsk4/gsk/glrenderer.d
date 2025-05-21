/// Module for [GLRenderer] class
module gsk.glrenderer;

import gid.gid;
import gsk.c.functions;
import gsk.c.types;
import gsk.renderer;
import gsk.types;

/** */
class GLRenderer : gsk.renderer.Renderer
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gsk_gl_renderer_get_type != &gidSymbolNotFound ? gsk_gl_renderer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GLRenderer self()
  {
    return this;
  }

  /**
      Creates a new [gsk.renderer.Renderer] using the new OpenGL renderer.
      Returns: a new GL renderer
  */
  this()
  {
    GskRenderer* _cretval;
    _cretval = gsk_gl_renderer_new();
    this(_cretval, Yes.Take);
  }
}
