module gsk.cairo_renderer;

import gid.gid;
import gsk.c.functions;
import gsk.c.types;
import gsk.renderer;
import gsk.types;

/**
    A GSK renderer that is using cairo.
  
  Since it is using cairo, this renderer cannot support
  3D transformations.
*/
class CairoRenderer : gsk.renderer.Renderer
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gsk_cairo_renderer_get_type != &gidSymbolNotFound ? gsk_cairo_renderer_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new Cairo renderer.
    
    The Cairo renderer is the fallback renderer drawing in ways similar
    to how GTK 3 drew its content. Its primary use is as comparison tool.
    
    The Cairo renderer is incomplete. It cannot render 3D transformed
    content and will instead render an error marker. Its usage should be
    avoided.
    Returns:     a new Cairo renderer.
  */
  this()
  {
    GskRenderer* _cretval;
    _cretval = gsk_cairo_renderer_new();
    this(_cretval, Yes.take);
  }
}
