module gsk.ngl_renderer;

import gid.gid;
import gsk.c.functions;
import gsk.c.types;
import gsk.renderer;
import gsk.types;

class NglRenderer : gsk.renderer.Renderer
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gsk_ngl_renderer_get_type != &gidSymbolNotFound ? gsk_ngl_renderer_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GskRenderer* _cretval;
    _cretval = gsk_ngl_renderer_new();
    this(_cretval, Yes.Take);
  }
}
